<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class GroupRecord extends ActiveRecord
{
    public static  function tableName(){
        return '{{%group_record}}';
    }
    /**
     * 用户组团进入记录
     */
    public static function groupRecord($uid,$createUid,$userGroupId,$groupId){
        $model = new GroupRecord();
        $model->uid = $uid;
        $model->createUid = $createUid;
        $model->userGroupId = $userGroupId;
        $model->createTime = time();
        $model->groupId = $groupId;
        $model->save();
        return true;
    }
}