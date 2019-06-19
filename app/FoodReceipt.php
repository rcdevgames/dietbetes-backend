<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class FoodReceipt extends Authenticatable
{
    use Notifiable;

    const ACTIVE = 1;
    const DEACTIVE = 0;

    public $table = 'food_receipt';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'type',
        'title',
        'ingredients',
        'tutorial'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'image',
        'created_at',
        'updated_at'
    ];
}
