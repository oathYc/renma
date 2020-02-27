<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件-->
<script type="text/javascript" src="/ueditor/ueditor.all.min.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">充值添加</li>
    </ul>
    <form action="/content/content/recharge-add" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('确定提交该内容？')){return dataSubmit()}else{
        return false;
    }">
        <input type="hidden" value="<?php echo isset($data['id'])?$data['id']:''?>"  name="id" />
        <fieldset>

            <div class="control-group">
                <label for="modulename" class="control-label">充值标题</label>
                <div class="controls">
                    <input type="text" name="title" id="title" value="<?php echo isset($data['title'])?$data['title']:''?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">充值原价</label>
                <div class="controls">
                    <input type="text" name="oldPrice" id="oldPrice" onkeyup="value = value.replace(/[^.0-9]/g,'')" value="<?php echo isset($data['oldPrice'])?$data['oldPrice']:''?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">充值价</label>
                <div class="controls">
                    <input type="text" name="price" id="price" onkeyup="value = value.replace(/[^.0-9]/g,'')" value="<?php echo isset($data['price'])?$data['price']:''?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">上传商品数</label>
                <div class="controls">
                    <input type="text" name="upload" id="upload" onkeyup="value = value.replace(/[^.0-9]/g,'')" value="<?php echo isset($data['upload'])?$data['upload']:''?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">会员等级</label>
                <div class="controls">
                    <input type="text" name="level" id="level" onkeyup="value = value.replace(/[^0-9]/g,'')" value="<?php echo isset($data['level'])?$data['level']:''?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">排序值</label>
                <div class="controls">
                    <input type="text" name="rank" id="rank" onkeyup="value = value.replace(/[^0-9]/g,'')" value="<?php echo isset($data['rank'])?$data['rank']:''?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">充值说明</label>
                <div class="controls">
                    <textarea name="remark"><?php echo isset($data['remark'])?$data['remark']:''?></textarea>
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
