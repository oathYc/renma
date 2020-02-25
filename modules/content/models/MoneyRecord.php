<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class MoneyRecord extends ActiveRecord
{
    public static  function tableName(){
        return '{{%member_money_record}}';
    }

    /**
     * 记录金额数据
     * $add 1=新增 2-减少
     * $type 1-组团
     */
    public static function saveRecord($uid,$orderId,$money,$add=1,$type=1){
        $model = new self();
        $model->uid = $uid;
        $model->orderId = $orderId;
        $model->money = $money;
        $model->type = $add;
        $model->createTime = time();
        $model->moneyType =$type;
        $model->save();
        return true;
    }
}