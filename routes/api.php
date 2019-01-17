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
		Route::post('/forgot', 'Api\AuthController@forgot_password');
		Route::post('/login-google', 'Api\AuthController@google_login');
	});

	Route::group(['middleware' => ['jwt.auth']], function () {
		// Route::group(['prefix' => 'auth'], function () {});
		Route::group(['prefix' => 'user'], function () {
			Route::get('/detail', 'Api\UserController@detail';
			Route::put('/update', 'Api\UserController@update';
			Route::post('/update-avatar', 'Api\UserController@updateAvatar';
		});
		Route::group(['prefix' => 'glucose'], function () {
			Route::get('/now', 'Api\GlucosaController@index';
			Route::post('/add', 'Api\GlucosaController@insert';
			Route::post('/history', 'Api\GlucosaController@history';
		});
		Route::group(['prefix' => 'food'], function () {
			Route::get('/category', 'Api\FoodController@category');
			Route::get('/receipt', 'Api\FoodController@receipt');
			Route::get('/receipt-detail', 'Api\FoodController@detailReceipt');
		});
		Route::group(['prefix' => 'journal'], function () {
			Route::get('/list', 'Api\FoodController@index');
			Route::post('/add', 'Api\FoodController@insert');
			Route::get('/criteria', 'Api\FoodController@criteria');
			Route::get('/calendar', 'Api\FoodController@calendar');
		});
	});
});
