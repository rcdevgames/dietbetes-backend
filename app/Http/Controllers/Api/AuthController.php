<?php

namespace App\Http\Controllers\Api;

use App\User;
use App\UserDetail;
use App\UserGlucose;
use App\UserMedicine;
use App\Medicines;
use App\Helpers\FormatConverter;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Validator;
use Exception;
use JWTAuth;
use Mail;
use function bcrypt;
use function str_random;

class AuthController extends Controller
{
    /**
	 * @param Request $request
	 * @return type
	 */
    public function login(Request $request)
    {
    	$validator = Validator::make($request->all(), [
			'useremail' => 'required|email',
			'password' => 'required|min:8',
			'onesignal_token' => 'nullable'
		]);

		if ($validator->fails()) {
			return response()->json([
				'status' => 400,
				'message' => 'Some Parameters is required',
				'validators' => FormatConverter::parseValidatorErrors($validator),
			], 400);
        }


		try {
            $user = User::where('email', $request->useremail)->orWhere('username', $request->useremail)->first();
            if(!$user) {
                return response()->json([
                    'status' => 404,
                    'message' => 'User not registered'
                ], 404);
            }

            if(! \Hash::check($request->password, $user->password)) {
                return response()->json([
                    'status' => 400,
                    'message' => 'Invalid Credential'
                ], 400);
            }

            if ($user->status != User::USER_ACTIVE) {
                return response()->json([
                    'status' => 400,
                    'message' => 'User not active'
                ], 400);
            }

            $user->token = JWTAuth::fromUser($user);
            $user->last_login = Carbon::now()->toDateTimeString();

            return response()->json([
				'status' => 200,
                'message' => 'Login Success',
                'data' => $user
			], 200);


		} catch (Exception $e) {
			return response()->json([
				'status' => 400,
				'message' => 'Could Not Login ' . $e->getMessage()
			], 400);
		}
    }

    public function loginGoogle(Request $request) {
        $validateData = Validator::make($request->only(['token']), ["token" => 'required']);
        if($validateData->fails())
        {
            return response()->json([
            'status' => 400,
            'validators' => FormatConverter::parseValidatorErrors($validator),
            ], 400);
        }

        $client = new Client(['headers' => ['Authorization' => 'Bearer '.$request->token]]);
        try {
            $result = $client->get("https://www.googleapis.com/oauth2/v1/userinfo?alt=json");
            $userData = json_decode($result->getBody(), true);

            $user = User::where('email', '=', $userData['email'])->first();
            if (!$user){
                return response()->json([
                    'status' => 404,
                    'message' => 'User not registered',
                ], 404);
            }

            $user->google_token = $request->token;
            $user->token = JWTAuth::fromUser($user);
            $user->last_login = Carbon::now()->toDateTimeString();
            $user->save();

            return response()->json([
                'status' => 200,
                'message' => 'Login Success',
                'data' => $user
            ], 200);

        } catch (GuzzleException $e) {
            if ($e->hasResponse()) {
                $exception = (string) $e->getResponse()->getBody();
                $exception = json_decode($exception);
                return response()->json($exception, $e->getCode());
            } else {
                return response()->json($e->getMessage(), 503);
            }
        }
    }

    public function register(Request $request)
    {
        $exactDuplicate = User::where('email', $request->email)->orWhere('username', $request->username)->where('status', User::USER_ACTIVE)->whereRaw(\DB::raw('created_at = NOW()'))->first();

        if (!$exactDuplicate) {
            $validator = Validator::make($request->all(), [
                'full_name' => 'required',
                'call_name' => 'required',
                'email' => 'required|email|unique:users,email',
                'username' => 'required|min:5|unique:users,username',
                'password' => 'required|min:8|confirmed',
                'password_confirmation' => 'required|min:8',
                'google_token' => 'nullable',
                'onesignal_token' => 'nullable',
                'dob' => 'required',
                'gender' => 'required|in:'.User::GENDER_MALE.','.User::GENDER_FEMALE,
                'physical_activity' => 'required|in:'.User::ACTIVITY_BEDREST.','.User::ACTIVITY_MILD.','.User::ACTIVITY_MODERATE.','.User::ACTIVITY_HEAVY.','.User::ACTIVITY_VERY_HEAVY,
                'height' => 'required',
                'weight' => 'required',
                'mass_index' => 'required',
                'history_family' => 'required|in:'.User::NO_HISTORY.','.User::FROM_FATHER.','.User::FROM_MOTHER.','.User::FROM_GRANDPA.','.User::FROM_GRANDMA,
                'gdp' => 'required',
                'gds' => 'required',
                'hba1c' => 'required',
                'ttgo' => 'required',
                'chol_total' => 'required',
                'chol_ldl' => 'required',
                'chol_hdl' => 'required',
                'triglesida' => 'required',
                'blood_pressure' => 'required',
                'clinical_symptoms' => 'required',
                'medicine' => 'required'
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 400,
                    'message' => 'Some Parameters is required',
                    'validators' => FormatConverter::parseValidatorErrors($validator),
                ], 400);
            }

            foreach (json_decode($request->medicine, true) as $key => $value) {
                $medicine = Medicines::where('id', $value)->first();
                if (!$medicine) {
                    return response()->json([
                        'status' => 404,
                        'message' => 'Madicine with id('.$value.') not found'
                    ], 404);
                }
            }


            foreach (json_decode($request->clinical_symptoms, true) as $key => $value) {
                if ($value != User::SYMPTOMS_POLIDIPSI && $value != User::SYMPTOMS_POLIURI && $value != User::SYMPTOMS_FEELING_WEAK && $value != User::SYMPTOMS_WEIGHT_LOSS) {
                    return response()->json([
                        'status' => 400,
                        'message' => 'Wrong input clinical symptoms'
                    ], 400);
                }
            }
            \DB::beginTransaction();
            $user = new User();
            $user->fill($request->only([
                'email',
                'username',
                'google_token',
                'onesignal_token'
            ]));

            $user->token = JWTAuth::fromUser($user);
            $user->password = bcrypt($request->password);
            $user->last_login = Carbon::now()->toDateTimeString();

            $user->save();

            $medicines = [];
            foreach (json_decode($request->medicine, true) as $key => $value) {
                array_push($medicines, ['user_id' => $user->id, 'medicine_id' => $value]);
            }
            UserMedicine::insert($medicines);

            $userDetail = $request->only(['full_name','call_name','dob','gender','physical_activity','height','weight','ideal_weight','mass_index','history_family','chol_total','chol_ldl','chol_hdl','triglesida','blood_pressure','clinical_symptoms']);
            $userDetail['user_id'] = $user->id;
            UserDetail::create($userDetail);

            $userGlucose = $request->only(['gdp','gds','hba1c','ttgo']);
            $userGlucose['user_id'] = $user->id;
            UserGlucose::create($userGlucose);
            \DB::commit();

            $user = User::where('id', $user->id)->first();
        }else{
            $user = $exactDuplicate;
        }

        return response()->json([
            'status' => 201,
            'message' => 'Register success',
            'data' => $user,
        ], 201);

    }

    public function forgotPassword(Request $request)
    {
        $validator = Validator::make($request->only('email'), [
			'email' => 'required|email'
		]);

		if ($validator->fails()) {
			return response()->json([
				'status' => 400,
				'message' => 'Some Parameters is required',
				'validators' => FormatConverter::parseValidatorErrors($validator),
			], 400);
        }

        $user = User::where('email', $request->email)->where('status', User::USER_ACTIVE)->first();
        if (!$user) {
            return response()->json([
                'status' => 404,
                'message' => 'User not registered'
            ], 404);
        }

        $password = str_random(8);
        $email = $user->email;
        // $email = 'rcdev.games@gmail.com';
        $user->password = bcrypt($password);

        Mail::send('emails.forgot-password', ['user' => $user, 'password' => $password], function ($message) use ($email) {
            $message->to($email)->subject(config('app.name') . ' | Forgot Password');
            $message->from("noreply@dietbetes.com", 'Noreply Dietbetes');
        });

        // $user->save();

        return response()->json([
            'status' => 200,
            'message' => 'Please check your email'
        ], 200);
    }
}
