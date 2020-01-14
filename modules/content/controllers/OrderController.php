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
     * 订单信息
     */
    public function actionOrderList(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $status = Yii::$app->request->get('status',0);
        $where = " type = 2 ";
        if($status){
            $where .= " and status = $status";
        }
        $count = Order::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = Order::find()->where($where)->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $data[$k]['name'] = Member::find()->where(" id = {$v['uid']}")->asArray()->one()['nickname'];
            $data[$k]['brand'] = Product::find()->where("id = {$v['productId']}")->asArray()->one()['brand'];
            if($v['status']==1){
                $status = '支付成功';
            }elseif($v['status'] == -1){
                $status = '退款申请中';
            }elseif($v['status'] == -2){
                $status = '已退款';
            }else{
                $status = '待支付';
            }
            $data[$k]['statusStr'] = $status;
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
        $where = " status = 1 and proType != 1";//支付成功才有后续的物流信息
        $count = Order::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count]);
        $order = Order::find()->where($where)->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        $data = [];
        foreach($order as $k => $v){
            $logistics = Logistics::find()->where("orderId = {$v['id']}")->asArray()->one();
            if(!$logistics){
                $logistics = ['id'=>0,'logistics'=>'','name'=>'','status'=>'','createTime'=>''];
                $logistics['status'] = '';
            }else{
                $logistics['status'] = $logistics['status']==1?'完成':($logistics['status']==0?'运送中':'');
            }
            if($v['address'] && $v['address']>0){
                $address = Address::find()->where("id = {$v['address']}")->asArray()->one();
            }else{
                $address = [];
            }
            if($address){
//                $logisticsAddress = $address['province'].$address['city'].$address['area'].$address['address'];
                $logisticsAddress = $address['area'].$address['address'];
            }else{
                $logisticsAddress = '';
                $address['name'] = '';
                $address['phone'] = '';
            }
            $data[] = ['id'=>$logistics['id'],'orderId'=>$v['id'],'orderNumber'=>$v['orderNumber'],'productName'=>$v['productTitle'],'productId'=>$v['productId'],'price'=>$v['payPrice'],'name'=>$address['name'],'phone'=>$address['phone'],'logistics'=>$logistics['logistics'],'logisticsName'=>$logistics['name'],'logisticsStatus'=>$logistics['status'],'logisticsTime'=>$logistics['createTime'],'logisticsAddress'=>$logisticsAddress];
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
//                $logisticsAddress = $address->province.$address->city.$address->area.$address->address;
                $logisticsAddress = $address->area.$address->address;
                $logistics = Logistics::find()->where("orderId = $id")->asArray()->one();
                $logistic = isset($logistics['logistics'])?$logistics['logistics']:'';
                $logisticsName = isset($logistics['name'])?$logistics['name']:'';
                if($logistics){
                    $logisticsStatus= $logistics['status']==1?'完成':'运输中';
                }else{
                    $logisticsStatus = '';
                }
                $logisticsTime= isset($logistics['createTime'])?$logistics['createTime']:'';
                if($logisticsTime){
                    $logisticsTime = date("Y-m-d H:i:s",$logisticsTime);
                }
                $data = ['orderId'=>$order['id'],'orderNumber'=>$order['orderNumber'],'productTitle'=>$order['productTitle'],'productId'=>$order['productId'],'payPrice'=>$order['payPrice'],'name'=>$address->name,'phone'=>$address->phone,'logistics'=>$logistic,'logisticsName'=>$logisticsName,'logisticsStatus'=>$logisticsStatus,'logisticsTime'=>$logisticsTime,'logisticsAddress'=>$logisticsAddress];
            }
            return $this->render('logistics-add',['data'=>$data]);
        }

    }
    /**
     * 订单退款
     */
    public function actionOrderSureReturn(){
        $id = Yii::$app->request->get('id');
        $res = Order::updateAll(['status'=>-2,'returnSuccess'=>time()],"id = $id");
        if($res){
            echo "<script>alert('确认成功');setTimeout(function(){location.href='order-list';},1000)</script>";die;
        }else{
            echo "<script>alert('确认失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
    /**
     * 订单售后
     */
    public function actionOrderAfter(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $where = " after > 0 ";//售后订单才能进行后续
        $count = Quality::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count]);
        $order = Quality::find()->where($where)->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($order as $k => $v){
            if($v['afterUid']){
                $after = Member::findOne($v['afterUid']);
                $afterName = $after->repairName;
                $afterPhone = $after->repairPhone;
            }else{
                $afterName = '';
                $afterPhone = '';
            }
            $order[$k]['afterName'] = $afterName;
            $order[$k]['afterPhone'] = $afterPhone;
        }
        return $this->render('order-after',['data'=>$order,'page'=>$page,'count'=>$count]);
    }
    /**
     * 订单售后
     * 职位维修师
     */
    public function actionOrderAfterAdd(){
        if($_POST){
            $id = Yii::$app->request->post('id');
            $repairId = Yii::$app->request->post('repair');
            if(!$repairId){
                echo "<script>alert('请选择维修师');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$id){
                echo "<script>alert('id不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $res = Quality::updateAll(['afterUid'=>$repairId,'repairTime'=>time()]," id = $id");
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='order-after';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $id = Yii::$app->request->get('id');
            $data = Quality::find()->where(" id = $id")->asArray()->one();
            if($data['afterUid']){
                $user = Member::findOne($data['afterUid']);
                $data['repairName'] = $user->repairName;
                $data['repairPhone'] = $user->repairPhone;
            }else{
                $data['repairName'] = '';
                $data['repairPhone'] = '';
            }
            $repairs = Member::find()->select("id,name,phone")->where(" repair = 1")->asArray()->all();
            return $this->render('order-after-add',['data'=>$data,'repairs'=>$repairs]);
        }
    }
    /**
     * 已付款订单
     */
    public function actionHadBuy(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $where = " type = 2 and status = 1";//售后订单才能进行后续
        $count = Order::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count]);
        $data = Order::find()->where($where)->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $data[$k]['name'] = Member::find()->where(" id = {$v['uid']}")->asArray()->one()['nickname'];
            $data[$k]['brand'] = Product::find()->where("id = {$v['productId']}")->asArray()->one()['brand'];
            if($v['status']==1){
                $status = '支付成功';
            }elseif($v['status'] == -1){
                $status = '退款申请中';
            }elseif($v['status'] == -2){
                $status = '已退款';
            }else{
                $status = '待支付';
            }
            $data[$k]['statusStr'] = $status;
        }
        return $this->render('had-buy',['data'=>$data,'page'=>$page,'count'=>$count]);
    }
    /**
     * 待付款订单
     */
    public function actionNeedBuy(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $where = " type = 2 and status = 0";//售后订单才能进行后续
        $count = Order::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count]);
        $data = Order::find()->where($where)->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $data[$k]['name'] = Member::find()->where(" id = {$v['uid']}")->asArray()->one()['nickname'];
            $data[$k]['brand'] = Product::find()->where("id = {$v['productId']}")->asArray()->one()['brand'];
            if($v['status']==1){
                $status = '支付成功';
            }elseif($v['status'] == -1){
                $status = '退款申请中';
            }elseif($v['status'] == -2){
                $status = '已退款';
            }else{
                $status = '待支付';
            }
            $data[$k]['statusStr'] = $status;
        }
        return $this->render('need-buy',['data'=>$data,'page'=>$page,'count'=>$count]);
    }
    /**
     * 已发货订单
     */
    public function actionHadSend(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $where = " type = 2 and status = 1 and typeStatus =  2 and proType in (2,3)";//售后订单才能进行后续
        $count = Order::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count]);
        $data = Order::find()->where($where)->orderBy('createTime desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $data[$k]['name'] = Member::find()->where(" id = {$v['uid']}")->asArray()->one()['nickname'];
            $data[$k]['brand'] = Product::find()->where("id = {$v['productId']}")->asArray()->one()['brand'];
            //物流信息
            $logistics = Logistics::find()->where("orderId = {$v['id']}")->asArray()->one();
            $data[$k]['logisticsName'] = isset($logistics['name'])?$logistics['name']:'';
            $data[$k]['logisticsType'] = isset($logistics['logistics'])?$logistics['logistics']:'';
            $data[$k]['logisticsStr'] = isset($logistics['status'])?$logistics['status']:'';
        }
        return $this->render('had-send',['data'=>$data,'page'=>$page,'count'=>$count]);
    }


}