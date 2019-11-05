<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class GroupProduct extends ActiveRecord
{
    public static  function tableName(){
        return '{{%group_product}}';
    }

}