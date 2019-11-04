<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\modules\content\models\Category;
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

}