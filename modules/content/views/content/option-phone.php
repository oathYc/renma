<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">反馈电话</li>
    </ul>
    <form action="/content/content/option-phone" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('确定提交该内容？')){return true}else{
        return false;
    }">
        <input type="hidden" name="id" value="<?php echo isset($data['id'])?$data['id']:0;?>"
        <fieldset>

            <div class="control-group">
                <label for="modulename" class="control-label">反馈微信</label>
                <div class="controls">
                    <input type="text" name="content"  placeholder="请填写反馈微信" value="<?php echo isset($data['content'])?$data['content']:''?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">反馈电话</label>
                <div class="controls">
                    <input type="text" name="phone" onkeyup="value = value.replace(/[^0-9]/g,'')" placeholder="请填写反馈联系电话" value="<?php echo isset($data['phone'])?$data['phone']:''?>" />
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

