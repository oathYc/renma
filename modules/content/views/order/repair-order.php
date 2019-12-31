<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/order/index">订单模块</a> <span class="divider">/</span></li>
        <li class="active">维修订单</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/order/repair-order" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/order/repair-order" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>订单号</th>
                <th>维修师uid</th>
                <th>维修师姓名</th>
                <th>维修师电话</th>
                <th>商品id</th>
                <th>商品名</th>
                <th>订单价格</th>
                <th>订单状态</th>
                <th>订单说明</th>
                <th>完成图片</th>
                <th>完成时间</th>
<!--                <th >操作</th>-->
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td style="width: 80px;"><span><?php echo $v['id']?></span></td>
                    <td ><span><?php echo $v['orderNumber']?></span></td>
                    <td ><span ><?php echo $v['repairUid']?></span></td>
                    <td ><span ><?php echo $v['repairName']?></span></td>
                    <td ><span ><?php echo $v['repairPhone']?></span></td>
                    <td ><span><?php echo $v['productId']?></span></td>
                    <td ><span><?php echo $v['productTitle']?></span></td>
                    <td ><span><?php echo $v['payPrice']?></span></td>
                    <td ><span><?php echo $v['status']?></span></td>
                    <td ><span><?php echo $v['remark']?></span></td>
                    <td ><span><?php echo $v['repairImg']?></span></td>
                    <td ><span><?php echo $v['repairSuccess']?date('Y-m-d H:i:s',$v['repairSuccess']):'';?></span></td>
                    <td  class="notSLH" style="width: 247px;">
                        <div>
<!--                            <a class="btn" href="/content/content/repair-order-detail?id=--><?php //echo $v['id']; ?><!--">详情</a>-->
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