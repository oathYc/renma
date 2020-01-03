<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">优选商品编辑</li>
    </ul>
    <form action="/content/product/good-product-add" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('确认提交该内容？')){return true}else{
        return false;
    }">
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">商品Id</label>
                <div class="controls">
                    <input type="text" name="productId" id="productId" value="" onkeyup="value = value.replace(/[^0-9]/g,'')"  />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">排序</label>
                <div class="controls">
                    <input type="text" name="rank" id="rank" value="" onkeyup="value = value.replace(/[^0-9]/g,'')" placeholder="大到小"/>
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

