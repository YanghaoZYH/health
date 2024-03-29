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
<link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>jquery-ui.min.css">
<link rel="stylesheet" href="<?php echo (ADMIN_LAYUI_URL); ?>css/layui.css">
<link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>font-awesome.min.css">
<script src="<?php echo (ADMIN_JS_URL); ?>jquery.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>jquery-ui.min.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>pintuer.js"></script>
<style type="text/css">
	.dialogtable{border-collapse: collapse; width: 100%;padding-top: 12px;}
	.dialogtable th{background-color: #E8E8E8;}
	.dialogtable th,
	.dialogtable td{border: solid 1px #ccc; padding: 8px;valign:middle;}
	.button.border-green{ color:#22CC77;}
	.pagelist span.current{background: #22CC77}
</style>
</head>
<body>
<form method="post" action="/health/management/Application/index.php/Admin/Knowledge/listKnow/p/1.html" id="listform">
  <div class="panel admin-panel">
    <!-- <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div> -->
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="layui-btn layui-btn-primary" href="/health/management/Application/index.php/Admin/Knowledge/add"><i class="layui-icon">&#xe654;</i> 添加知识</a> </li>
        <li style="margin-left: 500px">
          <input type="text" placeholder="请输入搜索关键字" name="searchValue" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a class="layui-btn layui-btn" style="cursor:pointer" onclick="$('#listform').submit()"><i class="layui-icon">&#xe615;</i>  搜索</a>  
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="8%" style="text-align:left; padding-left:20px;">ID</th>
        <th>标题</th>
        <th width="10%">点击量</th>
        <th width="14%">更新时间</th>
        <th width="30%">操作</th>
      </tr>
    <?php foreach ($data as $k => $v): ?>
        <tr>
          <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="know_id[]" value="<?php echo $v['know_id']; ?>" /><?php echo $v['know_id']; ?></td>
          <td><?php echo $v['know_title']; ?></td>
          <td><?php echo $v['know_see']; ?></td>
          <td><?php echo $v['time']; ?></td>
          <td><div class="button-group">
          <a class="layui-btn layui-btn-primary layui-btn-mini" style="cursor:pointer" onclick="showDialog(<?php echo $v['know_id']; ?>)"><i class="layui-icon">&#xe615;</i> 查看</a>
          <a class="layui-btn layui-btn layui-btn-mini" href="/health/management/Application/index.php/Admin/Knowledge/edit/know_id/<?php echo $v['know_id']; ?>"><i class="layui-icon">&#xe642;</i> 修改</a> 
          <a class="layui-btn layui-btn-danger layui-btn-mini" style="cursor:pointer" onclick="del(<?php echo $v['know_id']; ?>)"><i class="layui-icon">&#xe640;</i> 删除</a>
          </div></td>
          <td colspan="0">
          	<!-- 详情页面 -->
        	<div id="dialog<?php echo $v['know_id']; ?>" style="display:none;" title="详情信息">
        	<div><?php echo htmlspecialchars_decode($v['know_content']); ?></div>
       		</div>
          </td>
        </tr>
        
    <?php endforeach; ?>
      <tr>
        <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
          全选 </td>
        <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a>
      </tr>
      <tr>
      	<td colspan="8">
      	<div class="pagelist">
      		<?php echo ($page); ?>
      		</div>
      	</td>
      </tr>
    </table>
</form>
<script src="<?php echo (ADMIN_LAYUI_URL); ?>lay/dest/layui.all.js"></script>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}
//详情列表框
function showDialog(id) {
    layer.open({
        type: 1,
        area: ['450px', '460px'],
        content: $("#dialog"+id),
        shade:0,
        offset: ['10px', '200px'],
        cancel:function(index, layero){
          $("#dialog"+id).css('display','none');
          layer.close(index);
        }
    }); 
  };
//单个删除
function del(know_id){
	if(confirm("您确定要删除吗?")){
		window.location="/health/management/Application/index.php/Admin/Knowledge/delete/know_id/"+know_id;
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='hos_id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
  var know_id = new Array();
	 $("input[name='know_id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;	
    var i = 0;
    $("input[name='know_id[]']:checked").each(function(){
      know_id[i] = this.value;
      i++;
    });
    window.location="/health/management/Application/index.php/Admin/Knowledge/delete/know_id/"+know_id;
		//$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>
</body>
</html>