<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'v1', 'middleware' => ['requiredParameterJson']], function () {
	Route::group(['prefix' => 'auth'], function () {
		Route::post('/login', 'Api\AuthController@login');
		Route::post('/register', 'Api\AuthController@register');
		Route::post('/forgot-password', 'Api\AuthController@forgotPassword');
		Route::post('/login-google', 'Api\AuthController@loginGoogle');
	});

    Route::group(['prefix' => 'user'], function () {
        Route::get('/medicines', 'Api\UserController@medicines');
    });
    Route::group(['middleware' => ['jwt.auth']], function () {
        // Route::group(['prefix' => 'auth'], function () {});
        Route::group(['prefix' => 'alarm'], function () {
            Route::get('/list', 'Api\AlarmController@index');
            Route::post('/add', 'Api\AlarmController@insert');
            Route::delete('/remove/{id}', 'Api\AlarmController@delete');
        });
        Route::group(['prefix' => 'user'], function () {
            Route::get('/calorie', 'Api\UserController@calorie');
            Route::get('/detail', 'Api\UserController@detail');
            Route::put('/update', 'Api\UserController@update');
            Route::post('/update-avatar', 'Api\UserController@updateAvatar');
            Route::post('/update-password', 'Api\UserController@updatePassword');
        });
        Route::group(['prefix' => 'glucose'], function () {
            Route::get('/now', 'Api\GlucoseController@index');
            Route::post('/add', 'Api\GlucoseController@insert');
            Route::get('/history', 'Api\GlucoseController@history');
        });
        Route::group(['prefix' => 'food'], function () {
            Route::get('/receipt', 'Api\FoodController@index');
            Route::post('/receipt/add', 'Api\FoodController@insert');
            // Route::get('/category', 'Api\FoodController@category');
            // Route::get('/receipt-detail', 'Api\FoodController@detailReceipt');
        });
        Route::group(['prefix' => 'journal'], function () {
            Route::get('/list', 'Api\JournalController@index');
            Route::post('/add', 'Api\JournalController@insert');
            Route::get('/criteria', 'Api\JournalController@criteria');
            Route::get('/calendar', 'Api\JournalController@calendar');
        });
        Route::group(['prefix' => 'fatsecret'], function () {
            Route::get('/{id}', 'Api\JournalController@fatsecretDetail');
            Route::post('/search', 'Api\JournalController@fatsecret');
        });
	});
});
