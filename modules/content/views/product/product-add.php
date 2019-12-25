<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/product/index">商品模块</a> <span class="divider">/</span></li>
        <li class="active">商品编辑</li>
    </ul>
    <form action="/content/product/product-detail"  class="form-horizontal" >
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">商品分类</label>
                <div class="controls">
                    <label for="wx" style="display:inline;">
                        维修
                        <input type="radio" id="wx" name="submit[type]" value="1" <?php if(isset($data['type']) && $data['type'] ==1) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="xc" style="display:inline;">
                        新车
                        <input type="radio" id="xc" name="submit[type]" value="2" <?php if(isset($data['type']) && $data['type'] ==2) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="esc" style="display:inline;">
                        二手车
                        <input type="radio"  id='esc' name="" value="3" <?php if(isset($data['type']) && $data['type'] ==3) echo 'checked';?> />
                    </label>

                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">适用性别</label>
                <div class="controls">
                    <label for="all" style="display:inline;">
                        通用
                        <input type="radio" id="all" name="submit[sex]" value="0" <?php if(isset($data['sex']) && $data['sex'] ==0) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="nan" style="display:inline;">
                        男
                        <input type="radio" id="nan" name="submit[sex]" value="1" <?php if(isset($data['sex']) && $data['sex'] ==1) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="nv" style="display:inline;">
                        女
                        <input type="radio"  id='nv' name="submit[sex]" value="2" <?php if(isset($data['sex']) && $data['sex'] ==1) echo 'checked';?> />
                    </label>

                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">质保商品</label>
                <div class="controls">
                    <label for="yes" style="display:inline;">
                        是
                        <input type="radio" id="yes" name="submit[zhibao]" value="1" <?php if(isset($data['sex']) && $data['sex'] ==1) echo 'checked';?> />
                    </label>&nbsp;&nbsp;
                    <label for="nv" style="display:inline;">
                        否
                        <input type="radio"  id='nv' name="submit[zhibao]" value="2" <?php if(isset($data['sex']) && $data['sex'] ==1) echo 'checked';?> />
                    </label>

                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品名称</label>
                <div class="controls">
                    <input type="text" name="submit[title]"  id="title" value="<?php echo isset($data['title'])?$data['title']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品价格</label>
                <div class="controls">
                    <input type="text" name="submit[price]"  id="price" value="<?php echo isset($data['price'])?$data['price']:'';?>" " />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">联系电话</label>
                <div class="controls">
                    <input type="text" name="submit[phone]"  id="phone" value="<?php echo isset($data['phone'])?$data['phone']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">交易地址</label>
                <div class="controls">
                    <input type="text" name="submit[tradeAddress]"  id="tradeAddress" value="<?php echo isset($data['tradeAddress'])?$data['tradeAddress']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品品牌</label>
                <div class="controls">
                    <input type="text" name="submit[brand]"  id="brand" value="<?php echo isset($data['brand'])?$data['brand']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品库存</label>
                <div class="controls">
                    <input type="text" name="submit[number]"  id="number" value="<?php echo isset($data['number'])?$data['number']:'';?>" />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品电压</label>
                <div class="controls">
                    <select name="submit[voltage]" id="voltage">
                        <option value="0">请选择</option>
                        <?php foreach($voltage as $k => $v){?>
                            <option value="<?php echo $v['id']?>" <?php if(isset($data['voltage']) && $data['voltage'] == $v['id']) echo 'selected';?>><?php echo $v['val']?></option>
                        <?php }?>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">续航里程</label>
                <div class="controls">
                    <select name="submit[mileage]" id="mileage">
                        <option value="0">请选择</option>
                        <?php foreach($mileage as $k => $v){?>
                            <option value="<?php echo $v['id']?>" <?php if(isset($data['mileage']) && $data['mileage'] == $v['id']) echo 'selected';?>><?php echo $v['val']?></option>
                        <?php }?>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品说明</label>
                <div class="controls">
                    <textarea name="submit[remark]" id="remark" ><?php echo isset($data['remark'])?$data['remark']:'';?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品封面</label>
                <div class="controls">
                    <textarea name="submit[remark]" id="remark" ><?php echo isset($data['remark'])?$data['remark']:'';?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品图片</label>
                <div class="controls">
                    <textarea name="submit[remark]" id="remark" ><?php echo isset($data['remark'])?$data['remark']:'';?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">商品详细说明</label>
                <div class="controls">
                    <textarea name="submit[introduce]" id="introduce" ><?php echo isset($data['introduce'])?$data['introduce']:'';?></textarea>
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

