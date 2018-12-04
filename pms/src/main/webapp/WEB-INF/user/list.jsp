
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 引入标签库 -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="../lib/html5shiv.js"></script>
<script type="text/javascript" src="../lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<style type="text/css">
#pageC{
	float: right;
}
.pageCa {
	text-decoration: none;
	display: inline-block;
	padding: 8px 16px;
}

.pageCa:hover {
	background-color: #ddd;
	color: black;
}

.previous,.next {
	background-color: #f1f1f1;
	color: black;
}

.round {
	border-radius: 50%;
	position: relative;
	top: 12px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		用户管理 <span class="c-gray en">&gt;</span> 用户列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<form action="userlist.do?page=1" method="post" style="float: right;">
				<input type="text" value="${QUERY.loginname }" class="input-text" style="width: 200px; margin-left: 900px;" placeholder="输入登录名" id="" name="loginname">
				<select name="isenabled" class="select" style="width: 80px;height: 30px">
					<c:if test="${QUERY.isenabled==0 }">
						<option value="0" selected="selected">请选择</option>
						<option value="1">可用</option>
						<option value="-1">不可用</option>
					</c:if>
					<c:if test="${QUERY.isenabled==1 }">
						<option value="0">请选择</option>
						<option value="1" selected="selected">可用</option>
						<option value="-1">不可用</option>
					</c:if>
					<c:if test="${QUERY.isenabled==-1 }">
						<option value="0">请选择</option>
						<option value="1">可用</option>
						<option value="-1" selected="selected">不可用</option>
					</c:if>
				</select>
				<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
			</form>
			<span class="l"><button type="submit" class="btn btn-danger radius"
					id="deleteAll">
					<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
				</button> <a href="javascript:;"
				onclick="admin_add('添加用户','useradd.do','800','500')"
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					添加用户</a></span>
			
		</div>
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="10">用户列表</th>
				</tr>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="40">用户编号</th>
					<th width="40">用户名</th>
					<th width="40">真实姓名</th>
					<th width="40">性别</th>
					<th width="40">出生年月</th>
					<th width="40">部门</th>
					<th width="150">邮箱</th>
					<th width="50">头像</th>
					<th width="40">是否可用</th>
					<th width="100">操作选项</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users }" var="user">
					<tr class="text-c">
						<td><input type="checkbox" value="${user.id }" name=""></td>
						<td>${user.id }</td>
						<td>${user.loginname }</td>
						<td>${user.realname }</td>
						<td>${user.sex }</td>
						<td>${user.birthday }</td>
						<td>${user.dept.name }</td>
						<td>${user.email }</td>
						<td><img src="../pms/upload/${user.pic }" width="50px" height="50px"></td>
						<td>${user.isenabledTxt }</td>
						<td class="td-manage"><a title="编辑" href="javascript:;"
							onclick="admin_edit('编辑用户','userget.do?id=${user.id }','1','800','500')"
							class="ml-5" style="text-decoration: none"><i
								class="Hui-iconfont">&#xe6df;</i></a> <a title="删除"
							href="userdelete.do?id=${user.id }" onclick="admin_del(this,'1')"
							class="ml-5" style="text-decoration: none"><i
								class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
			<div>当前是第${page }页，总页数共${PageCount }页</div>
		
		<div id="pageC">
			
			
			
				<a href="userlist.do?&&loginname=${QUERY.loginname }&&isenabled=${QUERY.isenabled}"class="pageCa previous round">&laquo;</a>
					<a href="userlist.do?page=${(page-1)<=0?1:(page-1) }&&loginname=${QUERY.loginname }&&isenabled=${QUERY.isenabled}" class="pageCa previous">&#8249; 上一页</a>
				
			 		<a href="userlist.do?page=${page+1>PageCount?PageCount:page+1 }&&loginname=${QUERY.loginname }&&isenabled=${QUERY.isenabled}"class="pageCa next">下一页&#8250;</a>
				 <a href="userlist.do?page=${PageCount }&&loginname=${QUERY.loginname }&&isenabled=${QUERY.isenabled}"class="pageCa next round">&raquo;</a>
			
		
			 
		</div>


	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		
		/*
		 参数解释：
		 title	标题
		 url		请求的url
		 id		需要操作的数据id
		 w		弹出层宽度（缺省调默认值）
		 h		弹出层高度（缺省调默认值）
		 */
		/*管理员-增加*/
		function admin_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*管理员-删除*/
		function admin_del(obj, id) {
			if (!confirm("确认删除么？")) {
				window.event.returnValue = false;
			}
		}

		/*管理员-编辑*/
		function admin_edit(title, url, id, w, h) {
			if (!confirm("确认修改此用户么？")) {
				window.event.returnValue = false;
			} else {
				layer_show(title, url, w, h);
			}
		}
		/*管理员-停用*/
		function admin_stop(obj, id) {
			layer
					.confirm(
							'确认要停用吗？',
							function(index) {
								//此处请求后台程序，下方是成功后的前台处理……

								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-default radius">已禁用</span>');
								$(obj).remove();
								layer.msg('已停用!', {
									icon : 5,
									time : 1000
								});
							});
		}

		/*管理员-启用*/
		function admin_start(obj, id) {
			layer
					.confirm(
							'确认要启用吗？',
							function(index) {
								//此处请求后台程序，下方是成功后的前台处理……

								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-success radius">已启用</span>');
								$(obj).remove();
								layer.msg('已启用!', {
									icon : 6,
									time : 1000
								});
							});
		}
	</script>
</body>
</html>