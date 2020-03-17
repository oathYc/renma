<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Group extends ActiveRecord
{
    public static  function tableName(){
        return '{{%group}}';
    }

}