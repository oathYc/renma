<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Quality extends ActiveRecord
{
    public static  function tableName(){
        return '{{%quality_product}}';
    }

}