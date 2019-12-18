<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Integral extends ActiveRecord
{
    public static  function tableName(){
        return '{{%user_integral}}';
    }

    /**
     * 记录数据
     * type 1-较少 2-新增
     */
    public static function saveRecord($uid,$integral,$type,$remark){
        $model = new self();
        $model->uid = $uid;
        $model->integral = $integral;
        $model->type = $type;
        $model->remark = $remark;
        $model->createTime = time();
        $model->save();
        return true;
    }
}