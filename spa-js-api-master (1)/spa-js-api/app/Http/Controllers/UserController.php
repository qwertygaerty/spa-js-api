<?php

namespace App\Http\Controllers;

use App\Exceptions\ApiException;
use App\Http\Requests\LoginRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function login(LoginRequest $request)
    {

        $u = User::where("login", $request->login)->where("password", $request->password)->first();

        if (!$u) {
            throw new ApiException(401, "Authentication failed");
        }

        $data = [
            "data" => [
                "user_token" => $u->generateToken()
            ]
        ];

        return response()->json($data);
    }

    public function logout()
    {
        Auth::user()->api_token = null;
        Auth::user()->save();

        $data = [
            "data" => [
                "message" => "logout"
            ]
        ];

        return response()->json($data);

    }



}
