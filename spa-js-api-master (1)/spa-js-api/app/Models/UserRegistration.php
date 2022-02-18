<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserRegistrations extends Model
{
    use HasFactory;

    protected $guarded = [];


    public function Registration()
    {
        return $this->belongsTo(Registration::class);
    }

    public function Users()
    {
        return $this->belongsTo(User::class);
    }


}
