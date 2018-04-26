<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "countries".
 *
 * @property string $country_code
 * @property string $country_name
 *
 * @property Client[] $clients
 */
class Country extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'countries';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['country_code', 'country_name'], 'required'],
            [['country_code'], 'string', 'max' => 2],
            [['country_name'], 'string', 'max' => 100],
            [['country_code'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'country_code' => 'Country Code',
            'country_name' => 'Country Name',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClients()
    {
        return $this->hasMany(Client::className(), ['country' => 'country_code']);
    }
}
