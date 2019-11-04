<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<div class="span10" id="datacontent">
    <ul class="breadcrumb">
        <li><a href="/content/shop/index">店铺模块</a> <span class="divider">/</span></li>
        <li class="active">店铺详情</li>
    </ul>
    <form action="/content/shop/shop-detail" method="get" class="form-horizontal" >
        <fieldset>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺名称</label>
                <div class="controls">
                    <input type="text" name="name" id="name" value="<?php echo isset($data['name'])?$data['name']:'';?>"  readonly/>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">联系电话</label>
                <div class="controls">
                    <input type="text" name="phone" id="phone" value="<?php echo isset($data['phone'])?$data['phone']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">营业时间</label>
                <div class="controls">
                    <input type="text" name="shopTime" id="shopTime" value="<?php echo isset($data['shopTime'])?$data['shopTime']:'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺状态</label>
                <div class="controls">
                    <input type="text" name="status" id="status" value="<?php echo isset($data['status'])?($data['status']==1?'审核通过':($data['status']==-1?'审核不通过':'待审核')):'';?>" readonly />
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺地址</label>
                <div class="controls">
                    <input type="text" name="address" id="address" value="<?php echo isset($data['address'])?($data['province'].$data['city'].$data['area'].$data['address']):'';?>" readonly/>
                </div>
            </div>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺头图</label>
                <div class="controls">
                    <input type="text" name="headImage" id="headImage" value="<?php echo isset($data['headImage'])?$data['headImage']:'';?>" readonly/>
                </div>
            </div>
            <?php if(isset($data['image']) && $data['image']){?>
                <div class="control-group">
                    <label for="modulename" class="control-label">店铺图片</label>
                    <div class="controls">
                        <textarea name="image" readonly><?php echo isset($data['image'])?$data['image']:'';?></textarea>
                    </div>
                </div>
            <?php }?>
            <?php if(isset($data['video']) && $data['video']){?>
                <div class="control-group">
                    <label for="modulename" class="control-label">店铺视频</label>
                    <div class="controls">
                        <textarea name="video" readonly><?php echo isset($data['video'])?$data['video']:'';?></textarea>
                    </div>
                </div>
            <?php }?>
            <div class="control-group">
                <label for="modulename" class="control-label">店铺介绍</label>
                <div class="controls">
                    <textarea name="introduce" readonly><?php echo isset($data['introduce'])?$data['introduce']:'';?></textarea>
                </div>
            </div>
            <br/>
            <div class="control-group">
                <div class="controls">
                    <a onclick="Javascript:history.go(-1);">返回</a>
                </div>
            </div>
        </fieldset>
    </form>
</div>

