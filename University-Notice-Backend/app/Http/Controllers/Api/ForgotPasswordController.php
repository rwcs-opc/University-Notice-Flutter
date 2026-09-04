<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\PasswordResetOtp;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class ForgotPasswordController extends Controller
{
    public function sendOtp(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json([
                'status' => false,
                'message' => 'Email not found'
            ],404);
        }

        $otp = rand(100000,999999);

        PasswordResetOtp::updateOrCreate(
            ['email'=>$request->email],
            [
                'otp'=>$otp,
                'expires_at'=>Carbon::now()->addMinutes(10)
            ]
        );

        Mail::raw(
            "Your OTP for password reset is: $otp",
            function($message) use ($request){
                $message->to($request->email)
                        ->subject('Password Reset OTP');
            }
        );

        return response()->json([
            'status'=>true,
            'message'=>'OTP sent successfully'
        ]);
    }

    // public function verifyOtp(Request $request)
    // {
    //     //
    // }
    public function verifyOtp(Request $request)
{
    $request->validate([
        'email' => 'required|email',
        'otp' => 'required'
    ]);

    $record = PasswordResetOtp::where('email', $request->email)
        ->where('otp', $request->otp)
        ->first();

    if (!$record) {
        return response()->json([
            'status' => false,
            'message' => 'Invalid OTP'
        ], 400);
    }

    if (now()->greaterThan($record->expires_at)) {
        return response()->json([
            'status' => false,
            'message' => 'OTP has expired'
        ], 400);
    }

    return response()->json([
        'status' => true,
        'message' => 'OTP verified successfully'
    ]);
}

    // public function resetPassword(Request $request)
    // {
    //     //
    // }
    //use Illuminate\Support\Facades\Hash;

public function resetPassword(Request $request)
{
    $request->validate([
        'email' => 'required|email',
        'password' => 'required|min:6|confirmed',
    ]);

    $user = User::where('email', $request->email)->first();

    if (!$user) {
        return response()->json([
            'status' => false,
            'message' => 'User not found'
        ], 404);
    }

    $user->password = Hash::make($request->password);
    $user->save();

    PasswordResetOtp::where('email', $request->email)->delete();

    return response()->json([
        'status' => true,
        'message' => 'Password reset successfully'
    ]);
}
}