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
<form method="post" action="/health/management/Application/index.php/Admin/feedback/listAnalyze" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <!-- <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        
        <li>搜索：</li>
        <li>首页
          <select name="s_ishome" class="input" onchange="changesearch()" style="width:60px; line-height:17px; display:inline-block">
            <option value="">选择</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
          &nbsp;&nbsp;
          推荐
          <select name="s_isvouch" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">
            <option value="">选择</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
          &nbsp;&nbsp;
          置顶
          <select name="s_istop" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">
            <option value="">选择</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-green icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul> -->
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>用户注册数</th>
        <th>医生注册数</th>
        <th>APP下载量</th>
        <th width="30%">操作</th>
      </tr>
   
        <tr>
          <td><?php echo $user; ?></td>
          <td><?php echo $doc; ?></td>
          <td>5000</td>
          <td><div class="button-group">
          <a class="button border-green" style="cursor:pointer" href="/health/management/Application/index.php/Admin/feedback/listAnalyze"><span class="icon-view-o"></span> 更新</a>
          </div></td>
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
<script type="text/javascript">

//搜索
function changesearch(){	
		
}
//详情列表框
function showDialog(id) {
    $("#dialog"+id).dialog({
		  height:"auto",
	      width: "auto",
	      position: {my: "right bottom", at: "center",  collision:"fit"},
	      modal:false,//是否模式对话框
	      draggable:true,//是否允许拖拽
	      resizable:true,//是否允许拖动
	      title:"详细信息",//对话框标题
	      show:"slide",
	      hide:""
	});
  };
//单个删除
function del(feedb_id){
	if(confirm("您确定要删除吗?")){
		window.location="/health/management/Application/index.php/Admin/Feedback/delete/feedb_id/"+feedb_id;
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
	 $("input[name='hos_id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>
</body>
</html>