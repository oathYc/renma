<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Logistics extends ActiveRecord
{
    public static  function tableName(){
        return '{{%order_logistics}}';
    }

}