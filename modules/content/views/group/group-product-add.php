<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/group/index">拼团设置</a> <span class="divider">/</span></li>
        <li class="active">组团商品详情</li>
    </ul>
    <form action="/content/group/group-product-add" method="post" class="form-horizontal" onsubmit=" return dataCheck()" >
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
            <div class="control-group">
                <label for="modulename" class="control-label">商品分类价格</label>
                <div class="controls">
                    分类描述：<input type="text"  name="condition" id='catDesc' value=""/>&nbsp;&nbsp;&nbsp;&nbsp;
                    分类价格：<input type="text" style="width:120px" name="propId" id='catPrice' onkeyup="value = value.replace(/[^.0-9]/g,'')" autocomplete="off" value="" />
                    &nbsp;&nbsp;&nbsp;<a href="#" class="btn" onclick="addPrice(this)">添加</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div><br/>
                <div class="controls">
                    <table  class="nav " id="catPriceDiv" >
                        <?php if(isset($data['priceCat'])){
                            foreach($data['priceCat'] as $k => $v) {
                                ?>
                                <tr>
                                    <td>
                                        <?php echo $v['cateDesc']?>：<?php echo $v['price']?>元
                                        <input type="hidden" value="<?php echo $v['id'].'-'.$v['cateDesc'].'-'.$v['price']?>" name="priceCat[]"/>&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td><a href="#" style="display: inline;" onclick="deleteCont(this)">&nbsp;&nbsp;&nbsp;&nbsp;删除</a></td>
                                </tr>
                                <?php
                            }
                        }?>
                    </table>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">组团人数</label>
                <div class="controls">
                    <input type="text" name="number"  id="number" onkeyup="value = value.replace(/[^0-9]/g,'')" value="<?php echo isset($data['number'])?$data['number']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">返现金额</label>
                <div class="controls">
                    <input type="text" name="return"  id="return" onkeyup="value = value.replace(/[^.0-9]/g,'')" value="<?php echo isset($data['return'])?$data['return']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">组团价格</label>
                <div class="controls">
                    <input type="text" name="price"  id="price" onkeyup="value = value.replace(/[^.0-9.]/g,'')" value="<?php echo isset($data['price'])?$data['price']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">有效时间</label>
                <div class="controls">
                    <input type="text" name="groupTime"  id="groupTime" onkeyup="value = value.replace(/[^0-9.]/g,'')" value="<?php echo isset($data['groupTime'])?$data['groupTime']:'';?>" placeholder="单位天" />
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
                    <input type="hidden" name="id" value="<?php echo isset($data['id'])?$data['id']:'';?>" />
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
        if(!number || number < 1){
            alert('请填写正确的组团人数');return false;
        }
        if(!price || price <= 0){
            alert('请填写正确的组团价格');return false;
        }
        if(!remark){
            alert('请填写组团说明');return false;
        }
    }
    function addPrice(){
        var desc = $('#catDesc').val();
        var price = $('#catPrice').val();
        if(!desc){
            alert('请填写分类描述');return false;
        }
        if(!price){
            alert('请填写分类价格');return false;
        }
        var str = '<tr><td>'+desc+'：'+price+'元'+'<input type="hidden" value="0-'+desc+'-'+price+'" name="priceCat[]" /></td>';
        str += '<td><a href="#" style="display: inline;" onclick="deleteCont(this)">&nbsp;&nbsp;&nbsp;&nbsp;删除</a></td></tr>';
        $('#catPriceDiv').append(str);
    }
    function deleteCont(_this){
        $(_this).parents('tr').remove();
    }
</script>

