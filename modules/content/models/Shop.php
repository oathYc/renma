<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Shop extends ActiveRecord
{
    public static  function tableName(){
        return '{{%shop}}';
    }

}