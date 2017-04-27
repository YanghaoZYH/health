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
<!-- 搜索表单 -->
<form method="get" action="/health/management/Application/index.php/Admin/HistoryVis/listHis" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-green icon-plus-square-o" href="/health/management/Application/index.php/Admin/HistoryVis/add/user_id/<?php echo I('get.user_id'); ?>/relative_id/<?php echo I('get.relative_id'); ?>"> 添加</a> </li>
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
      	</li>
        <li>
          <input type="text" placeholder="请输入手机号" name="userPhone" class="input" style="width:250px; line-height:17px;display:inline-block" value="<?php echo I('get.userPhone'); ?>" />
          <a href="javascript:void(0)" class="button border-green icon-search" onclick="$('#submit').click()" > 搜索</a>
        </li>
      </ul>
    </div>
	</div>
	<input id="submit" type="submit" value="搜索" style="display:none"/>
</form>
    <table class="table table-hover text-center">
      <tr>
        <th width="8%" style="text-align:left; padding-left:20px;">ID</th>
        <th>所属用户</th>
        <th>用户手机</th>
        <th>亲友姓名</th>
        <th>所属关系</th>
        <th>就诊医院</th>
        <th>就诊科室</th>
        <th>就诊医生</th>
        <th>就诊时间</th>
        <th width="30%">操作</th>
      </tr>
    <?php foreach ($data as $k => $v): ?>
        <tr>
          <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="seecase_id[]" value="<?php echo $v['seecase_id']; ?>" /><?php echo $v['seecase_id']; ?></td>
          <td><?php echo $v['user_name']; ?></td>
          <td><?php echo $v['user_phone']; ?></td>
          <td><?php echo $v['relative_name']; ?></td>
          <td><?php echo $v['relative_relation']; ?></td>
          <td><?php echo $v['seecase_hos']; ?></td>
          <td><?php echo $v['seecase_depa']; ?></td>
          <td><?php echo $v['seecase_doc']; ?></td>
          <td><?php echo $v['seecase_time']; ?></td>
          <td><div class="button-group">
          <a class="button border-green" style="cursor:pointer" onclick="showDialog(<?php echo $v['seecase_id']; ?>)"><span class="icon-view-o"></span> 查看</a>
          <a class="button border-main" href="/health/management/Application/index.php/Admin/HistoryVis/edit/seecase_id/<?php echo $v['seecase_id']; ?>/user_id/<?php echo $v['user_id']; ?>/relative_id/<?php echo I('get.relative_id'); ?>"><span class="icon-edit"></span> 修改</a> 
          <a class="button border-red" href="/health/management/Application/index.php/Admin/HistoryVis/delete/seecase_id/<?php echo $v['seecase_id']; ?>/user_id/<?php echo I('get.user_id'); ?>/relative_id/<?php echo I('get.relative_id'); ?>"><span class="icon-edit"></span> 删除</a> 
          </div></td>
          <td colspan="0">
          	<!-- 详情页面 -->
        	<div id="dialog<?php echo $v['seecase_id']; ?>" style="display:none;" title="详情信息">
    		<table class="dialogtable" cellspacing="0" cellpadding="0">
    			<tr>
    				<td>用户名：</td>
    				<td><?php echo $v['user_name']; ?></td>
    			</tr>
	    		<tr>
	    			<td>用户手机：</td>
	    			<td><?php echo $v['user_phone']; ?></td>
	    		</tr>
	    		<tr>
    				<td>亲友姓名：</td>
    				<td><?php echo $v['relative_name']; ?></td>
    			</tr>
    			<tr>
    				<td>所属关系：</td>
    				<td><?php echo $v['relative_relation']; ?></td>
    			</tr>
	    		<tr>
	    			<td>就诊时间：</td>
	    			<td><?php echo $v['seecase_time']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>就诊医院：</td>
	    			<td><?php echo $v['seecase_hos']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>就诊科室：</td>
	    			<td><?php echo $v['seecase_depa']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>就诊医生：</td>
	    			<td><?php echo $v['seecase_doc']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>诊断结果</td>
	    			<td><?php echo $v['seecase_info']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>医生建议：</td>
	    			<td><?php echo $v['seecase_sgs']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>处方信息：</td>
	    			<td>
	    			<?php echo htmlspecialchars_decode($v['page_info']); ?>
	    			<?php showImage($v['page_img_path'],120,80); ?>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>检验结果：</td>
	    			<td>
	    			<?php echo htmlspecialchars_decode($v['check_info']); ?>
	    			<?php showImage($v['check_img_path'],120,80);?>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>创建时间：</td>
	    			<td><?php echo $v['hos_name']; ?></td>
	    		</tr>
    		</table>
       		</div>
          </td>
        </tr>
        
    <?php endforeach; ?>
      <tr>
        <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
          全选 </td>
        <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()"> 排序</a>
      </tr>
      <tr>
      	<td colspan="8">
      	<div class="pagelist">
      		<?php echo ($page); ?>
      		</div>
      	</td>
      </tr>
    </table>
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
function del(seecase_id,user_id,relative_id){
	if(confirm("您确定要删除吗?")){
		window.location="/health/management/Application/index.php/Admin/HistoryVis/delete/seecase_id/"+seecase_id+"/user_id/"+user_id+"/relative_id/"+relative_id;
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