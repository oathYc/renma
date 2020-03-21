<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/group/index">商品模块</a> <span class="divider">/</span></li>
        <li class="active">商品组团</li>
    </ul>
    <ul class="nav">
        <li class="dropdown pull-right">
            <a class="dropdown-toggle"
               href="/content/group/group-product-add">添加组团</a>
        </li>
    </ul>
    <form action="/content/group/group-product" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/group/group-product" method="post">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>组团ID</th>
                <th>组团标题</th>
                <th>图片</th>
                <th>商品ID</th>
                <th>有效时间（天）</th>
                <th>组团人数</th>
                <th>商品详情</th>
                <th>组团排序</th>
                <th>上传时间</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach( $data as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['id']?></span></td>
                    <td ><span><?php echo $v['title']?></span></td>
                    <td ><span ><img src="<?php echo $v['headImage']?>" style="width: 125px;height: 80px;"/></span></td>
                    <td ><span><?php echo $v['productIds']?></span></td>
                    <td ><span><?php echo $v['day']?></span></td>
                    <td ><span><?php echo $v['number']?></span></td>
                    <td ><span><?php echo $v['catData']?></span></td>
                    <td ><span><?php echo $v['rank']?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['createTime']);?></span></td>

                    <td  class="notSLH" style="width: 247px;">
                        <div>
<!--                            <a class="btn" href="/content/group/group-product-add?id=--><?php //echo $v['id']; ?><!--">详情</a>-->
                            <a class="btn" href="JavaScript:if(confirm('确认删除该组团商品？')){location.href='/content/group/group-product-delete?id=<?php echo $v['id']; ?>'}">删除</a>
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