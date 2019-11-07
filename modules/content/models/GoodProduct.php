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
        $goodProduct = self::find()->orderBy('rank desc')->offset($offset)->limit($pageSize)->all();
        return ['goodTotal'=>$total,'goodProduct'=>$goodProduct];
    }
}