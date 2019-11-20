<?php


namespace app\modules\content\models;


use yii\data\Pagination;
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

    /**
     * h后台获取用户优惠券使用列表
     */
    public static function getUserCoupon($page=1){
        if(!$page){$page = 1;}
        $count = self::find()->count();
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $limit = " limit ".(10*($page-1)).",10";
        $sql = "select *,uc.createTime as ucTime from {{%user_coupon}} uc left join {{%member}} m on m.id = uc.uid left join {{%coupon}} c on c.id = uc.couponId order by uc.id desc $limit";
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        return ['count'=>$count,'page'=>$pages,'data'=>$data];
    }
}