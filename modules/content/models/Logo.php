<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Logo extends ActiveRecord
{
    public static  function tableName(){
        return '{{%logo}}';
    }

}