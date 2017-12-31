<%@ page language="java"  pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + request.getServletPath();

%>
<header class="am-topbar am-topbar-inverse admin-header">
	<div class="am-topbar-brand">
		<a href="<%=path%>/test2/showBackIndex" class="tpl-logo"> <img
			src="../img/logo.png" alt="">
		</a>
	</div>
	<div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right" style="margin-left:30px;"></div>
	<button
		class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
		data-am-collapse="{target: '#topbar-collapse'}">
		<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
	</button>

	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

		<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">

			<li class="am-hide-sm-only"><a href="javascript:;"
				id="admin-fullscreen" class="tpl-header-list-link"><span
					class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>

			<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
				<a class="am-dropdown-toggle tpl-header-list-link"
				href="javascript:;"> <span class="tpl-header-list-user-nick">${adminName}</span><span
					class="tpl-header-list-user-ico"> <img
						src="<%=path%>${HeadImageUrl}" style="width:50px;height:50px;border-radius:50%;"></span>
			</a>
				<ul class="am-dropdown-content">
					<li><a href="<%=path%>/test2/showAdmin"><span class="am-icon-bell-o"></span> 资料</a></li>
							<li><a href="javascript:;" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 300}"><span class="am-icon-cog"></span>修改密码</a></li>
					<li><a href="<%=path%>/test2/loginOut"><span
							class="am-icon-power-off"></span> 退出</a></li>
				</ul>
			</li>
			<li><a href="<%=path%>/test2/loginOut"
				class="tpl-header-list-link"><span
					class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
		</ul>
	</div>
</header>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
  <div class="am-modal-dialog">
    <div class="am-modal-hd"><p id="updatePwdMessage">修改密码</p>
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
			<form class="am-form" name="updatepassword"> <fieldset>
    <div class="am-form-group">
      <label for="doc-ipt-email-1" style="float:left;">原密码</label>
      <input type="password"  name="oldPassword" id="oldPassword" placeholder="请输入原来的密码">
    </div>

    <div class="am-form-group">
      <label for="doc-ipt-pwd-1" style="float:left;">新密码</label>
      <input type="password" name="newPassword" id="newPassword" placeholder="请输入新的密码">
    </div>
    <p><button type="button" class="am-btn am-btn-success" onclick="updatePwd()">确认修改</button></p>
  </fieldset>
</form>
    </div>
  </div>
</div>
<script src="../js/initAJAX.js"></script>
<script type="text/javascript">
var oldPassword = document.getElementsByName("oldPassword")[0];
var newPassword = document.getElementsByName("newPassword")[0];
var updatePwdMessage = document.getElementById("updatePwdMessage");
function updatePwd(){
if(oldPassword.value == ''){
updatePwdMessage.innerHTML = "请输入原密码";
updatePwdMessage.style.color = 'red';
return;
}
if(newPassword.value == ''){
updatePwdMessage.innerHTML = "请输入新密码";
updatePwdMessage.style.color = 'red';
return;
}
if(oldPassword.value != '' && newPassword.value != ''){
initAJAX();
xmlHttp.open("POST","<%=path%>/sxw/updateUserPwd?oldPassword=" + oldPassword.value + "&newPassword=" + newPassword.value,true);
xmlHttp.send();
xmlHttp.onreadystatechange = function(){
if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
   var res = xmlHttp.responseText;
   if(res == "0"){
   updatePwdMessage.innerHTML = "原密码错误";
   updatePwdMessage.style.color = 'red';
   }else if (res == "1"){
   updatePwdMessage.innerHTML = "新修改的密码不能和原密码一致！";
   updatePwdMessage.style.color = 'red';
   }else if (res == "2"){
   updatePwdMessage.innerHTML = "修改密码成功！";
   updatePwdMessage.style.color = 'green';
   }
}
}
}
}


</script>

