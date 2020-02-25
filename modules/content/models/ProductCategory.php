<?php


namespace app\modules\content\models;


use yii\db\ActiveRecord;

class ProductCategory extends ActiveRecord
{
    public static  function tableName(){
        return '{{%product_category}}';
    }

    /**
     * 记录商品分类价格数据
     */
    public static function saveProductCategory($productId,$array=[]){
        if($array){
            $ids = "";
            foreach($array as $k => $v){
                $arr = explode('-',$v);
                if(count($arr) ==4){
                    $id = $arr[0];
                    if($id){//修改
                        $model = self::findOne($id);
                    }else{//新增
                        $model = new self();
                        $model->createTime = time();
                    }
                    $model->productId = $productId;
                    $model->number = $arr[3];
                    $model->price = $arr[2];
                    $model->cateDesc = $arr[1];
                    $model->save();

                    $ids .= $model->id.",";
                }
            }
            $ids = trim($ids,',');
            if($ids){
                self::deleteAll(" id not in ({$ids}) and productId = $productId");
            }
        }
    }
}