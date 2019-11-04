<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Coupon extends ActiveRecord
{
    public static  function tableName(){
        return '{{%coupon}}';
    }

}