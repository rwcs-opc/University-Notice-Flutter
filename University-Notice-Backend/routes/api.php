<?php

use App\Http\Controllers\Api\NoticeController;
use App\Http\Controllers\Api\CategoryController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\DepartmentController;
use App\Http\Controllers\Api\DashboardController;
// Test API
Route::get('/', function () {
    return response()->json([
        'message' => 'University Notice API is Working!',
        'status' => true,
    ]);
});

// Authentication APIs
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout']);

// Super Admin APIs
Route::post('/create-admin', [AdminController::class, 'createAdmin']);

// Department APIs
Route::get('/departments', [DepartmentController::class, 'index']);
Route::post('/departments', [DepartmentController::class, 'store']);
Route::get('/departments/{id}', [DepartmentController::class, 'show']);
Route::put('/departments/{id}', [DepartmentController::class, 'update']);
Route::delete('/departments/{id}', [DepartmentController::class, 'destroy']);

// Category APIs
Route::get('/categories', [CategoryController::class, 'index']);
Route::post('/categories', [CategoryController::class, 'store']);
Route::get('/categories/{id}', [CategoryController::class, 'show']);
Route::put('/categories/{id}', [CategoryController::class, 'update']);
Route::delete('/categories/{id}', [CategoryController::class, 'destroy']);

// Notice APIs
Route::get('/notices', [NoticeController::class, 'index']);
Route::post('/notices', [NoticeController::class, 'store']);
Route::get('/notices/{id}', [NoticeController::class, 'show']);
Route::put('/notices/{id}', [NoticeController::class, 'update']);
Route::delete('/notices/{id}', [NoticeController::class, 'destroy']);

Route::get('/notices/category/{category}', [NoticeController::class, 'category']);

Route::get('/dashboard/stats', [DashboardController::class, 'stats']);