<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!--_meta 作为公共模版分离出去-->
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
<script type="text/javascript" src="../../lib/html5shiv.js"></script>
<script type="text/javascript" src="../../lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="../../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>新增用户</title>
<meta name="keywords"
	content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<script type="text/javascript">
$(function(){
	//下拉框change事件
	$("#dept1").change(
		function(){
			//清空第二个下拉框
			$("#dept2").empty();
			
			//ajax的异步提交
			$.post(
			"getdept.do",//1.url
			{
			  pid:this.value //2.json类型数据，传值，this表示pid，value表示选中的一级部门的id，是二级部门的pid
			},
			function(data){ //3.成功后执行
			 if(data!=null){
				$(data).each(
				  function(){
					  //添加数据到第二个下拉框中,this表示data,id表示选中的二级部门的id
					  $("#dept2").append("<option value="+this.id+">"+this.name+"</option>");
				   }		
				);
			}	        

			},
			"json" //4.返回类型
			)
		}	

	);
});
//文件上传
function upload(){
	//ajax请求，局部提交
	var args={
			//请求路径
			url:$("#path").val()+"/upload/common.do",
			//返回类型
			dataType:"text",
			//提交方式
			type:"post",
			success:function(result){
				//设置图片的属性
				$("#img").attr("src",$("#path").val()+"/upload/"+result);
				$("#pic").val(result);
			}
			
	}
	//表单局部提交
	$("#form-admin-role-add").ajaxSubmit(args);
}
</script>
<body>
	<input type="hidden" id="path" value="${pageContext.request.contextPath }"/>
	<article class="page-container">
		<form action="touseradd.do" method="post" class="form form-horizontal"
			id="form-admin-role-add" enctype="multipart/form-data">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>登录名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="loginname" name="loginname" onblur="chkLoginname()" > <span
						id="resultName">${MSG }</span>

				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>密码：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password" class="input-text" value="" placeholder=""
						id="pwd" name="password" onblur="chkPwd()"><span
						id="resultPwd"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>确认密码：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password" class="input-text" value="" placeholder=""
						id="repwd" name="repwd" onblur="chkRepwd()"> <span
						id="resultRepwd"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>真实姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="realname" name="realname" onblur="chkRealname()"> <span
						id="resultRname"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>出生日期：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text"
						onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })"
						id="datemin" class="input-text Wdate"
						style="width: 120px; display: none;"> <input type="text"
						onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })"
						id="datemax" class="input-text Wdate" name="birthday"
						style="width: 120px;">

				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">性别：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<div class="radio-box">
						<input name="sex" type="radio" id="sex-1" value="男" checked>
						<label for="sex-1">男</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-2" name="sex" value="女"> <label
							for="sex-2">女</label>
					</div>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>eMail：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="email" name="email" onblur="chkEmail()"><span
						id="resultEmail"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">部门：</label>
				<div class="formControls col-xs-8 col-sm-9" style="margin: left;width: 180px">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="dept0" size="1" id="dept1">
							<c:forEach items="${DLIST }" var="dep">
								<option value="${dep.id }" name="id0">${dep.name }</option>
							</c:forEach>

					</select>
				</div>
				<div class="formControls col-xs-8 col-sm-9" style="margin: left;width: 200px">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="dept.id" size="1" id="dept2">
							<c:forEach items="${DLIST2 }" var="dep">
								<option value="${dep.id }" name="id">${dep.name }</option>
							</c:forEach>

					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">头像：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" id="file" name="file" onchange="upload()">
					<img id="img" width="150px" height="150px" />
					<input type="hidden" name="pic" id="pic"/>
				</div>
			</div>

			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input type="submit" value="提交"
						style="width: 70px; height: 40px; background: gray; border-radio: 50%;" />
				</div>
			</div>
		</form>

	</article>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
		<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".permission-list dt input:checkbox").click(
					function() {
						$(this).closest("dl").find("dd input:checkbox").prop(
								"checked", $(this).prop("checked"));
					});
			$(".permission-list2 dd input:checkbox")
					.click(
							function() {
								var l = $(this).parent().parent().find(
										"input:checked").length;
								var l2 = $(this).parents(".permission-list")
										.find(".permission-list2 dd").find(
												"input:checked").length;
								if ($(this).prop("checked")) {
									$(this).closest("dl").find(
											"dt input:checkbox").prop(
											"checked", true);
									$(this).parents(".permission-list").find(
											"dt").first()
											.find("input:checkbox").prop(
													"checked", true);
								} else {
									if (l == 0) {
										$(this).closest("dl").find(
												"dt input:checkbox").prop(
												"checked", false);
									}
									if (l2 == 0) {
										$(this).parents(".permission-list")
												.find("dt").first().find(
														"input:checkbox").prop(
														"checked", false);
									}
								}
							});

		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>