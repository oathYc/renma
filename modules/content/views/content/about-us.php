<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">关于我们</li>
    </ul>
    <form action="/content/content/about-us" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('确定提交该内容？')){return true}else{
        return false;
    }">
        <input type="hidden" name="id" value="<?php echo isset($data['id'])?$data['id']:0;?>"
        <fieldset>

            <div class="control-group">
                <label for="modulename" class="control-label">关于我们</label>
                <div class="controls">
                    <textarea name="content"><?php echo isset($data['content'])?$data['content']:''?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">联系电话</label>
                <div class="controls">
                    <input type="text" name="phone" id="phone" value="<?php echo isset($data['phone'])?$data['phone']:''?>" />
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

