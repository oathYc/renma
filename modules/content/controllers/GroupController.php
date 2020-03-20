<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\libs\Methods;
use app\modules\content\models\Address;
use app\modules\content\models\Group;
use app\modules\content\models\GroupCategory;
use app\modules\content\models\GroupPrice;
use app\modules\content\models\GroupProduct;
use app\modules\content\models\Logistics;
use app\modules\content\models\Member;
use app\modules\content\models\Order;
use app\modules\content\models\Product;
use app\modules\content\models\ProductCategory;
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
    public function actionProductGroup1(){
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
    public function actionGroupProductAdd1(){
        if($_POST){
            $id = Yii::$app->request->post('id');
            $productId = Yii::$app->request->post('productId');
            $number = Yii::$app->request->post('number');
            $return = Yii::$app->request->post('return');
            $price = Yii::$app->request->post('price');
            $remark = Yii::$app->request->post('remark');
            $groupTime = Yii::$app->request->post('groupTime',1);
            $rank = Yii::$app->request->post('rank',0);
            $priceCat = Yii::$app->request->post('priceCat');
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
                $priceCat = is_array($priceCat)?$priceCat:[];
                //保存商品分类价格数据
                GroupCategory::saveProductCategory($model->id,$priceCat);
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
                $data['priceCat'] = GroupCategory::find()->where("groupId = $id")->asArray()->all();
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
            $advert = Group::findOne($id);
            if(!$advert){
                echo "<script>alert('没有该内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $res = Group::deleteAll("id = $id");
            if($res){
                GroupPrice::deleteAll("groupId = $id");
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

    /**
     * 商品组团
     * 改版
     */
    public function actionProductGroup(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Group::find()->count();
        $page = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $data = Group::find()->asArray()->orderBy('rank desc')->offset($page->offset)->limit($page->limit)->all();
        foreach($data as $k => $v){
            $id = $v['id'];
            $sql = "select pc.*,gp.groupId,gp.groupPrice from {{%group_price}} gp left join {{%product_category}} pc on pc.id = gp.catPriceId where gp.groupId = $id order by pc.number asc";
            $catData = Yii::$app->db->createCommand($sql)->queryAll();
            $priceData = [];
            foreach($catData as $t => $y){
                $productId = $y['productId'];
                $product = Product::findOne($productId);
                if(!isset($priceData[$productId])){
                    $priceData[$productId] = $product->title.'（'.$product->brand.'）<br>';
                }
                $priceData[$productId] .= $y['cateDesc']."：原价".$y['price'].'元 组团价：'.$y['groupPrice'].' 库存：'.$y['number'].'<br>';

            }
            $priceData = implode('<br/>',$priceData);
            $data[$k]['catData'] = $priceData;
        }
        return $this->render('group',['count'=>$count,'page'=>$page,'data'=>$data]);
    }

    /**
     * 组团商品
     * 改版
     */
    public function actionGroupProductAdd(){
        if($_POST){
            $image = Yii::$app->request->post('image');
            $productId = Yii::$app->request->post('productId');
            $number = Yii::$app->request->post('number',2);
            $day = Yii::$app->request->post('day',1);
            $rank = Yii::$app->request->post('rank',0);
            $catData = Yii::$app->request->post('catData','');
            if($image){
                if(!preg_match("/http/",$image)){
                    $domain = Yii::$app->params['domain'];
                    $image = $domain.$image;
                }
            }
            if(!$catData){
                Methods::jsonData(0,'没有组团数据');
            }
            if(!$productId){
                Methods::jsonData(0,'没有组团id');
            }
            $model = new Group();
            $model->headImage = $image;
            $model->productIds = $productId;
            $model->day = $day?$day:1;
            $model->number = $number?$number:2;
            $model->rank = $rank?$rank:0;
            $model->createTime = time();
            $res = $model->save();
            if($res){
                $groupId = $model->id;
                //记录组团分类数据
                foreach($catData as $k => $v){
                    $arr = explode('-',$v);
                    $proId = isset($arr[0])?$arr[0]:0;
                    $catPriceId = isset($arr[1])?$arr[1]:0;
                    $groupPrice = isset($arr[2])?$arr[2]:0;
////                    $catImage = isset($arr[3])?$arr[3]:'';
//                    if(!preg_match("/http/",$catImage)){
//                        $domain = Yii::$app->params['domain'];
//                        $catImage = $domain.$catImage;
//                    }
                    $model = new GroupPrice();
                    $model->groupId = $groupId;
                    $model->productId = $proId;
                    $model->catPriceId = $catPriceId;
                    $model->groupPrice = $groupPrice?$groupPrice:0;
//                    $model->catImage = $catImage;
                    $model->createTime = time();
                    $model->save();
                }
                Methods::jsonData(1,'创建成功');
            }else{
                Methods::jsonData(0,'创建失败，请重试');
            }
        }else{
            $id = Yii::$app->request->get('id');
            if($id){
                $data = Group::find()->where("id = $id")->asArray()->one();

            }else{
                $data = [];
            }
            return $this->render('group-add',['data'=>$data]);
        }
    }
}