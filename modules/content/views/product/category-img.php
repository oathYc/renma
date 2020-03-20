<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/product/index">商品模块</a> <span class="divider">/</span></li>
        <li class="active">商品分类图片</li>
    </ul>
    <ul class="nav">
        <li class="dropdown pull-right">
            <a class="dropdown-toggle"
               href="/content/product/category-img-add">添加商品</a>
        </li>
    </ul>
    <form action="/content/product/category-img-add" method="get" class="form-horizontal">
        <table class="table">
            <tr>
                <td width="100">分类图片：</td>
                <td>
                    <select name="type">
                        <option value="1" <?php if(isset($_GET['type']) && $_GET['type'] ==1)echo 'selected';?>>全部</option>
                        <option value="2" <?php if(isset($_GET['type']) && $_GET['type'] ==2)echo 'selected';?>>有</option>
                        <option value="3" <?php if(isset($_GET['type']) && $_GET['type'] ==3)echo 'selected';?>>无</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-primary" type="submit">查询</button>
                </td>
                <td></td>
            </tr>
        </table>
    </form>
    <form action="/content/product/category-img-add" method="post">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>分类ID</th>
                <th>商品ID</th>
                <th>商品名称</th>
                <th>分类描述</th>
                <th>分类价格</th>
                <th>分类库存</th>
                <th>分类图片</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['id']?></span></td>
                    <td ><span><?php echo $v['productId']?></span></td>
                    <td ><span ><?php echo $v['title']?></span></td>
                    <td ><span ><?php echo $v['cateDesc']?></span></td>
                    <td ><span><?php echo $v['price']?></span></td>
                    <td ><span><?php echo $v['number']?></span></td>
                    <td ><span>
                            <?php if($v['catImage']){?>
                                <img src="<?php echo $v['catImage']?>" style="width: 125px;height: 80px;"/>
                            <?php }else{?>
                                暂无图片
                            <?php }?>
                        </span>
                    </td>
                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <a class="btn" href="/content/product/category-img-add?id=<?php echo $v['id']; ?>">修改图片</a>
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