<?php

namespace App\Http\Controllers;

use App\Exceptions\ApiException;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\ServiceRequest;
use App\Http\Resources\UserRegistrationsResource;
use App\Http\Resources\UserRegistrationsResource2;
use App\Models\Registration;
use App\Models\User;
use App\Models\UserRegistration;
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

    public function services()
    {

        $reg_id = UserRegistration::where("user_id", Auth::id())->get();



        return

            [
                "count" => 1,
                "next" => "next_id",
                "previous" => "previous_id",
                "results" =>  UserRegistrationsResource::collection($reg_id)
            ];

    }

    public function service(Registration $registration)
    {
        $reg_id = UserRegistration::where("user_id", Auth::id())->where("registration_id",$registration->id)->get();

        return UserRegistrationsResource::collection($reg_id);
    }

    public function add_service(ServiceRequest $request)
    {
        $reg = Registration::where("name" ,$request->service)->first();


        $reg_id =UserRegistration::create([
            "user_id"=>Auth::id(),
            "registration_id"=>$reg->id,
            "status"=>1
        ]);

        return [
            "id_registration"=> $reg_id->id
        ];
    }

    public function remove_service(UserRegistration $registration)
    {
        $reg_id = UserRegistration::where("user_id", Auth::id())->where("id",$registration->id)->first();
        $reg_id->delete();

        return [
            "id"=>$reg_id->id
        ];

    }

}
