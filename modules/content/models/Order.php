<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Order extends ActiveRecord
{
    public static  function tableName(){
        return '{{%order}}';
    }
    /**
     * 会员充值
     */
    public static function createOrder($uid,$orderNumber,$money,$remark){
        $model = new self();
        $model->orderNumber = $orderNumber;
        $model->uid = $uid;
        $model->productId = 0;
        $model->productTitle = $remark;
        $model->payPrice = $money;
        $model->totalPrice = $money;
        $model->status = 0;
        $model->createTime = time();
        $model->type = 1;//1-充值 2-买商品
        $model->save();
        return $model->id;
    }

}