<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\libs\Methods;
use app\modules\content\models\Category;
use app\modules\content\models\GoodProduct;
use app\modules\content\models\GroupProduct;
use app\modules\content\models\Member;
use app\modules\content\models\Product;
use app\modules\content\models\ProductCategory;
use app\modules\content\models\Quality;
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
        $type = Yii::$app->request->get('type',1);//1-维修 2-新车 3-二手车
        $where  = " type = $type";
        $count = Product::find()->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = Product::find()->where($where)->asArray()->orderBy('id desc')->offset($page->offset)->limit($page->limit)->all();
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
            //获取商品分类
            $productId = $v['id'];
            $cate = ProductCategory::find()->where("productId = $productId")->orderBy("number asc")->asArray()->all();
            $desc = [];
            foreach($cate as $r => $t){
                $desc[] = $t['cateDesc'].'：'.$t['price'].'元'.' 库存：'.$v['number'];
            }
            $desc = implode("\n\r\t",$desc);
            $data[$k]['desc'] = $desc;
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
        $id = Yii::$app->request->get('id');
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
     * 商品添加
     */
    public function actionProductAdd(){
        if($_POST){
            $id = Yii::$app->request->post('id');
            $submit = Yii::$app->request->post('submit');
            $image = Yii::$app->request->post('imageFiles');
            $headImgs = Yii::$app->request->post('imageFiles3');
            if($id){
                $model = Product::findOne($id);
            }else{
                $model = new Product();
                $model->uid = 999999;//后台添加
                $model->createTime = time();
            }
            if(!isset($submit['type']) || !$submit['type']){
                echo "<script>alert('商品类型不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!isset($submit['zhibao'])){
                echo "<script>alert('请勾选商品质保选项');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$submit['price']){
                echo "<script>alert('商品价格不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
//            if(!$submit['phone']){
//                echo "<script>alert('联系电话不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
//            }
//            if(!$submit['tradeAddress']){
//                echo "<script>alert('商品交易地址不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
//            }
            if(!$submit['brand']){
                echo "<script>alert('商品品牌不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
//            if(!$submit['voltage']){
//                echo "<script>alert('商品电压数据不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
//            }
//            if(!$submit['mileage']){
//                echo "<script>alert('商品续航里程不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
//            }
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
            if(isset($submit['video'])){
                if(!preg_match("/http/",$submit['video'])){
                    $submit['video'] = $domain.$submit['video'];
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
            if(!$headImgs || !is_array($headImgs)){
                echo "<script>alert('商品轮播图片数据不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }else{
                foreach($headImgs as $k =>$v){
                    if(!preg_match("/http/",$v)){
                        $headImgs[$k] = $domain.$v;
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
            $model->headImgs = serialize($headImgs);
            $model->tradeAddress = $submit['tradeAddress'];
            $model->brand = $submit['brand'];
            $model->introduce = $submit['introduce'];
            $model->type = $submit['type'];
            $model->number = isset($submit['number'])?$submit['number']:1;
            $model->catPid = isset($submit['catPid'])?$submit['catPid']:1;
            $model->catCid = isset($submit['catCid'])?$submit['catCid']:1;
            $model->zhibao = $submit['zhibao'];
            $model->remark = $submit['remark'];
            $model->phone = $submit['phone'];
            $model->video = $submit['video'];
            $res = $model->save();
            if($res){
                $priceCat = isset($submit['priceCat'])?$submit['priceCat']:[];
                //保存商品分类价格数据
                ProductCategory::saveProductCategory($model->id,$priceCat);
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
                $data['headImgs'] = unserialize($data['headImgs']);
                $data['priceCat'] = ProductCategory::find()->where("productId = $id")->asArray()->all();
            }else{
                $data = [];
            }
            $catPid = Category::find()->where("pid = 0")->asArray()->all();
            $catCid = Category::find()->where("pid != 0")->asArray()->all();
            $voltage = Search::find()->where(" type =1")->asArray()->all();//1-电压
            $mileage = Search::find()->where(" type =2")->asArray()->all();//2-续航
            return $this->render('product-add',['data'=>$data,'voltage'=>$voltage,'mileage'=>$mileage,'catPid'=>$catPid,'catCid'=>$catCid]);
        }
    }
    /**
     * 目录结构
     *商品分类
     */
    public function actionCategory(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        return $this->render('category');
    }
    /**
     * 添加分类与其基本信息
     * @return string
     */
    public function actionCategoryAdd(){
        if($_POST){
            $model = new Category();
            $categoryData = Yii::$app->request->post('category');
            $id = Yii::$app->request->post('id');
            if(empty($categoryData['name'])){
                die('<script>alert("请添加分类名称");history.go(-1);</script>');
            }
            $where = '';
            if($id){
                $where .= " and id != $id";
            }
            $hadName = Category::find()->where("name='{$categoryData['name']}' $where")->one();
            if($hadName){
                die('<script>alert("已有该分类，请勿重复添加");history.go(-1);</script>');
            }
            if(empty($categoryData['pid'])){
                $categoryData['pid'] = 0;
            }
            if(empty($categoryData['rank'])){
                $categoryData['rank'] = 0;
            }
            if($id){
                $re = $model->updateAll($categoryData,'id = :id',[':id' => $id]);
            }else{
                $categoryData['createTime'] = time();
                $re = Yii::$app->db->createCommand()->insert("{{%category}}",$categoryData)->execute();
            }
            if($re){
                echo '<script>alert("成功")</script>';
                $this->redirect('/content/product/category');
            }else{
                echo '<script>alert("失败，请重试");history.go(-1);</script>';
                die;
            }
        } else{
            $pid = Yii::$app->request->get('pid');
            return $this->render('category-add',['pid' => $pid]);
        }
    }
    /**
     * 修改分类
     * @return string
     * @Obelisk
     */
    public function actionCategoryUpdate(){
        $id = Yii::$app->request->get('id');
        $model = new Category();
        $cate = $model->find()->asArray()->all();
        $result = $model->find()->where("id= $id")->asArray()->one();
        return $this->render('category-add',array('data'=> $result,'pid' => $result['pid'],'id' => $id,'category'=>$cate));
    }
    /**
     * 删除分类
     * @return string
     */
    public function actionCategoryDelete(){
        $id = Yii::$app->request->get('id');
        $model = new Category();
        if($model->findOne($id)->delete()){
            Category::deleteAll("id = $id");//删除对应的用户目录权限
            $this->redirect('/content/product/category');
        }else{
            echo '<script>alert("失败，请重试");history.go(-1);</script>';
            die;
        }
    }
    /**
     * 优选商品
     */
    public function actionGoodProduct(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = GoodProduct::find()->count();
        $page = new Pagination(['totalCount'=>$count]);
        $data = GoodProduct::find()->asArray()->orderBy('rank desc')->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $product = Product::findOne($v['productId']);
            $data[$k]['productName'] = $product->title;
            $data[$k]['brand'] = $product->brand;
            $data[$k]['tradeAddress'] = $product->tradeAddress;
        }
        return $this->render('good-product',['count'=>$count,'page'=>$page,'data'=>$data]);
    }
    /**
     * 优选商品
     * 商品添加
     */
    public function actionGoodProductAdd(){
        if($_POST){
            $productId = Yii::$app->request->post('productId');
            $rank = Yii::$app->request->post('rank');
            //商品是否存在
            $product = Product::findOne($productId);
            if(!$productId){
                echo "<script>alert('参数错误');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$product){
                echo "<script>alert('没有该商品');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            //是否已经是优选商品
            $had = GoodProduct::find()->where("productId = $productId")->one();
            if($had){
                echo "<script>alert('该商品已是优选商品，请勿重复添加');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }else{
                $model = new GoodProduct();
                $model->productId = $productId;
                $model->rank = $rank?$rank:0;
                $model->createTime = time();
                $res = $model->save();
                if($res){
                    echo "<script>alert('添加成功');setTimeout(function(){location.href='good-product';},1000)</script>";die;
                }else{
                    echo "<script>alert('添加失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
                }
            }
        }else{
            return $this->render('good-product-add');
        }
    }
    /**
     * 优选商品
     * 商品删除
     */
    public function actionGoodProductDelete(){
        $id = Yii::$app->request->get('id');
        if(!$id){
            echo "<script>alert('参数错误');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $res = GoodProduct::deleteAll("id = $id");
        if($res){
            echo "<script>alert('删除成功');setTimeout(function(){location.href='good-product';},1000)</script>";die;
        }else{
            echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
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
}