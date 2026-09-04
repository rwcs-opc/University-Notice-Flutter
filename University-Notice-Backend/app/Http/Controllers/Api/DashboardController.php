<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Notice;
use App\Models\User;
use App\Models\Category;
use App\Models\Department;

class DashboardController extends Controller
{
    public function stats()
    {
        return response()->json([
            "status" => true,

            "total_notices" => Notice::count(),

            "total_users" => User::count(),

            "total_departments" => Department::count(),

            "total_categories" => Category::count(),

            "recent_notices" => Notice::latest()
                ->take(5)
                ->get()
        ]);
    }
    public function dashboard()
{
    return response()->json([
        'status' => true,
        'users' => User::count(),
        'notices' => Notice::count(),
        'admins' => User::where('role', 'admin')->count(),
    ]);
}
}