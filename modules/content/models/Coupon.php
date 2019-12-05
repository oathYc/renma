<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Coupon extends ActiveRecord
{
    public static  function tableName(){
        return '{{%coupon}}';
    }

    /**
     * 获取用户优惠券信息
     */
    public static function getUserCoupon($uid){
        $coupon = [];
        if(!$uid){
            $total = 0;
        }else{
            $coupon = UserCoupon::find()->where(" uid = $uid and status = 0")->asArray()->all();
            $total = count($coupon);
        }
        return ['total'=>$total,'coupon'=>$coupon];
    }
}