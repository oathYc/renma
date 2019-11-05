<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Order extends ActiveRecord
{
    public static  function tableName(){
        return '{{%order}}';
    }

}