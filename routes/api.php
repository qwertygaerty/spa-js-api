<?php

use App\Http\Controllers\ServiceController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::post("api-token-auth", [UserController::class, "login"])->withoutMiddleware("auth:api");
Route::get("api-token-logout",[UserController::class, "logout"]);
Route::get("servicerecord",[UserController::class, "services"]);

Route::get("servicerecord/{registration}",[UserController::class, "service"]);
Route::post("servicerecord",[UserController::class, "add_service"]);
Route::delete("servicerecord/{registration}",[UserController::class, "remove_service"]);

Route::get("service/{registration}",[ServiceController::class, "info"]);

Route::get("service",[ServiceController::class, "get"]);


Route::middleware(['can:admin, App\Models\User'])->group(function() {
    Route::post("service",[ServiceController::class, "store"]);
    Route::put("service/{registration}",[ServiceController::class, "update"]);
    Route::delete("service/{registration}",[ServiceController::class, "remove"]);
});


