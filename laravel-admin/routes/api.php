<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ImageController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\PermissionController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Influencer\ProduactController;
use App\Http\Controllers\Influencer\LinkController;


// Common
Route::post('login', [AuthController::class, 'login']);
Route::post('register',[AuthController::class, 'register']);

Route::group([
    'middleware'=>'auth:sanctum',
], function(){
    Route::get('user', [AuthController::class,'user']);
    Route::put('user/info', [AuthController::class,'updateInfo']);
    Route::put('user/password', [AuthController::class,'updatePassword']);
});

// Admin
Route::middleware(['auth:sanctum','ability:admin'])->prefix('admin')->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('upload', [ImageController::class,'upload']);
    Route::get('export', [OrderController::class,'export']);
    Route::get('chart', [DashboardController::class,'chart']);

    Route::apiResource('users', UserController::class);
    Route::apiResource('roles', RoleController::class);
    Route::apiResource('products', ProductController::class);
    Route::apiResource('orders', OrderController::class)->only('index','show');
    Route::apiResource('permissions', PermissionController::class)->only('index');
});

// Influencer
Route::group([
    'prefix'=>'influencer',
], function(){
    Route::get('/products', );

    Route::group([
        'middleware' => ['auth:sanctum','ability:influencer']
    ],function(){
        Route::post('links',[LinkController::class,'store']);
    });
});


// Checkout Routes
Route::group([
    'prefix'=>'checkout',
], function(){
    Route::get('links/{code}',[\App\Http\Controllers\Checkout\LinkController::class,'show']);
    Route::post('orders',[\App\Http\Controllers\Checkout\OrderController::class,'store']);
});
