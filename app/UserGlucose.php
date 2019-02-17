<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class UserGlucose extends Authenticatable
{
    use Notifiable;

    public $table = 'user_glucose';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'hba1c',
        'gdp',
        'gds',
        'ttgo',
        'date'
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
