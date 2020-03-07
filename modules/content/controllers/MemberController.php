<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\libs\WeixinReturn;
use app\modules\content\models\Address;
use app\modules\content\models\Member;
use app\modules\content\models\MemberReturn;
use app\modules\content\models\MoneyRecord;
use app\modules\content\models\RepairReturn;
use app\modules\content\models\ShopCart;
use app\modules\content\models\UserCoupon;
use app\modules\content\models\UserGroup;
use app\modules\content\models\UserPush;
use yii\data\Pagination;
use yii;

class MemberController  extends AdminController
{
    public $enableCsrfValidation = false;
    public $layout = 'content';
    public function init(){
        parent::init();
        parent::setContentId('member');
    }
    public function actionIndex(){
        return $this->redirect('/content/index/index');
    }

    /**
     * 用户信息
     */
    public function actionUserList(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Member::find()->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = Member::find()->orderBy('id desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        return $this->render('user-list',['page'=>$page,'count'=>$count,'data'=>$data]);
    }

    /**
     * 优惠券使用
     */
    public function actionCouponUse(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $page = Yii::$app->request->get('page',1);
        $data = UserCoupon::getUserCoupon($page);
        return $this->render('coupon-use',$data);

    }
    /**
     * 用户地址管理
     */
    public function actionUserAddress(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Address::find()->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = Address::find()->orderBy('id desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        return $this->render('user-address',['page'=>$page,'count'=>$count,'data'=>$data]);

    }
    /**
     * 用户分享
     */
    public function actionUserShare(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Member::find()->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = Member::find()->orderBy('id desc')->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $data[$k]['inviter'] = Member::find()->where("inviterCode = '{$v['inviteCode']}'")->asArray()->one()['nickname'];
        }
        return $this->render('user-share',['page'=>$page,'count'=>$count,'data'=>$data]);

    }
    /**
     * 用户反馈
     */
    public function actionUserFeedback(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = UserPush::find()->where("type = 1")->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = UserPush::find()->orderBy('id desc')->where("type = 1")->asArray()->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $data[$k]['nickname'] = Member::find()->where(" id = {$v['uid']}")->asArray()->one()['nickname'];
        }
        return $this->render('feedback',['page'=>$page,'count'=>$count,'data'=>$data]);

    }
    /**
     * 用户购物车
     */
    public function actionUserShopCart(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $page = Yii::$app->request->get('page',1);
        $data = ShopCart::getUserShopCart($page);
        return $this->render('shop-cart',$data);
    }
    /**
     * 用户收藏
     */
    public function actionUserCollect(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $page = Yii::$app->request->get('page',1);
        $pageSize = 10;
        $limit = " limit ".($pageSize*($page-1)).",$pageSize";
        $sql = "select uc.*,uc.id as collectId,uc.createTime as collectTime,p.title from {{%user_collect}} uc inner join {{%product}} p on p.id = uc.productId ";
        $total = Yii::$app->db->createCommand($sql)->queryAll();
        $count = count($total);
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>$pageSize]);
        $sql .= " order by collectTime desc";
        $sql .= $limit;
        $data = Yii::$app->db->createCommand($sql)->queryAll();
        foreach($data as $k => $v){
            $data[$k]['nickname'] = Member::find()->where("id = {$v['uid']}")->asArray()->one()['nickname'];
        }
        return $this->render('user-collect',['data'=>$data,'page'=>$pages,'count'=>$count]);
    }
    /**
     * 用户提现
     */
    public function actionUserReturn(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $page = Yii::$app->request->get('page',1);
        $pageSize = 10;
        $limit = " limit ".($pageSize*($page-1)).",$pageSize";
        $sql = "select mr.*,m.nickname from {{%member_return}} mr inner join {{%member}} m on m.id = mr.uid ";
        $total = Yii::$app->db->createCommand($sql)->queryAll();
        $count = count($total);
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>$pageSize]);
        $sql .= " order by createTime desc";
        $sql .= $limit;
        $data = Yii::$app->db->createCommand($sql)->queryAll();
        return $this->render('user-return',['data'=>$data,'page'=>$pages,'count'=>$count]);
    }
    /**
     * 用户提现
     * 商家同意
     */
    public function actionReturnSuccess(){
        $id = Yii::$app->request->get('id');
        if(!$id){
            echo "<script>alert('参数错误');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $data = MemberReturn::findOne($id);
        if(!$data){
            echo "<script>alert('没有该数据');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        //验证余额
        $user = Member::findOne($data->uid);
        if(!$user){
            echo "<script>alert('没有相应用户');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $finalMoney = $user->memberMoney - $data->totalMoney;
        if($finalMoney < 0){
            echo "<script>alert('用户余额不足');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $return  = WeixinReturn::WeixinReturn($data->uid,$data->orderNumber,$data->money,2);//2-提现
        if($return){
            //扣除相应余额
            $user->memberMoney = $finalMoney;
            $user->save();
            //记录余额消费
            MoneyRecord::saveRecord($data->uid,$data->id,$data->totalMoney,2,2);
            echo "<script>alert('用户提现成功');setTimeout(function(){location.href='user-return';},1000)</script>";die;
        }else{
            echo "<script>alert('用户提现失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }


}