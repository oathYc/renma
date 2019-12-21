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

    /**
     * 更新组团订单
     */
    public static function updateCartOrder($orderId){
        if(!$orderId){
            return false;
        }
        $order = Order::findOne($orderId);
        if(!$order){
            return true;
        }
        $products = $order->extInfo;
        if(!$products){
            return true;
        }
        $array = explode(',',$products);
        $count = count($array);
        if($count ==0){
            $serFee = 0;
        }else{
            $serFee = floor(($order->serverFee)/$count);
        }
        foreach($array as $k =>$v){
            $arr = explode('-',$v);
            if(count($arr) ==2){
                $productId = $arr[0];
                $number = $arr[1];
                $model = new self();
                $model->orderNumber = $order->orderNumber.$productId;
                $model->uid = $order->uid;
                $model->productId = $productId;
                $product = Product::findOne($productId);
                if(!$product){
                    continue;
                }
                $model->productTitle = $product->title;
                $model->totalPrice = $product->price;
                $model->reducePrice = 0;
                $model->payPrice = $product->price;
                $model->coupon = 0;
                $model->number = $number;
                $model->extInfo = $products;
                $model->status = 1;
                $model->typeStatus = 1;//0-代付款 1-待接单 2-已接单 3-待评价 4-待售后
                $model->createTime = $order->createTime;
                $model->proType = $product->type;
                $model->finishTime = time();
                $model->payType = 1;
                $model->type = 2;
                $model->address = $order->address;
                $model->integral = 0;
                $model->remark = '购物车购买';
                $model->serverFee = $serFee;
                $res = $model->save();
            }else{
                continue;
            }
        }
        Order::updateAll(['status'=>2]," id = $orderId");
        return true;
    }
}