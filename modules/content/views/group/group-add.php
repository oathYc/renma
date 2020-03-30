<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件-->
<script type="text/javascript" src="/ueditor/ueditor.all.min.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/group/index">拼团设置</a> <span class="divider">/</span></li>
        <li class="active">组团商品详情</li>
    </ul>
    <form action="#" method="" class="form-horizontal" >
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">团购活动标题</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="title" id="title"  value="<?php echo isset($data['title'])?$data['title']:''?>"  />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">团购活动图片</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="image" id="catImghead" value="<?php echo isset($data['image'])?$data['image']:''?>" readonly />&nbsp;&nbsp;
                        <a href="#" class="btn btn-info" onclick="upImage('head');">上传图片</a>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">团购商品ID</label>
                <div class="controls">
                    <input type="text" name="productId"  id="productId" value="<?php echo isset($data['productId'])?$data['productId']:'';?>" onkeyup="value = value.replace(/[^,0-9]/g,'')" placeholder="多个id英文逗号隔开"/>&nbsp;&nbsp;
                    <a href="#" class="btn btn-info" onclick="getProduct()">确认</a>
                </div>
                <div class="controls" id="productPrice">

                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">有效时间</label>
                <div class="controls">
                    <input type="text" name="day"  id="day" onkeyup="value = value.replace(/[^0-9.]/g,'')" value="<?php echo isset($data['day'])?$data['day']:'';?>" placeholder="单位天 默认1天" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">组团人数</label>
                <div class="controls">
                    <input type="text" name="number"  id="number" onkeyup="value = value.replace(/[^0-9]/g,'')" value="<?php echo isset($data['number'])?$data['number']:'2';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">组团排序</label>
                <div class="controls">
                    <input type="text" name="rank"  id="rank" onkeyup="value = value.replace(/[^0-9]/g,'')" value="<?php echo isset($data['rank'])?$data['rank']:'';?>" />
                </div>
            </div>
            <br/>
            <div class="control-group">
                <div class="controls">
                    <input type="hidden" name="id" value="<?php echo isset($data['id'])?$data['id']:'';?>" />
                    <intpu type="hidden" id="groupImgId" value="" />
                    <input type="button" class="btn " value="提交" onclick="groupCheck()">&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </fieldset>
    </form>
</div>
<script>
    function getProduct(){
        var productIds = $('#productId').val();
        if(!productIds){
            alert('请填写团购商品id');return false;
        }
        $.post("/content/api/get-group-product",{ids:productIds},function(e){
                var str = '';
                for(var i = 0;i< e.data.length;i++){
                    var catData = e.data;
                    str += '<div class="catPrice"><br>';
                    str += '<span>商品ID：'+catData[i].id+' &nbsp;'+catData[i].title+'</span>（'+catData[i].brand+'）&nbsp;&nbsp;&nbsp;&nbsp;';
                    str += '<input type="text" style="width: 70px;" onchange="updatePrice(this,'+catData[i].id+')" placeholder="封面价格" onkeyup="value = value.replace(/[^.0-9]/g,\'\')" />&nbsp;&nbsp;&nbsp;&nbsp;';
                    var catPrice = catData[i].catData;
                    for(var j=0;j<catPrice.length;j++){
                        str += '<div class="catPriceDiv">';
                        str += '<input type="hidden" value="'+catPrice[j].productId+'" class="productIdInput" />';
                        str += '<input type="hidden" value="'+catPrice[j].catPriceId+'" class="catPriceIdInput" />';
                        str += '<span>'+catPrice[j].str+'</span>&nbsp;&nbsp;';
                        str += '<input type="text" style="width: 70px;" class="groupPriceInput" placeholder="组团价格" onkeyup="value = value.replace(/[^.0-9]/g,\'\')" />&nbsp;&nbsp;&nbsp;&nbsp;';
                        str += '<input type="hidden" style="width: 70px;" class="groupHeadInput groupHeadInput'+catData[i].id+'" placeholder="封面价格" />&nbsp;&nbsp;&nbsp;&nbsp;';
                        // str += '<input type="text"  id="catImg'+catPrice[j].catPriceId+'"  placeholder="分类图片" onkeyup="value = value.replace(/[^.0-9]/g,\'\')" class="catImageInput" />&nbsp;&nbsp;&nbsp;&nbsp;';
                        // str += '<a href="#" class="btn btn-info" onclick="upImage('+catPrice[j].catPriceId+');">上传图片</a>';
                        str += '<br></div><br>';
                    }
                    str += '<br></div>';
                }
                $('#productPrice').html(str);
            },'json');
    }
    function groupCheck(){
        if(confirm('一旦修改便不可再修改，确认提交？')){
            var title = $('#title').val();
            var img = $('#catImghead').val();
            var productIds = $('#productId').val();
            var day = $('#day').val();
            var number = $('#number').val();
            var rank =$('#rank').val();
            var cont = 0;
            var arr = new Array();
            if(!title){
                alert('请上传团购活动标题');
                return false;
            }
            if(!img){
                alert('请上传团购活动图片');
                return false;
            }
            if(!productIds){
                alert('请填写组团商品id');
                return false;
            }
            $('#productPrice .catPrice .catPriceDiv').each(function(index,data){
                cont++;
                var productId = $(this).find(".productIdInput").val();
                var catPriceId = $(this).find(".catPriceIdInput").val();
                var groupPrice = $(this).find(".groupPriceInput").val();
                var headPrice = $(this).find(".groupHeadInput").val();
                // var catImage = $(this).find(".catImageInput").val();
                arr[index] = productId+'-'+catPriceId+'-'+groupPrice+'-'+headPrice;
            });
            if(cont < 1){
                alert('请获取有效的商品信息（点击确认按钮）');
                return false;
            }
            $.post(
                "/content/group/group-product-add",
                {image:img,productId:productIds,day:day,number:number,rank:rank,catData:arr,title:title},
                function(e){
                    alert(e.message);
                    if(e.code == 1){
                        location.href = '/content/group/product-group';
                    }
                },
                'json');
        }else{
            return false;
        }
    }
    function updatePrice(_this,pid){
        var val = $(_this).val();
        var str = '.groupHeadInput'+pid;
        $(str).val(val);
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
            var str = $('#groupImgId').val();
            var obj = '#'+str;
            $(obj).val(arg[0].src);

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
    function upImage(catPriceId)
    {
        var str = 'catImg'+catPriceId;
        $('#groupImgId').val(str);
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


