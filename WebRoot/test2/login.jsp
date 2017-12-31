<%@ page language="java"
	import="java.sql.*,java.io.*,java.util.*,util.DBUtil,dao.userDao,entity.User"
	pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + request.getServletPath();
%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>管理登录</title>
  <meta name="description" content="尚书圩村后台管理系统">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="../i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="../i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="../css/amazeui.min.css" />
  <link rel="stylesheet" href="../css/admin.css">
  <link rel="stylesheet" href="../css/app.css">
  <script
	src="../js/sweetalert2.min.js"></script>
<link
	href="../css/sweetalert2.min.css"
	rel="stylesheet">
<script
	src="../js/core.js"></script>
</head>

<body data-type="login">

  <div class="am-g myapp-login">
	<div class="myapp-login-logo-block  tpl-login-max">
		<div class="myapp-login-logo-text">
			<div class="myapp-login-logo-text">
				尚书圩村后台管理系统<span> Login</span> <i class="am-icon-skyatlas"></i>
				
			</div>
		</div>

		<div class="login-font">
			<i>&nbsp;&nbsp;&nbsp;</i>  <span>&nbsp;&nbsp;&nbsp;</span>
		</div>
		<div class="am-u-sm-10 login-am-center">
			<form action="<%=request.getContextPath()%>/check/CheckAdmin" class="am-form"  name="loginToBack" method="post" onsubmit="return false;">
				<fieldset>
					<div class="am-form-group">
						<input type="text" name="adminName" id="adminName" placeholder="请输入用户名">
					</div>
					<div class="am-form-group">
						<input type="password" name="password" id="password" placeholder="请输入密码">
					</div>
					<div class="am-form-group">
						<input type="hidden" name="text" id="text" placeholder="请输入密码" value="1">
					</div>
					<p><button  class="am-btn am-btn-default" onclick="checkAdmin()">登录</button></p>
				</fieldset>
			</form>
		</div>
	</div>
</div>
  <script src="../js/jquery.min.js"></script>
  <script src="../js/amazeui.min.js"></script>
  <script src="../js/app.js"></script>
  <script type="text/javascript">
  	//初始化Ajax
		var xmlHttp = false;
		function initAJAX() {
			if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				try {
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						window.alert("该浏览器不支持AJAX");
					}
				}
			}
  	}
  	function checkAdmin() {
  		initAJAX();
  		var reg = /\s+/g;
  		//var loginToBack = document.getElementById("loginToBack");
  		var adminName = document.getElementById("adminName").value;
  		var password = document.getElementById("password").value;
  		if(reg.test(adminName) || reg.test(password)){
  		 swal(
  						'不能包含',
  						'空格等特殊字符',
  						'warning'
  					)
  					return false;
  		}
  		if(adminName == '' || password == ''){
  		 swal(
  						'用户名或密码',
  						'不能为空',
  						'warning'
  					)
  					return false;
  		}
  		if(!reg.test(adminName) && adminName != '' && !reg.test(password) && password != ''){
  		xmlHttp.open("POST", "<%=request.getContextPath()%>/check/CheckAdmin?adminName=" + encodeURI(encodeURI(adminName)) + "&password=" + password + "&text=0", true);
  		xmlHttp.send();
  		xmlHttp.onreadystatechange = function() {
  			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
  				var res = xmlHttp.responseText;
  				if (res == "true") {
  					loginToBack.submit();
  				} else if (res == "false"){
  				   swal(
  						'用户名或密码',
  						'错误',
  						'error'
  					)
  				}
  
  			}
  		}
  		}
  	}
  </script>
</body>
</html>