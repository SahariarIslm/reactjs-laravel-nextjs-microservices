<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Cookie;

class AuthController extends Controller
{
    public function login(Request $request) {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        $user = Auth::user();
        $token = $user->createToken('auth_token')->plainTextToken;
        // 60 minutes = 1 hour.
        // Added 'httpOnly' as true and 'secure' as true for security.
        // $cookie = cookie('jwt', $token, 60, null, null, true, true);
        $cookie = cookie('jwt', $token, 60, '/', null, false, true);  // Added path, domain, SameSite params

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
        ])->withCookie($cookie);
    }

    public function logout()
    {
        $cookie = Cookie::forget('jwt');

        return response([
            'message' => 'success'
        ])->withCookie($cookie);
    }

    public function register(RegisterRequest $request)
    {
        $user = User::create($request->only('first_name','last_name','email')+[
            'role_id'=>3,
            'password'=>Hash::make($request->input('password')),
            'is_influencer' => 1
        ]);
        return response($user, 201);
    }

    public function user()
    {
        $user = Auth::user();
        $resource = new UserResource($user);
        if($user->isInfluencer()){
            return $resource;
        }
        return $resource->additional([
            'data'=>[
                'permissions' => $user->permissions()
            ]
        ]);
    }

    public function updateInfo(UpdateInfoRequest $request)
    {
        $user = Auth::user();
        $user->update($request->only('first_name','last_name','email'));
        return response(new UserResource($user), 202);
    }

    public function updatePassword(Request $request)
    {
        $user = Auth::user();
        $user->update([
            'password' => Hash::make($request->input('password'))
        ]);
        return response(new UserResource($user), 202);
    }

}
