<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/ueditor/ueditor.all.min.js"></script>
<!-- 编辑器公式插件 -->
<!-- 树形菜单选择 -->
<link rel="stylesheet" type="text/css" href="/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css">
<script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>

<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">添加分类</li>
    </ul>

    <form action="/content/product/category-add" method="post" class="form-horizontal" onsubmit="return dataSubmit()">
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">父级分类</label>
                <div class="controls">
                    <select style="width: 400px" id="contentcatid"  url='/content/api/category-tree?pid=0<?php echo isset($data["id"])?"&id=".$data["id"]:""?>' class="main autocombox input-medium easyui-combotree">
                    </select><br/><br/>
                    <input type="hidden" name="category[pid]" value="<?php echo isset($_GET['pid'])?$_GET['pid']:''?><?php echo isset($data['pid'])?$data['pid']:''?>" >
                </div>
            </div>

            <div class="control-group">
                <label for="modulename" class="control-label">分类名称</label>
                <div class="controls">
                    <input type="text" id="name" name="category[name]" value="<?php echo isset($data['name'])?$data['name']:''?>">
                    <span class="help-block">请输入分类名称</span>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">分类图片</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="image" id="image" placeholder="请上传png格式的图片" value="<?php echo isset($data['image'])?$data['image']:''?>" readonly />&nbsp;&nbsp;
                        <a href="#" class="btn btn-info" onclick="upImage();">上传图片</a>
                    </div>
                </div>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <img id="imgDiv"  src="<?php echo isset($data['image'])?$data['image']:''?>" />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">排序</label>
                <div class="controls">
                    <input type="text" id="rank" name="category[rank]" value="<?php echo isset($data['rank'])?$data['rank']:''?>">
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input name="id" type="hidden" value="<?php echo isset($id)?$id:''?>">
                    <input type="submit"  class="btn btn-primary" value="提交">
                </div>
            </div>

        </fieldset>
    </form>
</div>
<?php
if(isset($id)){
    ?>
    <script>
        $('.main').tree({
            onLoadSuccess: function (newValue, oldValue) {
                $('.main').combotree('setValue', <?php echo isset($data['pid'])?$data['pid']:''?>);
            }
        })
    </script>
<?php
}
?>
<?php
if(isset($_GET['pid'])) {
    ?>
    <script>
        $('.main').tree({
            onLoadSuccess: function (newValue, oldValue) {
                $('.main').combotree('setValue', <?php echo isset($_GET['pid'])?$_GET['pid']:''?>);
            }
        })
    </script>
<?php
}
?>
<script>
    $('.main').combotree({
        onClick: function (node) {
            $("input[name='category[pid]']").val(node.id);
        }
    })

    $('.vice').combotree({
        onCheck:function(newValue,oldValue){
            var nodes = $('.vice').combotree('getValues');
            $("input[name='category[secondClass]']").val(nodes);
        }
    });
</script>
<script>
    function dataSubmit(){
        var name = $('#name').val();
        if(!name){
            alert('请填写分类名称');
            return false;
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
            $('#imgDiv').attr('src',arg[0].src);

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