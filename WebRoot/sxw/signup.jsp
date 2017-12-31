<%@ page language="java"
	import="java.sql.*,java.io.*,java.util.*,util.DBUtil,dao.userDao,entity.User"
	pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>登录</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <link href="../css/slide-unlock.css" rel="stylesheet">
</head>
<body style="overflow-x: hidden;overflow-y: auto;">
    <div id="logo">
    <h1><a href="<%=path%>/sxw/showIndex" style="color:white;">尚书圩村</a></h1>
    <h3>让生活·更有趣</h3>
    </div>
	<div id="login" >
	<div id="login-tag">
     <ul>
     	<li id="login-li"><a href="login.jsp">注册</a></li>
     	<li id="signup-li"  style="background-color: white;"><a href="signup.jsp">登录</a></li>
     </ul>
     </div>
     <div id="login-form" style="display:none;">
      <form action="login" method="post" name="login">
      <input type="text" name="username" placeholder="&nbsp;&nbsp;请输入用户名" class="left login-top" /><br>
      <input type="password" name="password" placeholder="&nbsp;&nbsp;请输入密码" class="left" /><br>
      <input type="password" name="repassword" placeholder="&nbsp;&nbsp;请再次输入密码" class="left" /><br>
      <input type="text" name="checkcode" placeholder="&nbsp;&nbsp;请输入验证码" class="left" style="visibility: hidden;"><br>
      <input type="submit" name="submit" value="注册" id="submit1" class="left submit-css" />
      </form>
      <span style="color:#AAAAAA;">或</span>
     <ul>
      <li><a href="###"><img src="./images/weibo.png" alt="weibo" name="weibo"/></a></li>
      <li><a href="###"><img src="./images/qq.png" alt="qq" name="qq"/></a></li>
      <li><a href="###"><img src="./images/wechat.png" alt="wechat" name="wechat"/></a></li>
      <li><a href="###"><img src="./images/wechat.png" alt="wechat" name="wechat"/></a></li>
     </ul>
     </div>
     <div id="login-form" class="login-form" style="display:block;">
      <form action="<%=path%>/check/checkUserLogin" method="post" name="login2" id="login3" onsubmit="return false;">
      <input type="text" name="username" placeholder="&nbsp;&nbsp;请输入用户名" class="left login-top" onblur="checklogin2()"/><br>
      <input type="password" name="password" placeholder="&nbsp;&nbsp;请输入密码" class="left" onblur="checkpwd2()"/><br>
      <input type="text" name="checkUserLogin" value="1" placeholder="&nbsp;&nbsp;请输入验证码" class="left" style="visibility: hidden;"><br>
      <button   value="登录" id="submit2" class="left submit-css" onclick="check()">登录</button>
      </form>
      <span style="color:#AAAAAA;">或</span>
     <ul>
      <li><a href="###"><img src="../img/weibologin.png" alt="weibo" name="weibo"/></a></li>
      <li><a href="###"><img src="../img/qqlogin.png" alt="qq" name="qq"/></a></li>
      <li><a href="###"><img src="../img/wechatlogin.png" alt="wechat" name="wechat"/></a></li>
      <li><a href="###"><img src="../img/wechatlogin.png" alt="wechat" name="wechat"/></a></li>
     </ul>
     </div>
     <div id="slider" style="position:absolute;margin-top:-160px;margin-left:35px;z-index: 9999;display:block;">
    <div id="slider_bg" style="width: 0px;" ></div>
    <span id="label" style="left: 0px;">&gt;&gt;</span>
    <span id="labelTip">拖动滑块验证</span>
    </div>
    <p style="color:red;position: absolute; margin-top:-30px;margin-left:35px;" id="prompt2"></p>
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
function check(){
		initAJAX();
		if(login2.username.value != '' && login2.password.value != ''){
		xmlHttp.open("POST",encodeURI("<%=path%>/check/checkUserLogin?name=" + encodeURI(login2.username.value) + "&pwd=" + login2.password.value + "&checkUserLogin=0"),true);
		
		xmlHttp.send();
		xmlHttp.onreadystatechange = function(){
			if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
				var res = xmlHttp.responseText;
				if(res == "true" && login2.password.value != '' && login2.username.value != ''){
					//window.location.href ="success.html";
					var login3 = document.getElementById("login3");
					login3.submit();
				}else if(res == "false" && login2.password.value != '' && login2.username.value != ''){
					var prompt2 = document.getElementById("prompt2");
					prompt2.innerHTML = "用户名或密码错误";
					//flag2 = false;
				}
			}
		}
		}

}
</script>
<script src="../js/login.js"></script>
