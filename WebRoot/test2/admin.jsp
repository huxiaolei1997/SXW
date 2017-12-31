<%@ page language="java"
	import="java.sql.*,java.io.*,java.util.*,util.DBUtil,dao.userDao,entity.User"
	pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach items="${singleUser}" var="singleUser">
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人中心</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="../i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="../i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="../css/amazeui.min.css" />
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/app.css">
<script src="../js/sweetalert2.min.js"></script>
<link href="../css/sweetalert2.min.css" rel="stylesheet">
<script src="../js/echarts.min.js"></script>
</head>

<body data-type="index">


	<%@ include file="header.jsp"%>


	<!-- content start -->
	<div class="tpl-page-container tpl-page-header-fixed">


		<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-title">功能列表</div>
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a
						href="<%=path%>/test2/showBackIndex" class="nav-link active">
							<i class="am-icon-home"></i> <span>首页</span>
					</a></li>
					<li class="tpl-left-nav-item"><a
						href="<%=path%>/test2/getFileName"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-file"></i> <span>文件和图片管理</span>
					</a></li>

					<li class="tpl-left-nav-item"><a href="javascript:;"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-table"></i> <span>综合管理</span> <i
							class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu">
							<li><a href="<%=path%>/test2/pagerXiangJu"> <i
									class="am-icon-angle-right"></i> <span>乡居管理</span> <i
									class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
							</a> <a href="<%=path%>/test2/pagerViewStory"> <i
									class="am-icon-angle-right"></i> <span>景点、故事管理</span> <a
									href="<%=path%>/test2/pagerExperience"> <i
										class="am-icon-angle-right"></i> <span>体验管理</span>

								</a></li>
						</ul></li>

					<li class="tpl-left-nav-item"><a href="javascript:;"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-wpforms"></i> <span>用户和评论管理</span> <i
							class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu">
							<li><a href="<%=path%>/test2/pagerUser"> <i
									class="am-icon-angle-right"></i> <span>用户管理</span> <i
									class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
							</a> <a href="<%=path%>/test2/PagerComment"> <i
									class="am-icon-angle-right"></i> <span>评论管理</span>
							</a></li>
						</ul></li>
<li class="tpl-left-nav-item"><a href="<%=path%>/test2/showAccessIpAddress" class="nav-link"> <i class="am-icon-bar-chart"></i> <span>网站访客统计</span>
					</a></li>
					<li class="tpl-left-nav-item"><a
						href="<%=path%>/test2/loginOut"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-key"></i> <span>退出登录</span>

					</a></li>
				</ul>
			</div>
		</div>
		<!-- wrapper start -->
		<div class="admin-content" style="margin-left:250px;">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal
							information</small>
					</div>
				</div>

				<hr />

				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
						<div class="am-panel am-panel-default">
							<div class="am-panel-bd">
								<div class="am-g">
									<div class="am-u-md-4">
										<img class=""
											src="<%=path%>${singleUser.headImageUrl}"
											alt="" id="showHeadImageUrl" style="width:100px;height:100px;border-radius:50%;"/>
									</div>
									<div class="am-u-md-8">
										<form class="am-form"  name="updateHeadImage" method="post" enctype="multipart/form-data">
											<div class="am-form-group">
													<input name="file" type="file" id="myfile" onchange="preImg(this.files)">
												<p id="message">请选择要上传的图片...</p>
	    <input type="hidden" name="id" value="${singleUser.id}" id="updateHeadImageId"/>
	<input type="button" id="update" class="am-btn am-btn-primary" value="确认更换" onclick="updateHeadImage1('abc')"/>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
						<form class="am-form am-form-horizontal">

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">用户名
									/ userName</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" name="userName" placeholder="用户名 / userName" value="${singleUser.name}">
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-email" class="am-u-sm-3 am-form-label">联系方式   /Connect</label>
								<div class="am-u-sm-9">
									<input type="email" id="user-email"
										placeholder="输入你的联系方式 " value="${singleUser.conninfo}" name="conninfo">

								</div>
							</div>
			
									 <div class="am-form-group">
									 <label for="user-email" class="am-u-sm-3 am-form-label">性别 / Sex</label>
								      <div class="am-u-sm-9">
								      <c:if test="${singleUser.sex == '0' }">
								      <label class="am-radio-inline">
								        <input type="radio"  value="0" name="sexRadio1" checked> 男
								      </label>
								       <label class="am-radio-inline">
								        <input type="radio" name="sexRadio1" value="1"> 女
								      </label>
								         <label class="am-radio-inline">
								        <input type="radio" name="sexRadio1" value="2"> 保密
								      </label>
								      </c:if>
								       <c:if test="${singleUser.sex == '1' }">
								         <label class="am-radio-inline">
								        <input type="radio"  value="0" name="sexRadio1"> 男
								      </label>
								       <label class="am-radio-inline">
								        <input type="radio" name="sexRadio1" value="1" checked> 女
								      </label>
								         <label class="am-radio-inline">
								        <input type="radio" name="sexRadio1" value="2"> 保密
								      </label>
								      </c:if>
								       <c:if test="${singleUser.sex == '2' }">
								       <label class="am-radio-inline">
								        <input type="radio"  value="0" name="sexRadio1" > 男
								      </label>
								       <label class="am-radio-inline">
								        <input type="radio" name="sexRadio1" value="1"> 女
								      </label>
								         <label class="am-radio-inline">
								        <input type="radio" name="sexRadio1" value="2" checked> 保密
								      </label>
								      </c:if>
								      </div>
								    </div>
							<div class="am-form-group">
					 			<label for="user-intro" class="am-u-sm-3 am-form-label">简介
									/ Intro</label>
								<div class="am-u-sm-9">
									<textarea class="" rows="5" id="user-intro"
										placeholder="输入个人简介" name="introduce">${singleUser.introduce}</textarea>
									<small>100字以内写出你的一生...</small>
								</div>
							</div>
                             <input type="text" style="display:none;" name="id" value="${singleUser.id}"/>
                             <input type="text" style="display:none;" name="pwd" value="${singleUser.pwd}"/>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<button type="button" class="am-btn am-btn-primary" onclick="checkUpdate()">保存修改</button>
									<input type="reset" class="am-btn am-btn-primary" value="重置"/>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed
					under MIT license.</p>
			</footer>

		</div>
		<!-- wrapper end -->



	</div>
	<!-- content end -->




	<script src="../js/jquery.min.js"></script>
	<script src="../js/amazeui.min.js"></script>
	<script src="../js/iscroll.js"></script>
	<script src="../js/app.js"></script>
	<script src="../js/initAJAX.js"></script>
	<script type="text/javascript">
	var flag = true;
	function addList(){
	
	if(flag){
	var orderList = document.getElementById("orderList");
	orderList.innerHTML = "<li><div class='task-checkbox'><input type='hidden' value='1' name='test'><input type='checkbox' class='liChild' value='2' name='test'></div><div class='task-title'>" + 
	"<span class='task-title-sp'> Amaze UI Icon 组件目前使用了Font Awesome </span> <span class='label label-sm label-success'>技术部</span><span class='task-bell'> <i class='am-icon-bell-o'></i></span></div>"
	 +"<div class='task-config'><div class='am-dropdown tpl-task-list-dropdown' data-am-dropdown><a href='###' class='am-dropdown-toggle tpl-task-list-hover' data-am-dropdown-toggle> <i class='am-icon-cog'></i><span class='am-icon-caret-down'></span></a><ul class='am-dropdown-content tpl-task-list-dropdown-ul'><li><a href='javascript:;'>" + 
	 "<i class='am-icon-check'></i> 保存2</a></li><li><a href='javascript:;'><i class='am-icon-pencil'></i> 编辑</a></li><li><a href='javascript:;'> <i class='am-icon-trash-o'></i> 删除</a></li></ul></div></div></li>";
   //alert("success!");
      //alert($("#orderList").html());
    var head = document.getElementsByTagName('head')[0];
	var script = document.createElement('script');
	script.type = 'text/javascript';
    script.src = '../js/amazeui.min.js';
	head.appendChild(script);
	
		}
		flag = false;
    
}
	function checkUpdate() {
			initAJAX();
			var reg = /\s+/g;
			var userName = document.getElementsByName("userName")[0];
			var conninfo = document.getElementsByName("conninfo")[0];
			var introduce = document.getElementsByName("introduce")[0];
			if (reg.test(userName.value) || reg.test(conninfo.value) || reg.test(introduce.value)) {
				swal(
					'不能包含空格等',
					'非法字符',
					'warning'
				)
				//alert("不能包含空格等非法字符！");
				return false;
			}
			if (userName.value == ''  || conninfo.value == '' || introduce.value == '') {
				swal(
					'任意一项',
					'不能为空',
					'warning'
				)
				//alert("任意一项不能为空！");
				return false;
			}
	
			if (!reg.test(userName.value) && userName.value != '') {
				var sexRadio1 = document.getElementsByName("sexRadio1");
				var pwd = document.getElementsByName("pwd")[0].value;
				var id = document.getElementsByName("id")[0].value;
				var sexRadioChecked;
				for (var i = 0; i < sexRadio1.length; i++) {
					if (sexRadio1[i].checked) {
						sexRadioChecked = i;
					//alert(userRadioChecked);
					}
				}
				var flag = false;
				xmlHttp.open("POST", "<%=path%>/sxw/checkuser?name=" + encodeURI(encodeURI(userName.value)
						+ "&checkUpdateUser=checkUpdateUser&id=" + id + "&pwd=" + pwd
						+ "&conninfo=" + conninfo.value + "&introduce=" + encodeURI(introduce.value) + "&ifadmin=1"  + "&sex=" + sexRadioChecked), true);
				xmlHttp.send();
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
						var res = xmlHttp.responseText;
						if (res == "false") {
							swal(
								'用户名',
								'已经存在',
								'warning'
							)
							//alert("用户名已经存在！");
							return flag;
						} else if (res == "true") {
							flag = true;
							swal(
								'用户信息',
								'修改成功',
								'success'
							)
						//addUser.submit();
						}
					}
				}
				return flag;
			}
	
		//addUser.submit();
		//alert("提交表单成功！");
		}
	function preImg(files) {
			//alert(files.length);
			    //var imageUrl = document.getElementById("imageUrl");
			    //imageUrl.value = null;
			    var file = files[0];
				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(e) {
					//$(".previewImg")[i].attr("src", e.target.result);
					$("#showHeadImageUrl").attr("src", e.target.result);

			}
		}
		function updateHeadImage1(abc){
		//var updateHeadImage = document.getElementById("updateHeadImage");
		//var update = document.getElementById("update");
		var myfile = document.getElementById("myfile").value;
		var message = document.getElementById("message");
		if(myfile == '' || myfile == null){
		message.innerHTML = '请选择要更换的头像';
		message.style.color = 'red';
		return;
		}
			initAJAX();
			var updateHeadImage = document.forms.namedItem("updateHeadImage");
			oData = new FormData(updateHeadImage);
			//oData.append("CustomField", "This is some extra data");
			//var oReq = new XMLHttpRequest();
			xmlHttp.open("POST", "<%=path%>/test2/upload", true);
			xmlHttp.onload = function(oEvent) {
				if (xmlHttp.status == 200) {
					var res = xmlHttp.responseText;
					var showHeadImageUrl = document.getElementById("showHeadImageUrl");
					//var imageUrl = document.getElementById("imageUrl");
					showHeadImageUrl.src = "<%=path%>" + res;
			             swal(
								'头像',
								'修改成功！',
								'success'
							);
				} else {
					swal(
								'头像',
								'修改失败！',
								'error'
							);
				}
			};
			xmlHttp.send(oData);
		}


		
</script>


</body>
</html>
</c:forEach>