<?php 
namespace App;

use Illuminate\Database\Eloquent\Model;

class NotificationLog extends Model
{
    public $table = 'notification_log';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'message'
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