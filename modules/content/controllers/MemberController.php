<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\modules\content\models\Shop;
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
     * y用户信息
     */
    public function actionUserList(){

    }

    /**
     * 组团信息
     */
    public function actionGroupList(){

    }

    /**
     * 优惠券使用
     */
    public function actionCouponUse(){

    }
    /**
     * 用户地址管理
     */
    public function actionUserAddress(){

    }

    /**
     * 用户分享
     */
    public function actionUserShare(){

    }

    /**
     * 用户反馈
     */
    public function actionUserFeedback(){

    }
    /**
     * 用户购物车
     */
    public function actionUserShopCart(){

    }

}