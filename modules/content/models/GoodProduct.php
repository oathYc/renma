<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class GoodProduct extends ActiveRecord
{
    public static  function tableName(){
        return '{{%good_product}}';
    }

    /**
     * 获取优选区商品
     */
    public static function getGoodProduct($page=1,$pageSize = 10){
        $total = GoodProduct::find()->count();
        $offset = ($page-1)*$pageSize;
        $goodProduct = self::find()->orderBy('rank desc')->offset($offset)->limit($pageSize)->asArray()->all();
        foreach($goodProduct as $k => $v){
            $product = Product::find()->where("id = {$v['productId']}")->asArray()->one();
            $goodProduct[$k]['title'] = $product['title'];
            $goodProduct[$k]['headImage'] = $product['headMsg'];
            $goodProduct[$k]['price'] = $product['price'];
            $goodProduct[$k]['brand'] = $product['brand'];
        }
        return ['goodTotal'=>$total,'goodProduct'=>$goodProduct];
    }
}