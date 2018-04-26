<?php
declare(strict_types=1);

namespace app\models;

use Yii;
use \yii\db\ActiveRecord;
use \yii\web\IdentityInterface;

/**
 * This is the model class for table "user".
 *
 * @property int $id
 * @property string $username
 * @property string $email
 * @property string $password
 * @property string $subscription_type
 * @property string $company
 * @property string $country
 * @property string $name
 * @property string $auth_key
 *
 * @property Payment[] $payments
 */
class User extends ActiveRecord implements IdentityInterface
{
    const SUBSCRIPTION_COMPANY = 'company';
    const SUBSCRIPTION_INDIVIDUAL = 'individual';

    /**
     * @var array
     */
    public static $subscriptionTypes = [
        self::SUBSCRIPTION_COMPANY,
        self::SUBSCRIPTION_INDIVIDUAL
    ];

    /**
     * @return string
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'email', 'password', 'subscription_type', 'country', 'name', 'auth_key'], 'required'],
            [['subscription_type'], 'string'],
            [['username'], 'string', 'max' => 50],
            [['email', 'password', 'company', 'country', 'name'], 'string', 'max' => 255],
            [['auth_key'], 'string', 'max' => 32],
            [['username'], 'unique'],
            [['email'], 'unique'],
            [['auth_key'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'email' => 'Email',
            'password' => 'Password',
            'subscription_type' => 'Subscription Type',
            'company' => 'Company',
            'country' => 'Country',
            'name' => 'User name',
            'auth_key' => 'Auth Key',
        ];
    }
    /**
     * {@inheritdoc}
     */
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    /**
     * {@inheritdoc}
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne(['auth_key' => $token]);
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username]);
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * @return void
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword(string $password) : bool
    {
        return Yii::$app->security->validatePassword($password, $this->password);
    }

    /**
     * @param string $password
     */
    public function setPassword(string $password) : void
    {
        $this->password = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPayments()
    {
        return $this->hasMany(Payment::className(), ['created_by' => 'id']);
    }
}
