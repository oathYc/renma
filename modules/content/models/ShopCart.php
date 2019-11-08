<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class ShopCart extends ActiveRecord
{
    public static  function tableName(){
        return '{{%shop_cart}}';
    }

}