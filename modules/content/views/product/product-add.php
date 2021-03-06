<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件-->
<script type="text/javascript" src="/ueditor/ueditor.all.min.js"></script>
<style>
    #catPriceDiv tr td{
        border:2px solid #eeeeee;
        min-width: 100px;
    }
</style>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/product/index">商品模块</a> <span class="divider">/</span></li>
        <li class="active">商品编辑</li>
    </ul>
    <form action="/content/product/product-add" method="post"  class="form-horizontal"  onsubmit="javascript:if(confirm('确定进行该操作？')){return true;}else{return false;}" >
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">商品类型</label>
                <div class="controls">
                    <label for="wx" style="display:inline;">
                        维修
                        <input type="radio" id="wx" name="submit[type]" value="1" <?php if(isset($data['type']) && $data['type'] ==1) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="xc" style="display:inline;">
                        新车
                        <input type="radio" id="xc" name="submit[type]" value="2" <?php if(isset($data['type']) && $data['type'] ==2) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="esc" style="display:inline;">
                        二手车
                        <input type="radio"  id='esc' name="submit[type]" value="3" <?php if(isset($data['type']) && $data['type'] ==3) echo 'checked';?> />
                    </label>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">适用性别</label>
                <div class="controls">
                    <label for="all" style="display:inline;">
                        通用
                        <input type="radio" id="all" name="submit[sex]" value="0" <?php if(isset($data['sex']) && $data['sex'] ==0) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="nan" style="display:inline;">
                        男
                        <input type="radio" id="nan" name="submit[sex]" value="1" <?php if(isset($data['sex']) && $data['sex'] ==1) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="nv" style="display:inline;">
                        女
                        <input type="radio"  id='nv' name="submit[sex]" value="2" <?php if(isset($data['sex']) && $data['sex'] ==2) echo 'checked';?> />
                    </label>

                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">质保商品</label>
                <div class="controls">
                    <label for="yes" style="display:inline;">
                        是
                        <input type="radio" id="yes" name="submit[zhibao]" value="1" <?php if(isset($data['zhibao']) && $data['zhibao'] ==1) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="nv" style="display:inline;">
                        否
                        <input type="radio"  id='nv' name="submit[zhibao]" value="0" <?php if(isset($data['zhibao']) && $data['zhibao'] != 1) echo 'checked';?> />
                    </label>

                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">一级分类</label>
                <div class="controls">
                    <select name="submit[catPid]">
                        <option value="0">请选择</option>
                        <?php foreach($catPid as $k => $v){?>
                            <option value="<?php echo $v['id']?>" <?php if(isset($data['catPid']) && $data['catPid'] == $v['id']) echo 'selected';?>><?php echo $v['name']?></option>
                        <?php }?>
                    </select>

                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">二级分类</label>
                <div class="controls">
                    <select name="submit[catCid]">
                        <option value="0">请选择</option>
                        <?php foreach($catCid as $k => $v){?>
                            <option value="<?php echo $v['id']?>" <?php if(isset($data['catCid']) && $data['catCid'] == $v['id']) echo 'selected';?>><?php echo $v['name']?></option>
                        <?php }?>
                    </select>

                </div>
            </div>

            <div class="control-group">
                <label for="modulename" class="control-label">商品名称</label>
                <div class="controls">
                    <input type="text" name="submit[title]"  id="title" value="<?php echo isset($data['title'])?$data['title']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品价格</label>
                <div class="controls">
                    <input type="text" name="submit[price]"  id="price" onkeyup="value = value.replace(/[^.0-9]/g,'')" value="<?php echo isset($data['price'])?$data['price']:'';?>"  placeholder="商品封面价格"/>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品分类价格</label>
                <div class="controls">
                    分类描述：<input type="text"  name="condition" id='catDesc' value=""/>&nbsp;&nbsp;&nbsp;&nbsp;
                    分类价格：<input type="text" style="width:120px" name="propId" id='catPrice' onkeyup="value = value.replace(/[^.0-9]/g,'')" autocomplete="off" value="" />&nbsp;&nbsp;&nbsp;&nbsp;
                    分类库存：<input type="text" style="width:120px" id='number' onkeyup="value = value.replace(/[^.0-9]/g,'')" autocomplete="off" value="" />
                    &nbsp;&nbsp;&nbsp;<a href="#" class="btn" onclick="addPrice(this)">添加</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div><br/>
                <div class="controls">
                    <table  class="nav " id="catPriceDiv" >
                        <?php if(isset($data['priceCat'])){
                            foreach($data['priceCat'] as $k => $v) {
                                ?>
                                <tr>
                                    <td>
                                        <?php echo $v['cateDesc']?>：<?php echo $v['price']?>元 ： 库存 <?php echo $v['number']?>
                                        <input type="hidden" value="<?php echo $v['id'].'-'.$v['cateDesc'].'-'.$v['price'].'-'.$v['number']?>" name="submit[priceCat][]"/>&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td><a href="#" style="display: inline;" onclick="deleteCont(this)">&nbsp;&nbsp;&nbsp;&nbsp;删除</a></td>
                                </tr>
                                <?php
                            }
                        }?>
                    </table>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">联系电话</label>
                <div class="controls">
                    <input type="text" name="submit[phone]"  id="phone" value="<?php echo isset($data['phone'])?$data['phone']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">交易地址</label>
                <div class="controls">
                    <input type="text" name="submit[tradeAddress]"  id="tradeAddress" value="<?php echo isset($data['tradeAddress'])?$data['tradeAddress']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品品牌</label>
                <div class="controls">
                    <input type="text" name="submit[brand]"  id="brand" value="<?php echo isset($data['brand'])?$data['brand']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品库存</label>
                <div class="controls">
                    <input type="text" name="submit[number]"  id="number" onkeyup="value = value.replace(/[^0-9]/g,'')" value="<?php echo isset($data['number'])?$data['number']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品电压</label>
                <div class="controls">
                    <select name="submit[voltage]" id="voltage">
                        <option value="0">请选择</option>
                        <?php foreach($voltage as $k => $v){?>
                            <option value="<?php echo $v['val']?>" <?php if(isset($data['voltage']) && $data['voltage'] == $v['val']) echo 'selected';?>><?php echo $v['val']?></option>
                        <?php }?>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">续航里程</label>
                <div class="controls">
                    <select name="submit[mileage]" id="mileage">
                        <option value="0">请选择</option>
                        <?php foreach($mileage as $k => $v){?>
                            <option value="<?php echo $v['val']?>" <?php if(isset($data['mileage']) && $data['mileage'] == $v['val']) echo 'selected';?>><?php echo $v['val']?></option>
                        <?php }?>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品说明</label>
                <div class="controls">
                    <textarea name="submit[remark]" id="remark" ><?php echo isset($data['remark'])?$data['remark']:'';?></textarea>
                </div>
            </div>

            <div class="control-group">
                <label for="modulename" class="control-label">商品视频</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="submit[video]" id="video" value="<?php echo isset($data['video'])?$data['video']:''?>" readonly />&nbsp;&nbsp;
                        <a href="#" class="btn btn-info" onclick="upFiles2();">上传视频</a>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品封面</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <input type="text" name="submit[headMsg]" id="headMsg" value="<?php echo isset($data['headMsg'])?$data['headMsg']:''?>" readonly />&nbsp;&nbsp;
                        <a href="#" class="btn btn-info" onclick="upImage();">上传图片</a>
                    </div>
                </div>
            </div>

            <div class="control-group">
                <label for="modulename" class="control-label">商品轮播图</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <a href="#" class="btn btn-info" onclick="upFiles3();">上传内容</a>
                    </div>
                </div>
                <div class="controls" id="imgDivLp" data-imgNum="<?php echo isset($data['headImgs'])?count($data['headImgs']):0?>">
                    <?php if(isset($data['headImgs']) && is_array($data['headImgs'])) { ?>
                        <?php foreach ($data['headImgs'] as $k => $v) { ?>
                            <img width="120px" data-imgId="img3Id<?php echo $k + 1; ?>" title="双击删除" height="90px"
                                 src="<?php echo $v; ?>" ondblclick="imgDelete3(this)" />&nbsp;&nbsp;
                            <input type="hidden" name="imageFiles3[]" value="<?php echo $v; ?>"
                                   id="img3Id<?php echo $k + 1; ?>"/>
                        <?php }
                    }?>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品图片</label>
                <div class="controls">
                    <div style="margin-bottom: 10px" >
                        <a href="#" class="btn btn-info" onclick="upFiles();">上传内容</a>
                    </div>
                </div>
                <div class="controls" id="imgDiv" data-imgNum="<?php echo isset($data['image'])?count($data['image']):0?>">
                    <?php if(isset($data['image']) && is_array($data['image'])) { ?>
                        <?php foreach ($data['image'] as $k => $v) { ?>
                            <img width="120px" data-imgId="imgId<?php echo $k + 1; ?>" title="双击删除" height="90px"
                                 src="<?php echo $v; ?>" ondblclick="imgDelete(this)" />&nbsp;&nbsp;
                            <input type="hidden" name="imageFiles[]" value="<?php echo $v; ?>"
                                   id="imgId<?php echo $k + 1; ?>"/>
                        <?php }
                    }?>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品详情</label>
                <div class="controls">
                    <textarea name="submit[introduce]" id="introduce" ><?php echo isset($data['introduce'])?$data['introduce']:'';?></textarea>
                </div>
            </div>
            <br/>
            <div class="control-group">
                <div class="controls">
                    <input type="hidden" name="id"  value="<?php echo isset($data['id'])?$data['id']:'';?>" />
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


    function imgDelete3(_this){
        //删除对应的图片值
        var img3Id = $(_this).attr('data-imgId');
        $('#'+img3Id).remove();
        //img 数量减一
        var imgNum = $('#imgDivLp').attr('data-imgNum');
        imgNum--;
        $('#imgDivLp').attr('data-imgNum',imgNum);
        $(_this).remove();
    }

    function addPrice(){
        var desc = $('#catDesc').val();
        var price = $('#catPrice').val();
        var number = $('#number').val();
        if(!desc){
            alert('请填写分类描述');return false;
        }
        if(!price){
            alert('请填写分类价格');return false;
        }
        if(!price){
            alert('请填写分类库存');return false;
        }
        var str = '<tr><td>'+desc+'：'+price+'元 '+' 库存'+number+'<input type="hidden" value="0-'+desc+'-'+price+'-'+number+'" name="submit[priceCat][]" /></td>';
        str += '<td><a href="#" style="display: inline;" onclick="deleteCont(this)">&nbsp;&nbsp;&nbsp;&nbsp;删除</a></td></tr>';
        $('#catPriceDiv').append(str);
    }
    function deleteCont(_this){
        $(_this).parents('tr').remove();
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
            $('#headMsg').val(arg[0].src);

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

<script>

    //实例化编辑器
    var o_ueditorupload3 = UE.getEditor('j_ueditorupload3',
        {
            autoHeightEnabled:false
        });
    o_ueditorupload3.ready(function ()
    {

        o_ueditorupload3.hide();//隐藏编辑器

        //监听图片上传
        o_ueditorupload3.addListener('beforeInsertImage', function (t,arg)
        {
            $('#headMsg').val(arg[0].src);

        });

        /* 文件上传监听
         * 需要在ueditor.all.min.js文件中找到
         * d.execCommand("insertHtml",l)
         * 之后插入d.fireEvent('afterUpfile',b)
         */
        o_ueditorupload3.addListener('afterUpfile', function (t, arg)
        {
            var str = '';
            var imgNum =  $('#imgDivLp').attr('data-imgNum');
            if(!imgNum){
                imgNum = 0;
            }
            for(var t=0;t<arg.length;t++){
                imgNum++;
                str += '<img width="120px" data-imgId="img3Id'+imgNum+'" title="双击删除" height="90px" src="'+arg[t].url+'" ondblclick="imgDelete3(this)" />&nbsp;&nbsp;';
                str += '<input type="hidden" name="imageFiles3[]" value="'+arg[t].url+'" id="img3Id'+imgNum+'"/>';
            }
            $('#imgDivLp').attr('data-imgNum',imgNum);
            $('#imgDivLp').append(str);
        });
    });

    //弹出文件上传的对话框
    function upFiles3()
    {
        var myFiles3 = o_ueditorupload3.getDialog("attachment");
        myFiles3.open();
    }

</script>
<script type="text/plain" id="j_ueditorupload3"></script>
