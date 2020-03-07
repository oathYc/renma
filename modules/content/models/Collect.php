<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Collect extends ActiveRecord
{
    public static  function tableName(){
        return '{{%user_collect}}';
    }

}