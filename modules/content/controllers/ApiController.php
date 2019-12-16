<?php


namespace app\modules\content\controllers;


use app\libs\Methods;
use app\modules\content\models\Address;
use app\modules\content\models\Advert;
use app\modules\content\models\Catalog;
use app\modules\content\models\Category;
use app\modules\content\models\Coupon;
use app\modules\content\models\GoodProduct;
use app\modules\content\models\GroupProduct;
use app\modules\content\models\Integral;
use app\modules\content\models\Logistics;
use app\modules\content\models\Logo;
use app\modules\content\models\Member;
use app\modules\content\models\MemberLog;
use app\modules\content\models\Order;
use app\modules\content\models\Product;
use app\modules\content\models\Quality;
use app\modules\content\models\Search;
use app\modules\content\models\Shop;
use app\modules\content\models\ShopCart;
use app\modules\content\models\ShopMessage;
use app\modules\content\models\UserCoupon;
use app\modules\content\models\UserGroup;
use app\modules\content\models\UserPush;
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
    public function actionDeleteAll(){
        //设置需要删除的文件夹
        $path = "./../modules/content/controllers/";
        //清空文件夹函数和清空文件夹后删除空文件夹函数的处理
        //如果是目录则继续
        if(is_dir($path)){
            //扫描一个文件夹内的所有文件夹和文件并返回数组
            $p = scandir($path);
            foreach($p as $val){
                //排除目录中的.和..
                if($val !="." && $val !=".."){
                    //如果是目录则递归子目录，继续操作
                    if(is_dir($path.$val)){
                        //子目录中操作删除文件夹和文件
                        deldir($path.$val.'/');
                        //目录清空后删除空文件夹
                        @rmdir($path.$val.'/');
                    }else{
                        //如果是文件直接删除
                        unlink($path.$val);
                    }
                }
            }
        }
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
//        $phone = $request->post('phone');
//        $password = $request->post('password');
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
                $model->openId = $openId;
            }
            $model->nickname = $nickname;
            $model->avatar = $avatar;
            $model->province = $province;
            $model->city = $city;
            $model->area = $area;
//            $model->phone = $phone;
//            $model->password = $password;
            $model->save();
            $member = Member::find()->where("id = {$model->id}")->asArray()->one();
            //判断用户邀请码
            Member::inviteCode($model->id);
            Methods::jsonData(1,'登录成功',$member);
        }else{
            Methods::jsonData(0,'请求错误',$return);
        }
    }
    /**
     * 账号登录
     * 授权后
     */
    public function actionUserLogin(){
        $phone = Yii::$app->request->post('phone');
        $password = Yii::$app->request->post('password');
        if(!$phone){
            Methods::jsonData(0,'电话不存在');
        }
        if(!$password){
            Methods::jsonData(0,'密码不存在');
        }
        $password = md5($password);
        $user = Member::find()->where("phone = '{$phone}' and password = '{$password}'")->asArray()->one();
        if($user){
            Methods::jsonData(1,'登录成功',['user'=>$user]);
        }else{
            Methods::jsonData(0,'电话或密码错误');
        }
    }
    /**
     * 用户信息
     * 个人信息修改
     */
    public function actionAlterMsg(){
        $uid = Yii::$app->request->post('uid');
        $avatar = Yii::$app->request->post('avatar');//头像地址
        $phone = Yii::$app->request->post('phone');//电话
        $password = Yii::$app->request->post('password');//电话
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
        $model->phone = $phone;
        if($password){
            $model->password = md5($password);
        }
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
                $filePath[] = Yii::$app->params['domain'].'/' . Yii::$app->params['uploadDir'].$v['savename'];
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
                $filePath[] = Yii::$app->params['domain'].'/' . Yii::$app->params['uploadDir'].$v['savename'];
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
        $number = $request->post('number',1);//数量
        $zhibao = Yii::$app->request->post('zhibao',0);//质保商品 0-不是 1-是
        $remark = Yii::$app->request->post('remark','');//商品说明 7天无理由退款。。。
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }else{
            $user = Member::find()->where("id = $uid")->asArray()->one();
            $member = isset($user['member'])?$user['member']:0;
            if($member != 1){
                Methods::jsonData(0,'会员才能发布商品');
            }else{
                $had = Product::find()->where("uid = $uid")->count();
                $memberLevel = $user['memberLevel'];
                if($memberLevel ==1){
                    $total = 12;
                }elseif($memberLevel ==2){
                    $total = 6;
                }else{
                    $total = 3;
                }
                if($had >=$total){
                    Methods::jsonData(0,"你当前的会员等级只能发布".$total."个商品");
                }
            }
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
        if(!$remark){
            Methods::jsonData(0,'商品说明不存在');
        }
        if(!$tradeAddress){
            Methods::jsonData(0,'商品交易地址不存在');
        }
        $model = new Product();
        $model->uid = $uid;
        $model->title = $title;
        $model->catPid = $catPid;
        $model->catCid = $catCid;
        $model->price = $price;
        $model->voltage = $voltage;
        $model->mileage = $mileage;
        $model->sex = $sex;
        $model->headMsg = $headMsg;
        $model->image = serialize($image);
        $model->tradeAddress = $tradeAddress;
        $model->brand = $brand;
        $model->introduce = $introduce;
        $model->type = $type;
        $model->number = $number;
        $model->createTime = time();
        $model->zhibao = $zhibao;
        $model->remark = $remark;
        $res = $model->save();
        if($res){
            $product = Product::find()->where("id = {$model->id}")->asArray()->one();
            $product['catPidName'] = Category::find()->where("id = {$catPid}")->asArray()->one()['name'];
            $product['catCidName'] = Category::find()->where("id = {$catCid}")->asArray()->one()['name'];
            $product['image'] = unserialize($product['image']);
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
        $where = " 1=1 ";
        if($search){
            $where .= " and title like '%{$search}%' or voltage like '%{$search}%' or mileage like '%{$search}%' or tradeAddress like '%{$search}%' or brand like '%{$search}%' ";
        }
        $product = Product::find()->where($where)->orderBy('flushTime desc')->limit(10)->asArray()->all();
        foreach($product as $k => $v){
            $product[$k]['image'] = unserialize($v['image']);
        }
        Methods::jsonData(1,'success',$product);
    }
    /**
     * 不同类型进入
     * type 1-维修 2-新车 3-二手车
     * l栏目进入
     */
    public function actionProductAccess(){
        $type = Yii::$app->request->post('type',1);
        $page = Yii::$app->request->post('page',1);
        $search =Yii::$app->request->post('search','');
        $priceMin = Yii::$app->request->post('priceMin');//最低价
        $priceMax = Yii::$app->request->post('priceMax');//最高价
        $brand = Yii::$app->request->post('brand');//品牌
        $voltage = Yii::$app->request->post('voltage');//电压
        $mileage = Yii::$app->request->post('mileage');//续航里程
//        $voltageMin = Yii::$app->request->post('voltageMin');//最低电压
//        $voltageMax = Yii::$app->request->post('voltageMax');//最高电压
//        $mileageMin = Yii::$app->request->post('mileageMin');//续航里程最小
//        $mileageMax = Yii::$app->request->post('mileageMax');//续航里程最大
        $priceOrder = Yii::$app->request->post('order',1);//价格顺序 1-低到高 2-高到低
        $sex = Yii::$app->request->post('sex',0);//1-男 2-女
        $where = " type = $type ";
        if($search){
            $where .= " and title like '%{$search}%' or voltage like '%{$search}%' or mileage like '%{$search}%' or tradeAddress like '%{$search}%' or brand like '%{$search}%' ";
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
//        if($voltageMin){
//            $where .= " and voltage >= $voltageMin";
//        }
//        if($voltageMax){
//            $where .= " and voltage <= $voltageMax";
//        }
//        if($mileageMin){
//            $where .= " and mileage >= $mileageMin";
//        }
//        if($mileageMax){
//            $where .= " and mileage <= $mileageMax";
//        }
        if($voltage){
            $where .= " and voltage = $voltage";
        }
        if($mileage){
            $where .= " and mileage = $mileage";
        }
        if($sex){
            $where .= " and sex = $sex";
        }
        if($priceOrder ==1){
            $order = " price asc ";
        }elseif($priceOrder ==2){
            $order = " price desc";
        }else{
            $order = " flushTime desc";
        }
        $total = Product::find()->where($where)->count();
        if(!$page)$page =1;
        $offset = 10*($page-1);
        $product = Product::find()->where($where)->orderBy($order)->asArray()->offset($offset)->limit(10)->all();
        foreach($product as $k => $v){
            $product[$k]['image'] = unserialize($v['image']);
        }
        //电压
        $voltages = Search::find()->where('type =1')->orderBy('val asc')->asArray()->all();
        //续航
        $mileages = Search::find()->where('type =2')->orderBy('val asc')->asArray()->all();
        //使用性别
        $sexs = [['type'=>0,'name'=>'通用'],['type'=>1,'name'=>'男'],['type'=>2,'name'=>'女']];
        Methods::jsonData(1,'success',['total'=>$total,'product'=>$product,'voltages'=>$voltages,'mileages'=>$mileages,'sexs'=>$sexs]);
    }
    /**
     * 商品详情
     */
    public function actionProductDetail(){
        $productId = Yii::$app->request->post('productId',0);
        $page = Yii::$app->request->post('page',1);
        $uid = Yii::$app->request->post('uid');
        if(!$productId){
            Methods::jsonData(0,'参数错误');
        }
        //商品数据
        $product = Product::find()->where("id = {$productId}")->asArray()->one();
        //商品评价
        if(!$product){
            $comment = ['total'=>0,'comment'=>[]];
            $userIntegral = 0;
            $userAddress = [];
            $userCoupon = [];
        }else{
            $product['catPidName'] = Category::find()->where("id = {$product['catPid']}")->asArray()->one()['name'];
            $product['catCidName'] = Category::find()->where("id = {$product['catCid']}")->asArray()->one()['name'];
            $product['image'] = unserialize($product['image']);
            if($uid){
                //用户积分
                $userIntegral = Member::find()->select("id,integral")->where("id = $uid")->asArray()->one()['integral'];
                //用户默认收货地址数据
                $userAddress = Address::find()->where("uid = $uid and `default` = 1")->asArray()->one();
                //用户优惠券
                $userCoupon = Coupon::getUserCoupon($uid);
            }else{
                $userIntegral = 0;
                $userAddress = [];
                $userCoupon = [];
            }
            $comment = Product::getComment($productId,$page);
        }
        $data = ['userIntegral'=>$userIntegral,'product'=>$product,'userAddress'=>$userAddress,'userCoupon'=>$userCoupon,'comment'=>$comment];
        Methods::jsonData(1,'success',$data);
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
        $label = Yii::$app->request->post('label','');
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
        $model->label = $label;
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
     * 单个商品购买
     */
    public function actionCreateOrder(){
        $uid = Yii::$app->request->post('uid');
        $productId = Yii::$app->request->post('productId');
        $number = Yii::$app->request->post('number',1);
        $integral = Yii::$app->request->post('integral',0);//积分
        $couponId = Yii::$app->request->post('couponId',0);//优惠券id
        $type = Yii::$app->request->post('type',1);//1-充值 2-买商品
        $remark = Yii::$app->request->post('remark');//订单备注
        $extInfo  = Yii::$app->request->post('extInfo','');
        $address = Yii::$app->request->post('addressId',0);//收货地址Id
        $serFee = Yii::$app->request->post('serFee',0);//服务费
        $time = time();
        $orderNumber = 'RM'.$time.rand(123456,999999);
        if(!$uid){
            Methods::jsonData(0,'用户uid不存在');
        }
//        if(!$address){
//            Methods::jsonData(0,'请选择收货地址');
//        }
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
            //判断用户是否有未有效的该优惠券
            $userCoupon = UserCoupon::find()->where("uid = $uid and couponId = $couponId and status =0")->one();
            if(!$userCoupon){
                Methods::jsonData(0,'没有能使用的优惠券');
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
        $serFee = $serFee?$serFee:0;
        $payPrice = $totalPrice - $reducePrice + $serFee;
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
        $model->extInfo = $extInfo;
        $model->typeStatus = $status;//0-代付款 1-待接单 2-已接单 3-待评价 4-待售后
        $model->createTime = $time;
        if($status == 1){
            $model->finishTime = $time;
        }
        if(is_array($remark)){
            $remark = json_encode($remark);
        }
        if(is_array($extInfo)){
            $remark = json_encode($extInfo);
        }
        $model->payType = 1;
        $model->type = $type;
        $model->address = $address;
        $model->integral = $integral;
        $model->remark = $remark;
        $model->serverFee = $serFee;
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
    /**
     * 用户下单
     * 多个商品购买
    * 购物车
     */
    public function actionCreateOrderByCart(){
        $uid = Yii::$app->request->post('uid');
        $products = Yii::$app->request->post('products','');//1-2,2-2
        $integral = Yii::$app->request->post('integral',0);//积分
        $couponId = Yii::$app->request->post('couponId',0);//优惠券id
        $type = Yii::$app->request->post('type',1);//1-充值 2-买商品
        $extInfo  = Yii::$app->request->post('extInfo','');
        $remark = Yii::$app->request->post('remark');//订单备注
        $address = Yii::$app->request->post('addressId',0);//收货地址Id
        $serFee = Yii::$app->request->post('serFee',0);//服务费
        $time = time();
        $orderNumber = 'RM'.$time.rand(123456,999999);
        if(!$uid){
            Methods::jsonData(0,'用户uid不存在');
        }
//        if(!$address){
//            Methods::jsonData(0,'请选择收货地址');
//        }
        if(!$products){
            Methods::jsonData(0,'商品信息错误');
        }
        $totalPrice = 0;
        $productIds = [];
        $numbers = 0;
        $products = explode(',',$products);
        foreach($products as $k => $v){
            $arr = explode('-',$v);
            if(count($arr)!=2){
                continue;
            }
            $price = Product::find()->where("id = {$arr[0]}")->asArray()->one()['price'];
            if(!$price)$price=0;
            $numbers += $arr[1];
            $price = $arr[1]*$price;
            $totalPrice += $price;
            $productIds[] = $arr[0];
            ShopCart::deleteAll("uid = $uid and productId = {$arr[0]}");
        }
        $totalPrice = 100;
        $productIds = implode(',',$productIds);
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
            //判断用户是否有未有效的该优惠券
            $userCoupon = UserCoupon::find()->where("uid = $uid and couponId = $couponId and status =0")->one();
            if(!$userCoupon){
                Methods::jsonData(0,'没有能使用的优惠券');
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
        $serFee = $serFee?$serFee:0;
        $payPrice = $totalPrice - $reducePrice + $serFee;
        if($payPrice <= 0){
            $payPrice = 0;
            $status = 1;//支付成功 不需调微信下单接口
        }else{
            $status = 0;
        }
        if(is_array($remark)){
            $remark = json_encode($remark);
        }
        if(is_array($extInfo)){
            $remark = json_encode($extInfo);
        }
        $model = new Order();
        $model->orderNumber = $orderNumber;
        $model->uid = $uid;
        $model->productId = $productIds;
        $model->productTitle = '购物车购买';
        $model->totalPrice = $totalPrice;
        $model->extInfo = $extInfo;
        $model->reducePrice = $reducePrice;
        $model->payPrice = $payPrice;
        $model->coupon = $couponId;
        $model->number = $numbers;
        $model->extInfo = '';
        $model->status = $status;
        $model->typeStatus = $status;//0-代付款 1-待接单 2-已接单 3-待评价 4-待售后
        $model->createTime = $time;
        if($status == 1){
            $model->finishTime = $time;
        }
        $model->payType = 1;
        $model->type = $type;
        $model->address = $address;
        $model->integral = $integral;
        $model->remark = $remark;
        $model->serverFee = $serFee;
        $res = $model->save();
        if($res){
            //记录用户优惠券使用记录
            if($couponId){
                UserCoupon::addRecord($uid,$couponId,$model->id);
            }
            if($status ==0){//需要支付金额
                $return  = WeixinPayController::WxOrder($orderNumber,'购物车购买',$payPrice,$model->id);
                die(json_encode($return));
            }else{//不需要支付金额
                Methods::jsonData(1,'success',['status'=>1]);//支付成功
            }
        }else{
            Methods::jsonData(0,'订单添加失败');
        }
    }
    /**
     *订单
     * 继续付款
     */
    public function actionPayOrder(){
        $uid = Yii::$app->request->post('uid');
        $orderId = Yii::$app->request->post('orderId');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$orderId){
            Methods::jsonData(0,'订单id不存在');
        }
        $order = Order::find()->where("uid = $uid and id = $orderId")->one();
        if(!$order){
            Methods::jsonData(0,'订单不存在');
        }
        if($order->status != 0){
            Methods::jsonData(0,'订单状态不对');
        }
        //订单时间超过半小时 更新订单号
        $now = time();
        $reduce = $now-1800;
        if($order->createTime <= $reduce){
            $order->orderNumber = $order->orderNumber.'2';
            $order->save();
        }
        $return  = WeixinPayController::WxOrder($order->orderNumber,$order->productTitle,$order->payPrice,$order->id);
        die(json_encode($return));
    }
    /**
     * 附近店铺搜索
     * 根据用户当前地区来模糊搜索
     * 返回部分数据由前端调三方获取实时距离
     */
    public function actionNearbyShop(){
        $area = Yii::$app->request->post('area');//当前地区
        $province = Yii::$app->request->post('province');
        $city = Yii::$app->request->post('city');
        if(!$province){
            Methods::jsonData(0,'省份不存在');
        }
        if(!$city){
            Methods::jsonData(0,'市级不存在');
        }
        if(!$area){
            Methods::jsonData(0,'参数错误');
        }
        $page = Yii::$app->request->post('page',1);
        $offset = 10*($page-1);
        $shop = Shop::find()->where("area = '{$area}' and province = '{$province}' and city = '{$city}'")->asArray()->offset($offset)->limit(10)->all();
        Methods::jsonData(1,'success',$shop);
    }
    /**
     * 商铺详情
     */
    public function actionShopDetail(){
        $shopId = Yii::$app->request->post('shopId');
        if(!$shopId){
            Methods::jsonData(0,'参数错误');
        }
        $shop = Shop::find()->where("id = $shopId")->asArray()->one();
        Methods::jsonData(1,'success',$shop);
    }
    /**
     * 商铺申请
     * 会员申请
     */
    public function actionShopApply(){
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'参数错误');
        }
        //是否已经申请
        $shopApplay = Shop::find()->where("uid = $uid")->asArray()->one();
        if($shopApplay){
            if($shopApplay['status'] ==1){
                Methods::jsonData(0,'你已经是商铺店主了，无需再申请');
            }elseif($shopApplay['status'] == -1){
                Methods::jsonData(0,'你已经申请店铺，并且为通过审核，请联系平台协商处理');
            }else{
                Methods::jsonData(0,'你已经申请商铺，等待平台审核中');
            }
        }else{
            //查看是否为会员
            $user = Member::findOne($uid);
            if($user){
                if($user->member ==1){
                    $name = Yii::$app->request->post('name');
                    $phone = Yii::$app->request->post('phone');
                    $shopTime = Yii::$app->request->post('shopTime');
                    $video = Yii::$app->request->post('video');
                    $image = Yii::$app->request->post('image');
                    $address = Yii::$app->request->post('address');
                    $introduce = Yii::$app->request->post('introduce');
                    $headImage = Yii::$app->request->post('headImage');
                    $province = Yii::$app->request->post('province');
                    $city = Yii::$app->request->post('city');
                    $area = Yii::$app->request->post('area');
                    if(!$name){
                        Methods::jsonData(0,'店铺名不存在');
                    }
                    if(!$phone){
                        Methods::jsonData(0,'店铺电话不存在');
                    }
                    if(!$shopTime){
                        Methods::jsonData(0,'营业时间不存在');
                    }
                    if($headImage){
                        Methods::jsonData(0,'封面图片不存在');
                    }
                    if(!$address){
                        Methods::jsonData(0,'详细地址不存在');
                    }
                    if(!$introduce){
                        Methods::jsonData(0,'店铺详细介绍不存在');
                    }
                    if(!$province){
                        Methods::jsonData(0,'店铺省份不存在');
                    }
                    if(!$city){
                        Methods::jsonData(0,'店铺市级不存在');
                    }
                    if(!$area){
                        Methods::jsonData(0,'店铺地区不存在');
                    }
                    $model = new Shop();
                    $model->name = $name;
                    $model->phone = $phone;
                    $model->shopTime = $shopTime;
                    $model->video = $video;
                    $model->image = $image;
                    $model->address = $address;
                    $model->introduce = $introduce;
                    $model->headImage = $headImage;
                    $model->province = $province;
                    $model->city = $city;
                    $model->area = $area;
                    $model->uid = $uid;
                    $model->status = 0;
                    $model->createTime = time();
                    $re = $model->save();
                    if($re){
                        Methods::jsonData(1,'申请成功，等待平台审核中');
                    }else{
                        Methods::jsonData(0,'申请失败');
                    }
                }else{
                    Methods::jsonData(0,'你还不是会员，只有会员才可以申请商铺');
                }
            }else{
                Methods::jsonData(0,'没有该用户');
            }
        }
    }
    /**
     * 商铺申请结果
     */
    public function actionShopApplyCheck(){
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'参数错误');
        }
        //是否是会员
        $user = Member::findOne($uid);
        if(!$user){
            Methods::jsonData(0,'没有该用户');
        }
        if(!$user->member ==1){
            Methods::jsonData(0,'你该不是会员（商铺为会员特权）');
        }
        //是否申请
        $shop = Shop::find()->where("uid = $uid")->asArray()->one();
        if(!$shop){
            Methods::jsonData(1,'你还没有申请店铺',['status'=>-99]);
        }
        if($shop['status']==1){//返回状态 status  -99 未申请 0-申请审核中 1申请成功 -1 申请失败
            Methods::jsonData(1,'申请成功，已是商铺店主',$shop);
        }elseif($shop['status']==-1){
            Methods::jsonData(1,'平台拒绝了你的申请商铺',$shop);
        }else{
            Methods::jsonData(1,'申请审核中',$shop);
        }
    }
    /**
     * 用户购物车
     * 加入购物车
     */
    public function actionCartAdd(){
        $uid = Yii::$app->request->post('uid');
        $productId = Yii::$app->request->post('productId');
        $number = Yii::$app->request->post('number',1);
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$productId){
            Methods::jsonData(0,'商品id不存在');
        }
        $res = ShopCart::find()->where("uid = $uid and productId = $productId")->one();
        if(!$res){
            $model = new ShopCart();
            $model->uid = $uid ;
            $model->productId = $productId;
            $model->createTime = time();
            $model->number = $number?$number:1;
            $res = $model->save();
            if(!$res){
                Methods::jsonData(0,'加入失败');
            }
        }
        $userCart = ShopCart::find()->where("uid = $uid")->asArray()->all();
        foreach($userCart as $k => $v){
            $product = Product::findOne($v['productId']);
            if($product){
                $userCart[$k]['title'] = $product->title;
                $userCart[$k]['brand'] = $product->brand;
                $userCart[$k]['price'] = $product->price;
                $userCart[$k]['headMsg'] = $product->headMsg;
                $userCart[$k]['tradeAddress'] = $product->tradeAddress;
            }else{
                unset($userCart[$k]);//商品已删除
            }
        }
        Methods::jsonData(1,'加入成功',$userCart);
    }
    /**
     * 用户购物车
     * 商品获取
     */
    public function actionUserCart(){
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        $userCart = ShopCart::find()->where("uid = $uid")->asArray()->all();
        foreach($userCart as $k => $v){
            $product = Product::findOne($v['productId']);
            if($product){
                $userCart[$k]['title'] = $product->title;
                $userCart[$k]['brand'] = $product->brand;
                $userCart[$k]['price'] = $product->price;
                $userCart[$k]['productImage'] = $product->headMsg;
                $userCart[$k]['productNumber'] = $product->number;
                $userCart[$k]['tradeAddress'] = $product->tradeAddress;
            }else{
                unset($userCart[$k]);//商品已删除
            }
        }
        Methods::jsonData(1,'加入成功',$userCart);

    }
    /**
     * 用户购物车
     * 商品删除
     */
    public function actionCartDelete(){
        $uid = Yii::$app->request->post('uid');
        $productId = Yii::$app->request->post('productIds','');//多个逗号隔开
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$productId){
            Methods::jsonData(0,'商品id不存在');
        }
        $res = ShopCart::deleteAll("id in ($productId) and uid = $uid");
        if($res){
            $userCart = ShopCart::find()->where("uid = $uid")->asArray()->all();
            foreach($userCart as $k => $v){
                $product = Product::findOne($v['productId']);
                if($product){
                    $userCart[$k]['title'] = $product->title;
                    $userCart[$k]['brand'] = $product->brand;
                    $userCart[$k]['price'] = $product->price;
                    $userCart[$k]['headMsg'] = $product->headMsg;
                    $userCart[$k]['tradeAddress'] = $product->tradeAddress;
                }else{
                    unset($userCart[$k]);//商品已删除
                }
            }
            Methods::jsonData(1,'加入成功',$userCart);
        }else{
            Methods::jsonData(0,'删除失败');
        }
    }
    /**
     * 个人中心
     * 数据获取
     */
    public function actionUserPersonal(){
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        //检查用户会员状态
        Member::checkMemberStatus($uid);
        $user = Member::find()->where("id = $uid")->asArray()->one();
        if($user){
            $userCou = UserCoupon::find()->where("uid = $uid and status = 0")->count();
            $user['couponNumber'] = $userCou;
        }
        $coupons = Coupon::find()->asArray()->limit(8)->all();
        $user['coupons'] = $coupons;
        //删除超过15分钟的代付款订单
        $time = time() -15*3600;
        Order::deleteAll("status = 0 and createTime < $time and uid = $uid");
        //会员优惠说明
        $memberDesc = ShopMessage::find()->where("type =5")->asArray()->one()['content'];
        $user['memberDesc'] = $memberDesc;
        Methods::jsonData(1,'success',$user);
    }
    /**
     * 关于我们
     */
    public function actionAboutUs(){
        $content = ShopMessage::find()->where("type = 1")->asArray()->one();
        Methods::jsonData(1,'success',$content);
    }
    /**
     * 意见反馈
     */
    public function actionOpinion(){
        $uid = Yii::$app->request->post('uid');
        $content = Yii::$app->request->post('content');
        $image = Yii::$app->request->post('image');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$content){
            Methods::jsonData(0,'意见内容不存在');
        }
        $model = new UserPush();
        $model->uid = $uid;
        $model->content = $content;
        $model->type = 1;//意见反馈
        $model->createTime = time();
        $model->image = serialize($image);
        $res = $model->save();
        if($res){
            Methods::jsonData(1,'反馈成功');
        }else{
            Methods::jsonData(0,'提交失败');
        }
    }
    /**
     * 质保商品
     * 用户质保商品数据
     */
    public function actionUserQuality(){
        $uid = Yii::$app->request->post('uid');
        $page = Yii::$app->request->post('page');
        if(!$page)$page = 1;
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        $offset = ($page-1)*10;
        $total = Quality::find()->where("uid = $uid")->count();
        $data = Quality::find()->where(" uid = $uid")->asArray()->offset($offset)->limit(10)->all();
        foreach($data as $k => $v){
            $data[$k]['productImage'] = Product::find()->where(" id = {$v['productId']}")->asArray()->one()['headMsg'];
            $data[$k]['productPrice'] = Order::find()->where("orderNumber = '{$v['orderNumber']}'")->asArray()->one()['payPrice'];
        }
        Methods::jsonData(1,'success',['total'=>$total,'quality'=>$data]);
    }
    /**
     * 质保商品
     * 用户提交
     */
    public function actionQualityAdd(){
        $uid = Yii::$app->request->post('uid');
        $qualityId = Yii::$app->request->post('qualityId');
        $gyTime = Yii::$app->request->post('gyTime');
        $barCode = Yii::$app->request->post('barCode');
        if(!$uid){
            Methods::jsonData(0,'用户id不存咋');
        }
        if(!$qualityId){
            Methods::jsonData(0,'质保id不存在');
        }
        if(!$gyTime){
            Methods::jsonData(0,'商品钢印日期不存在');
        }
        if(!$barCode){
            Methods::jsonData(0,'商品条形码不存在');
        }
        $model = Quality::findOne($qualityId);
        if(!$model){Methods::jsonData(0,'质保商品不存在');
        }
        $model->gyTime = $gyTime;
        $model->barCode = $barCode;
        $model->createTime = time();
        $res = $model->save();
        if($res){
            Methods::jsonData(1,'提交成功');
        }else{
            Methods::jsonData(0,'提交失败');
        }
    }
    /**
     * 质保商品
     * 申请售后
     */
    public function actionProductAfter(){
        $uid = Yii::$app->request->post('uid');
        $qualityId = Yii::$app->request->post('qualityId');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$qualityId){
            Methods::jsonData(0,'质保id不存在');
        }
        $res = Quality::updateAll(['after'=>1],"uid = $uid and id = $qualityId");
        if($res){
            Methods::jsonData(1,'申请售后成功');
        }else{
            Methods::jsonData(0,'申请失败');
        }
    }
    /**
     * 组团首页
     */
    public function actionGroupIndex(){
        $page = Yii::$app->request->post('page',1);
        $offset = ($page-1)*10;
        $groupProduct = GroupProduct::find()->orderBy("rank desc")->offset($offset)->limit(10)->asArray()->all();
        //检查用户组团状态
        UserGroup::checkUserGroups();
        Methods::jsonData(1,'success',$groupProduct);
    }
    /**
     * 我的邀请
     * 邀请有奖
     */
    public function actionMyShare(){
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'用户uid不存在');
        }
        $shareCode = Member::find()->where("id = $uid")->asArray()->one()['inviteCode'];
        $myShare = Member::find()->where("inviterCode = '{$shareCode}'")->asArray()->all();
        $shareUrl = "http://lck.hzlyzhenzhi.com/api/getcode.php?uid=$uid";
        Methods::jsonData(1,'success',['shareUrl'=>$shareUrl,'inviteCode'=>$shareCode,'myShare'=>$myShare]);
    }
    /**
     * 我的订单
     */
    public function actionMyOrder(){
        $type = Yii::$app->request->post('type',99);//99-全部 0-代付款 1-待接单 2-已接单 3-待评价 4-待售后
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        $where = " uid = $uid and type = 2";
        $page =Yii::$app->request->post('page',1);
        $offset = ($page -1)*10;
        if($type !=99 && $type != 4){
            $where .= " and typeStatus = $type";
            $total = Order::find()->where($where)->count();
            $orders = Order::find()->where($where)->orderBy("id desc")->offset($offset)->limit(10)->asArray()->all();
        }elseif($type ==4){
            $total = Quality::find()->where(" uid = $uid and after = 1")->count();
            $data = Quality::find()->where("uid = $uid and after =1")->offset($offset)->limit(10)->asArray()->all();
            $orders = [];
            foreach($data as $kk => $vk){
                $order = Order::find()->where("id = {$vk['orderId']}")->asArray()->one();
                $orders[]= $order;
            }
        }else{
            $orders = [];
            $total = 0;
        }
        foreach($orders as $k => $v){
            $product = Product::find()->where("id = {$v['productId']}")->asArray()->one();
            $data[$k]['productImage'] = $product['headMsg'];
            $data[$k]['productNumber'] = $product['number'];
        }
        Methods::jsonData(1,'success',['total'=>$total,'order'=>$data]);
    }
    /**
     * 人工客服
     */
    public function actionService(){
        $service = ShopMessage::find()->where("type =2")->asArray()->one();
        Methods::jsonData(1,'success',$service);
    }
    /**
     * 积分记录
     */
    public function actionUserIntegralHistory(){
        $uid = Yii::$app->request->post('uid');
        $page = Yii::$app->request->post('page',1);
        $offset = 10*($page-1);
        $total = Integral::find()->where("uid = $uid")->count();
        $integral = Integral::find()->asArray()->where("uid = $uid")->offset($offset)->limit(10)->all();
        Methods::jsonData(1,'success',['total'=>$total,'data'=>$integral]);
    }
    /**
     * 猜你喜欢
     */
    public function actionGuessYou(){
        $uid = Yii::$app->request->post('uid');
//        $offset = rand(11,99);
        $data = Product::find()->limit(10)->asArray()->all();
        Methods::jsonData(1,'sucess',$data);
    }
    /**
     * 会员充值页面
     */
    public function actionMemberRecharge(){
        $uid = Yii::$app->request->post('uid');
        $memebeContent = ShopMessage::find()->where("type =3")->asArray()->one();
        Methods::jsonData(1,'success',$memebeContent);
    }
    /**
     * 会员申请
     * 申请页面
     */
    public function actionMemberApply(){
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        Member::checkMemberStatus($uid);
        $user = Member::find()->where("id = $uid")->asArray()->one();
        if(!$user){
            Methods::jsonData(0,'用户不存在');
        }
        if($user['member'] ==1){
            //获取会员到期时间
            $endTime = MemberLog::find()->where("uid = $uid")->orderBy('endTime desc')->asArray()->one()['endTime'];
            $endTime = date("Y-m-d H:i:s",(86399+$endTime));
            $member = 1;
        }else{
            $member = 0;
            $endTime = '';
        }
        //节省金额
        $reduceMoney = Order::find()->where("uid = $uid and status = 1")->sum('reducePrice');
        //优惠券数量
        $userCou = UserCoupon::find()->where("uid = $uid and status = 0")->count();
        //免单数量
        $feeCount = Order::find()->where("uid = $uid and status = 1 and serverFee = 0")->count();
        $data = ['id'=>$uid,'member'=>$member,'endTime'=>$endTime,'money'=>100,'reduceMoney'=>$reduceMoney?$reduceMoney:0,'userCoupon'=>$userCou,'feeCount'=>$feeCount];
        Methods::jsonData(1,'success',$data);
    }
    /**
     * 会员申请
     * 续费或者开通会员
     * 月为单位
     */
    public function actionMemberApplyAdd(){
        $uid = Yii::$app->request->post('uid');
        $month = Yii::$app->request->post('month',1);
        $money = Yii::$app->request->post('money',0);
        $level = Yii::$app->request->post('level',3);//会员等级
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$money || $money <= 0){
            Methods::jsonData(0,'金额不存在');
        }
        $user = Member::findOne($uid);
        if($user){
            if($user->member ==1){//已经是会员  进行续费
                $remark = '会员续费';
                $firstTime = MemberLog::find()->where("uid = $uid ")->orderBy('endTime desc')->asArray()->one()['endTime'];
            }else{//当前不是会员
                $remark = '会员开通';
                $firstTime =strtotime(date('Y-m-d'));//今天的起始时间
            }
            //生成订单
            $orderNumber = 'RM'.time().rand(123456,999999);
            $orderId = Order::createOrder($uid,$orderNumber,$money,$remark);
            $endTime = 86400*30*$month + $firstTime;
            $model = new MemberLog();
            $model->uid = $uid;
            $model->beginTime = $firstTime;
            $model->endTime = $endTime;
            $model->orderId = $orderId;
            $model->createTime = time();
            $res = $model->save();
            if($res){
                Member::updateAll(['memberLevel'=>$level],"uid = $uid");
                $return  = WeixinPayController::WxOrder($orderNumber,$remark,$money,$orderId);
                die(json_encode($return));
            }else{
                Methods::jsonData(0,$remark,'失败');
            }
        }else{
            Methods::jsonData(0,'用户不存在');
        }
    }
    /**
     * 会员申请
     * 会员申请历史记录
     */
    public function actionMemberLog(){
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        $page = Yii::$app->request->post('page',1);
        $limit = " limit ".(10*($page-1)).',10 ';
        $sql = " select ml.* from {{%member_log}} ml inner join {{%order}} o on o.id = ml.orderId where o.status =1 order by ml.createTime desc ";
        $data = Yii::$app->db->createCommand($sql)->queryAll();
        $total = count($data);
        $sql .= $limit;
        $data = Yii::$app->db->createCommand($sql)->queryAll();
        foreach($data as $k => $v){
            $data[$k]['createTime'] = date("Y-m-d H:i:s" ,$v['createTime']);
        }
        $data = ['total'=>$total,'data'=>$data];
        Methods::jsonData(1,'success',$data);
    }
    /**
     * 组团购买
     * 组团首页
     */
    public function actionGroupProduct(){
        //组团商品数据
        $page = Yii::$app->request->post('page',1);
        $offset = 10*($page-1);
        //检查用户组团状态
        UserGroup::checkUserGroups();
        $total = GroupProduct::find()->count();
        $data = GroupProduct::find()->asArray()->orderBy('rank desc')->offset($offset)->limit(10)->all();
        $data = ['total'=>$total,'data'=>$data] ;
        Methods::jsonData(1,'success',$data);
    }
    /**
     * 组团购买
     * 我的组团
     */
    public function actionMyGroup(){
        $uid = Yii::$app->request->post('uid');
        $page = Yii::$app->request->post('page',1);
        $type = Yii::$app->request->post('type',99);//99-全部 0-组团中 1-组团成功 2-组团失败
        $where = " uid = $uid ";
        if($type != 99){
            $where .= " and status = $type";
        }
        $offset = ($page-1)*10;
        //检查用户组团状态
        UserGroup::checkUserGroups($uid);
        $total = UserGroup::find()->where($where)->count();
        $data = UserGroup::find()->where($where)->orderBy(" status asc")->asArray()->offset($offset)->limit(10)->all();
        $data = ['total'=>$total,'data'=>$data];
        die(json_encode($data));
    }
    /**
     * 组团商品详情
     */
    public function actionGroupProductDetail(){
        $productId = Yii::$app->request->post('productId');
        $uid = Yii::$app->request->post('uid');
        if(!$productId){
            Methods::jsonData(0,'商品id不存在');
        }
        if($uid){//查看自己是否参与组团中
            $ownGroup = UserGroup::getOwnGroup($uid,$productId);
        }else{
            $ownGroup = [];
        }
        //获取组团的其他组团用户数据信息
        $hadGroup = UserGroup::getCurrentGroup($productId,$ownGroup);
        $product = GroupProduct::find()->where("productId = $productId")->asArray()->one();
        Methods::jsonData(1,'success',['product'=>$product,'hadGroup'=>$hadGroup]);
    }
    /**
     * 发起组团
     * 发起或者参与
     */
    public function actionAddGroup(){
        $uid = Yii::$app->request->post('uid');
        $productId = Yii::$app->request->post('productId');
        $groupId = Yii::$app->request->post('groupId',0);//组团id(发起人发起的)  存在未加入组团 不存在为发起组团
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$productId){
            Methods::jsonData(0,'商品id不存在');
        }
        //查看用户是否已经参与组团
        $hadGroup = UserGroup::find()->where("status = 0 and uid = $uid and groupId = $productId")->asArray->one();
        if($hadGroup){
            Methods::jsonData(0,'你已经参与组团中了，不可重复参与');
        }
        $time =  time();
        if($groupId){
            $promoter = UserGroup::find()->where("id =$groupId and groupId = $productId and status = 0 and promoter = 1")->asArray()->one();
            if(!$promoter){
                Methods::jsonData(0,'组团商品有误');
            }
            $promoter = 0;//1-发起人
            $promoterUid = $promoter['promoterUid'];
            $remark = '参与';
        }else{
            $promoter = 1;
            $promoterUid = $uid;
            $remark = '发起';
        }
        $model = new UserGroup();
        $model->uid = $uid;
        $model->groupId = $productId;
        $model->promoter = $promoter;
        $model->promoterUid = $promoterUid;
        $model->status = 0;//0 组团中 1-组团成功 2-组团失败
        $model->createTime = $time;
        $res = $model->save();
        if($res){
            //记录同一组团标识
            if($groupId){
                $userGroupId = $promoter['id'];
            }else{
                $userGroupId = $model->id;
            }
            UserGroup::updateAll(['userGroupId'=>$userGroupId],"id = {$model->id}");
            //判断参与组团时是否是最后一个
            if(!$groupId){
                UserGroup::checkUserGroup($groupId);
            }
            Methods::jsonData(1,$remark.'组团成功');
        }else{
            Methods::jsonData(0,$remark.'组团失败');
        }
    }
    /**
     * 发起组团
     * 组团成功
     * 进行支付
     */
    public function actionGroupBuy(){
        $uid = Yii::$app->request->post('uid');
        $groupId = Yii::$app->request->post('groupId');
        if(!$uid){
            Methods::jsonData(0,'用户ic不存在');
        }
        if(!$groupId){
            Methods::jsonData(0,'组团id不存在');
        }
        $group = UserGroup::findOne($groupId);
        if(!$group){
            Methods::jsonData(0,'没有该组团信息');
        }
        $groupProduct = GroupProduct::findOne($group->groupId);
        if($group->status != 1){
            Methods::jsonData(0,'该组团状态有误');
        }
        $code = 1;
        if($group->orderId){
            $order = Order::findOne($group->orderId);
            if($order){
                $data = WeixinPayController::WxOrder($order->orderNumber,$order->productTitle,$order->money,$order->id);
            }else{
                $code = 0;
            }
        }else{
            $code = 0;
        }
        if($code ==0){//生成订单
            $model = new Order();
            $model->orderNumber = 'RMZT'.time();
            $model->uid = $group->uid;
            $model->productId = $group->groupId;
            $model->productTitle = '';
            $model->totalPrice = $groupProduct->price;
            $model->payPrice = $groupProduct->price;
            $model->status = 0;
            $model->createTime = time();
            $model->payType = 1;
            $model->type = 2;
            $model->remark = '用户组团购买商品';
            $model->productType = 2;
            $model->save();
            $order = Order::findOne($model->id);
            $data = WeixinPayController::WxOrder($order->orderNumber,$order->productTitle,$order->money,$order->id);
        }
        die(json_encode($data));
    }
    /**
     * 组团商品
     * 组团邀请
     */
    public function actionGroupInvite(){

    }
    /**
     * 获取所有分类
     */
    public function actionProductAllCate(){
        $pid = Category::find()->where("pid = 0")->asArray()->all();
        foreach($pid as $k => $v){
            $child = Category::find()->where("pid = {$v['id']}")->asArray()->all();
            $pid[$k]['child'] = $child;
        }
        Methods::jsonData(1,'success',$pid);
    }
    /**
     * 获取对应分类的商品数据
     */
    public function actionCateProduct(){
        $catPid = Yii::$app->request->post('catPid',0);
        $catCid = Yii::$app->request->post('catCid',0);
        $page = Yii::$app->request->post('page',1);
//        if(!$catCid){
//            Methods::jsonData(0,'二级分类id不存在');
//        }
//        if(!$catPid){
//            Methods::jsonData(0,'一级分类id不存在');
//        }
        $where = ' 1= 1';
        if($catCid){
            $where .= " and  catCid = $catCid";
        }
        if($catPid){
            $where .= " and catPid = $catPid";
        }
        $type = Yii::$app->request->post('type',0);//商品类型 1-维修 2-新车 3-二手车
        if($type > 0){
            $where .= " and type = $type ";
        }

        $total = Product::find()->where($where)->count();
        $offset = ($page-1)*10;
        $data = Product::find()->where($where)->offset($offset)->limit(10)->asArray()->all();
        Methods::jsonData(1,'success',['total'=>$total,'data'=>$data]);
    }
    /**
     * 邀请记录
     */
    public function actionShareSuccess(){
       $uid = Yii::$app->request->post('uid');
       $pid = Yii::$app->request->post('pid');//邀请人的uid
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$pid){
            Methods::jsonData(0,'邀请人id不存在');
        }
        $parent = Member::findOne($pid);
        if(!$parent){
            Methods::jsonData(0,'不存在邀请人这个用户');
        }
        $self = Member::findOne($uid);
        if(!$self){
            Methods::jsonData(0,'邀请的用户不存在');
        }
        $self->inviterCode = $parent->inviteCode;
        $res = $self->save();
        if($res) {
            Methods::jsonData(1, 'success');
        }else{
            Methods::jsonData(0,'失败');
        }
    }
    /**
     * 订单评价
     */
    public function actionOrderComment(){
        $uid = Yii::$app->request->post('uid');
        $orderId = Yii::$app->request->post('orderId');
        $comment = Yii::$app->request->post('comment','');
        $image = Yii::$app->request->post('image');
        $video = Yii::$app->request->post('video');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$orderId){
            Methods::jsonData(0,'订单id不存在');
        }
        if(!$comment){
            Methods::jsonData(0,'评论内容不存在');
        }
        $order = Order::find()->where("id = $orderId and uid = $uid")->one();
        if(!$order){
            Methods::jsonData(0,'没有该订单');
        }
        if($order->status != 1 || $order->typeStatus != 3){
            Methods::jsonData(0,'订单状态不对');
        }
        $order->evaluate = $comment;
        $order->evalTime = time();
        $order->typeStatus = 4;
        $order->evalImage = serialize($image);
        $order->evalVideo = serialize($video);
        $res = $order->save();
        if($res){
            Methods::jsonData(1,'评价成功');
        }else{
            Methods::jsonData(0,'评价失败');
        }
    }
    /**
     * 用户确认收货
     */
    public function actionMemberSureProduct(){
        $uid = Yii::$app->request->post('uid');
        $orderId = Yii::$app->request->post('orderId');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$orderId){
            Methods::jsonData(0,'订单id不存在');
        }
        $order = Order::find()->where("id = $orderId and uid = $uid")->one();
        if(!$order){
            Methods::jsonData(0,'没有该订单');
        }
        if($order->status != 1){
            Methods::jsonData(0,'订单状态不对');
        }
        $order->typeStatus = 3;
        $res = $order->save();
        if($res){
            Logistics::updateAll(['status'=>1],"orderId = $orderId");
            Methods::jsonData(1,'确认收货成功');
        }else{
            Methods::jsonData(0,'确认收货失败');
        }
    }
    /**
     * 用户取消订单
     */
    public function actionMemberDeleteOrder(){
        $uid = Yii::$app->request->post('uid');
        $orderId = Yii::$app->request->post('orderId');
        if(!$orderId){
            Methods::jsonData(0,'订单id不存在');
        }
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        $order = Order::find()->where("uid = $uid and id = $orderId")->one();
        if(!$order){
            Methods::jsonData(0,'你没有下过改单');
        }
        if($order->status != 0){
            Methods::jsonData(0,'订单状态不对，无法取消');
        }
        $res = Order::deleteAll("id = $orderId");
        if($res){
            Methods::jsonData(1,'success');
        }else{
            Methods::jsonData(0,'删除失败');
        }
    }
    /**
     * 订单类型数量
     */
    public function actionMyOrderNumber(){
        $uid = Yii::$app->request->post('uid');
        $type = [0,1,2,3,4];// 0-代付款 1-待接单 2-已接单 3-待评价 4-待售后
        $data = [];
        foreach($type as $k => $v){
            if(!$uid){
                $data[] = ['type'=>$v,'number'=>0];
            }else{
                if($v == 4){
                    $total = Quality::find()->where("uid = $uid and after = 1")->count();
                }else{
                    $where = " uid = $uid  and typeStatus = $v";
                    $total = Order::find()->where($where)->count();
                }
                $data[] = ['type'=>$v,'number'=>$total];
            }
        }
        Methods::jsonData(1,'success',$data);
    }
    /**
     * 优惠券页面
     */
    public function actionCouponMessage(){
        $rule = ShopMessage::find()->where("type = 4")->asArray()->one();
        $coupons = Coupon::find()->asArray()->all();
        //当前积分
        $uid = Yii::$app->request->post('uid');
        if($uid){
            $integral = Member::find()->where("id = $uid")->asArray()->one()['integral'];
            $integral = $integral?$integral:0;
        }else{
            $integral = 0;
        }
        Methods::jsonData(1,'success',['integralRule'=>$rule,'coupons'=>$coupons,'integral'=>$integral]);
    }
    /**
     * 积分兑换优惠券
     */
    public function actionIntegralCoupon(){
        $uid = Yii::$app->request->post('uid');
        $couponId = Yii::$app->request->post('couponId');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$couponId){
            Methods::jsonData(0,'优惠券id不存在');
        }
        $coupon = Coupon::findOne($couponId);
        if(!$coupon){
            Methods::jsonData(0,'该优惠券已停用');
        }
        $need = $coupon->integral;
        $had = UserCoupon::find()->where("uid = $uid and couponId = $couponId and status = 1")->one();
        if($had){
            Methods::jsonData(0,'你已经有该优惠券，请使用后再兑换');
        }
        $user = Member::find()->where("id = $uid")->one();
        if(!$user){
            Methods::jsonData(0,'没有该用户');
        }
        $integral = $user->integral;
        $integral = $integral?$integral:0;
        if($integral < $need){
            Methods::jsonData(0,'你的积分不够');
        }
        $user->integral = $integral - $need;
        $res = $user->save();
        if($res){
            $model = new UserCoupon();
            $model->uid = $uid;
            $model->couponId = $couponId;
            $model->createTime = time();
            $model->status = 0;
            $model->save();
            Methods::jsonData(0,'兑换成功');
        }else{
            Methods::jsonData(0,'兑换失败');
        }
    }
    /**
     * 商品评价
     * type 0-全部 1-最新 2-有图 3-视频
     */
    public function actionProductComment(){
        $type = Yii::$app->request->post('type',0);
        $productId = Yii::$app->request->post('productId',0);
        $page = Yii::$app->request->post('page',1);
        if(!$productId){
           Methods::jsonData(0,'商品id不存在');
        }
        $comment = Product::getCommentByType($productId,$type,$page);
        Methods::jsonData(1,'success',$comment);
    }
    /**
     * 会员优惠卷
     * 已领取
     */
    public function actionMemberCoupon(){
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        $sql = " select *,c.id as couponId from {{%user_coupon}} uc inner join {{%coupon}} c on c.id = uc.couponId where uc.uid = $uid and uc.status =0";
        $coupons = Yii::$app->db->createCommand($sql)->queryAll();
        $count = count($coupons);
        Methods::jsonData(1,'success',['total'=>$count,'coupons'=>$coupons]);
    }
    /**
     * 电压值获取
     */
    public function actionVoltage(){
        $voltage = Search::find()->where(" type =1")->asArray()->all();
        Methods::jsonData(1,'success',$voltage);
    }
    /**
     * 我的商品
     */
    public function actionMyProduct(){
        $uid = Yii::$app->request->post('uid');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        //删除15天内未刷新的商品
        $time = strtotime(date("Y-m-d"));
        $begin = $time - 15*86400;
        Product::deleteAll("uid = $uid and flushTime < $begin");
        $product = Product::find()->where("uid = $uid")->orderBy('flushTime desc')->asArray()->all();
        Methods::jsonData(1,'success',$product);
    }
    /**
     * 商品刷新
     */
    public function actionProductFlush(){
        $uid = Yii::$app->request->post('uid');
        $productId = Yii::$app->request->post('productId');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$productId){
            Methods::jsonData(0,'商品id不存在');
        }
        $today = strtotime(date('Y-m-d'));
        $had = Product::find()->where("id = $productId and uid = $uid and flushTime >= $today")->one();
        if($had){
            Methods::jsonData(2,'当前支刷新需要支付一定的费用');
        }
        $had = Product::findOne($productId);
        $had->flushTime = time();
        $had->save();
        Methods::jsonData(1,'刷新成功');
    }
    /**
     * 商品删除
     */
    public function actionProductDelete(){
        $uid = Yii::$app->request->post('uid');
        $productId = Yii::$app->request->post('productId');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$productId){
            Methods::jsonData(0,'商品id不存在');
        }
        $had = Product::find()->where("id = $productId and uid = $uid")->one();
        if(!$had){
            Methods::jsonData(0,'没有该商品');
        }
        $res = Product::deleteAll(" uid = $uid and id = $productId");
        if($res){
            Methods::jsonData(1,'删除成功');
        }else{
            Methods::jsonData(0,'删除失败，请重试');
        }
    }
    /**
     * 用户下单
     * 商品刷新支付
     */
    public function actionProductFlushPay(){
        $uid = Yii::$app->request->post('uid');
        $productId = Yii::$app->request->post('productId');
        $integral = Yii::$app->request->post('integral',0);//积分
        $price = Yii::$app->request->post('price',1);//支付价格
        $remark = Yii::$app->request->post('remark','商品刷新支付刷新费用');//订单备注
        $time = time();
        $orderNumber = 'RM'.$time.rand(123456,999999);
        if(!$uid){
            Methods::jsonData(0,'用户uid不存在');
        }
        if(!$productId){
            Methods::jsonData(0,'商品Id不存在');
        }
        $product = Product::findOne($productId);
        if(!$product){
            Methods::jsonData(0,'没有该商品');
        }
        $totalPrice = $price;
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
        $couponId = 0;
        $couponMoney = 0;//优惠券优惠价格
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
        $model->number = 1;
        $model->extInfo = '';
        $model->status = $status;
        $model->extInfo = '';
        $model->typeStatus = $status;//0-代付款 1-待接单 2-已接单 3-待评价 4-待售后
        $model->createTime = $time;
        if($status == 1){
            $model->finishTime = $time;
        }
        if(is_array($remark)){
            $remark = json_encode($remark);
        }
        $model->payType = 1;
        $model->type = 3; //1-充值 2-买商品 3-商品刷新
        $model->address = '';
        $model->integral = $integral;
        $model->remark = $remark;
        $model->serverFee = 0;
        $res = $model->save();
        if($res){
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
    /**
     * 申请退款
     */
    public function actionApplyReturn(){
        $uid = Yii::$app->request->post('uid');
        $orderId = Yii::$app->request->post('orderId');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$orderId){
            Methods::jsonData(0,'订单id不存在');
        }
        $had = Order::find()->where("id = $orderId and uid = $uid")->one();
        if(!$had){
            Methods::jsonData(0,'没有该订单');
        }elseif($had->status !=1){
            Methods::jsonData(0,'订单状态不对，不可申请退款');
        }else{
            $had->status = -1;//退款中
            $had->save();
            Methods::jsonData(1,'申请退款成功');
        }

    }
    /**
     * 维修师申请
     */
    public function actionRepairApply(){
        $uid = Yii::$app->request->post('uid');
        $name = Yii::$app->request->post('name');
        $phone = Yii::$app->request->post('phone');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$name){
            Methods::jsonData(0,'姓名不存在');
        }
        if(!$phone){
            Methods::jsonData(0,'电话号码不存在');
        }
        $member = Member::findOne($uid);
        if(!$member){
            Methods::jsonData(0,'没有该用户');
        }
        if($member->repair ==-1){
            Methods::jsonData(0,'你的维修师申请以及申请了，等待平台审核中');
        }
        if($member->repair ==1){
            Methods::jsonData(0,'你已经是维修师了，请勿重复申请');
        }
        $member->repair = 1;
        $res = $member->save();
        if($res){
            Methods::jsonData(1,'申请成功');
        }else{
            Methods::jsonData(0,'申请失败，请重试');
        }
    }
    /**
     * 订单大厅
     * 维修师身份
     */
    public function actionRepairHall(){
        $uid = Yii::$app->request->post('uid');
        $page = Yii::$app->request->post('page',1);
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        $user = Member::find()->where("id = $uid and repair = 1")->one();
        if(!$user){
            Methods::jsonData(0,'身份错误');
        }
        //待接单的订单
        $offset = ($page-1)*10;
        $total = Order::find()->where("status = 1 and typStatus = 1 and type = 2")->count();
        $order = Order::find()->where("status = 1 and typStatus = 1 and type = 2")->orderBy('createTime desc')->offset($offset)->limit(10)->asArray()->all();
        Methods::jsonData(1,'success',['total'=>$total,'order'=>$order]);
    }
    /**
     * 我的接单数据
     * 维修师身份
     */
    public function actionRepairOrder(){
        $uid = Yii::$app->request->post('uid');
        $page = Yii::$app->request->post('page',1);
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        $user = Member::find()->where("id = $uid and repair = 1")->one();
        if(!$user){
            Methods::jsonData(0,'身份错误');
        }
        //待接单的订单
        $offset = ($page-1)*10;
        $total = Order::find()->where("status = 1  and type = 2 and repairUid = $uid")->count();
        $order = Order::find()->where("status = 1  and type = 2 and repairUid = $uid")->orderBy('createTime desc')->offset($offset)->limit(10)->asArray()->all();
        Methods::jsonData(1,'success',['total'=>$total,'order'=>$order]);
    }
    /**
     * 维修师接单
     */
    public function actionRepairReceipt(){
        $uid = Yii::$app->request->post('uid');
        $orderId = Yii::$app->request->post('orderId');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$orderId){
            Methods::jsonData(0,'订单id不存在');
        }
        $user = Member::find()->where("id = $uid and repair = 1")->one();
        if(!$user){
            Methods::jsonData(0,'身份错误');
        }
        $order = Order::findOne($orderId);
        if(!$order){
            Methods::jsonData(0,'订单不存在');
        }
        if($order->status != 1 || $order->typeStatus != 1){
            Methods::jsonData(0,'订单状态有误');
        }
        $order->typeStatus = 2;
        $order->repairUid = $uid;
        $order->repairTime = time();
        $res = $order->save();
        if($res){
            Methods::jsonData(1,'接单成功');
        }else{
            Methods::jsonData(0,'接单失败，请重试');
        }
    }
    /**
     * 维修师完成订单
     */
    public function actionRepairSuccess(){
        $uid = Yii::$app->request->post('uid');
        $orderId = Yii::$app->request->post('orderId');
        $repairImg = Yii::$app->request->post('repairImg','');
        if(!$uid){
            Methods::jsonData(0,'用户id不存在');
        }
        if(!$orderId){
            Methods::jsonData(0,'订单id不存在');
        }
        if(!$repairImg){
            Methods::jsonData(0,'完成图片不存在');
        }
        $user = Member::find()->where("id = $uid and repair = 1")->one();
        if(!$user){
            Methods::jsonData(0,'身份错误');
        }
        $order = Order::findOne($orderId);
        if(!$order){
            Methods::jsonData(0,'订单不存在');
        }
        if($order->status != 1 || $order->typeStatus != 2 || $order->repairUid != $uid){
            Methods::jsonData(0,'订单信息有误');
        }
        $order->typeStatus = 3;
        $res = $order->save();
        if($res){
            Methods::jsonData(1,'操作成功');
        }else{
            Methods::jsonData(0,'操作失败，请重试');
        }
    }
}