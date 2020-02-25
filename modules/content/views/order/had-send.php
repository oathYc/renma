<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/order/index">订单管理</a> <span class="divider">/</span></li>
        <li class="active">已发货订单</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/order/had-send" method="get" class="form-horizontal">
        <table class="table">
            <tr>
                <td></td>
            </tr>
        </table>
    </form>
    <form action="/content/order/had-send" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>订单ID</th>
                <th>订单号</th>
                <th>用户uid</th>
                <th>用户名</th>
                <th>商品id</th>
                <th>商品名</th>
                <th>品牌</th>
                <th>订单价格</th>
                <th>使用积分</th>
                <th>订单说明</th>
                <th>物流类型</th>
                <th>物流号</th>
                <th>物流状态</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['id']?></span></td>
                    <td ><span><?php echo $v['orderNumber']?></span></td>
                    <td ><span ><?php echo $v['uid']?></span></td>
                    <td ><span ><?php echo $v['name']?></span></td>
                    <td ><span><?php echo $v['productId']?></span></td>
                    <td ><span>
                            <?php if(isset($v['infos'])){?>
                                <?php
                                foreach( $v['infos'] as $vv) {
                                    ?>
                                    <?php echo $vv;?>
                                <?php } }else{?>
                                <?php echo $v['productTitle'] ?>
                            <?php } ?>
                        </span></td>
                    <td ><span><?php echo $v['brand']?></span></td>
                    <td ><span><?php echo $v['payPrice']?></span></td>
                    <td ><span><?php echo $v['integral']?></span></td>
                    <td ><span><?php echo $v['remark']?></span></td>
                    <td ><span><?php echo $v['logisticsName']?></span></td>
                    <td ><span><?php echo $v['logisticsType']?></span></td>
                    <td ><span><?php echo $v['logisticsStr']?></span></td>
                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <a class="btn" href="JavaScript:if(confirm('确认删除？')){location.href='/content/order/order-delete?id=<?php echo $v['id']; ?>'}">删除</a>
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