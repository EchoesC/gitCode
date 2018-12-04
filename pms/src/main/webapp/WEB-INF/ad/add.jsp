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
	href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="../static/h-ui/css/jquery.sinaEmotion.css" />
<link rel="stylesheet" type="text/css"
	href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="../static/h-ui.admin/css/style.css" />
	<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="../../lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>新增快报</title>
<meta name="keywords"
	content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<script type="text/javascript">
//快报标题，最少一位
var CHKTITLE = "^[a-zA-Z0-9\u4e00-\u9fa5]{1,}$";
//内容，最少一位
var CHKCONTENT = "^[a-zA-Z0-9\u4e00-\u9fa5\u3002|\uff1f|\uff01|\uff0c|\u3001|\uff1b|\uff1a|\u201c|\u201d|\u2018|\u2019|\uff08|\uff09|\u300a|\u300b|\u3008|\u3009|\u3010|\u3011|\u300e|\u300f|\u300c|\u300d|\ufe43|\ufe44|\u3014|\u3015|\u2026|\u2014|\uff5e|\ufe4f|\uffe5]{15,}$";
function chkTitle() {
	//获取输入信息
	var titleEle = document.getElementById("title");
	var title = titleEle.value;
	//获取span框
	var span = document.getElementById("resultTitle");
	var reg = new RegExp(CHKTITLE);
	if (reg.test(title)) {
		span.innerHTML = "<img src='../check_right.png'>"
		span.style.position = "relative";
		span.style.top = "-27px";
		span.style.left = "690px";
		return true;
	} else {
		span.innerHTML = "快报标题最少一位";
		span.style.color = "red";
		//清空文本框
		titleEle.value = "";
		//重新聚焦
		titleEle.focus();
		return false;
	}
}
function chkContent() {
	//获取用户名输入信息
	var contentEle = document.getElementById("content");
	var content = contentEle.value;
	//获取span框
	var span = document.getElementById("resultContent");
	var reg = new RegExp(CHKCONTENT);
	if (reg.test(content)) {
		
		return true;
	} else {
		span.innerHTML = "快报内容不能少于15位";
		span.style.color = "red";
		//清空文本框
		contentEle.value = "";
		//重新聚焦
		contentEle.focus();
		return false;
	}
}
</script>
<body>
	<article class="page-container">
		<form action="../adadd.do" method="post"
			class="publish form form-horizontal" id="form-admin-role-add">
			<div class="row cl">
				<div class="formControls col-xs-8 col-sm-9">
					<span style="color: red">${msg }</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>标题：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						 id="title" name="title" onblur="chkTitle()"><span
						id="resultTitle"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>内容：</label>
				<div class="formControls col-xs-8 col-sm-9" style="height: 200px;">
					<textarea id="content" contenteditable="true" class="content"
						placeholder="" name="content"
						style="height: 200px; width: 400px;" onblur="chkContent()"></textarea><span
						id="resultContent"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>创建时间：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate"  style="width:120px;display: none;">
					<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" name="crtime" style="width:120px;">
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
	<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="../static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../lib/laypage/1.2/laypage.js"></script>

		
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