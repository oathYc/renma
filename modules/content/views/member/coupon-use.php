<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/member/index">用户模块</a> <span class="divider">/</span></li>
        <li class="active">优惠券使用</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/member/coupon-use" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/member/coupon-use" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>用户uid</th>
                <th>用户名称</th>
                <th>优惠id</th>
                <th>优惠券金额</th>
                <th>优惠起步价</th>
                <th>优惠券说明</th>
                <th>订单id</th>
                <th>领取时间</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['uid']?></span></td>
                    <td ><span ><?php echo $v['name']?$v['name']:$v['nickname'];?></span></td>
                    <td ><span ><?php echo $v['couponId']?></span></td>
                    <td ><span><?php echo $v['money']?></span></td>
                    <td ><span><?php echo $v['least']?></span></td>
                    <td ><span><?php echo $v['remark']?></span></td>
                    <td ><span><?php echo $v['orderId']?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['ucTime']);?></span></td>

                    <td  class="notSLH" style="width: 247px;">
                        <div>
<!--                            <a class="btn" href="/content/shop/shop-detail?id=--><?php //echo $v['id']; ?><!--">详情</a>-->
<!--                            <a class="btn" href="JavaScript:if(confirm('确认删除该会员？')){location.href='/content/member/member-delete?id=--><?php //echo $v['id']; ?><!--'}">删除</a>-->
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
        <?php use yii\widgets\LinkPager;
        echo LinkPager::widget([
            'pagination' => $page,
        ])?>
    </div>
</div>