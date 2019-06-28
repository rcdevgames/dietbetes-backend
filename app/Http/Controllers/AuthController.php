<?php

namespace App\Http\Controllers;

use App\User;
use App\Helpers\FormatConverter;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Validator;
use Exception;
use JWTAuth;
use DateTime;

class AuthController extends Controller {

    public function reset_password(Request $request, $token)
    {
        return $token;
    }
}

