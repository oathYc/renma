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

}