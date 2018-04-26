<?php
declare(strict_types=1);

namespace app\models;

use Yii;
use yii\base\Model;

class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $country;
    public $name;
    public $subscription_type;
    public $company;
    public $password_repeat;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\app\models\User', 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 50],
            ['email', 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\app\models\User', 'message' => 'This email address has already been taken.'],
            ['password', 'required'],
            ['password', 'string', 'min' => 6],
            ['country', 'string', 'max' => 255],
            ['country', 'required'],
            ['country', 'trim'],
            ['name', 'string', 'max' => 255],
            ['name', 'required'],
            ['name', 'trim'],
            ['subscription_type', 'in', 'range' => User::$subscriptionTypes],
            ['subscription_type', 'required'],
            ['company', 'trim'],
            ['company','required', 'when' => function($model) {
                return $model->subscription_type == User::SUBSCRIPTION_COMPANY;
            }],
            ['password_repeat', 'required'],
            ['password_repeat', 'compare', 'compareAttribute'=>'password', 'message'=>"Passwords don't match" ]
        ];
    }

    /**
     * @return User|null
     */
    public function signUp()
    {
        if (!$this->validate()) {
            return null;
        }

        $user = new User();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->name = $this->name;
        $user->company = $this->company;
        $user->subscription_type = $this->subscription_type;
        $user->country = $this->country;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        return $user->save() ? $user : null;
    }
}