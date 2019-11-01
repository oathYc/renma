<?php
/**
 * 微信小程序支付
 * Created by PhpStorm.
 * User: Administrator
 * Date: 15-6-17
 * Time: 下午2:37
 */
namespace app\modules\content\controllers;

use yii;
use yii\web\Controller;

header("Access-Control-Allow-Origin:*");
class WeixinPayController extends  Controller{
    public $enableCsrfValidation = false;

    /**
     * 生成订单
     * 调用下单接口
     */
    public function actionCreateOrder(){

    }

}