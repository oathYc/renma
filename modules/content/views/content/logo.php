<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">logo内容</li>
    </ul>
    <form action="/content/content/logo-content" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('确定提交该内容？')){return true}else{
        return false;
    }">
        <fieldset>

            <div class="control-group">
                <label for="modulename" class="control-label">logo内容</label>
                <div class="controls">
                    <textarea name="content"><?php echo isset($content['content'])?$content['content']:''?></textarea>
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

