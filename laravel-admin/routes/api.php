<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\OrderController;

Route::post('login', [AuthController::class, 'login']);
Route::post('register',[AuthController::class, 'register']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('user', [UserController::class,'user']);
    Route::put('user/info', [UserController::class,'updateInfo']);
    Route::put('user/password', [UserController::class,'updatePassword']);
    Route::post('upload', [ImageController::class,'upload']);
    Route::get('export', [OrderController::class,'export']);

    Route::apiResource('users', UserController::class);
    Route::apiResource('roles', RoleController::class);
    Route::apiResource('products', ProductController::class);
    Route::apiResource('orders', OrderController::class)->only('index','show');
});


