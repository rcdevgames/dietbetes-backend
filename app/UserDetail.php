<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class UserDetail extends Authenticatable
{
    use Notifiable;

    public $table = 'user_detail';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'full_name',
        'call_name',
        'gender',
        'dob',
        'physical_activity',
        'height',
        'weight',
        'ideal_weight',
        'mass_index',
        'history_family',
        'chol_total',
        'chol_ldl',
        'chol_hdl',
        'triglesida',
        'blood_pressure',
        'clinical_symptoms'
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

    public function user()
    {
        return $this->hasOne('\App\User', 'id', 'user_id');
    }
}
