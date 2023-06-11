<?php

use App\Http\Controllers\AuthController;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [AuthController::class, 'save_user']);
Route::post('/login', [AuthController::class, 'get_user']);
Route::get('/candidat/all', [AuthController::class, 'get_candidat_all']);
Route::get('/candidat/result', [AuthController::class, 'get_candidat_result']);
Route::post('/vote/save', [AuthController::class, 'save_vote']);
Route::get('/config', [AuthController::class, 'get_config']);
