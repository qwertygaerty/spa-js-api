<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserRegistrationsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
//        var_dump($this->all());

        return [
            "id"=>$this->id,
            "url"=>$this->registration->url,
            "service"=>$this->registration->name,
            "user"=>$this->user->login,
            "status"=>$this->status,
        ];
    }
}
