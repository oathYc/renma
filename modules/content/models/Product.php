<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Product extends ActiveRecord
{
    public static  function tableName(){
        return '{{%product}}';
    }

    /**
     * 获取商品的评价
     */
    public static function getComment($productId,$page=1,$pageSize=10){
//        if(!$page){$page=1;}
//        $limit = " limit ".($pageSize*($page-1)).",$pageSize";
        $sql = "select o.id as orderId,o.uid,m.nickname,m.avatar,o.productId,o.evaluate,FROM_UNIXTIME(o.evalTime, '%Y-%m-%d %H:%i:%s') as evalTime from {{%order}} o inner join {{%product}} p on p.id = o.productId left join {{%member}} m on m.id = o.uid where o.productId = $productId and evalTime > 0 order by evalTime desc ";
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        $total = count($data);
//        $sql .= $limit;
//        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        return ['total'=>$total,'comment'=>$data];
    }
}