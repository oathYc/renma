<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\modules\content\models\Address;
use app\modules\content\models\Member;
use app\modules\content\models\ShopCart;
use app\modules\content\models\UserCoupon;
use app\modules\content\models\UserGroup;
use app\modules\content\models\UserPush;
use app\modules\test\models\UserAudio;
use function PHPSTORM_META\argumentsSet;
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
     * 组团信息
     */
    public function actionGroupList(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $page = Yii::$app->request->get('page',1);
        $data = UserGroup::getUserGroup($page);
        return $this->render('group-list',$data);
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
    /*
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

}