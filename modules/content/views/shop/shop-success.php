<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/shop/index">店铺管理</a> <span class="divider">/</span></li>
        <li class="active">店铺信息</li>
    </ul>
    <ul class="nav">
    </ul>
    <form action="/content/shop/shop-success" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/shop/shop-success" method="get">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>店铺名</th>
                <th>电话</th>
                <th>营业时间</th>
                <th>详细地址</th>
                <th>上线时间</th>
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
                    <td ><span ><?php echo $v['name']?></span></td>
                    <td ><span><?php echo $v['phone']?></span></td>
                    <td ><span><?php echo $v['shopTime']?></span></td>
                    <td ><span><?php echo $v['province'].$v['city'].$v['area'].$v['address']?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['checkTime']);?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['createTime']);?></span></td>

                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <a class="btn" href="/content/shop/shop-detail?id=<?php echo $v['id']; ?>">详情</a>
                            <a class="btn" href="JavaScript:if(confirm('确认删除该店铺？')){location.href='/content/shop/shop-delete?id=<?php echo $v['id']; ?>'}">删除</a>
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