<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class RepairReturn extends ActiveRecord
{
    public static  function tableName(){
        return '{{%repair_return}}';
    }

}