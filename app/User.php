<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    const UPLOAD_DESTINATION_PATH = '/uploads/avatar/';

    const USER_ACTIVE = 1;
    const USER_DEACTIVE = 0;

    const GENDER_MALE = 1;
    const GENDER_FEMALE = 0;

    const NO_HISTORY = 0;
    const FROM_FATHER = 1;
    const FROM_MOTHER = 2;
    const FROM_GRANDPA = 3;
    const FROM_GRANDMA = 4;

    const ACTIVITY_BEDREST = 0;
    const ACTIVITY_MILD = 1;
    const ACTIVITY_MODERATE = 2;
    const ACTIVITY_HEAVY = 3;
    const ACTIVITY_VERY_HEAVY = 4;

    const SYMPTOMS_POLIDIPSI = 1;
    const SYMPTOMS_POLIURI = 2;
    const SYMPTOMS_WEIGHT_LOSS = 3;
    const SYMPTOMS_FEELING_WEAK = 4;

    private $_path;
	private $_thumbPath;


    public $table = 'users';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'email',
        'password',
        'token',
        'google_token',
        'onesignal_token',
        'avatar_url',
        'last_login'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'updated_at',
        'created_at'
    ];

    protected $with = [
        'userDetail'
    ];

    public function __construct(array $attributes = array())
    {
        parent::__construct($attributes);

        $path = public_path(self::UPLOAD_DESTINATION_PATH);

        if(!is_dir($path)) {
            \File::makeDirectory($path, 0775, true);
        }
        $this->setPath($path);
    }

    /**
	 * set path
	 *
	 * @param string $value
	 */
	public function setPath($value)
	{
		$this->_path = $value;
	}

	/**
	 * @return string
	 */
	public function getPath()
	{
		return $this->_path;
	}

	/**
	 * set path
	 *
	 * @param string $value
	 */
	public function setThumbPath($value)
	{
		$this->_thumbPath = $value;
    }

    public function deleteFile()
    {
        @unlink($this->getPath() . $this->avatar_url);
    }

    public function getFileUrl()
    {
        return url(self::UPLOAD_DESTINATION_PATH . $this->avatar_url);
    }

    public function generateFilename($userCode, $ext)
    {
        return str_slug($userCode . ' ' . $this->name . ' ' . time()) . '.' . $ext;
    }

    public function userDetail()
    {
        return $this->hasOne('\App\UserDetail', 'user_id', 'id');
    }
    public function userGlucose()
    {
        return $this->hasMany('\App\UserGlucose', 'user_id', 'id');
    }
    public function userMedicine()
    {
        return $this->hasMany('\App\UserMedicine', 'user_id', 'id');
    }
}
