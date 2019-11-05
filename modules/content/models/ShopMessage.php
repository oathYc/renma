<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class ShopMessage extends ActiveRecord
{
    public static  function tableName(){
        return '{{%shop_message}}';
    }

}