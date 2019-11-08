<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class UserPush extends ActiveRecord
{
    public static  function tableName(){
        return '{{%user_push}}';
    }

}