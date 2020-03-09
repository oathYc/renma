<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">筛选添加</li>
    </ul>
    <form action="/content/content/search-add" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('提交后便不可修改了？')){return true}else{
        return false;
    }">
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">类型</label>
                <div class="controls">
                    <label for="img" style="display: inline;"><input type="radio" name="type" id="img" value="1"  />&nbsp;&nbsp;电压</label>&nbsp;&nbsp;
                    <label for="mv" style="display: inline;"><input type="radio" name="type" id="mv" value="2" />&nbsp;&nbsp;续航里程</label>&nbsp;&nbsp;
                    <label for="mv" style="display: inline;"><input type="radio" name="type" id="mv" value="3" />&nbsp;&nbsp;品牌</label>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">内容</label>
                <div class="controls">
                    <input type="text" name="val" id="val" value=""  />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">排序</label>
                <div class="controls">
                    <input type="text" name="rank" id="rank" onkeyup="value = value.replace(/[^0-9]/g,'')" value="" placeholder="倒叙"  />
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

