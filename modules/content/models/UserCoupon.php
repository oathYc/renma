<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class UserCoupon extends ActiveRecord
{
    public static  function tableName(){
        return '{{%user_coupon}}';
    }

    /**
     * 记录用户优惠券使用
     */
    public static function addRecord($uid,$couponId,$orderId){
        $model = new self();
        $model->uid = $uid;
        $model->couponId = $couponId;
        $model->orderId = $orderId;
        $model->createTime = time();
        $model->save();
    }
}