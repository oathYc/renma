<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">地区设置</li>
    </ul>
    <form action="/content/content/area-check" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('确定提交该内容？')){return true}else{
        return false;
    }">
        <input type="hidden" name="id" value="<?php echo isset($data['id'])?$data['id']:0;?>"
        <fieldset>

            <div class="control-group">
                <label for="modulename" class="control-label">地区设置</label>
                <div class="controls">
                    <input type="text" name="content" placeholder="请填写城市名，如成都" value="<?php echo isset($data['content'])?$data['content']:''?>" />
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

