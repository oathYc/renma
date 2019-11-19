<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/member/index">用户模块</a> <span class="divider">/</span></li>
        <li class="active">用户地址</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/member/user-address" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/member/user-address" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>uid</th>
                <th>姓名</th>
                <th>电话</th>
                <th>省级</th>
                <th>市级</th>
                <th>地区</th>
                <th>详细地址</th>
                <th>默认地址</th>
                <th>创建时间</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['uid']?></span></td>
                    <td ><span ><?php echo $v['name']?></span></td>
                    <td ><span><?php echo $v['phone']?></span></td>
                    <td ><span><?php echo $v['province']?></span></td>
                    <td ><span><?php echo $v['city']?></span></td>
                    <td ><span><?php echo $v['area']?></span></td>
                    <td ><span><?php echo $v['address']?></span></td>
                    <td ><span><?php echo $v['default']==1?'是':'否'?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['createTime']);?></span></td>
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