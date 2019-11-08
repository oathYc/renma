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
            //是否是会员 会员特权
            $memeber = Member::findOne($uid);
            if(!$memeber){
                $total = 0;
            }else{
                if($memeber->member == 1){
                    $data = self::find()->asArray()->all();
                    foreach($data as $k => $v){
                        $userCou = UserCoupon::find()->where("couponId = {$v['id']} and uid = $uid")->one();
                        if(!$userCou){
                            $coupon[] = $v;
                        }
                    }
                    $total = count($coupon);
                }else{
                    $total = 0;
                }
            }

        }
        return ['total'=>$total,'coupon'=>$coupon];
    }
}