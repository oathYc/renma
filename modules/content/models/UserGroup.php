<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class UserGroup extends ActiveRecord
{
    public static  function tableName(){
        return '{{%user_group}}';
    }


}