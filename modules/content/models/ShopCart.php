<?php


namespace app\modules\content\models;


use yii\data\Pagination;
use yii\db\ActiveRecord;

class ShopCart extends ActiveRecord
{
    public static  function tableName(){
        return '{{%shop_cart}}';
    }
    /**
     * 获取用户购物车收藏
     */
    public static function getUserShopCart($page=1){
        if(!$page){$page = 1;}
        $count = self::find()->count();
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $limit = " limit ".(10*($page-1)).",10";
        $sql = "select sc.*,sc.createTime as addTime,m.*,p.title,p.price,p.brand from {{%shop_cart}} sc left join {{%member}} m on m.id = sc.uid left join {{%product}} p on p.id = sc.productId order by sc.id desc $limit";
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        return ['count'=>$count,'page'=>$pages,'data'=>$data];
    }
}