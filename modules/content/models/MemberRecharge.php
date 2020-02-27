<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class MemberRecharge extends ActiveRecord
{
    public static  function tableName(){
        return '{{%member_recharge}}';
    }

}