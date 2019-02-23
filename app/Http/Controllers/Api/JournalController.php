<?php

namespace App\Http\Controllers\Api;

use App\User;
use App\FoodJournal;
use App\Diet;
use App\UserDietRequired;
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
            "keywords" => 'required|min:3',
            "page" => 'nullable'
        ]);
        if($validator->fails())
        {
            return response()->json([
            'status' => 400,
            'validators' => FormatConverter::parseValidatorErrors($validator),
            ], 400);
        }

        try {
            $foods = [];
            $result = FatSecret::customSearchIngredients($request->keywords, 0, 10);
            if (isset($result['foods']['food'])) {
                foreach ($result['foods']['food'] as $key => $value) {
                    $serving = FatSecret::getIngredient($value['food_id']);
                    if (isset($serving['food']['servings']['serving'])) {
                        if (isset($serving['food']['servings']['serving'][0]) && is_array($serving['food']['servings']['serving'][0])) {
                            foreach ($serving['food']['servings']['serving'] as $k => $v) {
                                if ($v['serving_description'] == '100 g') {
                                    $value['food_description'] = "Per " . $v['serving_description'] . " - Kalori: " . $v['calories'] . "kcal | Lemak: " . $v['fat'] . "g | Karbo: " . $v['carbohydrate'] . "g | Protein:" . $v['protein'] ."g";
                                    // $value['food_description'] = $v;
                                }
                            }
                        }else{
                            $value['food_description'] = str_replace(['Calories','Fat','Carbs'], ['Kalori','Lemak','Karbo'], $value['food_description']);
                        }
                    }
                    array_push($foods, $value);
                }
            }

            $result['foods']['food'] = $foods;

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
            if (isset($food['food']['servings']['serving'][0]) && is_array($food['food']['servings']['serving'][0])) {
                foreach ($food['food']['servings']['serving'] as $key => $value) {
                    if ($value['serving_description'] == '100 g') {
                        $input['cal'] = $value['calories'];
                        $input['carbo'] = $value['carbohydrate'];
                        $input['protein'] = $value['protein'];
                        $input['fat'] = $value['fat'];
                    }
                }
            } else {
                $input['cal'] = $food['food']['servings']['serving']['calories'];
                $input['carbo'] = $food['food']['servings']['serving']['carbohydrate'];
                $input['protein'] = $food['food']['servings']['serving']['protein'];
                $input['fat'] = $food['food']['servings']['serving']['fat'];
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
        // $result = ($user->userDetail->ideal_weight < 25) ? $after:$before;

        $before->count =  $hasil - $before->calories;
        $after->count = $after->calories - $hasil;
        $minResult = min([$before->count, $after->count]);

        if ($minResult < 100) {
            $result = ($before->count == $minResult) ? $before:$after;
            // $result = ($user->userDetail->ideal_weight < 25) ? $after:$before;
        }else{
            $result = [
                "type" => "custom",
                "calories" => $hasil,
                "protein" => 0.15 * $hasil,
                "fat" => 0.2 * $hasil,
                "carbo" => 0.64 * $hasil
            ];
        }

        // $result = ($before->count == $minResult) ? $before:$after;
        if (!$required = UserDietRequired::whereDate('created_at', Carbon::now())->first()) {
            UserDietRequired::create([
                "user_id" => $user->id,
                "calories" => $result['calories'],
                "protein" => $result['protein'],
                "fat" => $result['fat'],
                "carbo" => $result['carbo']
            ]);
        }
        $result['real_calories'] = $hasil;
        $result['gizi_status'] = $this->gizi_status($user->userDetail->ideal_weight);

        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => ["requirement" => $result, "result" => $this->calculateJournalToday($result)]
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

        $required = UserDietRequired::whereMonth('created_at', date('m'))->where('user_id', $user->id)->orderBy('created_at', 'DESC')->first();
        $journal = FoodJournal::whereMonth('created_at', date('m'))->where('user_id', $user->id)->orderBy('created_at', 'ASC')->get();

        $result = [];
        foreach ($journal as $key => $value) {
            if (
                ($value->calories >= $required->calories && $value->calories <= ($required->calories + 30)) && 
                ($value->carbo >= $required->carbo && $value->carbo <= ($required->carbo + 30)) && 
                ($value->protein >= $required->protein && $value->protein <= ($required->protein + 30)) && 
                ($value->fat >= $required->fat && $value->fat <= ($required->fat + 30))
            ){
                array_push($result, [
                    "day" => date('d', strtotime($value->created_at)),
                    "sucess" => true
                ]);
            }else{
                array_push($result, [
                    "day" => date('d', strtotime($value->created_at)),
                    "sucess" => false
                ]);
            }     
        }


        return response()->json([
            'status' => 200,
            'message' => 'success',
            'data' => $result,
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

    protected function calculateJournalToday($current)
    {
        $journal = FoodJournal::whereDate('created_at', Carbon::today())->orderBy('schedule', 'ASC')->get();
        $result = new Diet();
        $result->calories = $current['calories'];
        $result->protein = $current['protein'];
        $result->fat = $current['fat'];
        $result->carbo = $current['carbo'];
        if ($journal && count($journal) > 0) {
            foreach ($journal as $key => $value) {
                $result->calories -= $value->cal;
                $result->protein -= $value->protein;
                $result->fat -= $value->fat;
                $result->carbo -= $value->carbo;
            }
        }
        return $result;
    }

    protected function gizi_status($IBM)
    {
        if ($IBM < 18.5) {
            return "BB KURANG";
        } else if ($IBM >= 18.5 && $IBM < 25) {
            return "BB NORMAL";
        } else if ($IBM == 25) {
            return "BB LEBIH";
        } else if ($IBM > 25 && $IBM < 30) {
            return "PRE-OBESITAS";
        } else if ($IBM >= 30 && $IBM < 35) {
            return "OBESITAS I";
        } else if ($IBM >= 35 && $IBM < 40) {
            return "OBESITAS II";
        }
        return "OBESITAS III";
    }
}
