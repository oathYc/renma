<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class GroupPrice extends ActiveRecord
{
    public static  function tableName(){
        return '{{%group_price}}';
    }

}