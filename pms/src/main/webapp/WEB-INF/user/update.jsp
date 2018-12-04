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
<!--[if IE 6]>
<script type="text/javascript" src="../../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>修改用户</title>
<meta name="keywords"
	content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<script type="text/javascript">
	//用户名：数字+字母，结束之前不能全部都是数字，6-16
	var CHKLOGINNAME = "^(?![0-9]+$)[a-zA-Z0-9]{6,16}$";
	//邮箱xxxxxx@xxx.com,可以包含_      企业邮箱qwe@huewei.com.cn
	var CHKEMAIL = "^[a-zA-Z0-9_]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
	//真实姓名
	var CHKREALNAME = "^[\u4e00-\u9fa5]{2,}$";
	function chkLoginname() {
		//获取用户名输入信息
		var lgEle = document.getElementById("loginname");
		var loginname = lgEle.value;
		var reg = new RegExp(CHKLOGINNAME);
		if (reg.test(loginname)) {
			if(chkReLoginname(loginname)){
				return true;
			}else{
				return false;
			}
		} else {
			$("#resultName").html("用户名必须包含数字和字母，并且不能低于六位");
			$("#resultName").css("color","red");
			
			//清空文本框
			lgEle.value = "";
			//重新聚焦
			lgEle.focus();
			return false;
		}
	}
	function chkRealname() {
		//获取真实姓名
		var realnameEle = document.getElementById("realname");
		var realname = realnameEle.value;
		var reg = new RegExp(CHKREALNAME);
		if (reg.test(realname)) {
			$("#resultRname").html("<img src='check_right.png'>");
			$("#resultRname").css("position","relative");
			$("#resultRname").css("top","-27px");
			$("#resultRname").css("left","530px");
			
			return true;
		} else {
			$("#resultRname").html("请输入至少两位的汉字");
			$("#resultRname").css("color","red");
			//清空文本框
			realnameEle.value = "";
			//重新聚焦
			realnameEle.focus();
			return false;
		}
		

	}
	function chkEmail(){
		//获取email
		var emailEle = document.getElementById("email");
		var email = emailEle.value;
		//获取span
		var reg = new RegExp(CHKEMAIL);
		if(reg.test(email)){
			if(chkReEmail(email)){
				return true;
			}else{
				return false;
			}
				
			} else {
				$("#resultEmail").html("请按照正确的邮箱格式输入");
				$("#resultEmail").css("color","red");
				//清空文本框
				emailEle.value = "";
				//重新聚焦
				emailEle.focus();
				return false;
			}
		
	}
	/*
	ajax判断用户名重复
*/
function chkReLoginname(loginname){
	var flag = false;
	$.ajax({
		//提交路径
		url:"ajax.do",
		//提交方式
		method:"post",
		//携带参数
		data:"type=1&&loginname="+loginname,
		//返回类型
		dataType:"text",
		success:function(flag){
			if(flag=="true"){
				$("#resultName").html("<img src='check_right.png'>");
				$("#resultName").css("position","relative");
				$("#resultName").css("top","-27px");
				$("#resultName").css("left","530px");
				flag = true;
			}else{
				$("#resultName").html("用户名已经存在");
				$("#resultName").css("color","red");
				flag = false;
			}
		},
		error:function(){
			alert("请求失败");
		}
	});
	return flag;
}
function chkReEmail(email){
	var flag = false;
	$.ajax({
		//提交路径
		url:"ajax.do",
		//提交方式
		method:"post",
		//携带参数
		data:"type=2&&email="+email,
		//返回类型
		dataType:"text",
		success:function(flag){
			if(flag=="true"){
				$("#resultEmail").html("<img src='check_right.png'>");
				$("#resultEmail").css("position","relative");
				$("#resultEmail").css("top","-27px");
				$("#resultEmail").css("left","530px");
				flag = true;
			}else{
				$("#resultEmail").html("邮箱已经存在");
				$("#resultEmail").css("color","red");
				flag = false;
			}
		},
		error:function(){
			alert("请求失败");
		}
	});
	return flag;
}
	
</script>
<body>
	<article class="page-container">
		<form action="userupdate.do?id=${user.id }" method="post"
			class="form form-horizontal" id="form-admin-role-add" ">
			<div class="row cl">
				<div class="formControls col-xs-8 col-sm-9">
					<span style="color: red">${msg }</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>登录名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${user.loginname }"
						placeholder="" id="loginname" name="loginname" onblur="chkLoginname()"><span
						id="resultName"></span>
						
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>真实姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${user.realname }"
						placeholder="" id="realname" name="realname" onblur="chkRealname()"> <span
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
						style="width: 120px;" value="${user.birthday }">
					
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">性别：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<c:if test="${user.sex=='男' }">
						<div class="radio-box">
							<input name="sex" type="radio" id="sex-1" value="男" checked>
							<label for="sex-1">男</label>
						</div>
						<div class="radio-box">
							<input type="radio" id="sex-2" name="sex" value="女"> <label
								for="sex-2">女</label>
						</div>
					</c:if>
					<c:if test="${user.sex=='女' }">
						<div class="radio-box">
							<input name="sex" type="radio" id="sex-1" value="男"> <label
								for="sex-1">男</label>
						</div>
						<div class="radio-box">
							<input type="radio" id="sex-2" name="sex" value="女" checked>
							<label for="sex-2">女</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>eMail：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${user.email }"
						placeholder="" id="email" name="email" onblur="chkEmail()"><span
						id="resultEmail"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">部门：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="dept" size="1">
							<c:forEach items="${depts }" var="dep">
								<!--  显示所属部门 -->
								<c:if test="${user.dept==dep.id }">
									<option value="${dep.id }" selected="selected">${dep.dname}</option>
								</c:if>
								<!-- 其他部门 -->
								<c:if test="${user.dept!=dep.id }">
									<option value="${dep.id }">${dep.dname}</option>
								</c:if>

							</c:forEach>

					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">是否可用：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<c:if test="${user.enable==1 }">
						<div class="radio-box">
							<input name="enable" type="radio" id="yes" value="1" checked>
							<label for="yes">可用</label>
						</div>
						<div class="radio-box">
							<input type="radio" id="no" name="enable" value="2"> <label
								for="no">不可用</label>
						</div>
					</c:if>
					<c:if test="${user.enable==2 }">
						<div class="radio-box">
							<input name="enable" type="radio" id="yes" value="1"> <label
								for="yes">可用</label>
						</div>
						<div class="radio-box">
							<input type="radio" id="no" name="enable" value="2" checked>
							<label for="no">不可用</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input type="submit" value="提交"
						style="width: 70px; height: 40px; background: gray; border-radio: 50%;"  />
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