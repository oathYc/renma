<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/order/index">订单管理</a> <span class="divider">/</span></li>
        <li class="active">订单售后</li>
    </ul>
    <form action="/content/order/order-after-add" method="post" class="form-horizontal" onsubmit="return dataSub()" >
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">订单id</label>
                <div class="controls">
                    <input type="text" name="orderId" id="orderId" value="<?php echo isset($data['orderId'])?$data['orderId']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品名</label>
                <div class="controls">
                    <input type="text" name="productName" id="productName" value="<?php echo isset($data['productName'])?$data['productName']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品品牌</label>
                <div class="controls">
                    <input type="text" name="brand" id="brand" value="<?php echo isset($data['brand'])?$data['brand']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">钢印时间</label>
                <div class="controls">
                    <input type="text" name="gyTime" id="gyTime" value="<?php echo isset($data['gyTime'])?$data['gyTime']:'';?>" readonly/>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">条形码</label>
                <div class="controls">
                    <input type="text" name="barCode" id="barCode" value="<?php echo isset($data['barCode'])?$data['barCode']:'';?>" readonly/>
                </div>
            </div>
            <?php if(!isset($data['afterUid']) || !$data['afterUid']){?>
            <div class="control-group">
                <label for="modulename" class="control-label">维修师</label>
                <div class="controls">
                    <select name="repair">
                        <option value="0">请选择</option>
                        <?php foreach($repairs as $k => $v){?>
                            <option value="<?php echo $v['id'];?>"><?php echo $v['name'];?></option>
                        <?php }?>
                    </select>
                </div>
            </div>
                <br/>
                <div class="control-group">
                    <div class="controls">
                        <input name="id" type="hidden" value="<?php echo isset($data['id'])?$data['id']:'';?>">
                        <input type="submit"  class="btn btn-primary" value="提交">
                    </div>
                </div>
            <?php }else{?>
            <div class="control-group">
                <label for="modulename" class="control-label">指派时间</label>
                <div class="controls">
                    <input type="text" name="repairTime" id="repairTime" value="<?php echo isset($data['repairTime'])?date("Y-m-d",$data['repairTime']):'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">维修师姓名</label>
                <div class="controls">
                    <input type="text" name="repairName" id="repairName" value="<?php echo isset($data['repairName'])?$data['repairName']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">维修师电话</label>
                <div class="controls">
                    <input type="text" name="repairPhone" id="repairPhone" value="<?php echo isset($data['repairPhone'])?$data['repairPhone']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">完成图片</label>
                <div class="controls">
                    <input type="text" name="repairImg" id="repairImg" value="<?php echo isset($data['repairImg'])?$data['repairImg']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">完成时间</label>
                <div class="controls">
                    <input type="text" name="repairSuccess" id="repairSuccess" value="<?php echo isset($data['repairSuccess'])?date("Y-m-d",$data['repairSuccess']):'';?>" readonly />
                </div>
            </div>
                <br/>
                <div class="control-group">
                    <div class="controls">
                        <input name="id" type="hidden" value="<?php echo isset($data['orderId'])?$data['orderId']:'';?>">
                        <a class="btn" onclick="Javascript:history.go(-1);">返回</a>
                    </div>
                </div>
            <?php }?>
        </fieldset>
    </form>
</div>

<script>
    function dataSub(){
        if(confirm('确定提交该数据')){
            return true;
        }else{
            return false;
        }
    }
</script>

