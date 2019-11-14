<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class MemberLog extends ActiveRecord
{
    public static  function tableName(){
        return '{{%member_log}}';
    }

}