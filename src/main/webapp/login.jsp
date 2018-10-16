<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>实训管理登陆界面</title>
<style>
* {
	margin: 0;
	padding: 0;
}

html {
	height: 100%;
}

body {
	height: 100%;
	background: #fff url(images/backgroud.png) 50% 50% no-repeat;
	background-size: cover;
}

.dowebok {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 430px;
	height: 550px;
	margin: -300px 0 0 -215px;
	border: 1px solid #fff;
	border-radius: 20px;
	overflow: hidden;
}

.logo {
	width: 104px;
	height: 104px;
	margin: 50px auto 80px;
	background: url(images/login.png) 0 0 no-repeat;
}

.form-item {
	position: relative;
	width: 360px;
	margin: 0 auto;
	padding-bottom: 30px;
}

.form-item input {
	width: 288px;
	height: 48px;
	padding-left: 70px;
	border: 1px solid #fff;
	border-radius: 20px;
	font-size: 18px;
	color: #fff;
	background-color: transparent;
	outline: none;
}

.form-item>div>a {
	font-size: 28px;
	color: #1f6f4a;
}
.form-item div {
	width: 360px;
	height: 50px;
	border: 0;
	border-radius: 20px;
	outline: none;
	cursor: pointer;
	background-color: #fff;
}

#username {
	background: url(images/emil.png) 20px 14px no-repeat;
}

#password {
	background: url(images/password.png) 23px 11px no-repeat;
}

.tip {
	display: none;
	position: absolute;
	left: 20px;
	top: 52px;
	font-size: 14px;
	color: #f50;
}

.reg-bar {
	width: 360px;
	margin: 20px auto 0;
	font-size: 14px;
	overflow: hidden;
}

.reg-bar a {
	color: #fff;
	text-decoration: none;
}

.reg-bar a:hover {
	text-decoration: underline;
}

.reg-bar .reg {
	float: left;
}

.reg-bar .forget {
	float: right;
}

.dowebok ::-webkit-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok ::-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-ms-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

@media screen and (max-width: 500px) {
	* {
		box-sizing: border-box;
	}
	.dowebok {
		position: static;
		width: auto;
		height: auto;
		margin: 0 30px;
		border: 0;
		border-radius: 0;
	}
	.logo {
		margin: 50px auto;
	}
	.form-item {
		width: auto;
	}
	.form-item input, .form-item div, .reg-bar {
		width: 100%;
	}
}

.labelone {
	font-size: 18px;
	color: #fff;
	background-color: transparent;
}

.logost {
	width: 350px;
	height: 30px;
	position: absolute;
	margin-left: -110px;
	margin-top: 120px;
}
.yanzhengma {
	position: relative;
	width: 360px;
	margin: 0 auto;
	padding-bottom: 30px;
}

.yanzhengma>input {
	margin-top: 0px;
	height: 48px;
	padding-left: 70px;
	border: 1px solid #fff;
	border-radius: 20px;
	font-size: 18px;
	color: #fff;
	background-color: transparent;
	outline: none;
	width: 188px;
}
</style>
</head>
<body>

	<div class="dowebok">
		<div class="logo">
			<div class="logost">
				<label class="labelone" style="vertical-align:middle;">学生</label> 
				<input style="width:20px; height:20px;vertical-align:middle;" type="checkbox" value="1"class="chk"> 
				<label  class="labelone" style="vertical-align:middle;">|辅导员</label>
				 <input style="width:20px; height:20px;vertical-align:middle;" type="checkbox" value="2" class="chk"> 
				 <label class="labelone" style="vertical-align:middle;">|讲师</label> 
				<input  style="width:20px; height:20px;vertical-align:middle;" type="checkbox" value="3" class="chk"> 
					<label class="labelone" style="vertical-align:middle;">|管理员</label> 
					<input  style="width:20px; height:20px;vertical-align:middle;" type="checkbox" value="4" class="chk">
					<br>
					<label class="labelone">${sessionScope.statecount}</label>
			</div>
		</div>
		<form class="f1">
			<div class="form-item">
				<input id="username" name="niki" type="text" required="required"
					placeholder="名称">
			</div>
			<div class="form-item">
				<input id="password" name="pass" type="password" required="required"
					placeholder="登录密码">
			</div>
			<div class="yanzhengma">
				<input id="username" type="text" name="recomend" required="required"
					placeholder="验证码"> <img src="img/img.png"
					onclick="changerimg(this);" height="30px">
			</div>
			<div class="form-item">
				<div onclick="loginperson();"><a style="margin-left:150px;margin-top:40px;">登 录</a></div>
			</div>
		</form>
	</div>
	<script src="js/jquery/1.9.1/jquery.min.js"></script>
	<script>
		$(function() {
			$(".chk").click(function() {
				$(".chk").prop("checked", "")
				$(this).prop("checked", "checked")
			});
		})
		var a = 0;
		function changerimg(o) {
			o.src = "img/img.png?a=" + (a++);
		}
		
		function loginperson() {
			var id = 0;
			$(".chk").each(function() {
				if ($(this).prop("checked")) {
					id=$(this).val();
				}
			});
			if(id>0){
					var data = $.param({'id' : id}) + '&' + $(".f1").serialize();
					$.ajax({
						url : "login",
						type : "post",
						data : data,
						dataType : "json",
						success : function(json) {
							if (json.status==1) {
                             location.href="login.jsp"
							}
							if (json.status==2) {
							location.href="index.jsp"
							}
						}
					});
				}else{
					alert("请选择身份");
					
				};
		}
	</script>
</body>
</html>