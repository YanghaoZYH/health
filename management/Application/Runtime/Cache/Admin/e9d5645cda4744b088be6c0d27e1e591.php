<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>pintuer.css">
<link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>admin.css">
<script src="<?php echo (ADMIN_JS_URL); ?>jquery.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>pintuer.js"></script>
<script type="text/javascript" charset="utf-8" src="/health/management/Application/Public/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/health/management/Application/Public/Ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="/health/management/Application/Public/Ueditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
    .tips{
      color: red;
      line-height: 40px;
      margin-left: 20px;
    }
    #nav li{display:inline; height:60px} 
    #nav li {display:inline-block; padding:0 20px; height:30px; line-height:30px;
                color:black; font-family:"5FAE8F6F96C59ED1"; font-size:12px}
    .form-group label{font-weight: bold;}
</style>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <div class="body-content">
    <form method="post" class="form-x" action="/health/management/Application/index.php/Admin/Auth/editAdmin/mg_id/8" name="fileUploadForm" enctype="multipart/form-data">
    <input type="hidden" value="<?php echo $manager['mg_id']; ?>" name="mg_id">
    <div class="div_tab" style="display:block;">  
      <div class="form-group">
        <div class="label">
          <label>用户组：</label>
        </div>
        <div class="field">
        <?php foreach ($group as $k => $v): if(in_array($v['id'],$mGroup)) $checked = 'checked="checked"'; else $checked = ''; ?>
       
          <span><?php echo $v['title']; ?> <input <?php echo $checked; ?> type="checkbox" name="group_id[]" value="<?php echo $v['id']; ?>"></span>
        <?php endforeach; ?>

          <span class="tips">*</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $manager['mg_admin']; ?>" name="mg_admin" data-validate="required:请输入名称" />
          <span class="tips">*</span>
        </div>
      </div>
      <div class="div_tab">
        <div class="form-group" >
          <div class="label">
            <label>密码：</label>
          </div>
          <div class="field">
            <input type="text" class="input w50" value="<?php echo $manager['mg_password']; ?>" name="mg_password" data-validate="required:请输入密码" />
            <span class="tips">*</span>
          </div>
        </div>
      </div>
      </div>
      <!-- 提交 -->
      <div class="form-group" style="margin-left: 200px;margin-top: 40px">
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body>
<script type="text/javascript">


</script>
</html>