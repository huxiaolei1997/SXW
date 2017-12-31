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
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>注册</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <link href="../css/slide-unlock.css" rel="stylesheet">
</head>
<body>
    <div id="logo">
    <h1><a href="<%=path%>/sxw/showIndex" style="color:white;">尚书圩村</a></h1>
    <h3>让生活·更有趣</h3>
    </div>
	<div id="login" >
	<div id="login-tag"  >
     <ul>
     <li id="login-li" style="background-color: white;"><a href="login.jsp">注册</a></li>
      <li id="signup-li"><a href="signup.jsp">登录</a></li>
     </ul>
     </div>
     <div id="login-form">
      <form action="login" method="post" name="login1" onsubmit="return flag;">
      <input type="text" name="username" placeholder="&nbsp;&nbsp;请输入用户名" class="left login-top" onblur="checklogin()"/><br>
      <input type="password" name="password" placeholder="&nbsp;&nbsp;请输入密码" class="left" onblur="checkpwd()"/><br>
      <input type="password" name="repassword" placeholder="&nbsp;&nbsp;请再次输入密码" class="left" onblur="checkpwd1()"/><br>
      <input type="text" name="checkcode" placeholder="&nbsp;&nbsp;请输入验证码" class="left" style="visibility: hidden;"><br>
      <input type="submit" name="submit" value="注册" id="submit1" class="left submit-css" />
      </form>
      <span style="color:#AAAAAA;">或</span>
     <ul>
      <li><a href="###"><img src="../img/weibo.png" alt="weibo" name="weibo"/></a></li>
      <li><a href="###"><img src="../img/qq.png" alt="qq" name="qq"/></a></li>
      <li><a href="###"><img src="../img/wechat.png" alt="wechat" name="wechat"/></a></li>
      <li><a href="###"><img src="../img/wechat.png" alt="wechat" name="wechat"/></a></li>
     </ul>
     </div>

     <div id="login-form" class="login-form" style="display: none;">
      <form action="login" method="post" name="login" onsubmit="return check()">
      <input type="text" name="username" placeholder="&nbsp;&nbsp;请输入用户名" class="left login-top" /><br>
      <input type="password" name="password" placeholder="&nbsp;&nbsp;请输入密码" class="left" /><br>
      <input type="text" name="checkcode" placeholder="&nbsp;&nbsp;请输入验证码" class="left" style="visibility: hidden;"><br>
      <input type="submit" name="submit" value="登录" id="submit2" class="left submit-css" />
      </form>
      <span style="color:#AAAAAA;">或</span>
     <ul>
      <li><a href="###"><img src="../img/weibologin.png" alt="weibo" name="weibo"/></a></li>
      <li><a href="###"><img src="../img/qqlogin.png" alt="qq" name="qq"/></a></li>
      <li><a href="###"><img src="../img/wechatlogin.png" alt="wechat" name="wechat"/></a></li>
      <li><a href="###"><img src="../img/wechatlogin.png" alt="wechat" name="wechat"/></a></li>
     </ul>
     </div>
     <div id="slider" style="position:absolute;margin-top:-118px;margin-left:35px;z-index: 9999;display:block;">
    <div id="slider_bg" style="width: 0px;" ></div>
    <span id="label" style="left: 0px;">&gt;&gt;</span>
    <span id="labelTip">拖动滑块验证</span>
    </div>
      <p style="color:red;position: absolute; margin-top:-30px;margin-left:35px;" id="prompt1"></p>
	  <p style="display:none;" id="ifsubmit"></p>
	</div>

</body>
</html>
  <script src="../js/jquery-1.10.2.js"></script>
  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery.slideunlock.js"></script>
  <script>
   $("#submit1").attr("disabled","disabled");
   $("#submit2").attr("disabled","disabled");
   $("#submit1").css({cursor:"default"});
   $("#submit2").css({cursor:"default"});
    $(function () {
        var slider = new SliderUnlock("#slider",{
        successLabelTip : "验证成功"
      },function(){
        //alert("验证成功！");
        $("#submit1").removeAttr("disabled");
        $("#submit2").removeAttr("disabled");
        $("#submit1").css({cursor:"pointer"});
        $("#submit2").css({cursor:"pointer"});
          });
        slider.init();
    });
    var flag = false;
var reg =/\s+/g;
function checklogin(){
	initAJAX();
if(login1.username.value.replace(/(^\s*$)/g,'') == ''){
	//alert("false");
	var prompt1 = document.getElementById("prompt1");
	prompt1.innerHTML = "用户名不能为空";

}else if(reg.test(login1.username.value)){
	var prompt1 = document.getElementById("prompt1");
	prompt1.innerHTML = "用户名不能包含空格等特殊字符";

}
else if(login1.username.value.replace(/(^\s*)|(\s*$)/g,'') != ''){
	xmlHttp.open("POST",encodeURI("<%=path%>/sxw/login2?name=" + encodeURI(login1.username.value)) + "&checkuser=checkuser",true);
	xmlHttp.send();
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200 ){
			var res = xmlHttp.responseText;
			if(res == "true"){
				var prompt1 = document.getElementById("prompt1");
				prompt1.innerHTML = "用户名可以使用";
				var ifsubmit = document.getElementById("ifsubmit");
				ifsubmit.innerHTML = "1";
				//alert("1");

			}else if( res == "false"){
				var prompt1 = document.getElementById("prompt1");
				prompt1.innerHTML = "用户名已经存在";
				var ifsubmit = document.getElementById("ifsubmit");
				ifsubmit.innerHTML = "0";
               // alert("0");

			}
		}

	}
}

}
</script>
<script src="../js/login.js"></script>
