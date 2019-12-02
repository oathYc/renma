<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/order/index">订单模块</a> <span class="divider">/</span></li>
        <li class="active">质保商品</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/order/quality-product" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/order/quality-product" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>订单号</th>
                <th>商品名</th>
                <th>商品ID</th>
                <th>订单价格</th>
                <th>收货人</th>
                <th>联系电话</th>
                <th>物流号</th>
                <th>物流类型</th>
                <th>物流状态</th>
                <th>物流发送时间</th>
                <th>物流收货地址</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['orderId']?></span></td>
                    <td ><span ><?php echo $v['orderNumber']?></span></td>
                    <td ><span><?php echo $v['productName']?></span></td>
                    <td ><span><?php echo $v['productId']?></span></td>
                    <td ><span><?php echo $v['price']?></span></td>
                    <td ><span><?php echo $v['name']?></span></td>
                    <td ><span><?php echo $v['phone']?></span></td>
                    <td ><span><?php echo $v['logistics']?></span></td>
                    <td ><span><?php echo $v['logisticsName']?></span></td>
                    <td ><span><?php echo $v['logisticsStatus']?></span></td>
                    <td ><span><?php echo $v['logisticsTime']?date('Y-m-d H:i:s',$v['logisticsTime']):'';?></span></td>
                    <td ><span><?php echo $v['logisticsAddress']?></span></td>

                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <a class="btn" href="/content/order/logistics-add?id=<?php echo $v['orderId']; ?>">物流</a>
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