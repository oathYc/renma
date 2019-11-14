<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Integral extends ActiveRecord
{
    public static  function tableName(){
        return '{{%user_integral}}';
    }

}