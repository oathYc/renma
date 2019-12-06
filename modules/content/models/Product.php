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
    /**
     * 获取商品评论
     * type 0-全部 1-最新 2-有图 3-视频
     */
    public static function getCommentByType($productId,$type=0,$page=1,$pageSize=10){
        if(!$page){$page=1;}
        $limit = " limit ".($pageSize*($page-1)).",$pageSize";
        $where = " o.productId = $productId and o.evalTime > 0 ";
        $order = "  order by o.evalTime desc ";
        if($type ==0){
            $today = strtotime(date('Y-m-d'));
            $where .= " and o.evalTime >= $today";
        }
        if($type ==2){
            $where .= " and !isnull(o.evalImage)";
        }
        if($type == 3){
            $where .= " and !isnull(o.evalVideo)";
        }
        $sql = "select o.id as orderId,o.uid,m.nickname,m.avatar,o.productId,o.evaluate,FROM_UNIXTIME(o.evalTime, '%Y-%m-%d %H:%i:%s') as evalTime,o.evalImage,o.evalVideo from {{%order}} o inner join {{%product}} p on p.id = o.productId left join {{%member}} m on m.id = o.uid where $where $order ";
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        $total = count($data);
        $sql .= $limit;
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        foreach($data as $k => $v){
            $data[$k]['evalImage'] = $v['evalImage']?unserialize($v['evalImage']):'';
            $data[$k]['evalVideo'] = $v['evalVideo']?unserialize($v['evalVideo']):'';
        }
        return ['total'=>$total,'comment'=>$data];
    }
}