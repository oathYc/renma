<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">会员充值设置</li>
    </ul>
    <ul class="nav">
        <li class="dropdown pull-right">
            <a class="dropdown-toggle"
               href="/content/content/recharge-add">添加充值设置</a>
        </li>
    </ul>
    <form action="/content/content/member-recharge" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/content/member-recharge" method="post">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>上传商品数</th>
                <th>原价</th>
                <th>优惠价</th>
                <th>充值说明</th>
                <th>会员等级</th>
                <th>排序值</th>
                <th>创建时间</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach($data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['id']?></span></td>
                    <td ><span ><?php echo $v['title']?></span></td>
                    <td ><span ><?php echo $v['upload']?></span></td>
                    <td ><span ><?php echo $v['oldPrice']?></span></td>
                    <td ><span ><?php echo $v['price']?></span></td>
                    <td ><span ><?php echo $v['remark']?></span></td>
                    <td ><span ><?php echo $v['level']?></span></td>
                    <td ><span ><?php echo $v['rank']?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['createTime']);?></span></td>

                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <a class="btn" href="/content/content/recharge-add?id=<?php echo $v['id']; ?>">修改</a>
                            <a class="btn" href="JavaScript:if(confirm('确认删除该内容？')){location.href='/content/content/recharge-delete?id=<?php echo $v['id']; ?>'}">删除</a>
                        </div>
                    </td>
                </tr>
                <?php
            }
            ?>
            </tbody>
        </table>
    </form>
</div>