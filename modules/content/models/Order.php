<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class Order extends ActiveRecord
{
    public static  function tableName(){
        return '{{%order}}';
    }
    /**
     * 会员充值
     */
    public static function createOrder($uid,$orderNumber,$money,$remark,$status = 0){
        $model = new self();
        $model->orderNumber = $orderNumber;
        $model->uid = $uid;
        $model->productId = 0;
        $model->productTitle = $remark;
        $model->payPrice = $money;
        $model->totalPrice = $money;
        $model->status = $status;
        $model->createTime = time();
        $model->type = 1;//1-充值 2-买商品
        $model->save();
        return $model->id;
    }

    /**
     * 更新组团订单
     */
    public static function updateCartOrder($orderId){
        if(!$orderId){
            return false;
        }
        $order = Order::findOne($orderId);
        if(!$order){
            return true;
        }
        $products = $order->extInfo;
        if(!$products){
            return true;
        }
        $array = explode(',',$products);
        $count = count($array);
        if($count ==0){
            $serFee = 0;
        }else{
            $serFee = floor(($order->serverFee)/$count);
        }
        foreach($array as $k =>$v){
            $arr = explode('-',$v);
            if(count($arr) ==2){
                $productId = $arr[0];
                $number = $arr[1];
                $model = new self();
                $model->orderNumber = $order->orderNumber.$productId;
                $model->uid = $order->uid;
                $model->productId = $productId;
                $product = Product::findOne($productId);
                if(!$product){
                    continue;
                }
                $model->productTitle = $product->title;
                $model->totalPrice = $product->price;
                $model->reducePrice = 0;
                $model->payPrice = $product->price;
                $model->coupon = 0;
                $model->number = $number;
                $model->extInfo = $products;
                $model->status = 1;
                $model->typeStatus = 1;//0-代付款 1-待接单 2-已接单 3-待评价 4-待售后
                $model->createTime = $order->createTime;
                $model->proType = $product->type;
                $model->finishTime = time();
                $model->payType = 1;
                $model->type = 2;
                $model->address = $order->address;
                $model->integral = 0;
                $model->remark = '购物车购买';
                $model->serverFee = $serFee;
                $res = $model->save();//质保商品判断
                $zhibao = Product::find()->where("id = {$productId} and zhibao =1")->asArray()->one();
                if($zhibao){
                    Quality::addProduct($order->uid,$productId,$model->id);
                }
            }else{
                continue;
            }
        }
        Order::updateAll(['status'=>2]," id = $orderId");
        return true;
    }
    /**
     * 判断用户组团商品数据
     * 赠送返现
     */
    public static  function checkUserGroup($orderId){
        if($orderId){
            $order = Order::findOne($orderId);
            if(!$order){
                return false;
            }
            $userGroup = UserGroup::find()->where("orderId = {$orderId} and uid = {$order['uid']}")->one();
            if(!$userGroup){
                return false;
            }
            $userGroupId = $userGroup->userGroupId;//分享人组团id
//            if($userGroup->promoter != 1 && $userGroup->id = $userGroupId){//不是组团发起人 给发起人返现
                $pid = $userGroup->promoterUid;
                $group = GroupProduct::findOne($userGroup->groupId);
                if($group){
                    $return = $group->return;//返现金额
                    $number = $group->number;//组团人数
                    $groupTime = $group->groupTime;//有效时间
                    if($return){
                        $hadNumber = UserGroup::find()->where("userGroupId = $userGroupId and uid != $pid and status = 1 and uid != {$order['uid']}")->count();
                        //过期时间
                        $createTime = UserGroup::find()->where("id = $userGroupId and status = 1 and uid = $pid")->asArray()->one()['createTime'];//发起组团时间
                        $expirTime = $groupTime*86400 + $createTime;
                        $now = time();
                        if($hadNumber < $number && $now < $expirTime){//人数未满且在有效期内
                            $money = Member::find()->where(" id = $pid")->asArray()->one()['memberMoney'];
                            $add = $money + $return;
                            Member::updateAll(['memberMoney'=>$add],"id = $pid");
                            //记录金额收入记录
                            MoneyRecord::saveRecord($pid,$orderId,$return,1,1);
                        }
                    }
                }
//            }
        }
        return true;
    }
}