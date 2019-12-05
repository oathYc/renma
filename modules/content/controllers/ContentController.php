<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\libs\Methods;
use app\modules\content\models\Advert;
use app\modules\content\models\Category;
use app\modules\content\models\Coupon;
use app\modules\content\models\GoodProduct;
use app\modules\content\models\Logo;
use app\modules\content\models\Product;
use app\modules\content\models\ShopMessage;
use PHPUnit\Framework\Constraint\Count;
use yii\data\Pagination;
use yii;

class ContentController  extends AdminController
{
    public $enableCsrfValidation = false;
    public $layout = 'content';
    public function init(){
        parent::init();
        parent::setContentId('content');
    }
    public function actionIndex(){
        return $this->redirect('/content/index/index');
    }

    /**
     * logo滚动字幕内容
     */
    public function actionLogoContent(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $content = \Yii::$app->request->post('content');
            if(!$content){
                echo "<script>alert('请填写logo内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $model = new Logo();
            $model->content = $content;
            $model->createTime = time();
            $model->status = 1;
            $res = $model->save();
            if($res){
                Logo::updateAll(['status'=>0],"id != {$model->id}");
                echo "<script>alert('添加成功');setTimeout(function(){location.href='logo-content';},1000)</script>";die;
            }else{
                echo "<script>alert('添加失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $content = Logo::find()->where("status = 1")->asArray()->one();
            return $this->render('logo',['content'=>$content]);
        }
    }
    /**
     * 广告内容
     * 内容列表
     */
    public function actionAdvert(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $total = Advert::find()->count();
        $page = new Pagination(['totalCount'=>$total,'pageSize'=>10]);
        $data = Advert::find()->orderBy('status desc')->orderBy('rank desc')->offset($page->offset)->limit($page->limit)->asArray()->all();
        return $this->render('advert',['page'=>$page,'count'=>$total,'advert'=>$data]);
    }
    /**
     * 广告内容
     * 内容编辑
     */
    public function actionAdvertAdd(){
        if($_POST){
            $type = \Yii::$app->request->post('fileType',1);//1-图片 2-视频
            $imageUrl = \Yii::$app->request->post('imageUrl');
            $url = \Yii::$app->request->post('url');
            $status = \Yii::$app->request->post('status',0);//1-启用
            $title = \Yii::$app->request->post('title');
            $id = \Yii::$app->request->post('id');
            $rank = \Yii::$app->request->post('rank');
            if(!$url){
                echo "<script>alert('文件地址出错，请重新上传');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if($id){
                $model = Advert::findOne($id);
            }else{
                $model = new Advert();
            }
            $model->type = $type;
            $model->imageUrl = $imageUrl;
            $model->url = 'https://lck.hzlyzhenzhi.com'.$url;
            $model->status = $status;
            $model->title = $title;
            $model->rank = $rank?$rank:0;
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('添加成功');setTimeout(function(){location.href='advert';},1000)</script>";die;
            }else{
                echo "<script>alert('添加失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $id = \Yii::$app->request->get('id');
            if($id){
                $advert = Advert::find()->where("id = $id")->asArray()->one();
            }else{
                $advert = [];
            }
            return $this->render('advert-add',['advert'=>$advert]);
        }
    }
    /**
     * 广告状态操作
     * 启用 禁用
     */
    public function actionAlterStatus(){
        $id = \Yii::$app->request->get('id');
        if($id){
            $advert = Advert::findOne($id);
            if(!$advert){
                Methods::jsonData(0,'没有该内容');
            }
            $advert->status = $advert->status==1?0:1;
            $res = $advert->save();
            if($res){
                echo "<script>alert('操作成功');setTimeout(function(){location.href='advert';},1000)</script>";die;
            }else{
                echo "<script>alert('操作失败,请重试');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            echo "<script>alert('参数不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
    /**
     * 广告删除
     */
    public function actionAdvertDelete(){
        $id = \Yii::$app->request->get('id');
        if($id){
            $advert = Advert::findOne($id);
            if(!$advert){
                echo "<script>alert('没有该内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $res = Advert::deleteAll("id = $id");
            if($res){
                echo "<script>alert('删除成功');setTimeout(function(){location.href='advert';},1000)</script>";die;
            }else{
                echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            echo "<script>alert('参数不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
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
                $this->redirect('/content/content/category');
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
            $this->redirect('/content/content/category');
        }else{
            echo '<script>alert("失败，请重试");history.go(-1);</script>';
            die;
        }
    }
    /**
     * 优惠券
     */
    public function actionCoupon(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Coupon::find()->asArray()->count();
        $page =  new Pagination(['totalCount'=>$count]);
        $data = Coupon::find()->asArray()->orderBy('id desc')->offset($page->offset)->limit($page->limit)->all();
        return $this->render('coupon',['count'=>$count,'page'=>$page,'data'=>$data]);
    }
    /**
     * 优惠券编辑
     * 新增
     * 增加后不能修改
     */
    public function actionCouponAdd(){
        if($_POST){
            $name = Yii::$app->request->post('name');
            $money = Yii::$app->request->post('money');
            $least = Yii::$app->request->post('least',0);
            $number = Yii::$app->request->post('number',0);//为0时是店铺优惠价  大于0 积分兑换
            $remark = Yii::$app->request->post('remark');
            if(!$name){
                echo "<script>alert('请填写优惠券名称');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
//            if(!$money || $money <= 0){
//                echo "<script>alert('请填写正确的优惠券金额');setTimeout(function(){history.go(-1);},1000)</script>";die;
//            }
            if(!$number || $number < 1){
                echo "<script>alert('请填写正确的兑换积分数量');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $model = new Coupon();
            $model->name = $name;
            $model->money = $money;
            $model->least = $least?$least:0;
            $model->integral = $number;
            $model->remark = $remark;
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('添加成功');setTimeout(function(){location.href='coupon';},1000)</script>";die;
            }else{
                echo "<script>alert('添加失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            return $this->render('coupon-add',[]);
        }
    }
    /**
     * 优惠券删除
     */
    public function actionCouponDelete(){
        $id = Yii::$app->request->post('id');
        if(!$id){
            echo "<script>alert('参数错误');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $res = Coupon::deleteAll("id = $id");
        if($res){
            echo "<script>alert('删除成功');setTimeout(function(){location.href='coupon';},1000)</script>";die;
        }else{
            echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
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
        $id = Yii::$app->request->post('id');
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
     * 关于我们
     */
    public function actionAboutUs(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $id = Yii::$app->request->post('id');
            $content = Yii::$app->request->post('content');
            if(!$content){
                echo "<script>alert('请填写内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = 1;// 1-关于我们 2-客服说明 3-会员充值说明
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='about-us';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $about = ShopMessage::find()->where("type = 1")->asArray()->one();
            return $this->render('about-us',['data'=>$about]);
        }
    }
    /**
     * 会员充值说明
     */
    public function actionMemberRemark(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $id = Yii::$app->request->post('id');
            $content = Yii::$app->request->post('content');
            if(!$content){
                echo "<script>alert('请填写内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = 3; // 1-关于我们 2-客服说明 3-会员充值说明
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='member-remark';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $about = ShopMessage::find()->where("type = 3")->asArray()->one();
            return $this->render('member-remark',['data'=>$about]);
        }
    }
    /**
     * k客服联系
     */
    public function actionService(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $id = Yii::$app->request->post('id');
            $content = Yii::$app->request->post('content');
            if(!$content){
                echo "<script>alert('请填写内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = 2; // 1-关于我们 2-客服说明 3-会员充值说明
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='service';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $about = ShopMessage::find()->where("type = 2")->asArray()->one();
            return $this->render('service',['data'=>$about]);
        }
    }
    /**
     * 积分规则
     */
    public function actionIntegralRule(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $id = Yii::$app->request->post('id');
            $content = Yii::$app->request->post('content');
            $image = Yii::$app->request->post('image');
            if(!$content){
                echo "<script>alert('请填写内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$image){
                echo "<script>alert('请上传图片');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = 4; // 1-关于我们 2-客服说明 3-会员充值说明 4-积分规则
            $model->createTime = time();
            $model->image = 'https://lck.hzlyzhenzhi.com'.$image;
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='integral-rule';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $about = ShopMessage::find()->where("type = 4")->asArray()->one();
            return $this->render('integral-rule',['data'=>$about]);
        }
    }

}