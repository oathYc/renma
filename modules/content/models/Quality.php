<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Quality extends ActiveRecord
{
    public static  function tableName(){
        return '{{%quality_product}}';
    }

    /**
     * 添加质保商品信息
     */
    public static function addProduct($uid,$productId,$orderId){
        $product = Product::find()->where("id = $productId")->asArray()->one();
        $order = Order::find()->where("id = $orderId")->asArray()->one();
        if(!$product || !$order){
            return false;
        }
        $model = new Quality();
        $model->uid = $uid;
        $model->productId = $productId;
        $model->catId = $product['catCid'];
        $model->brand = $product['brand'];
        $model->buyTime = $order['createTime'];
        $model->gyTime = '';
        $model->barCode = '';
        $model->createTime = time();
        $model->productName = $product['title'];
        $model->orderId = $orderId;
        $res = $model->save();
        if($res){
            return true;
        }else{
            return false;
        }
    }
}