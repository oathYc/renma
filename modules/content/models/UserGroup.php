<?php


namespace app\modules\content\models;


use yii\data\Pagination;
use yii\db\ActiveRecord;

class UserGroup extends ActiveRecord
{
    public static  function tableName(){
        return '{{%user_group}}';
    }

    /**
     * 当前商品组团数据
     */
    public static function getCurrentGroup($productId,$ownGroup){
        if(!$productId){
            return [];
        }
        $data = [];
        if($ownGroup){
            $ownId = $ownGroup['id'];
        }else{
            $ownId = 0;
        }
        //获取组团的组数及组团信息
        $group = self::find()->where("groupId = $productId  and promoter = 1 and id = $ownId")->orderBy("status asc")->limit(10)->asArray()->one();
        if(!$group){
            return [];
        }
        $sql = " select ug.*,m.nickname,m.name,m.avatar from {{%user_group}} ug inner join {{%member}} m on m.id = ug.uid where ug.groupId = {$group['groupId']} and ug.promoter = 0 and ug.userGroupId = {$group['userGroupId']}";
        $add = \Yii::$app->db->createCommand($sql)->queryAll();
        //过期时间 默认一天
        $expireTime = $group['createTime'] + 86400;
        $expireTime = date('Y-m-d H:i:s',$expireTime);
        $group['expireTime'] = $expireTime;
        $user = Member::findOne($group['uid']);
        if(!$user){
            return [];
        }
        $group['nickname'] = $user->nickname;
        $group['name'] = $user->name;
        $group['avatar'] = $user->avatar;
        $data[] = $group;
        foreach($add as $k => $v){
            $data[]=$v;
        }
        return $data;
    }
    /**
     * 获取自己组团的信息
     */
    public static function getOwnGroup($uid,$productId){
        if($uid){
            $own = UserGroup::find()->where("status = 0 and groupId = $productId and uid = $uid ")->asArray()->one();
            if($own){
                if($own['promoter'] !=1){//不是发起人
                    $data = UserGroup::find()->where("promoter = 1 and groupId = $productId and userGroupId = {$own['userGroupId']}")->asArray()->one();
                }else{
                    $data = $own;
                }
                $sql = " select ug.*,m.nickname,m.name,m.avatar from {{%user_group}} ug inner join {{%member}} m on m.id = ug.uid where ug.groupId = {$data['groupId']} and ug.promoter != 0 and ug.userGroupId = {$data['userGroupId']}";
                $add = \Yii::$app->db->createCommand($sql)->queryAll();
                $data['add'] = $add;
                $user = Member::findOne($data['uid']);
                $data['nickname'] = $user->nickname;
                $data['name'] = $user->name;
                $data['avatar'] = $user->avatar;
            }else{
                $data = [];
            }
        }else{
            $data = [];
        }
        return $data;
    }

    /**
     * @param $groupId
     * 检查组团是否人数已满
     * 判断组团时间是否超时
     * j
     */
    public static function checkUserGroup($groupId){
        if(!$groupId){
            return true;
        }
        $group = UserGroup::findOne($groupId);
        if(!$group){
            return true;
        }
        //组团商品信息
        $product = GroupProduct::findOne($group->groupId);
        if(!$product){
            return true;
        }
        $number = $product->number;//组团人数
        //获取当前组团组团人数
        $hadNumber = UserGroup::find()->where(" userGroupId = {$group->userGroupId}")->count();
        if($hadNumber >= $number){//组团人数已满 修改组团状态
            UserGroup::updateAll(['status'=>1,'finishTime'=>time()],"userGroupId={$group->userGroupId}");
        }
        return true;
    }
    /**
     * 检查用户所有的组团数据状态
     * 组团时间超时
     */
    public static function checkUserGroups($uid=0){
        //获取所有用户的组团数据
        if($uid){
            $where = "uid = $uid and status = 0 ";
        }else{
            $where = "status = 0 ";
        }
        $groups = UserGroup::find()->where($where)->groupBy('groupId')->asArray()->all();
        foreach($groups as $k => $v){
            //组团商品信息
            $product = GroupProduct::findOne($v['groupId']);
            if(!$product){
                continue;
            }
            //获取组团结束时间
            $expireTime = UserGroup::find()->where("userGroupId = {$v['userGroupId']} and promoter = 1")->asArray()->one()['createTime'];
            $expireTime += 86400;
            $time = time();
            if( ($time > $expireTime)){//组团人数已满或者时间到了 修改组团状态
                UserGroup::updateAll(['status'=>2],"userGroupId={$v['userGroupId']}");
            }
        }
        return true;
    }

    /**
     * 后台获取组团信息
     */
    public static function getUserGroup($page=1){
        if(!$page){$page = 1;}
        $count = self::find()->count();
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>10]);
        $limit = " limit ".(10*($page-1)).",10";
        $sql = "select ug.id as gId,ug.createTime as ugTime,ug.*,m.*,p.title,p.price,p.brand from {{%user_group}} ug left join {{%member}} m on m.id = ug.uid left join {{%product}} p on p.id = ug.groupId order by ug.userGroupId desc $limit";
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        return ['count'=>$count,'page'=>$pages,'data'=>$data];
    }

    /**
     * 判断组团有效时间
     */
    public static function checkGroupTime($userGroupId){
        $time = time();
        if(!$userGroupId){
            $data = ['code'=>0,'message'=>'用户组团id不存在'];
            return $data;
        }
        //用户组团数据
        $userGroup = UserGroup::findOne($userGroupId);
        if(!$userGroup){
            $data = ['code'=>0,'message'=>'用户组团不存在'];
            return $data;
        }
        if($userGroup->promoter != 1){//不是发起人
            $data = ['code'=>0,'message'=>'用户组团发起人不存在'];
            return $data;
        }
        if($userGroup->status != 1){//发起人还未完成支付 不能进行分享购买
            $data = ['code'=>0,'message'=>'分享人组团未成功（未购买）'];
            return $data;
        }
        $beginTime = $userGroup->createTime;//发起组团时间
        //组团数据
        $group = GroupProduct::findOne($userGroup->groupId);
        if(!$group){
            $data = ['code'=>0,'message'=>'组团商品不存在'];
            return $data;
        }
        //组团有效时间
        $groupTime = $group->groupTime;
        $endTime = $groupTime*86400 + $beginTime;
        //当前时间判断
        if($time > $endTime){//已超过有效时间
            $data = ['code'=>0,'message'=>'组团时间已过'];
            return $data;
        }
        $data = ['code'=>1,'message'=>''];
        return $data;
    }
    /**
     * 获取组团购买数据
     */
    public static function getBuyData($userGroupId){
        $buyNumber = 0;
        $data = [];
        $groupStatus = '未开始' ;
        if($userGroupId){
            $userGroup = UserGroup::findOne($userGroupId);
            if($userGroup){
                if($userGroup->status ==1){//组团购买成功
                    $now = time();
                    $finishTime = $userGroup->finishTime;
                    $groupTime = GroupProduct::find()->where(" id = {$userGroup->groupId}")->asArray()->one()['groupTime'];
                    $endTime = $finishTime + (86400*$groupTime);
                    if($now <= $endTime){
                        $groupStatus = '进行中';
                    }else{
                        $groupStatus = '已结束';
                    }
                    $sql = " select ug.*,m.avatar,m.nickname,o.payPrice,o.typeStatus from {{%user_group}} ug inner join {{%order}} o on o.id = ug.orderId left join {{%member}} m on m.id = o.uid where o.status = 1 and ug.status = 1 and ug.userGroupId = $userGroupId and ug.id != $userGroupId and o.typeStatus >= 1";//订单已完成  用户确认收货  同一组团
                    $data = \Yii::$app->db->createCommand($sql)->queryAll();
                    $buyNumber = count($data);
                }
            }
        }
        $return = ['buyNumber'=>$buyNumber,'groupStatus'=>$groupStatus,'data'=>$data];
        return $return;
    }

}