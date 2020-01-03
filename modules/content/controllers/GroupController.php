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
use app\modules\content\models\UserGroup;
use yii\data\Pagination;
use yii;

class GroupController  extends AdminController
{
    public $enableCsrfValidation = false;
    public $layout = 'content';
    public function init(){
        parent::init();
        parent::setContentId('group');
    }
    public function actionIndex(){
        return $this->redirect('/content/index/index');
    }

    /**
     * 商品组团
     */
    public function actionProductGroup(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = GroupProduct::find()->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = GroupProduct::find()->asArray()->orderBy('rank desc')->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $product = Product::findOne($v['productId']);
            if($product){
                $data[$k]['productName'] = $product->title;
                $data[$k]['oldPrice'] = $product->price;
                $data[$k]['brand'] = $product->brand;
            }else{
                $data[$k]['productName'] = '';
                $data[$k]['oldPrice'] = '';
                $data[$k]['brand'] = '';
            }
        }
        return $this->render('group-product',['count'=>$count,'page'=>$page,'data'=>$data]);
    }
    /**
     * 组团商品
     * 添加商品
     */
    public function actionGroupProductAdd(){
        if($_POST){
            $id = Yii::$app->request->post('id');
            $productId = Yii::$app->request->post('productId');
            $number = Yii::$app->request->post('number');
            $return = Yii::$app->request->post('return');
            $price = Yii::$app->request->post('price');
            $remark = Yii::$app->request->post('remark');
            $groupTime = Yii::$app->request->post('groupTime',1);
            $rank = Yii::$app->request->post('rank',0);
            if(!$productId){
                echo "<script>alert('请填写商品id');history.go(-1);</script>";die;
            }else{
                //有无该商品
                $product = Product::findOne($productId);
                if(!$product){
                    echo "<script>alert('没有该商品');history.go(-1);</script>";die;
                }
                //是否已经组团
                if($id){
                    $had = GroupProduct::find()->where("productId = $productId and id !=$id")->one();
                }else{
                    $had = GroupProduct::find()->where("productId = $productId ")->one();
                }
                if($had){
                    echo "<script>alert('该商品已组团，请勿重复添加');history.go(-1);</script>";die;
                }
            }
            if(!$number || $number < 1){
                echo "<script>alert('请填写正确的组团人数');history.go(-1);</script>";die;
            }
            if(!$price || $price < 0){
                echo "<script>alert('请填写正确的组团价格');history.go(-1);</script>";die;
            }
            if(!$remark){
                echo "<script>alert('请填写组团说明');history.go(-1);</script>";die;
            }
            if($id){
                $model = GroupProduct::findOne($id);
            }else{
                $model = new GroupProduct();
            }
            $model->productId = $productId;
            $model->number = $number;
            $model->price = $price;
            $model->return = $return?$return:0;
            $model->remark = $remark;
            $model->createTime = time();
            $model->rank = $rank;
            $model->groupTime = $groupTime;
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='product-group'},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');history.go(-1);</script>";die;
            }
        }else{
            $id = Yii::$app->request->get('id');
            if($id){
                $data = GroupProduct::find()->where("id = $id")->asArray()->one();
                $product = Product::findOne($data['productId']);
                $data['productName'] = $product->title;
                $data['oldPrice'] = $product->price;
                $data['brand'] = $product->brand;
            }else{
                $data = [];
            }
            return $this->render('group-product-add',['data'=>$data]);
        }
    }
    /**
     * 组团商品
     * 商品删除
     */
    public function actionGroupProductDelete(){
        $id = \Yii::$app->request->get('id');
        if($id){
            $advert = GroupProduct::findOne($id);
            if(!$advert){
                echo "<script>alert('没有该内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $res = GroupProduct::deleteAll("id = $id");
            if($res){
                echo "<script>alert('删除成功');setTimeout(function(){location.href='product-group';},1000)</script>";die;
            }else{
                echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            echo "<script>alert('参数不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
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
}