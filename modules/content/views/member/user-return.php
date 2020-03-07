<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/member/index">用户模块</a> <span class="divider">/</span></li>
        <li class="active">用户提现</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/member/user-return" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/member/user-return" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>昵称</th>
                <th>提现金额</th>
                <th>提现手续费</th>
                <th>提现总金额</th>
                <th>提现状态</th>
                <th>申请时间</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['id']?></span></td>
                    <td ><span><?php echo $v['nickname']?></span></td>
                    <td ><span ><?php echo $v['money']?></span></td>
                    <td ><span ><?php echo $v['fee']?></span></td>
                    <td ><span><?php echo $v['totalMoney']?></span></td>
                    <td ><span><?php echo $v['status'] == 1?'已提现':'审核中'?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['createTime']);?></span></td>

                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <?php if($v['status'] !=1){?>
                                <a class="btn" href="/content/member/return-success?id=<?php echo $v['id'];?>">同意</a>
                            <?php }?>
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