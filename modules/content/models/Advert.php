<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Advert extends ActiveRecord
{
    public static  function tableName(){
        return '{{%advert}}';
    }

}