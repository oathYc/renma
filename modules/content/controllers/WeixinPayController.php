<?php
/**
 * 微信小程序支付
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-6-17
 * Time: 下午2:37
 */
namespace app\modules\content\controllers;

use app\libs\Methods;
use app\modules\content\models\Integral;
use app\modules\content\models\Member;
use app\modules\content\models\Order;
use app\modules\content\models\Product;
use app\modules\content\models\Quality;
use app\modules\content\models\UserCoupon;
use yii;
use yii\web\Controller;

header("Access-Control-Allow-Origin:*");
class WeixinPayController extends  Controller{
    public $enableCsrfValidation = false;

    /**
     * 微信支付请求发起
     * 小程序
     */
    public static  function WxOrder($orderNumber,$productName,$amount,$orderId){
        $paramArr = [];
        $paramArr['attach'] = \Yii::$app->params['wxAttach'];
        $paramArr['appid'] = \Yii::$app->params['appId'];
        $paramArr['mch_id'] = Yii::$app->params['wxMchId'];
        $paramArr['nonce_str'] = md5($orderNumber);//随机数
        $paramArr['body'] = $productName;//商品描述
        $paramArr['out_trade_no'] = $orderNumber;//商户订单号
        $paramArr['total_fee'] = $amount*100;;//总金额 金额处理 单位为分
        $paramArr['spbill_create_ip'] = self::getIP();//终端ip
        $paramArr['notify_url'] = Yii::$app->params['wxNotify'];;//回调地址
        $paramArr['trade_type'] = \Yii::$app->params['wxJSAPI'];//交易类型 小程序支付 JSAPI
        $key = \Yii::$app->params['wxMchKey'];
        //获取openid
        $openid = self::getOpenid($orderId);
        $paramArr['openid'] = $openid;
        //生成签名
        ksort($paramArr);
        $sign = self::signWxpay($paramArr,$key);
        $paramArr['sign'] = $sign;//签名
        //请求支付
        $url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
        //5.拼接成所需XML格式
        $post_data = "<xml> 
            <attach>{$paramArr['attach']}</attach>
            <appid>{$paramArr['appid']}</appid>
            <mch_id>{$paramArr['mch_id']}</mch_id>
            <nonce_str>{$paramArr['nonce_str']}</nonce_str>
            <body>{$paramArr['body']}</body>
            <out_trade_no>{$paramArr['out_trade_no']}</out_trade_no>
            <total_fee>{$paramArr['total_fee']}</total_fee>
            <spbill_create_ip>{$paramArr['spbill_create_ip']}</spbill_create_ip>
            <notify_url>{$paramArr['notify_url']}</notify_url>
            <trade_type>{$paramArr['trade_type']}</trade_type>
            <sign>{$paramArr['sign']}</sign>
            <openid>{$paramArr['openid']}</openid>
          </xml>";
        $return = Methods::post($url,$post_data);
        $return = (array)simplexml_load_string($return, 'SimpleXMLElement', LIBXML_NOCDATA); //将微信返回的XML转换成数组
        if(isset($return['return_code']) && $return['return_code'] == 'SUCCESS' && $return['result_code'] == 'SUCCESS'){
//            $return['paySign'] = $sign;
            unset($return['sign']);
            //生成小程序调用签名
            $time = time();
            $package = 'prepay_id='.$return['prepay_id'];
            $signType ='MD5';
            $nonceStr = $paramArr['nonce_str'];
            $jsapiSign = self::getJsapiSign($paramArr['appid'],$time,$nonceStr,$package,$signType);
            $ret['timeStamp'] = $time;
            $ret['nonceStr'] = $nonceStr;
            $ret['package'] = $package;
            $ret['paySign'] = $jsapiSign;
            $ret['signType'] = $signType;
            $ret['status'] = 0;//0-待支付 1-已支付
            $ret['orderId'] = $orderId;
            $data = ['code'=>1,'message'=>'success','data'=>$ret];//,'msg'=>'支付请求成功'
            //记录签名
            Order::updateAll(['paySign'=>$sign,'ip'=>$paramArr['spbill_create_ip']],"id = $orderId");
        }else{
            $data = ['code'=>0,'message'=>'支付请求错误'];//,'msg'=>$return['message'] 支付请求错误
        }
        return $data;
    }

    public static function getJsapiSign($appid,$time,$nonceStr,$package,$signType){
        $array['appId'] = $appid;
        $array['timeStamp'] = $time;
        $array['nonceStr'] = $nonceStr;
        $array['package'] = $package;
        $array['signType'] = $signType;
        ksort($array);
        $key = \Yii::$app->params['wxMchKey'];
        $jsapiSign = self::signWxpay($array,$key);
        return $jsapiSign;
    }
    public static function getOpenid($orderId){
        if($orderId){
            $uid = Order::find()->where("id = $orderId")->asArray()->one()['uid'];
            if($uid){
                $openId = Member::find()->where("id = $uid")->asArray()->one()['openId'];
                if(!$openId){
                    $openId = '';
                }
            }else{
                $openId = '';
            }
        }else{
            $openId = '';
        }
        if(!$openId){
            $openId = 'oAi5t5bJ9pwX_Nc7C5skWtVJkygg';
        }
        return $openId;
    }
    public static function getIP(){
        if($_SERVER['REMOTE_ADDR'])
            $ip = $_SERVER['REMOTE_ADDR'];
        else $ip = "Unknow";
        return $ip;
    }
    /**
     * 微信签名
     * 签名生成
     * @param $signArr
     * md5算法加密 转大写
     */
    public static function signWxpay($signArr,$key){
        $signStr = '';
        foreach($signArr as $k => $v){
            if($v != ''){
                $signStr .= $k.'='.$v.'&';
            }
        }
        $signStr.='key='.$key;
        $signStr = md5($signStr);
        $signStr = strtoupper($signStr);
        return $signStr;
    }

    /**
     * 微信回调
     * 支付结果通知处理
     * 支付宝
     * POST方式
     */
    public function actionWxpayNotify(){
        //获取通知的数据
        $xml = file_get_contents("php://input");
        Methods::varDumpLog('weixin.txt','222','a');
        Methods::varDumpLog('weixin.txt',$xml,'a');
        if(!$xml){
            Methods::varDumpLog('weixin.txt','333','a');
            echo 'fail';die;
        }else{
            $data = (array)simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA); //将微信返回的XML转换成数组
        }
        $returnCode = $data['return_code'];//支付状态
        if($returnCode == 'SUCCESS'){
            $amount = $data['total_fee'];//支付金额 单位为分
            $orderNo = $data['out_trade_no'];//商户订单号//验证签名

            $result = self::checkWxpaySign($orderNo);
            if($result){
                $amount = $amount/100;//换成元
                $orderData = Order::find()->where("orderNumber = '{$orderNo}' and payPrice = $amount")->asArray()->one();
                if($orderData['status'] != 1){//订单未完成
                    //添加积分
                    $member = Member::findOne($orderData['uid']);
                    $hadIntegral = isset($member->integral)?$member->integral:0;
                    $addIntegral = floor($orderData['PayPrice'] + $orderData['serverFee']);
                    //积分判断
                    if($orderData['integral'] >0){
                        $reduceIntegral = $orderData['integral'];
                        Integral::saveRecord($orderData['uid'],$reduceIntegral,1,'商品购买抵扣');//1-减少 2-新增
                    }else{
                        $reduceIntegral = 0;
                    }
                    $integral = $hadIntegral + $addIntegral - $reduceIntegral ;//一元得一个积分
                    Integral::saveRecord($orderData['uid'],$addIntegral,2,'购买商品赠送');
                    //判断会员状态
                    if($orderData['type'] == 1){//充值
                        $member = 1;
                        //赠送优惠券
                        Member::sendCoupon($orderData['uid']);
                    }elseif($orderData['type'] ==3){//商品刷新
                        Product::updateAll(['flushTime'=>time()],"id = {$orderData['productId']}");
                    }else{
                        $member = isset($member->member)?$member->member:0;
                    }
                    Member::updateAll(['integral'=>$integral,'member'=>$member]," id = {$orderData['uid']}");
                    Order::updateAll(['status'=>1,'typeStatus'=>1,'finishTime'=>time()],"orderNumber='{$orderNo}'");//修改订单状态
                    //优惠券判断
                    if($orderData['coupon'] > 0){
                        UserCoupon::updateAll(['status'=>1]," uid = {$orderData['uid']} and status = 0 and couponId = {$orderData['coupon']}");
                    }
                    //质保商品判断
                    $zhibao = Product::find()->where("id = {$orderData['productId']} and zhibao =1")->asArray()->one();
                    if($zhibao){
                        Quality::$orderData['uid']($orderData['uid'],$orderData['productId'],$orderData['id']);
                    }
                    if($orderData['productType'] ==3){//购物车
                        Order::updateCartOrder($orderData['id']);
                    }
                }
                $returnArr = ['return_code'=>'SUCCESS','return_msg'=>'OK'];
            }else{
                $returnArr = ['return_code'=>'fail','return_msg'=>'pay sign error'];
            }
        }else{
            $returnArr = ['return_code'=>'fail','return_msg'=>'no data return'];
        }
        $xml = "<xml>
                    <return_code><![CDATA[".$returnArr['return_code']."]]></return_code>
                    <return_msg><![CDATA[".$returnArr['return_msg']."]]></return_msg>
                </xml>";
        return $xml;
    }

    /**
     * 微信
     * 签名验证
     * 回调地址
     * 签名方式
     * 第一步，设所有发送或者接收到的数据为集合M，将集合M内非空参数值的参数按照参数名ASCII码从小到大排序（字典序），使用URL键值对的格式（即key1=value1&key2=value2…）拼接成字符串。
    第二步，在stringA最后拼接上应用key得到stringSignTemp字符串，并对stringSignTemp进行MD5运算，再将得到的字符串所有字符转换为小写，得到sign值signValue。
     */
    public static function checkWxpaySign($orderNumber){
        //查询数据库数据生成签名进行验证
        $orderData = Order::find()->where("orderNumber = '{$orderNumber}'")->asArray()->one();
        $paramArr['attach'] = \Yii::$app->params['wxAttach'];
        $paramArr['appid'] = \Yii::$app->params['appId'];
        $paramArr['mch_id'] = Yii::$app->params['wxMchId'];
        $paramArr['nonce_str'] = md5($orderNumber);//随机数
        $paramArr['body'] = $orderData['productTitle'];//商品描述
        $paramArr['out_trade_no'] = $orderNumber;//商户订单号
        $paramArr['total_fee'] = $orderData['payPrice']*100;;//总金额 金额处理 单位为分
        $paramArr['spbill_create_ip'] = $orderData['ip'];//终端ip
        $paramArr['notify_url'] = Yii::$app->params['wxNotify'];;//回调地址
        $paramArr['trade_type'] = \Yii::$app->params['wxJSAPI'];//交易类型 小程序支付 JSAPI
        $key = \Yii::$app->params['wxMchKey'];
        //获取openid
        $openid = self::getOpenid($orderData['id']);
        $paramArr['openid'] = $openid;
        //生成签名
        ksort($paramArr);
        $sign = self::signWxpay($paramArr,$key);
        $paySign = $orderData['paySign'];
        if($sign ==$paySign){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 输出xml字符
     * @param   $params     参数名称
     * return   string      返回组装的xml
     **/
    public function data_to_xml( $params ){
        if(!is_array($params)|| count($params) <= 0)
        {
            return false;
        }
        $xml = "<xml>";
        foreach ($params as $key=>$val)
        {
            if (is_numeric($val)){
                $xml.="<".$key.">".$val."</".$key.">";
            }else{
                $xml.="<".$key."><![CDATA[".$val."]]></".$key.">";
            }
        }
        $xml.="</xml>";
        return $xml;
    }


}