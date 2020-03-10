<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/order/index">订单管理</a> <span class="divider">/</span></li>
        <li class="active">订单售后</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/order/order-after" method="get" class="form-horizontal">
        <table class="table">
            <tr>
                <td width="100">订单号：</td>
                <td>
                    <input type="text" name="orderNumber" value="<?php echo isset($_GET['orderNumber'])?$_GET['orderNumber']:'';?>"/>
                </td>
                <td>
                    <button class="btn btn-primary" type="submit">查询</button>
                </td>
            </tr>
        </table>
    </form>
    <form action="/content/order/order-after" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>订单号</th>
                <th>商品名</th>
                <th>商品品牌</th>
                <th>商品钢印时间</th>
                <th>商品条形码</th>
                <th>商品ID</th>
                <th>维修师id</th>
                <th>维修师姓名</th>
                <th>维修师电话</th>
                <th>申请时间</th>
                <th>申请信息</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['id']?></span></td>
                    <td ><span ><?php echo $v['orderNumber']?></span></td>
                    <td ><span>
                            <?php if(isset($v['infos'])){?>
                                <?php
                                foreach( $v['infos'] as $vv) {
                                    ?>
                                    <?php echo $vv?$vv:$v['productName'];?>
                                <?php } }else{?>
                                <?php echo $v['productName'] ?>
                            <?php } ?>
                        </span></td>
                    <td ><span><?php echo $v['brand']?></span></td>
                    <td ><span><?php echo $v['gyTime']?></span></td>
                    <td ><span><?php echo $v['barCode']?></span></td>
                    <td ><span><?php echo $v['productId']?></span></td>
                    <td ><span><?php echo $v['afterUid']?></span></td>
                    <td ><span><?php echo $v['afterName']?></span></td>
                    <td ><span><?php echo $v['afterPhone']?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['afterTime']);?></span></td>
                    <td ><span><?php echo $v['afterMsg']?></span></td>
                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <a class="btn" href="/content/order/order-after-add?id=<?php echo $v['id']; ?>">
                                <?php if($v['afterUid'] > 0) echo '详情';else echo '指派维修师';?>
                            </a>
<!--                            <a class="btn" href="JavaScript:if(confirm('确认删除该物流信息？')){location.href='/content/order/logistics-delete?id=<?php echo $v['id']; ?>'}">删除</a>-->
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
</script>