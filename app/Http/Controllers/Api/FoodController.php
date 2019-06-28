<?php

namespace App\Http\Controllers\Api;

use App\Diet;
use App\User;
use App\UserGlucose;
use App\FoodReceipt;
use App\Helpers\FormatConverter;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Validator;
use Exception;
use JWTAuth;
use DateTime;

class FoodController extends Controller {

    public function index($type, Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        $energiBasal = ($user->userDetail->gender == 0 ? 20:30) * $user->userDetail->ideal_weight;
        $faktorAktifitas = ($energiBasal * 0.3) + $energiBasal;
        $koreksiStatusGizi = 0.2 * $energiBasal;
        $koreksiIBM = $this->koreksiBeratBadan($user->userDetail->ideal_weight, $faktorAktifitas, $koreksiStatusGizi);
        $koreksiUmur = $this->koreksiUmur($user->userDetail->dob, $energiBasal);
        $hasil = $koreksiIBM + $koreksiUmur;

        $before = Diet::where('calories', '<=', $hasil)->orderBy('id', 'DESC')->first();
        $after = Diet::where('calories', '>=', $hasil)->first();
        // $result = ($user->userDetail->ideal_weight < 25) ? $after:$before;

        $before->count =  $hasil - $before->calories;
        $after->count = $after->calories - $hasil;
        $minResult = min([$before->count, $after->count]);

        $result = ($before->count == $minResult) ? $before:$after;

        $receipt = FoodReceipt::where('status', FoodReceipt::ACTIVE)->where('type', $result->calories)->where('time', $type)->orderBy('title', 'ASC')->get();

        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $receipt,
        ]);
    }

    public function insert(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
        if (!$user) {
            return response()->json([
                'status' => 401,
                'message' => 'Invalid credentials'
            ], 401);
        }

        $validator = Validator::make($request->only('type', 'title', 'ingredients', 'tutorial'), [
            "type" => "required|numeric",
            "title" => "required",
            "ingredients" => "required",
            "tutorial" => "required"
        ]);

        if($validator->fails())
        {
            return response()->json([
            'status' => 400,
            'validators' => FormatConverter::parseValidatorErrors($validator),
            ], 400);
        }

        \DB::beginTransaction();
        $receipt = new FoodReceipt();
        $receipt->fill($request->only('type', 'title', 'ingredients', 'tutorial'));
        $receipt->save();
        \DB::commit();

        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $receipt,
        ]);
        
    }

    protected function koreksiBeratBadan($IBM, $faktorAktifitas, $koreksiStatusGizi) {
        if ($IBM < 18.5) {
            return $faktorAktifitas + $koreksiStatusGizi;
        } else if ($IBM >= 18.5 && $IBM <= 24.9) {
            return $koreksiStatusGizi;
        } else {
            return $faktorAktifitas - $koreksiStatusGizi;
        }

    }

    protected function countAges($bithdayDate)
    {
        $date = new DateTime($bithdayDate);
        $now = new DateTime();
        $interval = $now->diff($date);
        return $interval->y;
    }

    protected function koreksiUmur($bithdayDate, $energiBasal)
    {
        $umur = $this->countAges($bithdayDate);
        if ($umur >= 40 && $umur <= 50) {
            return 0.05 * $energiBasal;
        }else if ($umur > 50 && $umur <= 60) {
            return 0.1 * $energiBasal;
        }else if ($umur > 60) {
            return 0.2 * $energiBasal;
        }else{
            return 0;
        }
    }

}

