<?php


namespace app\modules\content\controllers;


use app\libs\AdminController;
use app\libs\Methods;
use app\modules\content\models\Advert;
use app\modules\content\models\Category;
use app\modules\content\models\Coupon;
use app\modules\content\models\GoodProduct;
use app\modules\content\models\GroupProduct;
use app\modules\content\models\Logo;
use app\modules\content\models\MemberRecharge;
use app\modules\content\models\Product;
use app\modules\content\models\Search;
use app\modules\content\models\ShopMessage;
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
            $imageType = \Yii::$app->request->post('imageType',0);//0-其他 1-商品 2-组团
            $imageUrl = \Yii::$app->request->post('imageUrl');
            $url = \Yii::$app->request->post('url');
            $status = \Yii::$app->request->post('status',0);//1-启用
            $title = \Yii::$app->request->post('title');
            $id = \Yii::$app->request->post('id');
            $rank = \Yii::$app->request->post('rank');
            $domain = Yii::$app->params['domain'];
            if(!$url){
                echo "<script>alert('文件地址出错，请重新上传');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }else{
                if(!preg_match("/http/",$url)){
                    $url = $domain.$url;
                }
            }
//            if($type ==1 && !$imageUrl){
//                echo "<script>alert('图片广告时，商品id必须存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
//            }
            $turnUrl = $imageUrl;//图片跳转地址
            if($imageType ==1){//商品
                $pro = Product::findOne($imageUrl);
                if(!$pro){
                    echo "<script>alert('没有该商品，请填写正确的商品id');setTimeout(function(){history.go(-1);},1000)</script>";die;
                }else{
                    $turnUrl = '/pages/goodsinfo/index?id='.$imageUrl;
                }
            }
            if($imageType ==2){//组团
                $gro = GroupProduct::findOne($imageUrl);
                if(!$gro){
                    echo "<script>alert('没有该商品，请填写正确的组团商品id');setTimeout(function(){history.go(-1);},1000)</script>";die;
                }else{
                    $turnUrl = '/pages/pintuan/goodsinfo/index?id='.$imageUrl;;
                }
            }
            if($id){
                $model = Advert::findOne($id);
            }else{
                $model = new Advert();
            }
            $model->type = $type;
            $model->imageUrl = $turnUrl;
            $model->url = $url;
            $model->status = $status;
            $model->title = $title;
            $model->rank = $rank?$rank:0;
            $model->createTime = time();
            $model->imageType = $imageType;
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
        $id = Yii::$app->request->get('id');
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
     * 关于我们
     */
    public function actionAboutUs(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $id = Yii::$app->request->post('id');
            $content = Yii::$app->request->post('content');
            $phone = Yii::$app->request->post('phone');
            if(!$content){
                echo "<script>alert('请填写内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$phone){
                echo "<script>alert('请填写联系电话');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = 1;// 1-关于我们 2-客服说明 3-会员充值说明
            $model->phone = $phone;
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
     * 客服联系
     */
    public function actionService(){
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
            }else{
                if(!preg_match('/https/',$image)){
                    $domain = Yii::$app->params['domain'];
                    $image = $domain.$image;
                }
            }
            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = 2; // 1-关于我们 2-客服说明 3-会员充值说明
            $model->createTime = time();
            $model->image = $image;
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
            }else{
                if(!preg_match('/https/',$image)){
                    $domain = Yii::$app->params['domain'];
                    $image = $domain.$image;
                }
            }
            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = 4; // 1-关于我们 2-客服说明 3-会员充值说明 4-积分规则
            $model->createTime = time();
            $model->image = $image;
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
    /**
     * 筛选设置
     * 电压 续航里程
     */
    public function actionSearchSet(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        $count = Search::find()->asArray()->count();
        $page =  new Pagination(['totalCount'=>$count]);
        $data = Search::find()->asArray()->orderBy('id desc')->offset($page->offset)->limit($page->limit)->all();
        return $this->render('search',['count'=>$count,'page'=>$page,'data'=>$data]);
    }
    /**
     * 筛选编辑
     * 新增
     * 增加后不能修改
     */
    public function actionSearchAdd(){
        if($_POST){
            $type = Yii::$app->request->post('type',1);//1-电压 2-续航
            $val = Yii::$app->request->post('val',0);
            if($type ==1){
                $name = '电压';
            }else{
                $name = '续航里程';
            }
            $model = new Search();
            $model->name = $name;
            $model->type = $type;
            $model->val = $val;
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('添加成功');setTimeout(function(){location.href='search-set';},1000)</script>";die;
            }else{
                echo "<script>alert('添加失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            return $this->render('search-add',[]);
        }
    }
    /**
     * 筛选删除
     */
    public function actionSearchDelete(){
        $id = Yii::$app->request->get('id');
        if(!$id){
            echo "<script>alert('参数错误');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
        $res = Search::deleteAll("id = $id");
        if($res){
            echo "<script>alert('删除成功');setTimeout(function(){location.href='search-set';},1000)</script>";die;
        }else{
            echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
    /**
     * 会员优惠说明
     */
    public function actionMemberDesc(){
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
            $model->type = 5;// 1-关于我们 2-客服说明 3-会员充值说明 4-积分规则 5-会员优惠说明
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='member-desc';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $about = ShopMessage::find()->where("type = 5")->asArray()->one();
            return $this->render('member-desc',['data'=>$about]);
        }
    }
    /**
     * 小程序地区进入限制
     */
    public function actionAreaCheck(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $id = Yii::$app->request->post('id');
            $content = Yii::$app->request->post('content');
//            if(!$content){
//                echo "<script>alert('请填写地区内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
//            }
            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = 11; // 1-关于我们 2-客服说明 3-会员充值说明  11-地区设置
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='area-check';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $about = ShopMessage::find()->where("type = 11")->asArray()->one();
            return $this->render('area-check',['data'=>$about]);
        }
    }
    /**
     * 商品刷新金额设置
     */
    public function actionFlushMoney(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $id = Yii::$app->request->post('id');
            $content = Yii::$app->request->post('content');
            if(!$content){
                echo "<script>alert('请填写刷新金额');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }

            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = round($content,2);
            $model->type = 12; // 1-关于我们 2-客服说明 3-会员充值说明  11-地区设置 12-刷新金额
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='flush-money';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $about = ShopMessage::find()->where("type = 12")->asArray()->one();
            return $this->render('flush-money',['data'=>$about]);
        }
    }
    /**
     * 会员充值
     * 内容列表
     */
    public function actionMemberRecharge(){
        $action = Yii::$app->controller->action->id;
        parent::setActionId($action);
        $data = MemberRecharge::find()->asArray()->orderBy('rank desc')->all();
        return $this->render('member-recharge',['data'=>$data]);
    }
    /**
     * 会员充值
     * 内容编辑
     */
    public function actionRechargeAdd(){
        if($_POST){
            $title = \Yii::$app->request->post('title');
            $remark = Yii::$app->request->post('remark');//说明
            $upload = Yii::$app->request->post('upload');//上传商品个数
            $oldPrice = Yii::$app->request->post('oldPrice');
            $price = Yii::$app->request->post('price');
            $id = Yii::$app->request->post('id');
            $level = Yii::$app->request->post('level',1);
            $rank = Yii::$app->request->post('rank',0);
            $month = Yii::$app->request->post('month',1);
            if(!$title){
                echo "<script>alert('请填写标题');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$remark){
                echo "<script>alert('请填写充值说明');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$upload){
                echo "<script>alert('请填写上传商品数');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$price){
                echo "<script>alert('请填写充值金额');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if(!$month){
                echo "<script>alert('请填写月数');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if($id){
                $had = MemberRecharge::find()->where("level = $level and id != $id")->one();
                $model = MemberRecharge::findOne($id);
            }else{
                $had = MemberRecharge::find()->where("level = $level")->one();
                $model = new MemberRecharge();
            }
            if($had){
                echo "<script>alert('该等级充值已经存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $model->title = $title;
            $model->remark = $remark;
            $model->upload = $upload;
            $model->oldPrice = $oldPrice?$oldPrice:'';
            $model->price = $price;
            $model->createTime = time();
            $model->level = $level;
            $model->rank = $rank;
            $model->month = $month;
            $res = $model->save();
            if($res){
                echo "<script>alert('添加成功');setTimeout(function(){location.href='member-recharge';},1000)</script>";die;
            }else{
                echo "<script>alert('添加失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $id = \Yii::$app->request->get('id');
            if($id){
                $data = MemberRecharge::find()->where("id = $id")->asArray()->one();
            }else{
                $data = [];
            }
            return $this->render('recharge-add',['data'=>$data]);
        }
    }
    /**
     * 会员充值
     * 删除
     */
    public function actionRechagrDelete(){
        $id = \Yii::$app->request->get('id');
        if($id){
            $data = MemberRecharge::findOne($id);
            if(!$data){
                echo "<script>alert('没有该内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            $res = MemberRecharge::deleteAll("id = $id");
            if($res){
                echo "<script>alert('删除成功');setTimeout(function(){location.href='member-recharge';},1000)</script>";die;
            }else{
                echo "<script>alert('删除失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            echo "<script>alert('参数不存在');setTimeout(function(){history.go(-1);},1000)</script>";die;
        }
    }
    /**
     * 图片设置
     * 编辑添加
     */
    public function actionSetImage(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $id = Yii::$app->request->post('id');
            $content = Yii::$app->request->post('content');
            $image = Yii::$app->request->post('image');
            $type = Yii::$app->request->post('type');//13-购物车背景图 14-积分明细背景图 15-邀请朋友圈背景图 16-邀请有奖背景图 17-维修师背景图
            if(!$image){
                echo "<script>alert('请上传图片');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }else{
                if(!preg_match('/https/',$image)){
                    $domain = Yii::$app->params['domain'];
                    $image = $domain.$image;
                }
            }
            if(!$type){
                echo "<script>alert('请选择图片类型');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }

            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = $type; //13-购物车背景图 14-积分明细背景图 15-邀请朋友圈背景图 16-邀请有奖背景图 17-维修师背景图
            $model->createTime = time();
            $model->image = $image;
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='set-image';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $type = Yii::$app->request->get('type',0);//13-购物车背景图 14-积分明细背景图 15-邀请朋友圈背景图 16-邀请有奖背景图 17-维修师背景图
            if($type){
                $data = ShopMessage::find()->where("type = $type")->asArray()->one();
            }else{
                $data = [];
            }
            $types = [
                ['type'=>13,'name'=>'购物车'],
                ['type'=>14,'name'=>'积分明细'],
//                ['type'=>15,'name'=>'邀请码背景图'],
                ['type'=>16,'name'=>'邀请有奖'],
                ['type'=>17,'name'=>'维修师'],
            ];
            return $this->render('set-image',['data'=>$data,'types'=>$types]);
        }
    }
    /**
     * 活动规则
     * 1-关于我们  2-客服联系 3-会员充值说明 4-积分规则 5-会员优惠说明 11-地区设置 12-刷新金额 13-购物车背景图 14-积分明细背景图 15-邀请朋友圈背景图 16-邀请有奖背景图 17-维修师背景图 18-活动规则 19-反馈电话
     */
    public function actionActivityRule(){
        $action = \Yii::$app->controller->action->id;
        parent::setActionId($action);
        if($_POST){
            $id = Yii::$app->request->post('id');
            $content = Yii::$app->request->post('content');
            if(!$content){
                echo "<script>alert('请填写活动规则内容');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
            if($id){
                $model = ShopMessage::findOne($id);
            }else{
                $model = new ShopMessage();
            }
            $model->content = $content;
            $model->type = 18;// 18-活动规则
            $model->createTime = time();
            $res = $model->save();
            if($res){
                echo "<script>alert('编辑成功');setTimeout(function(){location.href='activity-rule';},1000)</script>";die;
            }else{
                echo "<script>alert('编辑失败');setTimeout(function(){history.go(-1);},1000)</script>";die;
            }
        }else{
            $data = ShopMessage::find()->where("type = 18")->asArray()->one();
            return $this->render('activity-rule',['data'=>$data]);
        }
    }

}