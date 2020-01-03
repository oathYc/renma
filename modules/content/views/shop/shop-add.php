<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件-->
<script type="text/javascript" src="/ueditor/ueditor.all.min.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/shop/index">店铺管理</a> <span class="divider">/</span></li>
        <li class="active">店铺添加</li>
    </ul>
    <form action="/content/shop/shop-add" method="post" class="form-horizontal"  onsubmit="javascript:if(confirm('确定添加该店铺？')){return true;}else{return false;}" >
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺名称</label>
                <div class="controls">
                    <input type="text" name="name" id="name" value=""  />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">联系电话</label>
                <div class="controls">
                    <input type="text" name="phone" id="phone" value=""  />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">营业时间</label>
                <div class="controls">
                    <input type="text" name="shopTime" id="shopTime" value=""  placeholder="08:00-20:00" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺地址（省份）</label>
                <div class="controls">
                    <input type="text" name="province" id="province" value="" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺地址（市级）</label>
                <div class="controls">
                    <input type="text" name="city" id="city" value="" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺地址（地区）</label>
                <div class="controls">
                    <input type="text" name="area" id="area" value="" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺详细地址</label>
                <div class="controls">
                    <input type="text" name="address" id="address" value="" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺封面</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="headImage" id="headImage" value=""  readonly />&nbsp;&nbsp;
                        <a href="#" class="btn btn-info" onclick="upImage();">上传图片</a>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺视频</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="video" id="video" value="" readonly />&nbsp;&nbsp;
                        <a href="#" class="btn btn-info" onclick="upFiles2();">上传视频</a>
                    </div>
                </div>
            </div>

            <div class="control-group">
                <label for="modulename" class="control-label">店铺介绍</label>
                <div class="controls">
                    <textarea name="introduce" ></textarea>
                </div>
            </div>
            <br/>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" class="btn btn-primary" value="提交">
                </div>
            </div>
        </fieldset>
    </form>
</div>

<script>

    function imgDelete(_this){
        //删除对应的图片值
        var imgId = $(_this).attr('data-imgId');
        $('#'+imgId).remove();
        //img 数量减一
        var imgNum = $('#imgDiv').attr('data-imgNum');
        imgNum--;
        $('#imgDiv').attr('data-imgNum',imgNum);
        $(_this).remove();
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
            $('#headImage').val(arg[0].src);

        });

        /* 文件上传监听
         * 需要在ueditor.all.min.js文件中找到
         * d.execCommand("insertHtml",l)
         * 之后插入d.fireEvent('afterUpfile',b)
         */
        o_ueditorupload.addListener('afterUpfile', function (t, arg)
        {
            var str = '';
            var imgNum =  $('#imgDiv').attr('data-imgNum');
            if(!imgNum){
                imgNum = 0;
            }
            for(var t=0;t<arg.length;t++){
                imgNum++;
                str += '<img width="120px" data-imgId="imgId'+imgNum+'" title="双击删除" height="90px" src="'+arg[t].url+'" ondblclick="imgDelete(this)" />&nbsp;&nbsp;';
                str += '<input type="hidden" name="imageFiles[]" value="'+arg[t].url+'" id="imgId'+imgNum+'"/>';
            }
            $('#imgDiv').attr('data-imgNum',imgNum);
            $('#imgDiv').append(str);
        });
    });

    //弹出图片上传的对话框
    function upImage()
    {
        var myImage = o_ueditorupload.getDialog("insertimage");
        myImage.open();
    }
    //弹出文件上传的对话框
    function upFiles()
    {
        var myFiles = o_ueditorupload.getDialog("attachment");
        myFiles.open();
    }

</script>
<script type="text/plain" id="j_ueditorupload"></script>

<script>

    //实例化编辑器
    var o_ueditorupload2 = UE.getEditor('j_ueditorupload2',
        {
            autoHeightEnabled:false
        });
    o_ueditorupload2.ready(function ()
    {

        o_ueditorupload2.hide();//隐藏编辑器

        //监听图片上传
        // o_ueditorupload2.addListener('beforeInsertImage', function (t,arg)
        // {
        //     $('#headMsg').val(arg[0].src);
        //
        // });

        /* 文件上传监听
         * 需要在ueditor.all.min.js文件中找到
         * d.execCommand("insertHtml",l)
         * 之后插入d.fireEvent('afterUpfile',b)
         */
        o_ueditorupload2.addListener('afterUpfile', function (t, arg)
        {
            var url = arg[0].url;
            $('#video').val(url);
        });
    });

    //弹出图片上传的对话框
    // function upImage2()
    // {
    //     var myImage2 = o_ueditorupload2.getDialog("insertimage");
    //     myImage2.open();
    // }
    //弹出文件上传的对话框
    function upFiles2()
    {
        var myFiles2 = o_ueditorupload2.getDialog("attachment");
        myFiles2.open();
    }

</script>
<script type="text/plain" id="j_ueditorupload2"></script>

