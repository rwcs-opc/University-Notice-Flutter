<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    // Create Admin
    public function createAdmin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation Error',
                'errors' => $validator->errors()
            ], 422);
        }

        $admin = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => 'admin',
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Admin Created Successfully',
            'admin' => [
                'id' => $admin->id,
                'name' => $admin->name,
                'email' => $admin->email,
                'role' => $admin->role,
            ]
        ], 201);
    }
    public function admins()
{
    $admins = User::where('role', 'admin')->get();

    return response()->json([
        'status' => true,
        'admins' => $admins
    ]);
}
public function users()
{
    $users = User::where('role', 'user')->get();

    return response()->json([
        'status' => true,
        'users' => $users
    ]);
}
public function makeAdmin($id)
{
    $user = User::find($id);

    if (!$user) {
        return response()->json([
            'status' => false,
            'message' => 'User not found'
        ], 404);
    }

    $user->role = 'admin';
    $user->save();

    return response()->json([
        'status' => true,
        'message' => 'User promoted to Admin'
    ]);
}
public function removeAdmin($id)
{
    $user = User::find($id);

    if (!$user) {
        return response()->json([
            'status' => false,
            'message' => 'User not found'
        ], 404);
    }

    // Prevent removing the Super Admin
    if ($user->role == 'super_admin') {
        return response()->json([
            'status' => false,
            'message' => 'Super Admin cannot be removed.'
        ], 403);
    }

    $user->role = 'user';
    $user->save();

    return response()->json([
        'status' => true,
        'message' => 'Admin removed successfully.'
    ]);
}
public function updateAdmin(Request $request, $id)
{
    $admin = User::find($id);

    if (!$admin) {
        return response()->json([
            'status' => false,
            'message' => 'Admin not found'
        ], 404);
    }

    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'email' => 'required|email|unique:users,email,' . $id,
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'errors' => $validator->errors(),
        ], 422);
    }

    $admin->update([
        'name' => $request->name,
        'email' => $request->email,
    ]);

    return response()->json([
        'status' => true,
        'message' => 'Admin updated successfully',
        'admin' => $admin,
    ]);
}
}