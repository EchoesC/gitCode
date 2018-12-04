
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet"
	type="text/css" />
<link href="static/h-ui.admin/css/H-ui.login.css" rel="stylesheet"
	type="text/css" />
<link href="static/h-ui.admin/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录</title>
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header"></div>
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<form class="form form-horizontal" action="login.do" method="post">
				<div class="cl" style="position: relative; top: -10px;">
					<div class="formControls col-xs-8">
						<label class="form-label col-xs-3"><i class="Hui-iconfont"></i></label>
						<span class="login_txt" style="color: red">${err }</span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="" name="loginname" type="text" placeholder="账户"
							class="input-text size-L" value="${cookie.loginname.value }">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="password" name="password" type="password" placeholder="密码"
							class="input-text size-L" value="${cookie.password.value }">
						<div id="showPassword" class="log-showPwd loginWindowImg"
							onclick="showPwd()"
							style="height: 14px; width: 43px; float: right; position: relative; right: 45px; top: -25px; cursor: hand; background: url(static/h-ui.admin/images/login_icon.png) -49px -53px no-repeat; z-index: 10;"></div>
							<div id="notshowPassword" class="log-showPwd loginWindowImg"
							onclick="notshowPwd()"
							style="height: 14px; width: 43px; float: right; position: relative; right: 45px; top: -25px; cursor: hand; background: url(static/h-ui.admin/images/login_icon.png) -49px -94px no-repeat; z-index: 10;display:none;"></div>
					</div>
					</div>
					
				
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input name="yanz" class="input-text size-L" type="text"
							placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}"
							onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:"
							style="width: 150px;"> <img src="kaptcha.jsp" id="Img"
							onclick="reImg()"> <a id="kanbuq" href="#"
							onclick="reImg()">看不清，换一张</a>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<label for="online"> <input type="checkbox" name="online"
							id="online" value="1"> 使我保持登录状态
						</label>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input name="" type="submit" class="btn btn-success radius size-L"
							value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> <input
							name="" type="reset" class="btn btn-default radius size-L"
							value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">Copyright12345</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript">
		function reImg() {
			var img = document.getElementById("Img");
			img.src = "kaptcha.jsp?rnd" + Math.random();
		}
		function showPwd(){
			var show = document.getElementById("showPassword");
			var notshow = document.getElementById("notshowPassword");
			var pwd = document.getElementById("password");
			show.style.display = "none";
			notshow.style.display = "block";
			pwd.type = "text";
			
		}
		function notshowPwd(){
			var show = document.getElementById("showPassword");
			var notshow = document.getElementById("notshowPassword");
			var pwd = document.getElementById("password");
			notshow.style.display = "none";
			show.style.display = "block";
			pwd.type = "password";
			
		}
	</script>

</body>
</html>