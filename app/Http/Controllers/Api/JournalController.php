<?php

namespace App\Http\Controllers\Api;

use App\User;
use App\FoodJournal;
use App\Diet;
use App\Helpers\FormatConverter;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Validator;
use Exception;
use JWTAuth;
use FatSecret;
use DateTime;

class JournalController extends Controller {
    public function fatsecretDetail($id, Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        try {
            $result = FatSecret::getIngredient($id);
            foreach ($result['food']['servings']['serving'] as $key => $value) {
                if ($value['serving_description'] == '100 g') {
                    $result['food']['serving'] = $value;
                }
            }

            unset($result['food']['servings']);

            return response()->json([
                'status' => 200,
                'message' => 'success',
                'data' => $result['food'],
            ]);
        }
        catch (Exception $e) {
            return response()->json([
                'status' => 400,
                'message' => $e->getMessage()
            ], 400);
        }
    }

    public function fatsecret(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        $validator = Validator::make($request->only('keywords'), [
            "keywords" => 'required|min:3'
        ]);
        if($validator->fails())
        {
            return response()->json([
            'status' => 400,
            'validators' => FormatConverter::parseValidatorErrors($validator),
            ], 400);
        }

        try {
            $result = FatSecret::customSearchIngredients($request->keywords);

            return response()->json([
                'status' => 200,
                'message' => 'success',
                'data' => $result['foods'],
            ]);
        }
        catch (Exception $e) {
            return response()->json([
                'status' => 400,
                'message' => $e->getMessage()
            ], 400);
        }
    }

    public function index(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        $journal = FoodJournal::whereDate('created_at', Carbon::today())->orderBy('schedule', 'ASC')->get();
        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $journal,
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

        $validator = Validator::make($request->all(), [
            "schedule" => 'required|in:'.FoodJournal::SCHEDULE_BREAKFAST.','.FoodJournal::SCHEDULE_MORNING_SNACK.','.FoodJournal::SCHEDULE_LUNCH.','.FoodJournal::SCHEDULE_BREAKFAST.','.FoodJournal::SCHEDULE_AFTERNOON_SNACK.','.FoodJournal::SCHEDULE_DINNER.','.FoodJournal::SCHEDULE_EVENING_SNACK,
            "food_id" => 'required|numeric'
        ]);
        if($validator->fails())
        {
            return response()->json([
            'status' => 400,
            'validators' => FormatConverter::parseValidatorErrors($validator),
            ], 400);
        }

        $journal = FoodJournal::whereDate('created_at', Carbon::today())->where('schedule', $request->schedule)->first();
        if ($journal) {
            return response()->json([
                'status' => 400,
                'message' => "You have entered food data for this schedule",
            ], 400);
        }

        try {
            $input = array("user_id" => $user->id, "schedule" => $request->schedule);

            $food = FatSecret::getIngredient($request->food_id);
            foreach ($food['food']['servings']['serving'] as $key => $value) {
                if ($value['serving_description'] == '100 g') {
                    $input['cal'] = $value['calories'];
                    $input['carbo'] = $value['carbohydrate'];
                    $input['protein'] = $value['protein'];
                    $input['fat'] = $value['fat'];
                }
            }

            $foodJournal = FoodJournal::create($input);

            return response()->json([
                'status' => 200,
                'message' => 'success',
                'data' => $foodJournal
            ]);

        } catch (Exception $e) {
            return response()->json([
                'status' => 400,
                'message' => $e->getMessage()
            ], 400);
        }
    }
    public function criteria(Request $request)
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

        // $hasil = 1650;

        $before = Diet::where('calories', '<=', $hasil)->orderBy('id', 'DESC')->first();
        $after = Diet::where('calories', '>=', $hasil)->first();
        $result = ($user->userDetail->ideal_weight < 25) ? $after:$before;
        $result['real_calories'] = $hasil;

        // $before->count =  $hasil - $before->calories;
        // $after->count = $after->calories - $hasil;
        // $minResult = min([$before->count, $after->count]);

        // if ($minResult < 100) {
        //     $result = ($before->count == $minResult) ? $before:$after;
        // }else{
        //     $result = [
        //         "type" => "custom",
        //         "calories" => $hasil,
        //         "protein" => 0.15 * $hasil,
        //         "fat" => 0.2 * $hasil,
        //         "carbo" => 0.64 * $hasil
        //     ];
        // }

        // $result = ($before->count == $minResult) ? $before:$after;

        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => ["requirement" => $result, "result" => $this->calculateJournalToday()]
        ]);
    }
    public function calendar(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        $journal = FoodJournal::whereMonth('created_at', date('m'))->get();
        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $journal,
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

    protected function calculateJournalToday()
    {
        $journal = FoodJournal::whereDate('created_at', Carbon::today())->orderBy('schedule', 'ASC')->get();
        $result = new Diet();
        foreach ($journal as $key => $value) {
            $result->calories += $value->cal;
            $result->protein += $value->protein;
            $result->fat += $value->fat;
            $result->carbo += $value->carbo;
        }
        return $result;
    }
}
