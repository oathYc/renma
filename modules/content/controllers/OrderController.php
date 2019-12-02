<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\modules\content\models\Address;
use app\modules\content\models\Logistics;
use app\modules\content\models\Member;
use app\modules\content\models\Order;
use app\modules\content\models\Product;
use app\modules\content\models\Quality;
use yii\data\Pagination;
use yii;

class OrderController  extends AdminController
{
    public $enableCsrfValidation = false;
    public $layout = 'content';
    public function init(){
        parent::init();
        parent::setContentId('order');
    }
    public function actionIndex(){
        return $this->redirect('/content/index/index');
    }

    /**
     * 质保商品
     */
    public function actionQualityProduct(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Quality::find()->count();
        $page = new Pagination(['totalCount'=>$count]);
        $data = Quality::find()->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $user  = Member::find()->select('name,nickname')->where("id = {$v['uid']}")->asArray()->one();
            $data[$k]['productName'] = Product::find()->where("id = {$v['productId']}")->asArray()->one()['title'];
            $data[$k]['name']  = $user['name']?$user['name']:$user['nickname'];
        }
        return $this->render('quality-product',['data'=>$data,'page'=>$page,'count'=>$count]);
    }
    /**
     * 删除质保商品
     */
    public function actionQualityDelete(){
        $id = \Yii::$app->request->get('id');
        if($id){
            $shop = Quality::findOne($id);
            if(!$shop){
                echo "<script>alert('没有该信息');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $res = Quality::deleteAll("id = $id");
            if($res){
                echo "<script>alert('删除成功');setTimeout(function(){location.href='quality-product';},1000)</script>";die;
            }else{
                echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            echo "<script>alert('参数不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
    /**
     * 订单信息
     */
    public function actionOrderList(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Order::find()->count();
        $page = new Pagination(['totalCount'=>$count]);
        $data = Order::find()->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $data[$k]['name'] = Member::find()->where(" id = {$v['uid']}")->asArray()->one()['nickname'];
            $data[$k]['brand'] = Product::find()->where("id = {$v['productId']}")->asArray()->one()['brand'];
        }
        return $this->render('order-list',['data'=>$data,'page'=>$page,'count'=>$count]);
    }
    /**
     * 订单详情
     */
    public function actionOrderDetail(){
        $id = Yii::$app->request->get('id');
        if($id){
            $data = Order::find()->where("id = $id")->asArray()->one();
        }else{
            $data = [];
        }
        return $this->render('order-detail',['data'=>$data]);
    }
    /**
     * 订单删除
     */
    public function actionOrderDelete(){
        $id = \Yii::$app->request->get('id');
        if($id){
            $shop = Order::findOne($id);
            if(!$shop){
                echo "<script>alert('没有该信息');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $res = Order::deleteAll("id = $id");
            if($res){
                echo "<script>alert('删除成功');setTimeout(function(){location.href='order-list';},1000)</script>";die;
            }else{
                echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            echo "<script>alert('参数不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
    /**
     * 订单物流信息
     */
    public function actionOrderLogistics(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $where = " status = 1";//支付成功才有后续的物流信息
        $count = Order::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count]);
        $order = Order::find()->where($where)->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        $data = [];
        foreach($order as $k => $v){
            $logistics = Logistics::find()->where("orderId = {$v['id']}")->asArray()->one();
            if(!$logistics){
                $logistics = ['id'=>0,'logistics'=>'','name'=>'','status'=>'','createTime'=>''];
            }
            $logistics['status'] = $logistics['status']==1?'完成':($logistics['status']==0?'运送中':'');
            $address = Address::findOne($v['address']);
            $logisticsAddress = $address->province.$address->city.$address->area.$address->address;
            $data[] = ['id'=>$logistics['id'],'orderId'=>$v['id'],'orderNumber'=>$v['orderNumber'],'productName'=>$v['productTitle'],'productId'=>$v['productId'],'price'=>$v['payPrice'],'name'=>$address->name,'phone'=>$address->phone,'logistics'=>$logistics['logistics'],'logisticsName'=>$logistics['name'],'logisticsStatus'=>$logistics['status'],'logisticsTime'=>$logistics['createTime'],'logisticsAddress'=>$logisticsAddress];
        }
        return $this->render('order-logistics',['data'=>$data,'page'=>$page,'count'=>$count]);
    }
    /**
     * 物流信息管理
     */
    public function actionLogisticsAdd(){
        if($_POST){
            $id = Yii::$app->request->post('id');
            $logistics = Yii::$app->request->post('logistics');//物流号
            $name = Yii::$app->request->post('logisticsName');//物流类型
            if(!$id){
                echo "<script>alert('id不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$logistics){
                echo "<script>alert('请填写物流号');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$name){
                echo "<script>alert('请填写物流类型');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $model = Logistics::find()->where("orderId = $id")->one();
            if(!$model){//不存在便新增
                $model = new Logistics();
            }
            $model->orderId = $id;
            $model->logistics = $logistics;
            $model->name = $name;
            $model->status = 0;
            $model->createTime = time();
            $res = $model->save();
            if($res){
                Order::updateAll(['typeStatus'=>2]," id = $id");//0-代付款 1-待接单 2-已接单 3-待评价 4-待售后
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='order-logistics';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $id = Yii::$app->request->get('id');
            if(!$id){
                $data = [];
            }else{
                $order = Order::find()->where("id = $id")->asArray()->one();
                $address = Address::findOne($order['address']);
                $logisticsAddress = $address->province.$address->city.$address->area.$address->address;
                $logistics = Logistics::findOne($id);
                $logistic = isset($logistics['logistics'])?$logistics['logistics']:'';
                $logisticsName = isset($logistics['name'])?$logistics['name']:'';
                $logisticsStatus= isset($logistics['status'])?$logistics['status']:'';
                $logisticsTime= isset($logistics['createTime'])?$logistics['createTime']:'';
                $data = ['orderId'=>$order['id'],'orderNumber'=>$order['orderNumber'],'productTitle'=>$order['productTitle'],'productId'=>$order['productId'],'payPrice'=>$order['payPrice'],'name'=>$address->name,'phone'=>$address->phone,'logistics'=>$logistic,'logisticsName'=>$logisticsName,'logisticsStatus'=>$logisticsStatus,'logisticsTime'=>$logisticsTime,'logisticsAddress'=>$logisticsAddress];
            }
            return $this->render('logistics-add',['data'=>$data]);
        }

    }
}