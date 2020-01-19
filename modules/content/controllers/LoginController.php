<?php
/**
 * 登录管理
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-6-17
 * Time: 下午2:37
 */
namespace app\modules\content\controllers;

use app\modules\content\models\Member;
use app\modules\content\models\Role;
use yii;
use yii\web\Controller;

class LoginController extends  Controller{
    public $enableCsrfValidation = false;
    /**
     * 后台登录
     *
     */
    public function actionLogin(){
        return $this->renderPartial('login');
    }
    /**
     * 登录验证
     */
    public function actionCheckLogin(){
        $userName = Yii::$app->request->post("userName");
        $userPass = Yii::$app->request->post("userPass");
        $userName = trim($userName);
        $userPass = trim(md5(md5($userPass)));
        $res = Role::find()->where("name='{$userName}' and password = '{$userPass}'")->one();
        if($res){
            Yii::$app->session->set('adminId',$res->id);
            Yii::$app->session->set('createPower',$res->createPower);
            return $this->redirect('/content/index/index');
        }else{
            echo '<script>alert("帐号或密码不正确");history.go(-1);</script>';
            exit;
        }
    }
    /**
     * 注销账户
     * @return string
     * */
    public function actionLoginOut()
    {
        $session    = Yii::$app->session;
        $session->removeAll();
        $session->remove('adminId');
        $this->redirect('/content/login/login');
    }
    /**
     * 用户分享
     * 授权页面
     */
    public function actionShare(){
        $uid = Yii::$app->request->get('uid');
        $host = Yii::$app->params['domain'];
        $loginUrl = $host.'/content/login/share-login';
        $redirect_uri = urlencode ($loginUrl);
        $appid = Yii::$app->params['appId'];
        $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$appid."&redirect_uri=$redirect_uri&response_type=code&scope=snsapi_userinfo&state=u".$uid."#wechat_redirect";
         return $this->redirect($url);
    }

    /**
     * 用户分享
     * 授权成功
     */
    public function actionShareLogin(){
        $code = $_GET["code"];
        $state = $_GET["state"];
        $agentid = substr($state, 1);
        $appid = Yii::$app->params['appId'];
        $secret = Yii::$app->params['secret'];
        $oauth2Url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$appid."&secret=".$secret."&code=$code&grant_type=authorization_code";
        $oauth2 = $this->getJson($oauth2Url);

        $access_token = $oauth2["access_token"];

        $openId = $oauth2['openid'];
//        $get_user_info_url = "https://api.weixin.qq.com/sns/userinfo?access_token=" .$access_token. "&openid=".$openid;
//
//        $userinfo = $this->getJson($get_user_info_url);
//        $unionid=$userinfo["unionid"];

        if($openId){
            //已经授权登录
            $res = Member::find()->where("openId = '{$openId}' ")->asArray()->one();
            if(!$res){//第一次授权
                $model = new Member();
                $model->createTime = time();
                $model->inviterCode = $agentid;
                $model->nickname = '默认昵称'.rand(1234,9999);
                $model->save();
                //判断用户邀请码
                Member::inviteCode($model->id);
            }
        }
        return $this->redirect("https://lc.hzlyzhenzhi.com");
    }

    private function getJson($url){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);
        return json_decode($output, true);
    }
}