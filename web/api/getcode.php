<?php
include('./phpqrcode.php');

$imgpath="./bg.jpg"; //背景图片
$im=imagecreatefromjpeg($imgpath);
//背景中二维码的位置和尺寸信息
$top=900;
$left=290;
$width=180;
$height=180;

//生成我们需要的二维码图片
$url="http://lck.hzlyzhenzhi.com/content/login/share?uid=".$_GET["uid"];

QRcode::png($url,false, 'L', 6, 1);

$ob_contents = ob_get_contents();
ob_end_clean(); 

$qrim = imagecreatefromstring($ob_contents);

//用新的二维码替换背景中二维码
//$qrim=imagecreatefrompng($newqrimg);

$qrw=imagesx($qrim);
$qrh=imagesy($qrim);
imagecopyresampled($im, $qrim, $left, $top, 0, 0, $width, $height, $qrw, $qrh);
header("content-type:image/jpg");
imagejpeg($im);
if(is_file($newqrimg)){
    unlink($newqrimg);
}
imagedestroy($im);
imagedestroy($qrim);

?>