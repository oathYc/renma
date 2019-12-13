<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Search extends ActiveRecord
{
    public static  function tableName(){
        return '{{%search}}';
    }

}