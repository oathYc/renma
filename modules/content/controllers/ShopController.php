<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\modules\content\models\Shop;
use yii\data\Pagination;
use yii;

class ShopController  extends AdminController
{
    public $enableCsrfValidation = false;
    public $layout = 'content';
    public function init(){
        parent::init();
        parent::setContentId('shop');
    }
    public function actionIndex(){
        return $this->redirect('/content/index/index');
    }

    /**
     * 店铺信息
     * 获取已审核信息
     */
    public function actionShopSuccess(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $where = " status = 1";
        $count = Shop::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count]);
        $data = Shop::find()->where($where)->asArray()->orderBy('id desc')->offset($page->offset)->limit($page->limit)->all();
        return $this->render('shop-success',['data'=>$data,'count'=>$count,'page'=>$page]);
    }
    /**
     * 店铺详情
     */
    public function actionShopDetail(){
        $id = \Yii::$app->request->get('id');
        if($id){
            $data = Shop::find()->where("id = $id")->asArray()->one();
        }else{
            $data = [];
        }
        return $this->render('shop-detail',['data'=>$data]);
    }
    /**
     * 店铺审核
     */
    public function actionShopDelete(){
        $id = \Yii::$app->request->get('id');
        if($id){
            $shop = Shop::findOne($id);
            if(!$shop){
                echo "<script>alert('没有该店铺');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $res = Shop::deleteAll("id = $id");
            if($res){
                echo "<script>alert('删除成功');setTimeout(function(){location.href='shop-success';},1000)</script>";die;
            }else{
                echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            echo "<script>alert('参数不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
    /**
     * 店铺审核页面
     */
    public function actionShopCheck(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $where = " status != 1";
        $count = Shop::find()->where($where)->count();
        $page = new Pagination(['totalCount'=>$count]);
        $data = Shop::find()->where($where)->asArray()->orderBy('status desc')->offset($page->offset)->limit($page->limit)->all();
        return $this->render('shop-check',['data'=>$data,'count'=>$count,'page'=>$page]);
    }
    /**
     * 店铺审核
     */
    public function actionCheckShop(){
        $id = \Yii::$app->request->get('id');
        if(!$id){
            echo "<script>alert('参数错误');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $type = \Yii::$app->request->get('type',1);//1-审核通过 -1-审核不通过
        $res = Shop::updateAll(['status'=>$type,'checkTime'=>time()],"id = $id");
        if($res){
            echo "<script>alert('操作成功');setTimeout(function(){location.href='shop-check';},1000)</script>";die;
        }else{
            echo "<script>alert('操作失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }

}