<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class FoodJournal extends Authenticatable {
    use Notifiable;

    const SCHEDULE_BREAKFAST = 1;
    const SCHEDULE_MORNING_SNACK = 2;
    const SCHEDULE_LUNCH = 3;
    const SCHEDULE_AFTERNOON_SNACK = 4;
    const SCHEDULE_DINNER = 5;
    const SCHEDULE_EVENING_SNACK = 6;

    public $table = 'food_journal';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'cal',
        'carbo',
        'protein',
        'fat',
        'schedule'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        //
    ];
}
