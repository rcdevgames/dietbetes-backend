<?php 

namespace App\Http\Controllers\Api;

use App\Alarm;
use App\Helpers\FormatConverter;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Validator;
use Exception;
use JWTAuth;

/**
 * summary
 */
class AlarmController extends Controller
{
    public function index(Request $request)
    {
    	$user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
		}

		$data = Alarm::where('user_id', $user->id)->get();

		return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $data,
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
            "title" => "required",
            "note" => "required",
            "remind_at" => "required|min:5|max:5",
            "remind_on" => "required",
            "status" => "required|in:1,0"
        ]);

        if($validator->fails())
        {
            return response()->json([
            'status' => 400,
            'validators' => FormatConverter::parseValidatorErrors($validator),
            ], 400);
        }

        if (isset($request->id)) {
			$data = Alarm::where('id', $request->id)->where('user_id', $user->id)->first();

			if (!$data) {
				return response()->json([
		            'status' => 404,
		            'message' => 'not found'
		        ], 404);	        		
        	}

        	$data->title = $request->title;
        	$data->note = $request->note;
            $data->remind_at = $request->remind_at;
        	$data->remind_on = $request->remind_on;
        	$data->status = $reques->status;
        	$data->save();     	
        }else{
        	$input = $request->all();
        	$input["user_id"] = $user->id;
        	$data = Alarm::create($input);
        }


        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $data,
        ]);
    	
    }

    public function delete($id, Request $request)
    {
    	$user = JWTAuth::parseToken()->authenticate();
		if (!$user) {
			return response()->json([
				'status' => 401,
				'message' => 'Invalid credentials'
			], 401);
		}

    	$data = Alarm::find($id);

    	if (!$data) {
    		return response()->json([
	            'status' => 404,
	            'message' => 'data not found'
	        ], 404);
    	}

    	$data->delete();
    	return response()->json([
            'status' => 200,
            'message' => 'delete successful'
        ]);
    }
}