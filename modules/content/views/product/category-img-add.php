<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件-->
<script type="text/javascript" src="/ueditor/ueditor.all.min.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">商品分类图片修改</li>
    </ul>
    <form action="/content/product/category-img-add" method="post" class="form-horizontal" onsubmit="javascript:if(confirm('确定提交该内容？')){return true}else{
        return false;
    }">
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">商品名称</label>
                <div class="controls">
                    <textarea name="title" readonly><?php echo isset($data['title'])?$data['title']:''?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">分类描述</label>
                <div class="controls">
                    <input type="text" name="cateDesc" value="<?php echo isset($data['cateDesc'])?$data['cateDesc']:''?>"  readonly/>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">分类价格</label>
                <div class="controls">
                    <input type="text" name="price" value="<?php echo isset($data['price'])?$data['price']:''?>"  readonly/>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">分类库存</label>
                <div class="controls">
                    <input type="text" name="number" value="<?php echo isset($data['number'])?$data['number']:''?>"  readonly/>
                </div>
            </div>

            <div class="control-group">
                <label for="modulename" class="control-label">分类图片</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="catImage" id="image" value="<?php echo isset($data['catImage'])?$data['catImage']:''?>" readonly />&nbsp;&nbsp;
                        <a href="#" class="btn btn-info" onclick="upImage();">上传图片</a>
                    </div>
                </div>
            </div>
            <br/>
            <div class="control-group">
                <div class="controls">
                    <input type="hidden" name="id" value="<?php echo isset($data['id'])?$data['id']:''?>" />
                    <input type="submit" class="btn " value="提交">&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </fieldset>
    </form>
</div>
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
