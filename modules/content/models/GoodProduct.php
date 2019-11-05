<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class GoodProduct extends ActiveRecord
{
    public static  function tableName(){
        return '{{%good_product}}';
    }

}