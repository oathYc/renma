<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">优惠券添加</li>
    </ul>
    <form action="/content/content/coupon-add" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('提交后便不可修改了？')){return true}else{
        return false;
    }">
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">名称</label>
                <div class="controls">
                    <input type="text" name="name" id="name" value="" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">金额</label>
                <div class="controls">
                    <input type="text" name="money" id="money" value="" onkeyup="value = value.replace(/[^0-9]/g,'')" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">积分</label>
                <div class="controls">
                    <input type="text" name="number" id="number" value="" onkeyup="value = value.replace(/[^0-9]/g,'')" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">起步价</label>
                <div class="controls">
                    <input type="text" name="least" id="least" value="" onkeyup="value = value.replace(/[^0-9]/g,'')" placeholder="使用该卷的最低价" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">备注说明</label>
                <div class="controls">
                    <textarea name="remark"></textarea>
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

