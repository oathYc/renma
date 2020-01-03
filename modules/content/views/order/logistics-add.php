<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/order/index">订单管理</a> <span class="divider">/</span></li>
        <li class="active">订单物流</li>
    </ul>
    <form action="/content/order/logistics-add" method="post" class="form-horizontal" onsubmit="return dataSub()" >
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">订单号</label>
                <div class="controls">
                    <input type="text" name="orderNumber" id="orderNumber" value="<?php echo isset($data['orderNumber'])?$data['orderNumber']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品名</label>
                <div class="controls">
                    <input type="text" name="productTitle" id="productTitle" value="<?php echo isset($data['productTitle'])?$data['productTitle']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">订单价格</label>
                <div class="controls">
                    <input type="text" name="payPrice" id="payPrice" value="<?php echo isset($data['payPrice'])?$data['payPrice']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">收货人</label>
                <div class="controls">
                    <input type="text" name="name" id="name" value="<?php echo isset($data['name'])?$data['name']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">联系电话</label>
                <div class="controls">
                    <input type="text" name="phone" id="phone" value="<?php echo isset($data['phone'])?$data['phone']:'';?>" readonly/>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">物流状态</label>
                <div class="controls">
                    <input type="text" name="logistics" id="logistics" value="<?php echo isset($data['logisticsStatus'])?$data['logisticsStatus']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">物流时间</label>
                <div class="controls">
                    <input type="text" name="logisticsName" id="logisticsName" value="<?php echo isset($data['logisticsTime'])?$data['logisticsTime']:'';?>" readonly/>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">物流类型</label>
                <div class="controls">
                    <input type="text" name="logistics" id="logistics" value="<?php echo isset($data['logistics'])?$data['logistics']:'';?>" <?php if(isset($data['logisticsStatus']) && $data['logisticsStatus']==1) echo 'readonly'; ?> />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">物流号</label>
                <div class="controls">
                    <input type="text" name="logisticsName" id="logisticsName" value="<?php echo isset($data['logisticsName'])?$data['logisticsName']:'';?>" <?php if(isset($data['logisticsStatus']) && $data['logisticsStatus']==1) echo 'readonly'; ?>/>
                </div>
            </div>
            <br/>
            <div class="control-group">
                <div class="controls">
                    <input name="id" type="hidden" value="<?php echo isset($data['orderId'])?$data['orderId']:'';?>">
                    <?php if(isset($data['logisticsStatus']) && $data['logisticsStatus']==1){ ?>
                        <a class="btn" onclick="Javascript:history.go(-1);">返回</a>
                    <?php }else{ ?>
                        <input type="submit"  class="btn btn-primary" value="提交">
                    <?php
                    } ?>
                </div>
            </div>
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

