<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\modules\content\models\Address;
use app\modules\content\models\GroupProduct;
use app\modules\content\models\Logistics;
use app\modules\content\models\Member;
use app\modules\content\models\Order;
use app\modules\content\models\Product;
use app\modules\content\models\Quality;
use app\modules\content\models\RepairReturn;
use app\modules\content\models\UserGroup;
use yii\data\Pagination;
use yii;

class RepairController  extends AdminController
{
    public $enableCsrfValidation = false;
    public $layout = 'content';
    public function init(){
        parent::init();
        parent::setContentId('repair');
    }
    public function actionIndex(){
        return $this->redirect('/content/index/index');
    }

    /**
     * 维修师审核
     */
    public function actionRepairCheck(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Member::find()->where(" repair in(-1,1)")->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = Member::find()->select("id,name,phone,repair")->orderBy('id desc')->where("repair in(-1,1)")->asArray()->offset($page->offset)->limit($page->limit)->all();
        return $this->render('repair-check',['page'=>$page,'count'=>$count,'data'=>$data]);
    }
    /**
     * 维修师审核
     * 同意 注销操作
     */
    public function actionCheckRepair(){
        $type = Yii::$app->request->get('type',1);
        $id = Yii::$app->request->get('id');
        if(!$id){
            echo "<script>alert('id不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        if($type == 1){
            $update = ['repair'=>1];
        }else{
            $update = ['repair'=>0,'name'=>'','phone'=>''];
        }
        $res = Member::updateAll($update," id = $id");
        if($res){
            echo "<script>alert('编辑成功');setTimeout(function(){location.href='repair-check';},1000)</script>";die;
        }else{
            echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
    /**
     * 维修师提现
     */
    public function actionRepairReturn(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $type = Yii::$app->request->get('type',99);//99-所有 0-待审核 1-已提现
        $uid = Yii::$app->request->get('uid',0);
        $where = " 1 = 1";
        if($uid){
            $where .= " and uid = $uid ";
        }
        if($type != 99){
            $where .= " and status = $type";
        }
        $count = RepairReturn::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = RepairReturn::find()->orderBy('id desc')->where($where)->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $repair = Member::findOne($v['uid']);
            if($repair){
                $name = $repair->repairName;
                $phone = $repair->repairPhone;
            }else{
                $name = '';
                $phone = '';
            }
            $data[$k]['name'] = $name;
            $data[$k]['phone'] = $phone;
        }
        return $this->render('repair-return',['page'=>$page,'count'=>$count,'data'=>$data]);
    }
    /**
     * 维修师提现通过
     */
    public function actionCheckRepairReturn(){
        $id = Yii::$app->request->get('id');
        if(!$id){
            echo "<script>alert('参数错误');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $data = RepairReturn::findOne($id);
        if(!$data){
            echo "<script>alert('数据错误');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $uid = $data->uid;
        $returnMoney = $data->money;//提现金额
        $member = Member::find()->where("id = $uid and repair = 1")->one();
        if(!$uid){
            echo "<script>alert('用户错误');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $currentMoney = $member->repairMoney;
        if($currentMoney < $returnMoney){
            echo "<script>alert('提现失败（余额不足）');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $reduceMoney = $currentMoney - $returnMoney;
        $member->repairMoney = $reduceMoney;
        $res = $member->save();
        if($res){
            $data->checkTime = time();//记录平台通过时间
            $data->status = 1;
            $data->save();
            echo "<script>alert('编辑成功');setTimeout(function(){location.href='repair-return';},1000)</script>";die;
        }else{
            echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
    /**
     * 维修订单
     */
    public function actionRepairOrder(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Order::find()->where("proType = 1 and status =1")->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = Order::find()->where("proType = 1 and status =1")->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->orderBy('id desc')->all();
        foreach($data as $k => $v){
            $data[$k]['name'] = Member::find()->where(" id = {$v['uid']}")->asArray()->one()['nickname'];
            $data[$k]['brand'] = Product::find()->where("id = {$v['productId']}")->asArray()->one()['brand'];
//            if($v['status']==1){
//                $status = '支付成功';
//            }elseif($v['status'] == -1){
//                $status = '退款申请中';
//            }elseif($v['status'] == -2){
//                $status = '已退款';
//            }else{
//                $status = '待支付';
//            }
//            $data[$k]['status'] = $status;
            $repairUid = $v['repairUid'];
            if($repairUid){
                $repair = Member::findOne($repairUid);
                $data[$k]['repairName'] = $repair->repairName;
                $data[$k]['repairPhone'] = $repair->repairPhone;
            }else{
                $data[$k]['repairName'] = '';
                $data[$k]['repairPhone'] = '';
            }
        }
        return $this->render('repair-order',['data'=>$data,'page'=>$page,'count'=>$count]);
    }
}