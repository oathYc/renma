<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/product/index">商品模块</a> <span class="divider">/</span></li>
        <li class="active">商品详情</li>
    </ul>
    <form action="/content/product/product-detail"  class="form-horizontal" >
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">商品名称</label>
                <div class="controls">
                    <input type="text" name="title" readonly id="title" value="<?php echo $data['title'];?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品价格</label>
                <div class="controls">
                    <input type="text" name="price" readonly id="price" value="<?php echo $data['price'];?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品分类</label>
                <div class="controls">
                    <input type="text" name="category" readonly id="category" value="<?php echo $data['category'];?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品品牌</label>
                <div class="controls">
                    <input type="text" name="brand" readonly id="brand" value="<?php echo $data['brand'];?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品电压</label>
                <div class="controls">
                    <input type="text" name="voltage" readonly id="voltage" value="<?php echo $data['voltage'];?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">续航里程</label>
                <div class="controls">
                    <input type="text" name="mileage" readonly id="mileage" value="<?php echo $data['mileage'];?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">交易地点</label>
                <div class="controls">
                    <input type="text" name="tradeAddress" readonly id="tradeAddress" value="<?php echo $data['tradeAddress'];?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">封面展示</label>
                <div class="controls">
                    <input type="text" name="headMsg" readonly id="headMsg" value="<?php echo $data['headMsg'];?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品图片</label>
                <div class="controls">
                    <textarea name="image" id="image" readonly><?php echo $data['image'];?></textarea>
                </div>
            </div>
            <br/>
            <div class="control-group">
                <div class="controls">
                    <a class="btn" href="Javascript:history.go(-1);">返回</a>
                </div>
            </div>
        </fieldset>
    </form>
</div>

