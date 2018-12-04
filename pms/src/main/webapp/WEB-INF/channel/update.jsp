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
<!--[if IE 6]>
<script type="text/javascript" src="../../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>修改频道</title>
<meta name="keywords"
	content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<script type="text/javascript">
	//频道名不能为空，最少两位字符
	var CHKCNAME = "^[a-zA-Z0-9\u4e00-\u9fa5]{2,}$";
	function chkCname(){
		var cnameEle = document.getElementById("cname");
		var cname = cnameEle.value;
		var span = document.getElementById("resultCname");
		var reg = new RegExp(CHKCNAME);
		if(reg.test(cname)){
			span.innerHTML = "<img src='check_right.png'>"
				span.style.position = "relative";
				span.style.top = "-27px";
				span.style.left = "530px";
				return true;
		}else {
			span.innerHTML = "频道名不能低于两位";
			span.style.color = "red";
			//清空文本框
			cnameEle.value = "";
			//重新聚焦
			cnameEle.focus();
			return false;
		}
	}
</script>
<body>
	<article class="page-container">
		<form action="channelupdate.do?id=${channel.id }" method="post"
			class="form form-horizontal" id="form-admin-role-add">
			<div class="row cl">
				<div class="formControls col-xs-8 col-sm-9">
					<span style="color: red">${msg }</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">频道名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${channel.cname }"
						placeholder="" id="cname" name="cname" onblur="chkCname()"><span
						id="resultCname"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">上级栏目：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="pid" size="1">
							<c:forEach items="${pidTxts }" var="pidTxt">
								<!--  显示所属部门 -->
								<c:if test="${channel.pid==pidTxt.pid }">
									<option value="${pidTxt.pid }" selected="selected">${pidTxt.pname}</option>
								</c:if>
								<!-- 其他部门 -->
								<c:if test="${channel.pid!=pidTxt.pid }">
									<option value="${pidTxt.pid }">${pidTxt.pname}</option>
								</c:if>

							</c:forEach>

					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">级别：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<c:if test="${channel.lev=='爸爸级别' }">
						<div class="radio-box">
							<input name="lev" type="radio" id="sex-1" value="爸爸级别" checked>
							<label for="sex-1">爸爸级别</label>
						</div>
						<div class="radio-box">
							<input type="radio" id="sex-2" name="lev" value="儿子级别"> <label
								for="sex-2">儿子级别</label>
						</div>
					</c:if>
					<c:if test="${channel.lev=='儿子级别' }">
						<div class="radio-box">
							<input name="lev" type="radio" id="sex-1" value="爸爸级别">
							<label for="sex-1">爸爸级别</label>
						</div>
						<div class="radio-box">
							<input type="radio" id="sex-2" name="lev" value="儿子级别" checked> <label
								for="sex-2">儿子级别</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">是否叶子：</label>
				<div class="formControls col-xs-8 col-sm-9">
				<c:if test="${channel.isleaf==0 }">
					<div class="radio-box">
						<input name="isleaf" type="radio" id="sex-1" value="0" checked>
						<label for="sex-1">是叶子</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-2" name="isleaf" value="1"> <label
							for="sex-2">不是叶子</label>
					</div>
				</c:if>
				<c:if test="${channel.isleaf==1 }">
					<div class="radio-box">
						<input name="isleaf" type="radio" id="sex-1" value="0" >
						<label for="sex-1">是叶子</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-2" name="isleaf" value="1" checked> <label
							for="sex-2">不是叶子</label>
					</div>
				</c:if>
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