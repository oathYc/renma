<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件-->
<script type="text/javascript" src="/ueditor/ueditor.all.min.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">广告添加</li>
    </ul>
    <form action="/content/content/advert-add" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('确定提交该内容？')){return dataSubmit()}else{
        return false;
    }">
        <input type="hidden" value="<?php echo isset($advert['id'])?$advert['id']:''?>"  name="id" />
        <fieldset>

            <div class="control-group">
                <label for="modulename" class="control-label">广告类型</label>
                <div class="controls">
                    <label for="img" style="display: inline;"><input type="radio" name="fileType" id="img" value="1" <?php if(isset($advert['type']) && $advert['type'] ==1) echo 'checked';?> />&nbsp;&nbsp;图片</label>&nbsp;&nbsp;
                    <label for="mv" style="display: inline;"><input type="radio" name="fileType" id="mv" value="2" <?php if(isset($advert['type']) && $advert['type'] ==2) echo 'checked';?> />&nbsp;&nbsp;视频</label>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">广告状态</label>
                <div class="controls">
                    <label for="st" style="display: inline;"><input type="radio" name="status" id="st" value="1"  <?php if(isset($advert['status']) && $advert['status'] ==1) echo 'checked';?> />&nbsp;&nbsp;启用</label>&nbsp;&nbsp;
                    <label for="sta" style="display: inline;"><input type="radio" name="status" id="sta" value="0" <?php if(isset($advert['status']) && $advert['status'] !=1) echo 'checked';?> />&nbsp;&nbsp;禁用</label>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">广告标题</label>
                <div class="controls">
                    <input type="text" name="title" id="title" value="<?php echo isset($advert['title'])?$advert['title']:''?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">跳转地址</label>
                <div class="controls">
                    <input type="text" name="imageUrl" id="imageUrl" value="<?php echo isset($advert['imageUrl'])?$advert['imageUrl']:''?>" placeholder="图片广告必填" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">广告排序</label>
                <div class="controls">
                    <input type="text" name="rank" id="rank" value="<?php echo isset($advert['rank'])?$advert['rank']:''?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">广告文件</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="url" id="url" value="<?php echo isset($advert['url'])?$advert['url']:''?>" readonly />&nbsp;&nbsp;
                        <a href="#" class="btn btn-info" onclick="upFiles();">上传内容</a>
                    </div>
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
    function dataSubmit(){
        var fileType = $('input[name="fileType"]:checked').val();
        console.log(fileType);
        var url = $('#url').val();
        if(!fileType){
            alert('请选择广告类型');return false;
        }else if(fileType ==1){
            var imageUrl = $('#imageUrl').val();
            if(!imageUrl){
                alert('请填写图片跳转地址');return false;
            }
        }
        if(!url){
            alert('请上传广告内容');return false;
        }
    }
</script>
<script>
    //实例化编辑器
    var o_ueditorupload = UE.getEditor('j_ueditorupload',
        {
            autoHeightEnabled:false
        });
    o_ueditorupload.ready(function ()
    {

        o_ueditorupload.hide();//隐藏编辑器

        //监听图片上传
        // o_ueditorupload.addListener('beforeInsertImage', function (t,arg)
        // {
        //     $('.imageFile').val(arg[0].src);
        //
        // });

        /* 文件上传监听
         * 需要在ueditor.all.min.js文件中找到
         * d.execCommand("insertHtml",l)
         * 之后插入d.fireEvent('afterUpfile',b)
         */
        o_ueditorupload.addListener('afterUpfile', function (t, arg)
        {
            var url = arg[0].url;
            $('#url').val(url);
        });
    });

    //弹出图片上传的对话框
    // function upImage()
    // {
    //     var myImage = o_ueditorupload.getDialog("insertimage");
    //     myImage.open();
    // }
    //弹出文件上传的对话框
    function upFiles()
    {
        var myFiles = o_ueditorupload.getDialog("attachment");
        myFiles.open();
    }

</script>
<script type="text/plain" id="j_ueditorupload"></script>
