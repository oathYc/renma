<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Member extends ActiveRecord
{
    public static  function tableName(){
        return '{{%member}}';
    }

    /**
     * 用户验证码生成
     */
    public static function inviteCode($uid){
        $user = self::findOne($uid);
        if($user){
            $inviteCode = $user->inviteCode;
            if(!$inviteCode){
                $code = self::getInviteCode();
                $user->inviteCode = $code;
                $user->save();
            }
        }
    }
    /**
     * 邀请码码生成
     */
    public static function getInviteCode(){
        //初次生成邀请码
        $array = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9','0');
        $total = count($array);
        for($i = 0; $i<8;$i++){
            $rand = rand(0,$total);
            $code[] = $array[$rand];
        }
        $code = implode('',$code);
        $had = self::find()->where("inviteCode = '{$code}'")->one();
        if(!$had){
            return $code;
        }else{//已有用户有改邀请码 重新生成
            self::getInviteCode();
        }
    }

    /**
     * 检查用户会员状态
     */
    public static function checkMemberStatus($uid){
        if(!$uid){
            return false;
        }else{
            $memberLog = MemberLog::find()->where(" uid = $uid ")->orderBy('endTime desc')->asArray()->one();
            if($memberLog){
                $endTime = $memberLog['endTime'] + 86399;//最新会员结束时间
                $todayTime = time();
                if($endTime > $todayTime){//还在会员时间段内
                    Member::updateAll(['member'=>1]," id = $uid");
                }else{//会员过期
                    Member::updateAll(['member'=>0],"id = $uid");
                }
            }else{//还没有开通会员
                Member::updateAll(['member'=>0],"id = $uid");
            }
            return true;
        }
    }
    /**
     * 会员优惠券赠送
     */
    public static function sendCoupon($uid){
        //赠送五元优惠券五张
        $coupons = Coupon::find()->where("money = 5")->asArray()->all();
        $count = 0;
        foreach($coupons as $k => $v){
            $had = UserCoupon::find()->where("uid = $uid and couponId = {$v['id']}")->one();
            if(!$had){
                if($count < 5){
                    $model = new UserCoupon();
                    $model->uid = $uid;
                    $model->couponId = $v['id'];
                    $model->createTime = time();
                    $model->status = 0;
                    $res = $model->save();
                    if($res){
                        $count += 1;
                    }
                }
            }
        }
    }

    /**
     * 购买赠送等值积分
     */
    public static function sendIntegral($uid,$totalPrice,$serFee=0){
        $price = $totalPrice + $serFee;
        $integral = floor($price);
        if(!$uid){
            return true;
        }
        if($integral < 1){
            return true;
        }else{
            $member = Member::findOne($uid);
            if(!$member){
                return true;
            }else{
                $userIntegral = $member->integral;
                if(!$userIntegral){$userIntegral=0;}
                $saveIntegral = $userIntegral + $integral;
                $member->integral = $saveIntegral;
                $member->save();
                return true;
            }
        }
    }
    /**
     * 积分抵扣
     */
    public static function reduceIntegral($uid,$integral=0){
        if(!$uid){
            return true;
        }
        if($integral < 1){
            return true;
        }else{
            $member = Member::findOne($uid);
            if(!$member){
                return true;
            }else{
                $userIntegral = $member->integral;
                if(!$userIntegral){$userIntegral=0;}
                $reduceIntegral = $userIntegral - $integral;
                $member->integral = $reduceIntegral;
                $member->save();
                return true;
            }
        }
    }

    /**
     * 余额增加
     */
    public static function addYu($uid,$money=0){
        if(!$uid){
            return true;
        }
        if($money<= 0){
            return true;
        }else{
            $member = Member::findOne($uid);
            if(!$member){
                return true;
            }else{
                $memberMoney = $member->memberMoney;
                $newMoney = $memberMoney + $money;
                $member->memberMoney = $newMoney;
                $member->save();
                return true;
            }
        }
    }

    /**
     * 获取公网IP和地址
     * cy
     */
    public static function getip(){
//        $ch = curl_init('http://tool.huixiang360.com/zhanzhang/ipaddress.php');
//        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
//        $a  = curl_exec($ch);
//        preg_match('/\[(.*)\]/', $a, $ip);
//
//        $cip =$ip[1];
        $code = 1;//获取成功
        $cip = \Yii::$app->request->getUserIP();
        if($cip == ''){
            $url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json";//新浪借口获取访问者地区
            $ip=json_decode(file_get_contents($url),true);
            $data = $ip;
        }else{
            try{
                $url="http://ip.taobao.com/service/getIpInfo.php?ip=".$cip;//淘宝借口需要填写ip
                $ip=json_decode(file_get_contents($url));
                if((string)$ip->code=='1'){
                    return false;
                }
                $data = (array)$ip->data;
            }catch(\Exception  $e){
                return ['code'=>2];
            }
        }
        $data['code'] = $code;
        return $data;
    }
}