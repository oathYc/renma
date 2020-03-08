<?php
namespace app\libs;
use app\modules\content\models\Member;
use app\modules\content\models\MemberRecharge;
use app\modules\content\models\MemberReturn;
use app\modules\content\models\Order;
use yii;

class WeixinReturn
{
   
    /**
     * 微信提现
     * uid 用户id
     * orderNumber  订单号
     * money  提现金额
     * serFee  服务费
     * type  1-退款 2-提现
     */
    public static function WeixinReturn($uid,$orderNumber,$money,$type =1){
//        return false;
        if(!$uid  || !$money){
            return ['code'=>0,'message'=>'参数错误'];
        }
        $user = Member::findOne($uid);
        if(!$user){
            return ['code'=>0,'message'=>'没有该用户'];
        }
        $url = 'https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';
        $openid = $user->openId;//用户openid
        $mch_appid = Yii::$app->params['appId'];;//appid
        $mchid = Yii::$app->params['wxMchId'];//商户号
        $nonce_str = md5($orderNumber);//随机字符串
        $partner_trade_no = $orderNumber;//商户订单号
        $check_name = 'NO_CHECK';//校验用户姓名选项 NO_CHECK：不校验真实姓名 FORCE_CHECK：强校验真实姓名
        $amount = 100*$money;//金额  分
        $desc = $type == 1?'用户订单退款':'用户余额提现';///企业付款备注
        $spbill_create_ip = $_SERVER['REMOTE_ADDR'];//ip地址
        $signArr = ['openid'=>$openid,'mch_appid'=>$mch_appid,'mchid'=>$mchid,'nonce_str'=>$nonce_str,'partner_trade_no'=>$partner_trade_no,'check_name'=>$check_name,'amount'=>$amount,'desc'=>$desc,'spbill_create_ip'=>$spbill_create_ip];
        //生成签名
        ksort($signArr);
        $key = \Yii::$app->params['wxMchKey'];
        $sign = self::signWxpay($signArr,$key);//签名
        $signArr['sign'] = $sign;
        //组合xml数据
        $xml = self::getXml($signArr);
        $return = Methods::postCa($url,$xml);
        $return = (array)simplexml_load_string($return, 'SimpleXMLElement', LIBXML_NOCDATA); //将微信返回的XML转换成数组
        if(isset($return['return_code']) && $return['return_code'] == 'SUCCESS' && $return['result_code'] == 'SUCCESS'){
            if($type ==1){//退款
                Order::updateAll(['status'=>-2,'returnSuccess'=>time()],"uid = $uid and orderNumber = '{$orderNumber}'");
            }else{//提现
                MemberReturn::updateAll(['status'=>1,'successTime'=>time()],"uid = $uid and orderNumber = '{$orderNumber}'");
            }
            return ['code'=>1,'message'=>'success'];
        }elseif(isset($return['return_msg'])){
            return ['code'=>0,'message'=>$return['return_msg']];
        }else{
            return ['code'=>0,'message'=>'微信提现接口请求失败'];
        }
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
     * xsm数据组合
     */
    public static function getXml($data){
        if(is_array($data)){
            $xml = '<xml>';
            foreach($data as $k => $v){
                $xml .= "<$k>$v</$k>";
            }
            $xml .= "</xml>";
            return $xml;
        }else{
            return '';
        }
    }
}