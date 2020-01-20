<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/repair/index">维修师栏目</a> <span class="divider">/</span></li>
        <li class="active">维修师审核</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/repair/repair-check" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/repair/repair-check" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>电话</th>
                <th>维修师</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['id']?></span></td>
                    <td ><span ><?php echo $v['repairName']?></span></td>
                    <td ><span><?php echo $v['repairPhone']?></span></td>
                    <td ><span><?php echo $v['repair']==1?'是':'否'?></span></td>
                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <?php if($v['repair'] == -1){?>
                                <a class="btn" href="Javascript:if(confirm('确定进行该操作吗？')){location.href='/content/repair/check-repair?type=1&id=<?php echo $v['id']; ?>';}">同意</a>
                            <?php }else{ ?>
                                <a class="btn" href="Javascript:if(confirm('确定进行该操作吗？')){location.href='/content/repair/check-repair?type=-1&id=<?php echo $v['id']; ?>';}">注销</a>
                           <?php  }?>
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