<?php

namespace App\Http\Controllers\Api;

use App\User;
use App\UserGlucose;
use App\Helpers\FormatConverter;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Validator;
use Exception;
use JWTAuth;

class GlucoseController extends Controller {

    public function index(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        $glucose = UserGlucose::where('user_id', $user->id)->orderBy('date', 'desc')->first();
        if ($glucose->hba1c < 7 && ($glucose->gdp >= 80 && $glucose->gdp <= 125) && ($glucose->gds >= 115 && $glucose->gds <= 157) && ($glucose->ttgo >= 80 && $glucose->ttgo <= 170)) {
            $glucose->{'status'} = 'Normal';
        }else if ($glucose->gds <= 70 && $glucose->ttgo < 140) {
            $glucose->{'status'} = 'Hipoglikemia';
        }else if ($glucose->hba1c >= 7 && $glucose->gdp > 125 && $glucose->gds > 125 && $glucose->ttgo >= 200) {
            $glucose->{'status'} = 'Hiperglikemia';
        } else if ($glucose->hba1c >= 7 || $glucose->gdp > 125 || $glucose->gds > 125 || $glucose->ttgo >= 200) {
            $glucose->{'status'} = 'Hiperglikemia';
        }else {
            $glucose->{'status'} = 'Unkown';
        }

        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $glucose,
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
            "date" => 'required',
            "hba1c" => 'required|numeric',
            "gdp" => 'required|numeric',
            "gds" => 'required|numeric',
            "ttgo" => 'required|numeric',
        ]);
        if($validator->fails())
        {
            return response()->json([
            'status' => 400,
            'validators' => FormatConverter::parseValidatorErrors($validator),
            ], 400);
        }

        $glucose = new UserGlucose();
        $glucose->fill($request->only(["date","hba1c","gdp","gds","ttgo"]));
        $glucose->user_id = $user->id;
        $glucose->save();

        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $glucose,
        ]);
    }

    public function history(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        $glucose = UserGlucose::where('user_id', $user->id)->get();
        // foreach ($glucose as $key => $value) {
        //     if ($value->hba1c < 7 && ($value->gdp >= 80 && $value->gdp <= 125) && ($value->gds >= 115 && $value->gds <= 157) && ($value->ttgo >= 80 && $value->ttgo <= 170)) {
        //         $glucose[$key]->{'status'} = 'Normal';
        //     }else if ($value->gds <= 70 && $value->ttgo < 140) {
        //         $glucose[$key]->{'status'} = 'Hipoglikemia';
        //     }else if ($value->hba1c >= 7 && $value->gdp > 125 && $value->gds > 125 && $value->ttgo >= 200) {
        //         $glucose[$key]->{'status'} = 'Hiperglikemia';
        //     }
        // }
        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $glucose,
        ]);
    }

}

