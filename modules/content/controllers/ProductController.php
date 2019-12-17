<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\modules\content\models\Category;
use app\modules\content\models\GroupProduct;
use app\modules\content\models\Product;
use app\modules\content\models\Shop;
use yii\data\Pagination;
use yii;

class ProductController  extends AdminController
{
    public $enableCsrfValidation = false;
    public $layout = 'content';
    public function init(){
        parent::init();
        parent::setContentId('product');
    }
    public function actionIndex(){
        return $this->redirect('/content/index/index');
    }

    /**
     * 商品信息
     */
    public function actionProductList(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Product::find()->count();
        $page = new Pagination(['totalCount'=>$count]);
        $data = Product::find()->asArray()->orderBy('createTime desc')->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $parent = Category::findOne($v['catPid']);
            $child = Category::findOne($v['catCid']);
            $data[$k]['category'] = $parent->name.' '.$child->name;
        }
        return $this->render('product-list',['count'=>$count,'page'=>$page,'data'=>$data]);
    }
    /**
     * 商品详情
     */
    public function actionProductDetail(){
        $id = Yii::$app->request->get('id');
        if($id){
            $data = Product::find()->where("id = $id")->asArray()->one();
        }else{
            $data = [];
        }
        return $this->render('product-detail',['data'=>$data]);
    }
    /**
     * 商品删除
     */
    public function actionProductDelete(){
        $id = Yii::$app->request->post('id');
        if($id){
            $advert = Product::findOne($id);
            if(!$advert){
                echo "<script>alert('没有该内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $res = Product::deleteAll("id = $id");
            if($res){
                echo "<script>alert('删除成功');setTimeout(function(){location.href='product-list';},1000)</script>";die;
            }else{
                echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            echo "<script>alert('参数不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
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
            $data[$k]['productName'] = $product->title;
            $data[$k]['oldPrice'] = $product->price;
            $data[$k]['brand'] = $product->brand;
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
            $price = Yii::$app->request->post('price');
            $remark = Yii::$app->request->post('remark');
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
                $had = GroupProduct::find()->where("productId = $productId")->one();
                if($had){
                    echo "<script>alert('该商品已组团，请勿重复添加');history.go(-1);</script>";die;
                }
            }
            if(!$number || $number < 2){
                echo "<script>alert('请填写争取的组团人数');history.go(-1);</script>";die;
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
            $model->remark = $remark;
            $model->createTime = time();
            $model->rank = $rank;
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
                echo "<script>alert('删除成功');setTimeout(function(){location.href='group-product';},1000)</script>";die;
            }else{
                echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            echo "<script>alert('参数不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
}