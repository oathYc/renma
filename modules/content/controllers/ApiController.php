<?php


namespace app\modules\content\controllers;


use app\libs\Methods;
use app\modules\content\models\Address;
use app\modules\content\models\Advert;
use app\modules\content\models\Catalog;
use app\modules\content\models\Category;
use app\modules\content\models\Coupon;
use app\modules\content\models\GoodProduct;
use app\modules\content\models\Logo;
use app\modules\content\models\Member;
use app\modules\content\models\Order;
use app\modules\content\models\Product;
use app\modules\content\models\UserCoupon;
use yii\web\Controller;
use Yii;

header("Access-Control-Allow-Origin:*");
class ApiController extends  Controller
{
    public $enableCsrfValidation = false;
    /**
     * 获取分类
     * cy
     */
    public function actionGetCategory(){
        $model = new Catalog();
        $pid = Yii::$app->request->get('pid','0');
        $id = Yii::$app->request->get('id','');
        $data = $model->getAllCate($pid,$id);
        echo json_encode($data);
    }

    /**
     * 获取分类树包括一级分类
     * @Obelisk
     */
    public function actionTree(){
        $model = new Catalog();
        $pid = Yii::$app->request->get('pid',0);
        $id = Yii::$app->request->get('id','');
        $data = $model->getTree($pid,$id);
        echo json_encode($data);
    }
    /**
     * 设置排序号
     * cy
     */
    public function actionSetRank(){
        $id = Yii::$app->request->post("id");
        $rank = Yii::$app->request->post("rank");
        $res = Catalog::updateAll(['rank'=>$rank],"id = $id");
        if($res){
            $data = ['code'=>1,'message'=>'success'];
        }else{
            $data = ['code'=>0,'message'=>'fail'];
        }
        die(json_encode($data));
    }
    /**
     * 检查是否能够删除分类
     * @Obelisk
     */
    public function actionCheckDelete(){
        $id = Yii::$app->request->post('id');
        $rowCate = Catalog::find()->where("pid=$id")->all();
        if(count($rowCate)>0 ){
            $code = 0;
        }else{
            $code = 1;
        }
        die(json_encode(['code' => $code]));
    }
    /**
     * 获取分类
     * 商品分类
     */
    public function actionGetProductCategory(){
        $model = new Category();
        $pid = Yii::$app->request->get('pid','0');
        $id = Yii::$app->request->get('id','');
        $data = $model->getAllCate($pid,$id);
        echo json_encode($data);
        exit;
    }

    /**
     * 获取分类树包括一级分类
     * 商品分类
     */
    public function actionCategoryTree(){
        $model = new Category();
        $pid = Yii::$app->request->get('pid',0);
        $id = Yii::$app->request->get('id','');
        $data = $model->getTree($pid,$id);
        echo json_encode($data);
        exit;
    }
    /**
     * 设置排序号
     * 商品分类
     */
    public function actionSetProductRank(){
        $id = Yii::$app->request->post("id");
        $rank = Yii::$app->request->post("rank");
        $res = Category::updateAll(['rank'=>$rank],"id = $id");
        if($res){
            $data = ['code'=>1,'message'=>'success'];
        }else{
            $data = ['code'=>0,'message'=>'fail'];
        }
        die(json_encode($data));
    }
    /**
     * 检查是否能够删除分类
     * 商品分类
     */
    public function actionCheckProductDelete(){
        $id = Yii::$app->request->post('id');
        $rowCate = Category::find()->where("pid=$id")->all();
        if(count($rowCate)>0 ){
            $code = 0;
        }else{
            $code = 1;
        }
        die(json_encode(['code' => $code]));
    }

    //后台接口
    /**
     * 获取商品信息
     * 组团获取商品信息
     */
    public function actionGetProduct(){
        $id = Yii::$app->request->post('id');
        if($id){
            $product = Product::find()->select("id,title,price,brand")->asArray()->one();
            if($product){
                Methods::jsonData(1,'success',$product);
            }else{
                Methods::jsonData(0,'参数错误');
            }
        }else{
            Methods::jsonData(0,'参数错误');
        }
    }

    //小程序接口

    /**
     * 用户登录
     * 微信授权
     */
    public function actionWeixinLogin(){
        $request = Yii::$app->request;
        $code = $request->post('code');
        $avatar = $request->post('avatar');
        $province = $request->post('province');
        $city = $request->post('city');
        $area = $request->post('area');
        $nickname = $request->post('nickname');
        $phone = $request->post('phone');
        $password = $request->post('password');
        $appId = Yii::$app->params['appId'];
        $secret = Yii::$app->params['secret'];
        if(!$code){
            Methods::jsonData(0,'code不存在');
        }
        $url="https://api.weixin.qq.com/sns/jscode2session?appid=".$appId."&secret=".$secret."&js_code=".$code."&grant_type=authorization_code";
        $return = Methods::doCurl($url);
        if(isset($return->openid)){
            $openId = $return->openid;//获取到用户的openid
            //已经授权登录
            $res = Member::find()->where("openId = '{$openId}' ")->asArray()->one();
            if($res){
                $model = Member::findOne($res['id']);
            }else{
                $model = new Member();
                $model->createTime = time();
            }
            $model->nickname = $nickname;
            $model->avatar = $avatar;
            $model->province = $province;
            $model->city = $city;
            $model->area = $area;
            $model->phone = $phone;
            $model->password = $password;
            $model->save();
            $member = Member::find()->where("id = {$model->id}")->asArray()->one();
            //判断用户邀请码
            Member::inviteCode($model->id);
            Methods::jsonData(1,'登录成功',$member);
        }else{
            Methods::jsonData(0,'请求错误');
        }
    }
    /**
     * 账号登录
     * 授权后
     */
    public function actionUserLogin(){
        $phone = Yii::$app->request->post('phone');
        $password = Yii::$app->request0>post('password');
        if(!$phone){
            Methods::jsonData(0,'电话不存在');
        }
        if(!$password){
            Methods::jsonData(0,'密码不存在');
            $user = Member::find()->where("phone = '{$phone}' and password = '{$password}'")->asArray()->one();
            if($user){
                Methods::jsonData(1,'登录成功',['user'=>$user]);
            }else{
                Methods::jsonData(0,'电话或密码错误');
            }
        }
    }
    /**
     * 用户信息
     * 个人信息修改
     */
    public function actionAlterMsg(){
        $uid = Yii::$app->request->post('uid');
        $avatar = Yii::$app->request->post('avatar');//头像地址
        $nickname = Yii::$app->request->post('nickname');//昵称
        $username = Yii::$app->request->post('username');//姓名
        $sex = Yii::$app->request->post('sex',0);//1-男 2-女
        $birthday = Yii::$app->request->post('birthday');
        $work = Yii::$app->request->post('work');//职业
        $province = Yii::$app->request->post('province');
        $city = Yii::$app->request->post('city');
        $area = Yii::$app->request->post('area');
        $identity = Yii::$app->request->post('identity');//身份证号
        if(!$uid){
            Methods::jsonData(0,'用户uid不存在');
        }
        $model = Member::findOne($uid);
        $model->avatar = $avatar;
        $model->nickname = $nickname;
        $model->username = $username;
        $model->sex = $sex;
        $model->birthday = $birthday;
        $model->work = $work;
        $model->province = $province;
        $model->city = $city;
        $model->area = $area;
        $model->identity = $identity;
        $res = $model->save();
        if($res){
            $msg = Member::find()->where("id = $uid")->asArray()->one();
            Methods::jsonData(1,'修改成功',$msg);
        }else{
            Methods::jsonData(0,'修改失败');
        }
    }
    /**
     * 图片上传
     */
    public function actionUploadImage(){
        $file = $_FILES['upload'];
        if(!$file){
            Methods::jsonData(0,'请上传图片');
        }
        $upload = new \UploadFile();
        $upload->int_max_size = 3145728;
        $upload->arr_allow_exts = array('jpg', 'gif', 'png', 'jpeg');
        $upload->str_save_path = Yii::$app->params['uploadDir'];
        $arr_rs = $upload->upload($file);
        if ($arr_rs['int_code'] == 1) {
            $filePath =[];
            foreach($arr_rs['arr_data']['arr_data'] as $k => $v){
                $filePath[] = Yii::$app->params['domain'].'/' . Yii::$app->params['upImage'].$v['savename'];
            }
            $filePath = implode("\n",$filePath);
            Methods::jsonData(1,'上传成功',['imageUrl'=>$filePath]);
        } else {
            Methods::jsonData(0,'上传失败，请重试');
        }
    }
    /**
     * 视频上传
     */
    public function actionFileImage(){
        $file = $_FILES['upload'];
        if(!$file){
            Methods::jsonData(0,'请上传文件');
        }
        $upload = new \UploadFile();
        $upload->int_max_size = 3145728;
        $upload->arr_allow_exts = array('avi', 'rm', 'rmvb', 'divx','mpg','wmv','mp4','mkv');
        $upload->str_save_path = Yii::$app->params['uploadDir'];
        $arr_rs = $upload->upload($file);
        if ($arr_rs['int_code'] == 1) {
            $filePath =[];
            foreach($arr_rs['arr_data']['arr_data'] as $k => $v){
                $filePath[] = Yii::$app->params['domain'].'/' . Yii::$app->params['upImage'].$v['savename'];
            }
            $filePath = implode("\n",$filePath);
            Methods::jsonData(1,'上传成功',['fileUrl'=>$filePath]);
        } else {
            Methods::jsonData(0,'上传失败，请重试');
        }
    }

    /**
     * 商品分类
     * 获取
     */
    public function actionProductCategory(){
        $pid = Yii::$app->request->post('pid',0);
        if($pid){
            $category = Category::find()->where("pid = $pid")->asArray()->all();
        }else{
            $category = Category::find()->where("pid = 0")->asArray()->all();
        }
        if(!$category)$category=[];
        Methods::jsonData(1,'success',$category);
    }
    /**
     * 商品上传
     * 上传
     */
    public function actionProductUpload(){
        $request = Yii::$app->request;
        $uid = $request->post('uid');
        $title = $request->post('title');//商品名称
        $catPid = $request->post('catPid');//一级分类
        $catCid = $request->post('catCid');//二级分类;
        $price = $request->post('price');//价格
        $brand = $request->post('brand');//品牌
        $headMsg = $request->post('headMsg');//封面信息
        $voltage = $request->post('voltage');//电压
        $mileage = $request->post('mileage');//续航里程
        $sex = $request->post('sex',0);//使用性别 0-通用 1-男 2-女
        $image = $request->post('image');//图片集合
        $tradeAddress = $request->post('tradeAddress');//商品详细地址
        $type = $request->post('type',0);//商品特性  1-维修 2-新车 3-二手车
        $introduce = $request->post('introduce');//详细介绍
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$title){
            Methods::jsonData(0,'商品名称不存在');
        }
        if(!$catPid){
            Methods::jsonData(0,'商品分类不存在（一级）');
        }
        if(!$catCid){
            Methods::jsonData(0,'商品分类不存在（二级）');
        }
        if(!$catPid){
            Methods::jsonData(0,'商品分类不存在（一级）');
        }
        if(!$price){
            Methods::jsonData(0,'商品价格不存在');
        }
        if(!$brand){
            Methods::jsonData(0,'商品品牌不存在');
        }
        if(!$headMsg){
            Methods::jsonData(0,'商品封面信息不存在');
        }
        if(!$voltage){
            Methods::jsonData(0,'商品电压数据不存在');
        }
        if(!$mileage){
            Methods::jsonData(0,'商品续航里程不存在');
        }
        if(!$image){
            Methods::jsonData(0,'商品图片数据不存在');
        }
        if(!$tradeAddress){
            Methods::jsonData(0,'商品交易地址不存在');
        }
        $model = new Product();
        $model->uid = $uid;
        $model->title = $title;
        $model->catPid = $catPid;
        $model->catCip = $catCid;
        $model->price = $price;
        $model->voltage = $voltage;
        $model->mileage = $mileage;
        $model->sex = $sex;
        $model->headMsg = $headMsg;
        $model->image = $image;
        $model->tradeAddress = $tradeAddress;
        $model->brand = $brand;
        $model->introduce = $introduce;
        $model->type = $type;
        $res = $model->save();
        if($res){
            $product = Product::find()->where("id = {$model->id}")->asArray()->one();
            $product['catPidName'] = Category::find()->where("id = {$catPid}")->asArray()->one()['name'];
            $product['catCidName'] = Category::find()->where("id = {$catCid}")->asArray()->one()['name'];
            Methods::jsonData(1,'上传成功',$product);
        }else{
            Methods::jsonData(0,'上传失败');
        }
    }

    /**
     * 首页信息
     */
    public function actionHomeIndex(){
        //logo内容
        $logo = Logo::find()->where("status = 1")->asArray()->one();
        //广告内容
        $advert = Advert::find()->where('status = 1')->asArray()->orderBy('rank desc')->all();
        //优选内容
        $page = Yii::$app->request->post('page',1);
        if(!$page)$page =1;
        $goodProduct = GoodProduct::getGoodProduct($page);
        $data = ['logo'=>$logo,'advert'=>$advert,'goodProduct'=>$goodProduct['goodProduct'],'goodTotal'=>$goodProduct['goodTotal']];
        Methods::jsonData(1,'success',$data);
    }
    /**
     * 首页搜索
     */
    public function actionIndexSearch(){
        $search = Yii::$app->request->post('search','');
        if($search){
            $where = " title like '%{$search}%' or voltage like '%{$search}%' or mileage like '%{$search}%' or tradeAddress like '%{$search}%' or brand like '%{$search}%' ";
            $product = Product::find()->where($where)->limit(10)->asArray()->all();
        }else{
            $product = [];
        }
        Methods::jsonData(1,'success',$product);
    }
    /**
     * 不同类型进入
     * type 1-维修 2-新车 3-二手车
     */
    public function actionProductAccess(){
        $type = Yii::$app->request->post('type',1);
        $page = Yii::$app->request->post('page',1);
        $search =Yii::$app->request->post('search','');
        $priceMin = Yii::$app->request->post('priceMin');//最低价
        $priceMax = Yii::$app->request->post('priceMax');//最高价
        $brand = Yii::$app->request->post('brand');//品牌
        $voltageMin = Yii::$app->request->post('voltageMin');//最低电压
        $voltageMax = Yii::$app->request->post('voltageMax');//最高电压
        $mileageMin = Yii::$app->request->post('mileageMin');//续航里程最小
        $mileageMax = Yii::$app->request->post('mileageMax');//续航里程最大
        $sex = Yii::$app->request->post('sex',0);//1-男 2-女
        $where = " type = $type ";
        if($search){
            $where .= " title like '%{$search}%' or voltage like '%{$search}%' or mileage like '%{$search}%' or tradeAddress like '%{$search}%' or brand like '%{$search}%' ";
        }
        if($priceMin){
            $where .= " and price >= $priceMin";
        }
        if($priceMax){
            $where .= " and price <= $priceMax";
        }
        if($brand){
            $where .= " and brand = $brand";
        }
        if($voltageMin){
            $where .= " and voltage >= $voltageMin";
        }
        if($voltageMax){
            $where .= " and voltage <= $voltageMax";
        }
        if($mileageMin){
            $where .= " and mileage >= $mileageMin";
        }
        if($mileageMax){
            $where .= " and mileage <= $mileageMax";
        }
        if($sex){
            $where .= " and sex = $sex";
        }
        $total = Product::find()->where($where)->count();
        if(!$page)$page =1;
        $offset = 10*($page-1);
        $product = Product::find()->where($where)->asArray()->offset($offset)->limit(10)->all();
        Methods::jsonData(1,'success',['total'=>$total,'product'=>$product]);
    }
    /**
     * 商品详情
     */
    public function actionProductDetail(){
        $productId = Yii::$app->request->post('productId',0);
        $uid = Yii::$app->request->post('uid');
        if(!$productId){
            Methods::jsonData(0,'参数错误');
        }
        //商品数据
        $product = Product::find()->where("id = {$productId}")->asArray()->one();
        $product['catPidName'] = Category::find()->where("id = {$product['catPid']}")->asArray()->one()['name'];
        $product['catCidName'] = Category::find()->where("id = {$product['catCid']}")->asArray()->one()['name'];
        if($uid){
            //用户积分
            $userIntegral = Member::find()->select("id,integral")->where("id = $uid")->asArray()->one()['integral'];
            //用户默认收货地址数据
            $userAddress = Address::find()->where("uid = $uid and default = 1")->asArray()->one();
            //用户优惠券
            $userCoupon = Coupon::getUserCoupon($uid);
        }else{
            $userIntegral = 0;
            $userAddress = [];
            $userCoupon = [];
        }
        $data = ['userIntegral'=>$userIntegral,'product'=>$product,'userAddress'=>$userAddress,'userCoupon'=>$userCoupon];
        Methods::jsonData(1,'上传成功',$data);
    }
    /**
     * 用户地址数据
     */
    public function actionUserAddress(){
        $uid = Yii::$app->request->post('uid',0);
        $default = Yii::$app->request->post('default',0);
        if($default ==1){
            $address = Address::find()->where("uid = '{$uid}' and `default` = 1")->asArray()->one();
        }else{
            $address = Address::find()->where("uid = '{$uid}'")->orderBy('`default` desc')->asArray()->all();
        }
        die(json_encode(['code'=>1,'message'=>'success','data'=>$address]));
    }
    /**
     * 添加 修改用户地址
     */
    public function actionAddAddress(){
        $uid = Yii::$app->request->post('uid');
        $addressId = Yii::$app->request->post('addressId');
        $province = Yii::$app->request->post('province');
        $city = Yii::$app->request->post('city');
        $area = Yii::$app->request->post('area');
        $address = Yii::$app->request->post('address');
        $name = Yii::$app->request->post('name');
        $phone = Yii::$app->request->post('phone');
        $default = Yii::$app->request->post('default',0);
        if(!$province){
            Methods::jsonData(0,'请选择省份');
        }
        if(!$city){
            Methods::jsonData(0,'请选择市区');
        }
        if(!$name){
            Methods::jsonData(0,'请填写收货人');
        }
        if(!$phone){
            Methods::jsonData(0,'请填写联系电话');
        }
        if($addressId){//修改
            $model = Address::findOne($addressId);
        }else{//新增
            $model = new Address();
        }
        $model->createTime = time();
        $model->uid = $uid;
        $model->province = $province;
        $model->city = $city;
        $model->area = $area;
        $model->address = $address;
        $model->name = $name;
        $model->phone = $phone;
        if($default ==1){
            $model->default = 1;
        }else{
            $model->default = 0;
        }
        $res = $model->save();
        if($res){
            if($default ==1){
                Address::updateAll(['default'=>0],"uid = '{$uid}' and id != '{$model->id}'");
            }
            $data = Address::find()->where("id = {$model->id}")->asArray()->one();
            $data = ['code'=>1,'message'=>'操作成功','data'=>$data];
        }else{
            $data = ['code'=>0,'message'=>'操作失败，请重试'];
        }
        die(json_encode($data));
    }
    /**
     * 设置默认地址
     */
    public function actionAddressDefault(){
        $uid = Yii::$app->request->post('uid');
        $addressId = Yii::$app->request->post('addressId');
        if(!$addressId || !$uid){
            $data = ['code'=>0,'message'=>'参数错误'];
        }else{
            Address::updateAll(['default'=>0],"uid = '{$uid}'");
            Address::updateAll(['default'=>1],"id = $addressId and uid = '{$uid}'");
            $data = ['code'=>1,'message'=>'设置成功'];
        }
        die(json_encode($data));
    }
    /**
     * 地址删除
     */
    public function actionAddressDelete(){
        $addressId = Yii::$app->request->post('addressId');
        $uid = Yii::$app->request->post('uid');
        if(!$addressId || !$uid){
            Methods::jsonData(0,'参数错误');
        }
        $res = Address::deleteAll("id = $addressId and uid = '{$uid}'");
        if($res){
            $code = 1;
            $message = '删除成功';
        }else{
            $code = 0 ;
            $message = '删除失败，请重试';
        }
        Methods::jsonData($code,$message);
    }
    /**
     * 用户下单
     */
    public function actionCreateOrder(){
        $uid = Yii::$app->request->post('uid');
        $productId = Yii::$app->request->post('productId');
        $number = Yii::$app->request->post('number',1);
        $integral = Yii::$app->request->post('integral',0);//积分
        $couponId = Yii::$app->request->post('couponId',0);//优惠券id
        $type = Yii::$app->request->post('type',1);//1-充值 2-买商品
        $remark = Yii::$app->request->post('remark');//订单备注
        $address = Yii::$app->request->post('addressId',0);//收货地址Id
        $time = time();
        $orderNumber = 'RM'.$time.rand(123456,999999);
        if(!$uid){
            Methods::jsonData(0,'用户uid不存在');
        }
        if(!$productId){
            Methods::jsonData(0,'商品Id不存在');
        }
        if(!$number || $number < 1){
            Methods::jsonData(0,'商品数量不正确');
        }
        $product = Product::findOne($productId);
        if(!$product){
            Methods::jsonData(0,'没有该商品');
        }
        $totalPrice = $number*$product->price;
        //积分抵扣
        if(!$integral){
            $integral = 0;
            $inteMoney = 0;
        }else{
            //判断用户积分是否足够
            $user = Member::findOne($uid);
            if($user->integral < $integral){
                Methods::jsonData(0,'用户积分不足');
            }
            $inteMoney = $integral;//积分金钱比例换算
        }
        //优惠券金额换算
        if(!$couponId){
            $couponId = 0;
            $couponMoney = 0;//优惠券优惠价格
        }else{
            //判断用户是否已经使用过该优惠券
            $userCoupon = UserCoupon::find()->where("uid = $uid and couponId = $couponId")->one();
            if($userCoupon){
                Methods::jsonData(0,'你已经使用过该优惠券（每张只能用一次）');
            }
            $coupon = Coupon::findOne($couponId);
            if($coupon['least'] > $totalPrice){
                Methods::jsonData(0,'该优惠券使用最低价格应不小于'.$coupon['least'].'元');
            }else{
                $couponMoney = $coupon['money'];
            }
        }
        //抵扣金额
        $reducePrice = $inteMoney+$couponMoney;
        //实际支付价格
        $payPrice = $totalPrice - $reducePrice;
        if($payPrice <= 0){
            $payPrice = 0;
            $status = 1;//支付成功 不需调微信下单接口
        }else{
            $status = 0;
        }
        $model = new Order();
        $model->orderNumber = $orderNumber;
        $model->uid = $uid;
        $model->productId = $productId;
        $model->productTitle = $product->title;
        $model->totalPrice = $totalPrice;
        $model->reducePrice = $reducePrice;
        $model->payPrice = $payPrice;
        $model->coupon = $couponId;
        $model->number = $number;
        $model->extInfo = '';
        $model->status = $status;
        $model->createTime = $time;
        if($status == 1){
            $model->finishTime = $time;
        }
        $model->payType = 1;
        $model->type = $type;
        $model->address = $address;
        $model->integral = $integral;
        $model->remark = $remark;
        $res = $model->save();
        if($res){
            //记录用户优惠券使用记录
            if($couponId){
                UserCoupon::addRecord($uid,$couponId,$model->id);
            }
            if($status ==0){//需要支付金额
                $return  = WeixinPayController::WxOrder($orderNumber,$product->title,$payPrice,$model->id);
                die(json_encode($return));
            }else{//不需要支付金额
                Methods::jsonData(1,'success',['status'=>1]);//支付成功
            }
        }else{
            Methods::jsonData(0,'订单添加失败');
        }
    }
}