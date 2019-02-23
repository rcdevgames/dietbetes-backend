<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class UserDietRequired extends Authenticatable
{
    use Notifiable;

    public $table = 'user_diet_required';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'calories',
        'protein',
        'fat',
        'carbo'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        //
    ];

    public function user()
    {
        return $this->hasOne('\App\User', 'id', 'user_id');
    }
}
