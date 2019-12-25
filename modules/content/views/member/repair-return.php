<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/member/index">用户模块</a> <span class="divider">/</span></li>
        <li class="active">维修师提现</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/member/repair-return" method="get" class="form-horizontal">
        <table class="table">
            <tr>
                <td>
                    维修师uid：
                </td>
                <td>
                    <input style="height: 20px" type="text" size="10" id="uid"  name="uid" value="<?php echo isset($_GET['uid'])?$_GET['uid']:''?>"/>
                </td>
                <td>
                    提现状态：
                </td>
                <td>
                    <select name="type">
                        <option value="99">请选择</option>
                        <option value='0' <?php if(isset($_GET['type']) && $_GET['type'] == 0) echo 'selected';?>>待审核</option>
                        <option value='1' <?php if(isset($_GET['type']) && $_GET['type'] == 1) echo 'selected';?>>已提现</option>
                    </select>
                </td>
                <td>
                    <button class="btn btn-primary" type="submit">查询</button>
                </td>
                <td></td>
            </tr>
        </table>
    </form>
    <form action="/content/member/repair-return" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>维修师uid</th>
                <th>维修师姓名</th>
                <th>维修师电话</th>
                <th>提现金额</th>
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
                    <td ><span><?php echo $v['uid']?></span></td>
                    <td ><span ><?php echo $v['name']?></span></td>
                    <td ><span><?php echo $v['phone']?></span></td>
                    <td ><span><?php echo $v['money']?></span></td>
                    <td ><span><?php echo $v['status']==1?'已提现':'待审核'?></span></td>
                    <td ><span><?php echo date('Y-m-d',$v['createTime'])?></span></td>
                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <?php if($v['status'] == 0){?>
                                <a class="btn" href="Javascript:if(confirm('确定进行该操作吗？')){location.href='/content/member/check-repair-return?id=<?php echo $v['id']; ?>';}">提现通过</a>
                           <?php  }?>
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