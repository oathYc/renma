<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class MemberReturn extends ActiveRecord
{
    public static  function tableName(){
        return '{{%member_return}}';
    }

}