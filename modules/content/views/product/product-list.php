<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/product/index">商品模块</a> <span class="divider">/</span></li>
        <li class="active">商品列表</li>
    </ul>
    <ul class="nav">
        <li class="dropdown pull-right">
            <a class="dropdown-toggle"
               href="/content/product/product-add">添加商品</a>
        </li>
    </ul>
    <form action="/content/product/product-list" method="get" class="form-horizontal">
        <table class="table">
            <tr>
                <td width="100">商品类型：</td>
                <td>
                    <select name="type">
                        <option value="1" <?php if(isset($_GET['type']) && $_GET['type'] ==1)echo 'selected';?>>维修</option>
                        <option value="2" <?php if(isset($_GET['type']) && $_GET['type'] ==2)echo 'selected';?>>新车</option>
                        <option value="3" <?php if(isset($_GET['type']) && $_GET['type'] ==3)echo 'selected';?>>二手车</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-primary" type="submit">查询</button>
                </td>
                <td></td>
            </tr>
        </table>
    </form>
    <form action="/content/product/product-list" method="post">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>名称</th>
                <th>价格</th>
                <th>电压</th>
                <th>续航里程</th>
                <th>交易地点</th>
                <th>品牌名称</th>
                <th>商品类型</th>
                <th>商品分类</th>
                <th>上传时间</th>
                <th>服务费/元</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['id']?></span></td>
                    <td ><span ><?php echo $v['title']?></span></td>
                    <td ><span><?php echo $v['price']?></span></td>
                    <td ><span><?php echo $v['voltage']?></span></td>
                    <td ><span><?php echo $v['mileage']?></span></td>
                    <td ><span><?php echo $v['tradeAddress']?></span></td>
                    <td ><span><?php echo $v['brand']?></span></td>
                    <td ><span><?php echo $v['category']?></span></td>
                    <td ><span><?php echo $v['desc']?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['createTime']);?></span></td>
                    <td>
                        <span>
                            <input type="text" style="width: 140px;" onkeyup="value = value.replace(/[^.0-9]/g,'')" id="serverFee<?php echo $kss;?>" value="<?php echo $v['serverFee'];?>"  />
                            <input type="button" class="btn" value="提交" style="position: relative;top: -5px;" onclick="setServerFee(<?php echo $kss;?>,<?php echo $v['id']?>)" />
                        </span>
                    </td>
                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <a class="btn" href="/content/product/product-add?id=<?php echo $v['id']; ?>">修改</a>
                            <a class="btn" href="JavaScript:if(confirm('确认删除该商品？')){location.href='/content/product/product-delete?id=<?php echo $v['id']; ?>'}">删除</a>
                        </div>
                    </td>
                </tr>
                <?php
            }
            ?>
            </tbody>
        </table>
    </form>
    <div class="pagination pagination-right">
        <span style="font-size: 17px;position: relative;bottom: 7px;">共<?php echo $count;?>条&nbsp;</span>
<!--        --><?php //if($count > 200){?>
<!--            <span style="font-size: 17px;position: relative;bottom: 5px;">-->
<!--            <a onclick="jumpPage()">Go</a>&nbsp;-->
<!--            <input type="text" style="width: 20px;height: 18px;" id="jumpPage">&nbsp;页-->
<!--        </span>-->
<!--        --><?php //}?>
        <?php use yii\widgets\LinkPager;
        echo LinkPager::widget([
            'pagination' => $page,
        ])?>
    </div>
</div>
<script>
    function jumpPage(){
        var page = $("#jumpPage").val();
        if(isNaN(page) || page <= 0 || !page){
            alert('请输入正确的数值');
            return false;
        }
        location.href = '/content/rule/role?page='+page;
    }
    function setServerFee(site,productId){
        var str = '#serverFee'+site;
        var fee = $(str).val();
        if(!fee){
            fee = 0;
        }
        if(confirm('确认修改该商品服务费为'+fee+'元？')){
            $.post('/content/api/set-server-fee',{productId:productId,serverFee:fee},function(e){
                alert(e.message);
                if(e.code !=1){
                    window.location.reload();
                }
            },'json');
        }
    }
</script>