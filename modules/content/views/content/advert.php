<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/content/index">内容模块</a> <span class="divider">/</span></li>
        <li class="active">广告列表</li>
    </ul>
    <ul class="nav">
        <li class="dropdown pull-right">
            <a class="dropdown-toggle"
               href="/content/content/advert-add">添加广告</a>
        </li>
    </ul>
    <form action="/content/content/advert" method="get" class="form-horizontal">
        <table class="table">
            <tr>
            </tr>
        </table>
    </form>
    <form action="/content/content/advert" method="post">
        <table class="table table-hover add_defined">
            <thead>
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>文件对象</th>
                <th>使用状态</th>
                <th>跳转地址</th>
                <th>添加时间</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach($advert as $kss => $v) {
                ?>
                <tr>
                    <td ><span><?php echo $v['id']?></span></td>
                    <td ><span ><?php echo $v['title']?></span></td>
                    <td ><span><?php echo $v['type']==1?'图片':'视频'?></span></td>
                    <td ><span><?php echo $v['status']==1?'使用中':'禁用中'?></span></td>
                    <td ><span><?php echo $v['imageUrl']?></span></td>
                    <td ><span><?php echo date('Y-m-d H:i:s',$v['createTime']);?></span></td>

                    <td  class="notSLH" style="width: 247px;">
                        <div>
                            <a class="btn" href="/content/content/advert-add?id=<?php echo $v['id']; ?>">修改</a>
                            <a class="btn" href="/content/content/alter-status?id=<?php echo $v['id']; ?>"><?php echo $v['status']==1?'禁用':'启用'?></a>
                            <a class="btn" href="JavaScript:if(confirm('确认删除该广告？')){location.href='/content/content/advert-delete?id=<?php echo $v['id']; ?>'}">删除</a>
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
        <?php if($count > 200){?>
            <span style="font-size: 17px;position: relative;bottom: 5px;">
            <a onclick="jumpPage()">Go</a>&nbsp;
            <input type="text" style="width: 20px;height: 18px;" id="jumpPage">&nbsp;页
        </span>
        <?php }?>
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