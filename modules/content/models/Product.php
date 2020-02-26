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
        if(!$page){$page=1;}
        $limit = " limit ".($pageSize*($page-1)).",$pageSize";
        $sql = "select o.id as orderId,o.uid,m.nickname,m.avatar,o.productId,o.evalImage,o.evalVideo,o.evaluate,FROM_UNIXTIME(o.evalTime, '%Y-%m-%d %H:%i:%s') as evalTime from {{%order}} o inner join {{%product}} p on p.id = o.productId left join {{%member}} m on m.id = o.uid where o.productId = $productId and evalTime > 0 order by evalTime desc ";
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        $total = count($data);
        $sql .= $limit;
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        return ['total'=>$total,'comment'=>$data];
    }
    /**
     * 获取商品评论
     * type 0-全部 1-最新 2-有图 3-视频
     */
    public static function getCommentByType($productId,$type=0,$page=1,$pageSize=10){
        if(!$page){$page=1;}
        $limit = " limit ".($pageSize*($page-1)).",$pageSize";
        $where = " where o.productId = $productId and o.evalTime > 0 ";
        $order = "  order by o.evalTime desc ";
        $today = strtotime(date('Y-m-d'));
        $where1 = "$where and o.evalTime >= $today";//最新
        $where2 = "$where and !isnull(o.evalImage)";//有图
        $where3 = "$where and o.evalVideo not like '%s%' ";//视频
        if($type ==1){
            $where = $where1;
        }
        if($type ==2){
            $where = $where2;
        }
        if($type == 3){
            $where = $where3;
        }
        $sql = "select o.id as orderId,o.uid,m.nickname,m.avatar,o.productId,o.evaluate,FROM_UNIXTIME(o.evalTime, '%Y-%m-%d %H:%i:%s') as evalTime,o.evalImage,o.evalVideo from {{%order}} o inner join {{%product}} p on p.id = o.productId left join {{%member}} m on m.id = o.uid  ";
        $sqlData = $sql.$where.$order.$limit;
        $data = \Yii::$app->db->createCommand($sqlData)->queryAll();
        foreach($data as $k => $v){
            $data[$k]['evalImage'] = $v['evalImage']?unserialize($v['evalImage']):'';
            if($data[$k]['evalImage']){
                $data[$k]['evalImages'] = explode(',',$data[$k]['evalImage']);
            }
//            var_dump($data[$k]['evalImage']);die;
            $data[$k]['evalVideo'] = $v['evalVideo']?unserialize($v['evalVideo']):'';
            if($data[$k]['evalVideo']){
                $data[$k]['evalVideos'] = explode(',',$data[$k]['evalVideo']);
            }
        }
//        var_dump($data);die;
        //获取类型数量
        $sql1 = $sql.$where1;
        $content1 = \Yii::$app->db->createCommand($sql1)->queryAll();
        $count1 = count($content1);
        $sql2 = $sql.$where2;
        $content2 = \Yii::$app->db->createCommand($sql2)->queryAll();
        $count2 = count($content2);
        $sql3 = $sql.$where3;
        $content3 = \Yii::$app->db->createCommand($sql3)->queryAll();
        $count3 = count($content3);
        $sql = $sql." where o.productId = $productId and o.evalTime > 0 ";
        $content = \Yii::$app->db->createCommand($sql)->queryAll();
        $count = count($content);
        $counts= [
            ['type'=>0,'number'=>$count],
            ['type'=>1,'number'=>$count1],
            ['type'=>2,'number'=>$count2],
            ['type'=>3,'number'=>$count3],
        ];
        return ['count'=>$counts,'comment'=>$data];
    }
}