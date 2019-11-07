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
            $data = self::find()->asArray()->all();
            foreach($data as $k => $v){
                $userCou = UserCoupon::find()->where("couponId = {$v['id']} and uid = $uid")->one();
                if(!$userCou){
                    $coupon[] = $v;
                }
            }
            $total = count($coupon);
        }
        return ['total'=>$total,'coupon'=>$coupon];
    }
}