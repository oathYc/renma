<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class GroupCategory extends ActiveRecord
{
    public static  function tableName(){
        return '{{%group_category}}';
    }

    /**
     * 记录商品分类价格数据
     */
    public static function saveProductCategory($groupId,$array=[]){
        if($array){
            $ids = "";
            if(!is_array($array)){return false;}
            foreach($array as $k => $v){
                $arr = explode('-',$v);
                if(count($arr) ==3){
                    $id = $arr[0];
                    if($id){//修改
                        $model = self::findOne($id);
                    }else{//新增
                        $model = new self();
                        $model->createTime = time();
                    }
                    $model->groupId = $groupId;
                    $model->price = $arr[2];
                    $model->cateDesc = $arr[1];
                    $model->save();
                    $ids .= $model->id.",";
                }
            }
            $ids = trim($ids,',');
            if($ids){
                self::deleteAll(" id not in ({$ids}) and groupId = $groupId");
            }
            return true;
        }
        return false;
    }
}