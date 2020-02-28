<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件-->
<script type="text/javascript" src="/ueditor/ueditor.all.min.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">图片设置</li>
    </ul>
    <form action="/content/content/set-image" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('确定提交该内容？')){return true}else{
        return false;
    }">
        <input type="hidden" name="id" id="id" value="<?php echo isset($data['id'])?$data['id']:0;?>"
        <fieldset>

            <div class="control-group">
                <label for="modulename" class="control-label">图片类型</label>
                <div class="controls">
                    <select name="type" id="type" onchange="selectType()">
                        <option value="0">请选择</option>
                        <?php foreach($types as $k => $v){?>
                            <option value="<?php echo $v['type']?>" <?php if(isset($data['type']) && $data['type'] == $v['type']) echo 'selected';?> ><?php echo $v['name']?></option>
                        <?php }?>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">图片</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="image" id="image" value="<?php echo isset($data['image'])?$data['image']:''?>" readonly />&nbsp;&nbsp;
                        <a href="#" class="btn btn-info" onclick="upImage();">上传图片</a>
                    </div>
                </div>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <img id="imgDiv"  src="<?php echo isset($data['image'])?$data['image']:''?>" />
                    </div>
                </div>
            </div>
            <br/>
            <div class="control-group">
                <label for="modulename" class="control-label">内容说明</label>
                <div class="controls">
                    <textarea name="content" id="content"><?php echo isset($data['content'])?$data['content']:''?></textarea>
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
    function selectType(){
        var type = $('#type').val();
        if(type){
            $.post('/content/api/select-type',{type:type},function(e){
                if(e.data ){
                    $('#image').val(e.data.image);
                    $('#imgDiv').attr('src',e.data.image);
                    $('#content').val(e.data.content);
                    $('#id').val(e.data.id);
                }else{
                    $('#image').val('');
                    $('#imgDiv').attr('src','');
                    $('#content').val('');
                    $('#id').val('');
                }
            },'json');
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
        o_ueditorupload.addListener('beforeInsertImage', function (t,arg)
        {

            $('#image').val(arg[0].src);

        });

        /* 文件上传监听
         * 需要在ueditor.all.min.js文件中找到
         * d.execCommand("insertHtml",l)
         * 之后插入d.fireEvent('afterUpfile',b)
         */
        // o_ueditorupload.addListener('afterUpfile', function (t, arg)
        // {
        //     var url = arg[0].url;
        //     $('#url').val(url);
        // });
    });

    //弹出图片上传的对话框
    function upImage()
    {
        var myImage = o_ueditorupload.getDialog("insertimage");
        myImage.open();
    }
    //弹出文件上传的对话框
    // function upFiles()
    // {
    //     var myFiles = o_ueditorupload.getDialog("attachment");
    //     myFiles.open();
    // }

</script>
<script type="text/plain" id="j_ueditorupload"></script>

