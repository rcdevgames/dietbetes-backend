<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class UserMedicine extends Authenticatable
{
    use Notifiable;

    public $table = 'user_medicine';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'medicine_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'updated_at',
        'created_at'
    ];

    protected $with = [
        'medicine'
    ];

    public function medicine()
    {
        return $this->hasOne('\App\Medicines', 'id', 'medicine_id');
    }
}
