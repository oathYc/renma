<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/product/index">商品模块</a> <span class="divider">/</span></li>
        <li class="active">组团商品详情</li>
    </ul>
    <form action="/content/product/group-product-add" method="post" class="form-horizontal" onsubmit=" return dataCheck()" >
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">商品名称</label>
                <div class="controls">
                    <input type="text" name="productName" readonly id="productName" value="<?php echo isset($data['productName'])?$data['productName']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品品牌</label>
                <div class="controls">
                    <input type="text" name="brand" readonly id="brand" value="<?php echo isset($data['brand'])?$data['brand']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品原价</label>
                <div class="controls">
                    <input type="text" name="oldPrice" readonly id="oldPrice" value="<?php echo isset($data['oldPrice'])?$data['oldPrice']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品ID</label>
                <div class="controls">
                    <input type="text" name="productId"  id="productId" value="<?php echo isset($data['productId'])?$data['productId']:'';?>" onchange="getProduceMsg()"/>
                </div>
            </div>
<!--            <div class="control-group">-->
<!--                <label for="modulename" class="control-label">组团人数</label>-->
<!--                <div class="controls">-->
<!--                    <input type="text" name="number"  id="number" onkeyup="value = value.replace(/[^0-9]/g,'')" value="--><?php //echo isset($data['number'])?$data['number']:'';?><!--" />-->
<!--                </div>-->
<!--            </div>-->
            <div class="control-group">
                <label for="modulename" class="control-label">返现金额</label>
                <div class="controls">
                    <input type="text" name="return"  id="return" onkeyup="value = value.replace(/[^0-9]/g,'')" value="<?php echo isset($data['return'])?$data['return']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">组团价格</label>
                <div class="controls">
                    <input type="text" name="price"  id="price" onkeyup="value = value.replace(/[^0-9.]/g,'')" value="<?php echo isset($data['price'])?$data['price']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">组团排序</label>
                <div class="controls">
                    <input type="text" name="rank"  id="rank" onkeyup="value = value.replace(/[^0-9]/g,'')" value="<?php echo isset($data['rank'])?$data['rank']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">组团说明</label>
                <div class="controls">
                    <textarea name="remark" id="remark" ><?php echo isset($data['remark'])?$data['remark']:'';?></textarea>
                </div>
            </div>
            <br/>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" class="btn " value="提交">&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </fieldset>
    </form>
</div>
<script>
    function getProduceMsg(){
        var productId = $('#productId').val();
        if(productId > 0){
            $.post('/content/api/get-product',{id:productId},function(e){
                if(e.code ==1){
                    $('#productName').val(e.data.title);
                    $('#brand').val(e.data.brand);
                    $('#oldPrice').val(e.data.price);
                }
            },'json');
        }
    }
    function dataCheck(){
        var productId = $('#productId').val();
        // var number = $('#number').val();
        var price = $('#price').val();
        var remark = $('#remark').val();
        if(!productId || productId < 1){
            alert('请填写参与组团的商品id');return false;
        }
        // if(!number || number < 1){
        //     alert('请填写正确的组团人数');return false;
        // }
        if(!price || price <= 0){
            alert('请填写正确的组团价格');return false;
        }
        if(!remark){
            alert('请填写组团说明');return false;
        }
    }
</script>

