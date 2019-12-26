<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\libs\Methods;
use app\modules\content\models\Category;
use app\modules\content\models\GroupProduct;
use app\modules\content\models\Product;
use app\modules\content\models\Search;
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
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = Product::find()->asArray()->orderBy('id desc')->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
//            if($v['catPid']){
//                $parent = Category::findOne($v['catPid']);
//                $catPname =$parent->name;
//            }else{
//                $catPname = '';
//            }
//            if($v['catCid']){
//                $child = Category::findOne($v['catCid']);
//                $catCname = $child->name;
//            }else{
//                $catCname = '';
//            }
            $catName = $v['type']==1?'维修':($v['type']==2?'新车':($v['type'] ==3?'二手车':''));
            $data[$k]['category'] = $catName;
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
            $data['catName'] = $data['type']==1?'维修':($data['type']==2?'新车':($data['type'] ==3?'二手车':''));
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
//            $number = Yii::$app->request->post('number');
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
//            if(!$number || $number < 2){
//                echo "<script>alert('请填写争取的组团人数');history.go(-1);</script>";die;
//            }
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
//            $model->number = $number;
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
    /**
     * 商品添加
     */
    public function actionProductAdd(){
        if($_POST){
            $id = Yii::$app->request->post('id');
            $submit = Yii::$app->request->post('submit');
            $image = Yii::$app->request->post('imageFiles');
            if($id){
                $model = Product::findOne($id);
            }else{
                $model = new Product();
                $model->uid = 999999;//后台添加
                $model->createTime = time();
            }
            if(!isset($submit['type']) || !$submit['type']){
                echo "<script>alert('商品分类不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!isset($submit['zhibao'])){
                echo "<script>alert('请勾选商品质保选项');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$submit['price']){
                echo "<script>alert('商品价格不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$submit['phone']){
                echo "<script>alert('联系电话不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$submit['tradeAddress']){
                echo "<script>alert('商品交易地址不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$submit['brand']){
                echo "<script>alert('商品品牌不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$submit['voltage']){
                echo "<script>alert('商品电压数据不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$submit['mileage']){
                echo "<script>alert('商品续航里程不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$submit['remark']){
                echo "<script>alert('商品说明不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $domain = Yii::$app->params['domain'];
            if(!$submit['headMsg']){
                echo "<script>alert('商品封面信息不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }else{
                if(!preg_match("/http/",$submit['headMsg'])){
                    $submit['headMsg'] = $domain.$submit['headMsg'];
                }
            }
            if(!$image || !is_array($image)){
                echo "<script>alert('商品图片数据不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }else{
                foreach($image as $k =>$v){
                    if(!preg_match("/http/",$v)){
                        $image[$k] = $domain.$v;
                    }
                }
            }
            if(!$submit['introduce']){
                echo "<script>alert('商品详情不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $model->title = $submit['title'];
            $model->price = $submit['price'];
            $model->voltage = $submit['voltage'];
            $model->mileage = $submit['mileage'];
            $model->sex = $submit['sex'];
            $model->headMsg = $submit['headMsg'];
            $model->image = serialize($image);
            $model->tradeAddress = $submit['tradeAddress'];
            $model->brand = $submit['brand'];
            $model->introduce = $submit['introduce'];
            $model->type = $submit['type'];
            $model->number = isset($submit['number'])?$submit['number']:1;
            $model->zhibao = $submit['zhibao'];
            $model->remark = $submit['remark'];
            $model->phone = $submit['phone'];
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='product-list';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $id = Yii::$app->request->get('id');
            if($id){
                $data = Product::find()->where("id = $id")->asArray()->one();
                $data['catName'] = $data['type']==1?'维修':($data['type']==2?'新车':($data['type'] ==3?'二手车':''));
                $data['image'] = unserialize($data['image']);
            }else{
                $data = [];
            }
            $voltage = Search::find()->where(" type =1")->asArray()->all();//1-电压
            $mileage = Search::find()->where(" type =2")->asArray()->all();//2-续航
            return $this->render('product-add',['data'=>$data,'voltage'=>$voltage,'mileage'=>$mileage]);
        }
    }
}