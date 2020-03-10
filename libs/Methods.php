<?php
namespace app\libs;
use app\modules\cn\models\Member;
use app\modules\content\models\MemberRecharge;
use yii;

class Methods
{
    public static function jsonData($code,$message,$data=[]){
        $data = ['code'=>$code,'message'=>$message,'data'=>$data];
        $data = json_encode($data);
        die($data);
    }

    /**
     * post请求
     * @param $url
     * @param string $post_data
     * @param int $timeout
     * @return mixed
     * @Obelisk
     */
    public static  function post($url, $post_data = '', $timeout = 5){//curl
        $ch = curl_init();
        curl_setopt ($ch, CURLOPT_URL, $url);
        curl_setopt ($ch, CURLOPT_POST, 1);
        if(is_array($post_data)){
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_data));
        }else{
            curl_setopt($ch, CURLOPT_POSTFIELDS,$post_data);//微信 xml数据
        }
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_HEADER, false);
        //忽略证书
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        $file_contents = curl_exec($ch);
        curl_close($ch);
        return $file_contents;
    }
    /**
     * post请求
     * @param $url
     * @param string $post_data
     * @param int $timeout
     * @return mixed
     * @Obelisk
     */
    public static  function postCa($url, $post_data = '', $timeout = 5){//curl
        $ch = curl_init();
        curl_setopt ($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);//设置执行最长秒数
        curl_setopt ($ch, CURLOPT_POST, 1);
        if(is_array($post_data)){
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_data));
        }else{
            curl_setopt($ch, CURLOPT_POSTFIELDS,$post_data);//微信 xml数据
        }
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_HEADER, false);
        //忽略证书
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        //默认格式为PEM，可以注释
        $dir = dirname(__FILE__);
        $cert = $dir."/wxCa/apiclient_cert.pem";
        $key = $dir.'/wxCa/apiclient_key.pem';
        curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLCERT,$cert);
        //默认格式为PEM，可以注释
        curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLKEY,$key);
        $data = curl_exec($ch);
        if ($data) {
            curl_close($ch);
            return $data;
        } else {
            $error = curl_errno($ch);
//            $info = curl_getinfo($ch);
//            var_dump($info);
            echo "call faild, errorCode:$error\n";
            echo "<a href='http://curl.haxx.se/libcurl/c/libcurl-errors.html'>错误原因查询</a></br>";
            curl_close($ch);
            return false;
        }
    }

    /**
     * @param $imageFile
     * base64内容转图片
     */
    public static function baseSaveImage($imageFile){
        if(is_array($imageFile)){
            $images = [];
            foreach($imageFile as $k => $v){
                if(isset($v['content'])){
                    $content = $v['content'];
                    if(preg_match('/^(data:\s*image\/(\w+);base64,)/', $content, $result)){
                        $imageName = time().rand(11111,99999).'.png';
                        $path = "./files/attach/file/".date("Ymd",time());
                        if (!is_dir($path)){ //判断目录是否存在 不存在就创建
                            mkdir($path,0777,true);
                        }
                        $imageSrc= $path."/". $imageName; //图片名字
                        $r = file_put_contents($imageSrc, base64_decode(str_replace($result[1], '', $content)));
                        if($r){
                            $images[] = Yii::$app->params['hostUrl'].ltrim($imageSrc,'.');
                        }
                    }
                }elseif(isset($v['url'])){
                    $images[] = $v['url'];
                }
            }
            return $images;
        }else{
            return [];
        }
    }

    /**
     * @param $url
     * @return array|mixed|object
     * curl  get
     */
    public static  function doCurl($url)
    {
        $curl = curl_init();
        // 使用curl_setopt()设置要获取的URL地址
        curl_setopt($curl, CURLOPT_URL, $url);
        // 设置是否输出header
        curl_setopt($curl, CURLOPT_HEADER, false);
        // 设置是否输出结果
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        // 设置是否检查服务器端的证书
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        // 使用curl_exec()将CURL返回的结果转换成正常数据并保存到一个变量
        $data = curl_exec($curl);
        // 使用 curl_close() 关闭CURL会话
        curl_close($curl);
        return json_decode($data);
    }

    /**
     * @param $filename
     * @param $content
     * @param string $do
     * 日志打印
     */
    public static function varDumpLog($filename,$content,$do='w'){
        $path = fopen(IndexDir.'/files/log/'.$filename,$do);
        fwrite($path,$content);
        fclose($path);
    }

    /**
     * 微信小程序生成二维码
     */
    public static function wxCreateQrcode($uid,$invite){
        //配置APPID、APPSECRET
        $APPID = Yii::$app->params['appId'];
        $APPSECRET =  Yii::$app->params['secret'];
        //获取access_token
        $access_token = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$APPID&secret=$APPSECRET";
        //缓存access_token
        session_start();
        $_SESSION['access_token'] = "";
        $_SESSION['expires_in'] = 0;

        $ACCESS_TOKEN = "";
        if(!isset($_SESSION['access_token']) || (isset($_SESSION['expires_in']) && time() > $_SESSION['expires_in']))
        {
            $json = self::httpRequest( $access_token );
            $json = json_decode($json,true);
            // var_dump($json);
            $_SESSION['access_token'] = $json['access_token'];
            $_SESSION['expires_in'] = time()+7200;
            $ACCESS_TOKEN = $json["access_token"];
        }
        else{

            $ACCESS_TOKEN =  $_SESSION["access_token"];
        }
        //构建请求二维码参数
        //path是扫描二维码跳转的小程序路径，可以带参数?id=xxx
        //width是二维码宽度
        $qcode ="https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token=$ACCESS_TOKEN";
        $param = json_encode(array("path"=>"pages/index/index?code=$invite","width"=> 150,'height'=>120));
        //POST参数
        $result = self::httpRequest( $qcode, $param,"POST");
        //生成二维码
        $img = "./api/qrcode/qrcode-$uid.png";
        file_put_contents($img, $result);
//        $base64_image ="data:image/jpeg;base64,".base64_encode( $result );
        $host = Yii::$app->params['domain'];
        return $host.ltrim($img,'.');
    }


//把请求发送到微信服务器换取二维码
    public static function  httpRequest($url, $data='', $method='GET'){
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1);
        if($method=='POST')
        {
            curl_setopt($curl, CURLOPT_POST, 1);
            if ($data != '')
            {
                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            }
        }

        curl_setopt($curl, CURLOPT_TIMEOUT, 30);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($curl);
        curl_close($curl);
        return $result;
    }
    /**
     * 微信内容检测
     * 图片
     */
    public function weiXinImgCheck($img){
        $access_token = self::getAccessToken();
        $url = "https://api.weixin.qq.com/wxa/img_sec_check?access_token=".$access_token;
        $file_data = array("media"  => new \CURLFile($img));
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch , CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch , CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $file_data);
        $output = curl_exec($ch);//发送请求获取结果
        curl_close($ch);//关闭会话
        $output=json_decode($output,true);
        if($output['errcode'] ==0){
            return true;
        }else{
            Methods::jsonData(0,$output['errmsg']);
        }
    }
    /**
     * 微信内容检测
     * 文本检测
     */
    public function weiXinContentCheck($access_tokec,$content){
        $url = "https://api.weixin.qq.com/wxa/msg_sec_check?access_token=".$access_tokec;
        // $content="hello world!";
        $file_data = '{ "content":"'.$content.'" }';//$content(需要检测的文本内容，最大520KB)
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch , CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch , CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $file_data);
        $output = curl_exec($ch);//发送请求获取结果
        curl_close($ch);//关闭会话
        $output=json_decode($output,true);
        if($output['errcode'] == 0){
            return true;
        }else{
            Methods::jsonData(0,$output['errmsg']);
        }
    }
    /**
     * 获取微信access_token
     */
    public static function getAccessToken(){
        $appid = Yii::$app->params['appId'];
        $secret = Yii::$app->params['secret'];
        //判断当前是否有access_token
        $file = './access_token.json';
        if(is_file($file)){
            $data = file_get_contents($file);
            $data = json_decode($data,true);
            $time = time();//当前时间
            if($time >= $data['expireTime']){//超时重新获取
                $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$secret";
                $data = file_get_contents($url);
                $data = json_decode($data,true);
                $exireTime = $time + $data['expires_in'];//过期时间
                $data['expireTime'] = $exireTime;
                $access_token = $data['access_token'];
                $data = json_encode($data);
                file_put_contents('./access_token.json',$data);
            }else{
                $access_token = $data['access_token'];
            }
            return $access_token;
        }else{//还没有生成过access_token
            $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$secret";
            $data = file_get_contents($url);
            $data = json_decode($data,true);
            $time = time();//当前时间
            $exireTime = $time + $data['expires_in'];//过期时间
            $data['expireTime'] = $exireTime;
            $access_token = $data['access_token'];
            $data = json_encode($data);
            file_put_contents('./access_token.json',$data);
            return $access_token;
        }
    }
    /**
     * 消息推送
     * 小程序推送用户
     */
    public static function messagePush(){
        $access_token = self::getAccessToken();
        $date = date("Y-m-d H:i");
        $desc = '有一个新的订单需要服务';
        $url = 'https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token='.$access_token;
        //获取维修师信息
        $repirs = \app\modules\content\models\Member::find()->select("id,openId")->where('repair = 1')->asArray()->all();
        foreach($repirs as $k => $v){
            $templateId = Yii::$app->params['template_id'];
            $data = "{
                'touser':'{$v['openId']}',
                'template_id':'{$templateId}',
                'page':'page/index/index',
                'data':{
                        'thing6':{
                            'value':'{$date}',
                        },
                        'time2':{
                            'value':'{$desc}',
                        }
                    },
                }";
            $log = 'text.txt';
            self::varDumpLog($log,$data,'a');
            self::varDumpLog($log,"\n",'a');
            $res = self::post($url,$data);
            self::varDumpLog($log,$res,'a');
            self::varDumpLog($log,"\n",'a');
        }
    }
}