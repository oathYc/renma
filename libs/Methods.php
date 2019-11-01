<?php
namespace app\libs;
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

        if($post_data != ''){

            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_data));

        }

        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);

        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);

        curl_setopt($ch, CURLOPT_HEADER, false);

        $file_contents = curl_exec($ch);

        curl_close($ch);

        return $file_contents;

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

}