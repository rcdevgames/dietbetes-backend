<?php

namespace App\Http\Controllers\Api;

use App\User;
use App\UserDetail;
use App\UserGlucose;
use App\UserMedicine;
use App\Medicines;
use App\Helpers\FormatConverter;
use App\Helpers\ImageHelper;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Validator;
use Exception;
use JWTAuth;

class UserController extends Controller {

    public function detail(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        // $user = User::where('id', $user->id)->with('userGlucose')->with('userMedicine')->first();

        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $user,
        ]);
    }

    public function update(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'call_name' => 'required',
            'dob' => 'required',
            'gender' => 'required|in:'.User::GENDER_MALE.','.User::GENDER_FEMALE,
            'physical_activity' => 'required|in:'.User::ACTIVITY_BEDREST.','.User::ACTIVITY_MILD.','.User::ACTIVITY_MODERATE.','.User::ACTIVITY_HEAVY.','.User::ACTIVITY_VERY_HEAVY,
            'height' => 'required',
            'weight' => 'required',
            'mass_index' => 'required',
            'history_family' => 'required|in:'.User::NO_HISTORY.','.User::FROM_FATHER.','.User::FROM_MOTHER.','.User::FROM_GRANDPA.','.User::FROM_GRANDMA,
            'chol_total' => 'required',
            'chol_ldl' => 'required',
            'chol_hdl' => 'required',
            'triglesida' => 'required',
            'blood_pressure' => 'required',
            'clinical_symptoms' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'message' => 'Some Parameters is required',
                'validators' => FormatConverter::parseValidatorErrors($validator),
            ], 400);
        }

        $userDetail = UserDetail::where('user_id', $user->id)->first();

        $userDetail->full_name = $request->full_name;
        $userDetail->call_name = $request->call_name;
        $userDetail->dob = $request->dob;
        $userDetail->gender = $request->gender;
        $userDetail->physical_activity = $request->physical_activity;
        $userDetail->height = $request->height;
        $userDetail->weight = $request->weight;
        $userDetail->mass_index = $request->mass_index;
        $userDetail->history_family = $request->history_family;
        $userDetail->chol_total = $request->chol_total;
        $userDetail->chol_ldl = $request->chol_ldl;
        $userDetail->chol_hdl = $request->chol_hdl;
        $userDetail->triglesida = $request->triglesida;
        $userDetail->blood_pressure = $request->blood_pressure;
        $userDetail->clinical_symptoms = $request->clinical_symptoms;

        $userDetail->save();

        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $userDetail,
        ]);

    }

    public function updateAvatar(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        $validator = \Validator::make($request->all(), [
            'avatar_file' => 'required'
        ]);

        if ($validator->fails()) {
			return response()->json([
				'status' => 400,
				'message' => 'Some Parameters is required',
				'validators' => FormatConverter::parseValidatorErrors($validator),
			], 400);
        }

        $model = User::findOrFail($user->id);

        // $data = \App\Helpers\ImageHelper::getImageBase64Information($request->avatar_file);
        $img = \Eventviva\ImageResize::createFromString($request->avatar_file);
        $imageFilename = $model->generateFilename(str_random(8), $data['extension']);
        $img->save($model->getPath() . $imageFilename);
        $model->avatar_url = $imageFilename;

        $model->save();

        return response()->json([
            'status' => 200,
            'message' => 'Upload avatar success',
            'data' => $model->getFileUrl(),
        ]);
    }

    public function updatePassword(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
        }

        Validator::extend('old_password', function ($attribute, $value, $parameters, $validator) {
            return Hash::check($value, current($parameters));
        }, 'Wrong old password');

        $validator = \Validator::make($request->all(), [
            'old_password' => 'required|old_password:'.$user->password,
            'password' => 'required|min:8|confirmed|different:old_password',
            'password_confirmation' => 'required|min:8',
        ]);

        if ($validator->fails()) {
			return response()->json([
				'status' => 400,
				'message' => 'Some Parameters is required',
				'validators' => FormatConverter::parseValidatorErrors($validator),
			], 400);
        }

        $user = User::findOrFail($user->id);
        $user->password = bcrypt($request->password);
        $user->save();

        return response()->json([
            'status' => 200,
            'message' => 'Change password success',
        ]);
    }

    public function medicines(Request $request)
    {
        return response()->json([
            'status' => 200,
            'message' => 'Success',
            'data' => Medicines::all()
        ]);
    }
}
