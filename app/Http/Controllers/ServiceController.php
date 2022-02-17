<?php

namespace App\Http\Controllers;

use App\Http\Requests\ServiceCreateRequest;
use App\Http\Resources\UserRegistrationsResource;
use App\Http\Resources\UserRegistrationsResource2;
use App\Models\Registration;
use App\Models\UserRegistration;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ServiceController extends Controller
{
    public function info(Registration $registration)
    {
        $reg_id = Registration::where("id",$registration->id)->first();

        return new UserRegistrationsResource2($reg_id);
    }

    public function store(ServiceCreateRequest $request)
    {
        $r = Registration::create($request->all());

        return [
            "id"=>$r->id,
            "url"=>$r->url,
            "name"=>$r->name,
            "price"=>$r->price,
            "description"=>$r->description,
            "position"=>$r->position,
        ];
    }


    public function update(Registration $registration, Request $request)
    {
        $r = Registration::where("id",$registration->id)->first();


        $r->update($request->all());

        return [
            "id"=>$r->id,
            "url"=>$r->url,
            "name"=>$r->name,
            "price"=>$r->price,
            "description"=>$r->description,
            "position"=>$r->position,
        ];
    }

    public function remove(Registration $registration)
    {
        $r = Registration::where("id",$registration->id)->first();

        $r->delete();

        return [
            "DELETED"=>$registration->id
        ];
    }

    public function get()
    {
        return UserRegistrationsResource2::collection(Registration::all());
    }

}

