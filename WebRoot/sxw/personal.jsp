<%@ page language="java"
	import="java.sql.*,java.io.*,java.util.*,util.DBUtil,dao.userDao,entity.User"
	pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + request.getServletPath();
	String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
			+ request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1)
			+ "showUser";
    String urlLogin = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
			+ request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1)
			+ "signup.jsp";
	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	}
	session.setAttribute("url", url);
	session.setAttribute("urlLogin", urlLogin);
%>
<c:forEach items="${singleUser}" var="singleUser">
	<!DOCTYPE html>
	<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
<link rel="stylesheet" href="../css/nav.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/necessary.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/personal.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/foot.css" media="screen"
	title="no title">
<script src="../js/sweetalert2.min.js"></script>
<link href="../css/sweetalert2.min.css" rel="stylesheet">
<style media="screen">
footer.foot-footer {
	position: relative;
	background: rgba(97, 144, 148, 0.23);
	margin-top: -188px;
	height: 188px;
	clear: both;
}
</style>
</head>
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.pagination.js"></script>
<script type="text/javascript">	
	// 乡居订单分页
	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		//$("#orderActivity").submit();
		//return false;
	}

	$(function(){
		$("#orderXiangJu").pagination(30, {
			items_per_page : 10, // 每页显示多少条记录
			current_page : 0, // 当前显示第几页数据
			num_display_entries : 6, // 分页显示的条目数
			next_text : "下一页",
			prev_text : "上一页",
			num_edge_entries : 2, // 连接分页主体，显示的条目数
			callback : handlePaginationClick
		});
	});
	// 我的故事分页
	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		//$("#orderActivity").submit();
		//return false;
	}

	$(function(){
		$("#myStory").pagination(30, {
			items_per_page : 10, // 每页显示多少条记录
			current_page : 0, // 当前显示第几页数据
			num_display_entries : 6, // 分页显示的条目数
			next_text : "下一页",
			prev_text : "上一页",
			num_edge_entries : 2, // 连接分页主体，显示的条目数
			callback : handlePaginationClick
		});
	});
</script>

<body>
	<header class="nav-header">
	   <div class="nav-bao">
			<nav class="nav-nav">
				<a href="<%=path%>/sxw/showIndex" class="nav-logo"> <img src="../img/logo.png" alt=""
					class="nav-logo-img">
				</a>
				<div class="nav-div">
					<!-- <img src="static/images/menu.png" alt="" class="nav-div-img"> -->
					<div class="nav-div-img">
						<span class="nav-div-img-b1">1</span> <span class="nav-div-img-b2">1</span>
						<span class="nav-div-img-b3">1</span>
					</div>
					<ul class="nav-ul">
						<li class="nav-li"><a href="<%=path%>/sxw/showIndex"
							class="nav-lia">首页</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showView"
							class="nav-lia">景点</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showActivity"
							class="nav-lia">体验</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showLive"
							class="nav-lia">乡居</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showStory"
							class="nav-lia">故事</a></li>
						<li class="nav-li nav-active" >
						<c:if test="${userName == null}">
							<a href="<%=path%>/sxw/login.jsp" class="nav-lia nav-lia-active"> 登录/注册 </a>
						</c:if> 
						<c:if test="${userName != null}">
							<a href="<%=path%>/sxw/showUser" class="nav-lia"> ${userName} </a>
						</c:if>
						</li>
						<c:if test="${userName != null}">
						<li class="nav-li">		
							<a href="<%=path%>/sxw/loginout" class="nav-lia"> 退出 </a>
						</li>
						</c:if>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	<div class="setting">
		<div class="clearfix" id="page">
			<div class="box-top">
				<ul>
					<li class="clicked"><a href="#">个人资料设置</a></li>
					<li><a href="javascript:;" onclick="getActivity()" style="display:none;">活动预约情况</a></li>
					<li><a href="javascript:;" onclick="getXiangJu()">民居预约情况</a></li>
					<li><a href="javascript:;" onclick="getStory()">故事书写情况</a></li>
					<li><a href="javascript:;" onclick="getStory()">修改密码</a></li>
				</ul>
			</div>
			<div class="box-texts">
				<div class="box-text-first box-text">
					<form action="" class="" method="post" name="updateHeadImage" enctype="multipart/form-data">
						<table>
							<tr>
								<td><em class="must">*</em> 用户名</td>
								<td><input type="text" name="username"
									value="${singleUser.name}" placeholder="请输入您的用户名"
									class="left login-top" maxlength="20"></td>
								<td id="prompt1" style="color:red;"></td>
								<td style="display:none;" id="ifsubmit"></td>
							</tr>
							<tr>
								<td class="headphoto">头像</td>
								<td><img src="<%=path%>${singleUser.headImageUrl}" alt="头像"
									width="150px" height="150px" id="showHeadImageUrl" style="border-radius:50%;" />
									<input name="file" type="file" id="myfile" onchange="preImg(this.files)">
								    <input type="hidden" name="id" value="${singleUser.id}" id="updateHeadImageId"/>
								    	<p id="message">请选择要上传的图片...</p>
									<button type="button" id="update" class="change" onclick="updateHeadImage1('abc')">更换头像</button></td>
							</tr>
							<tr>
								<td>联系方式</td>
								<td><input type="text" name="conninfo"
									value="${singleUser.conninfo}" maxlength="20" /></td>
							</tr>
							<tr>
								<td>性别</td>
								<c:if test="${singleUser.sex == '0' }">
								<td>
										<input type="radio" name="sex" value="0" id="male" checked>
										<label for="male">男</label>
										<input type="radio" name="sex" value="1" id="female">
										<label for="female">女</label>
										<input type="radio" name="sex" value="2" id="secret">
										<label for="secret">保密</label></td>
								</c:if>
								<c:if test="${singleUser.sex == '1' }">
								   <td>
									<input type="radio" name="sex" value="0" id="male">
									<label for="male">男</label>
									<input type="radio" name="sex" value="1" id="female" checked>
									<label for="female">女</label>
									<input type="radio" name="sex" value="2" id="secret">
									<label for="secret">保密</label>
									</td>
								</c:if>
								<c:if test="${singleUser.sex == '2' }">
								 	<td>
									<input type="radio" name="sex" value="0" id="male">
									<label for="male">男</label>
									<input type="radio" name="sex" value="1" id="female">
									<label for="female">女</label>
									<input type="radio" name="sex" value="2" id="secret" checked>
									<label for="secret">保密</label>
									</td>
								</c:if>
							</tr>

							<tr>
								<td>个人介绍</td>
								<td><textarea name="introduce" rows="8" cols="40"
										maxlength="100">${singleUser.introduce}</textarea></td>
							</tr>
						</table>
						<input type="hidden" name="id" value="${singleUser.id}"/>
						<input type="hidden" name="pwd" value="${singleUser.pwd}"/>
						<input type="button" name="saves" class="change"
							style="margin-left:141px;" onclick="updateUserInfo()"
							value="确定修改"> <input type="reset" name="change"
							class="change" value="重置">
					</form>
				</div>
				<div class="box-text-second box-text" style="display:none;">
					<div class="huodong">
						<div class="item1">
							<span id="activityName">预约的活动名称</span> <a href="#">订单详情</a> <a href="#">删除</a>
						</div>
					
					
					</div>
					<div id="orderActivity"></div>
				</div>
				<div class="box-text-third box-text">
					<div class="xiangju">
						<div class="item1">
							<span>预约的乡居名称</span> <a href="#">订单详情</a> <a href="#">删除</a>
						</div>
					</div>
			 	<div id="orderXiangJu"></div>
				</div>
				<div class="box-text-fourth box-text">
					<div class="storys">
						<div class="item1">
							<span>书写的故事</span> <a href="#">订单详情</a> <a href="#">删除</a>
						</div>
					</div>
					<div id="myStory"></div>
				</div>
				<div class="box-text-fourth box-text">
					<div class="storys">
						<div class="item1">
							<span>请输入原密码：<input type="password" name="oldPassword" style="width:150px;height:30px;border:1px solid green;"/></span><br/><br/><br/>
							<span>请输入新密码：<input type="password" name="newPassword" style="width:150px;height:30px;border:1px solid green;"/></span><br/><br/><br/>
							<span>请再次输入新密码：<input type="password" name="reNewPassword" style="width:150px;height:30px;border:1px solid green;"/></span><br/><br/><br/>
							<span><input type="button" onclick="updateUserPwd()" value="确定修改" style="border-radius:5px;color:white;width:60px;height:30px;border:none;background:rgba(94, 196, 94, 0.98);"/></span>
						</div>
					</div>
					<div id="myStory"></div>
				</div>
			</div>
		</div>
	</div>
	<footer class="foot-footer">
		<div class="foot-div">
			<div class="foot-friendship">
				<h4 class="foot-friend-h4">友情链接</h4>
				<div class="foot-friends">
					<a href="http://www.ctrip.com/" class="foot-friend">携程旅行</a> <a
						href="http://www.tuniu.com/" class="foot-friend">途牛旅游</a> <a
						href="https://www.ly.com/" class="foot-friend">同程旅游</a> <a
						href="https://www.alitrip.com/" class="foot-friend">淘宝旅行</a> <a
						href="https://www.qunar.com/" class="foot-friend">去哪儿网</a> <a
						href="http://guide.qyer.com/" class="foot-friend">穷游锦囊</a> <a
						href="http://map.baidu.com/" class="foot-friend">百度地图</a> <a
						href="http://www.autonavi.com/" class="foot-friend">高德地图</a> <a
						href="<%=path%>/sxw/about.jsp" class="foot-friend">关于我们</a>

				</div>
			</div>
			<div class="foot-nav">
				<a href="<%=path%>/sxw/showIndex">首页</a> · <a
					href="<%=path%>/sxw/showView">景点</a> · <a
					href="<%=path%>/sxw/showActivity">体验</a> · <a
					href="<%=path%>/sxw/showLive">乡居</a> · <a
					href="<%=path%>/sxw/showStory">故事</a> · <a
					href="<%=path%>/sxw/login.jsp">登录/注册</a>

			</div>
			<div class="foot-down">
				<p class="foot-p">Copyright © 2017尚书悠 版权归 our team 所有</p>
			</div>
	</footer>
	<p style="display:none;" id="activityTotalPages"></p>
	<p style="display:none;" id="activityCurrentPage"></p>
	<script src="../js/initAJAX.js"></script>
	<script src="../js/personal.js"></script>
	<script type="text/javascript">
	function updateUserInfo(){
	var reg = /\s+/g;
	var userName = document.getElementsByName("username")[0];
	var conninfo = document.getElementsByName("conninfo")[0];
	var introduce = document.getElementsByName("introduce")[0];
	if(reg.test(userName.value) || reg.test(conninfo.value)){
		swal(
				'不能包含空格等',
				'非法字符',
				'warning'
			);
			//alert("不能包含空格等非法字符！");
			return false;
		
	}
	if(userName.value == '' || conninfo.value == '' || introduce.value == '') {
			swal(
				'任意一项',
				'不能为空',
				'warning'
			);
			//alert("任意一项不能为空！");
			return false;
			}
	if(userName.value != '' && conninfo.value != '' && introduce.value != ''){
		initAJAX();
		var sex = document.getElementsByName("sex");
		var id = document.getElementsByName("id")[0];
		var pwd = document.getElementsByName("pwd")[0];
		var sexRadioChecked;
		for (var i = 0; i < sex.length; i++) {
			if (sex[i].checked) {
				sexRadioChecked = i;
			//alert(sexRadioChecked);
			}
		}
		xmlHttp.open("POST", "<%=path%>/sxw/checkuser?name=" + encodeURI(encodeURI(userName.value)
				+ "&checkUpdateUser=checkUpdateUser&id=" + id.value + "&pwd=" + pwd.value
				+ "&conninfo=" + conninfo.value + "&introduce=" + encodeURI(introduce.value) + "&ifadmin=0"  + "&sex=" + sexRadioChecked), true);
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
					swal(
						'用户信息',
						'修改成功',
						'success'
					);
				}
			}
		}
		
	}
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
			xmlHttp.open("POST", "<%=path%>/sxw/uploadFrontHeadImage", true);
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
		
		// 获取活动订单
		function getActivity() {
			initAJAX();
			xmlHttp.open("POST", "<%=path%>/sxw/showFrontOrderActivity", true);
			xmlHttp.send();
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var res = xmlHttp.responseText;
					//alert(res);
					var res = eval('(' + res + ')');
					var activityTotalPages;
					var activityCurrentPage;
					var huodong1 = "";
					for(var i in res){
					activityTotalPages = res[i].totalPages;
					activityCurrentPage = res[i].currentPage;
					huodong1 += "<div class='item1'><span id='activityName'>" + res[i].activityType + "</span><span id='activityName'>" + res[i].phoneNumber + "</span><span id='activityName'>" + res[i].checkInDate + "</span>" +
					 "<a href='#' onclick='" +"deleteOrderActivity(" + "&apos;" + res[i].id + "&apos;" +  ")'>删除</a></div>";
					}
					huodong1 = "<span id='activityName'>预约的活动名称</span><span id='activityName'>联系方式</span><span id='activityName'>参加日期</span><span>功能</span>" + huodong1;
				    var huodong = document.getElementsByClassName("huodong")[0];
				    huodong.innerHTML = huodong1;
					$(function() {
						$("#orderActivity").pagination(activityTotalPages, {
							items_per_page : 10, // 每页显示多少条记录
							current_page : activityCurrentPage - 1, // 当前显示第几页数据
							num_display_entries : 6, // 分页显示的条目数
							next_text : "下一页",
							prev_text : "上一页",
							num_edge_entries : 2, // 连接分页主体，显示的条目数
							callback : handlePaginationClickActivity
						});
					});
					}
			}
		}
		
		function handlePaginationClickActivity(new_page_index, pagination_container) { 
			initAJAX();
			xmlHttp.open("POST", "<%=path%>/sxw/showFrontOrderActivity?pageNum=" + (new_page_index + 1), true);
			xmlHttp.send();
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var res = xmlHttp.responseText;
					//alert(res);
					var res = eval('(' + res + ')');
					var huodong1 = "";
					var activityTotalPages;
					var activityCurrentPage;
					for(var i in res){
					activityTotalPages = res[i].totalPages;
					activityCurrentPage = res[i].currentPage;
					huodong1 += "<div class='item1'><span id='activityName'>" + res[i].activityType + "</span><span id='activityName'>" + res[i].phoneNumber + "</span><span id='activityName'>" + res[i].checkInDate + "</span>" +
					 "<a href='#' onclick='" +"deleteOrderActivity(" + "&apos;" + res[i].id + "&apos;" +  ")'>删除</a></div>";					}
					huodong1 = "<span id='activityName'>预约的活动名称</span><span id='activityName'>联系方式</span><span id='activityName'>参加日期</span><span>功能</span>" + huodong1;
				    var huodong = document.getElementsByClassName("huodong")[0];
				    huodong.innerHTML = huodong1;
				    	$(function() {
						$("#orderActivity").pagination(activityTotalPages, {
							items_per_page : 10, // 每页显示多少条记录
							current_page : activityCurrentPage - 1, // 当前显示第几页数据
							num_display_entries : 6, // 分页显示的条目数
							next_text : "下一页",
							prev_text : "上一页",
							num_edge_entries : 2, // 连接分页主体，显示的条目数
							callback : handlePaginationClickActivity
						});
					});
				}
			}
	}
	
	
	// 获取乡居订单情况
	function getXiangJu(){
			initAJAX();
			xmlHttp.open("POST", "<%=path%>/sxw/showOrderXiangJu", true);
			xmlHttp.send();
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var res = xmlHttp.responseText;
					//alert(res);
					var res = eval('(' + res + ')');
					var XiangJuTotalPages;
					var XiangJuCurrentPage;
					var xiangJu1 = "";
					for(var i in res){
					XiangJuTotalPages = res[i].totalPages;
					XiangJuCurrentPage = res[i].currentPage;
					xiangJu1 += "<div class='item1'><span id='xiangJuName'>" + res[i].houseType + "</span><span id='xiangJuName'>" + res[i].phoneNumber + "</span><span id='xiangJuName'>" + res[i].checkInDate + "——" + res[i].checkOutDate + "</span>" + "<a href='#' onclick='" +"deleteOrderXiangJu(" + "&apos;" + res[i].id + "&apos;" +  ")'>删除</a></div>";
					}
					xiangJu1 = "<span id='activityName'>预约的乡居名称</span><span id='activityName'>联系方式</span><span id='activityName'>入住-离开日期</span><span>功能</span>" + xiangJu1;
					//alert(xiangJu1);
				    var xiangju = document.getElementsByClassName("xiangju")[0];
				    xiangju.innerHTML = xiangJu1;
					$(function() {
						$("#orderXiangJu").pagination(XiangJuTotalPages, {
							items_per_page : 10, // 每页显示多少条记录
							current_page : XiangJuCurrentPage - 1, // 当前显示第几页数据
							num_display_entries : 6, // 分页显示的条目数
							next_text : "下一页",
							prev_text : "上一页",
							num_edge_entries : 2, // 连接分页主体，显示的条目数
							callback : handlePaginationClickXiangJu
						});
					});
					}
			}
	
	
	}
		function handlePaginationClickXiangJu(new_page_index, pagination_container) { 
			initAJAX();
			xmlHttp.open("POST", "<%=path%>/sxw/showOrderXiangJu?pageNum=" + (new_page_index + 1), true);
			xmlHttp.send();
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var res = xmlHttp.responseText;
					//alert(res);
					var res = eval('(' + res + ')');
					var XiangJuTotalPages;
					var XiangJuCurrentPage;
					var xiangJu1 = "";
					for(var i in res){
					XiangJuTotalPages = res[i].totalPages;
					XiangJuCurrentPage = res[i].currentPage;
					xiangJu1 += "<div class='item1'><span id='xiangJuName'>" + res[i].houseType + "</span><span id='xiangJuName'>" + res[i].phoneNumber + "</span><span id='xiangJuName'>" + res[i].checkInDate + "——" + res[i].checkOutDate + "</span>" + "<a href='#' onclick='" +"deleteOrderXiangJu(" + "&apos;" + res[i].id + "&apos;" +  ")'>删除</a></div>";
					}
					//alert(xiangJu1);
					xiangJu1 = "<span id='activityName'>预约的乡居名称</span><span id='activityName'>联系方式</span><span id='activityName'>入住-离开日期</span><span>功能</span>" + xiangJu1;
				    var xiangju = document.getElementsByClassName("xiangju")[0];
				    xiangju.innerHTML = xiangJu1;
					$(function() {
						$("#orderXiangJu").pagination(XiangJuTotalPages, {
							items_per_page : 10, // 每页显示多少条记录
							current_page : XiangJuCurrentPage - 1, // 当前显示第几页数据
							num_display_entries : 6, // 分页显示的条目数
							next_text : "下一页",
							prev_text : "上一页",
							num_edge_entries : 2, // 连接分页主体，显示的条目数
							callback : handlePaginationClickXiangJu
						});
					});
					}
			}
	}
	
	
	// 获取故事信息
	function getStory(){
			initAJAX();
			xmlHttp.open("POST", "<%=path%>/sxw/getStory", true);
			xmlHttp.send();
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var res = xmlHttp.responseText;
					//alert(res);
					var res = eval('(' + res + ')');
					var StoryTotalPages;
					var StoryCurrentPage;
					var story1 = "";
					for(var i in res){
					StoryTotalPages = res[i].totalPages;
					StoryCurrentPage = res[i].currentPage;
					story1 += "<div class='item1'><span id='storyName' style='width:150px;'><a href='" + "<%=path%>/sxw/showSingleStoryServlet?id=" + res[i].id + "&type=story" + "'>"  + res[i].viewTitle + "</a></span><span id='addtime' style='width:150px;'>" + res[i].addtime.substring(0,10) + "</span><a href='#' onclick='" +
					 "deleteUserStory(" + "&apos;" + res[i].id + "&apos;"+ ",&apos;" + res[i].imageUrl + "&apos;" + ")'>删除</a></div>";		
					}
					story1 = "<div class='item1'><span id='storyName' style='width:150px;'>故事名称</span><span id='addtime' style='width:150px;'>发表时间</span><a href='#'>功能</a></div>" + story1;
					//alert(StoryCurrentPage + "," + StoryTotalPages);
				    var storys = document.getElementsByClassName("storys")[0];
				    storys.innerHTML = story1;
					$(function() {
						$("#myStory").pagination(StoryTotalPages, {
							items_per_page : 6, // 每页显示多少条记录
							current_page : StoryCurrentPage - 1, // 当前显示第几页数据
							num_display_entries : 6, // 分页显示的条目数
							next_text : "下一页",
							prev_text : "上一页",
							num_edge_entries : 2, // 连接分页主体，显示的条目数
							callback : handlePaginationClickStory
						});
					});
					}
			}
	
	
	}
	function handlePaginationClickStory(new_page_index, pagination_container) { 
			initAJAX();
			xmlHttp.open("POST", "<%=path%>/sxw/getStory?pageNum=" + (new_page_index + 1), true);
			xmlHttp.send();
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var res = xmlHttp.responseText;
					//alert(res);
					var res = eval('(' + res + ')');
					var StoryTotalPages;
					var StoryCurrentPage;
					var story1 = "";
					for(var i in res){
					StoryTotalPages = res[i].totalPages;
					StoryCurrentPage = res[i].currentPage;
					story1 += "<div class='item1'><span id='storyName' style='width:150px;'><a href='" + "<%=path%>/sxw/showSingleStoryServlet?id=" + res[i].id + "&type=story" + "'>"  + res[i].viewTitle + "</a></span><span id='addtime' style='width:150px;'>" + res[i].addtime.substring(0,10) + "</span><a href='#' onclick='" +
					 "deleteUserStory(" + "&apos;" + res[i].id + "&apos;"+ ",&apos;" + res[i].imageUrl + "&apos;" + ")'>删除</a></div>";		
					}
					story1 = "<div class='item1'><span id='storyName' style='width:150px;'>故事名称</span><span id='addtime' style='width:150px;'>发表时间</span><a href='#'>功能</a></div>" + story1;
					//alert(StoryCurrentPage + "," + StoryTotalPages);
				    var storys = document.getElementsByClassName("storys")[0];
				    storys.innerHTML = story1;
					$(function() {
						$("#myStory").pagination(StoryTotalPages, {
							items_per_page : 6, // 每页显示多少条记录
							current_page : StoryCurrentPage - 1, // 当前显示第几页数据
							num_display_entries : 6, // 分页显示的条目数
							next_text : "下一页",
							prev_text : "上一页",
							num_edge_entries : 2, // 连接分页主体，显示的条目数
							callback : handlePaginationClickStory
						});
					});
					}
			}
	}
	
	
	function deleteUserStory(id,imageUrl) {
			swal({
				title : '确定删除吗？',
				text : '你将无法恢复它！',
				type : 'warning',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '确定删除！',
			}).then(function() {
				initAJAX();
				xmlHttp.open("POST", '<%=path%>/sxw/deleteViewStory?id=' + id + "&imageUrl=" + imageUrl, true);
				xmlHttp.send();
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
	                   var res = xmlHttp.responseText;
	                   if(res == 'success') {
								swal(
									'删除',
									'成功',
									'success'
								);
							setTimeout(function() {
								window.location.reload();
							}, 3000);
							} else { 
	                            swal(
									'删除',
									'失败',
									'error'
								) ;
	                   }
	                   
					}
				}
			});
		}
		
		function deleteOrderActivity(id) {
			//alert(id + "," + deleteOneComment);
			swal({
				title : '确定删除该订单吗？',
				text : '删除之后将无法恢复！',
				type : 'warning',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '确定删除！',
			}).then(function() {
				initAJAX();
				xmlHttp.open("POST", "<%=path%>/sxw/deleteUserOrder?id=" + id + "&order=orderActivity", true);
				xmlHttp.send();
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
						var res = xmlHttp.responseText;
						if (res == "success") {
							swal(
								'删除',
								'成功',
								'success'
							);
							setTimeout(function() {
								window.location.reload();
							}, 3000);
						} else {
							swal(
								'删除',
								'失败',
								'warning'
							);
						}
					}
				}
	
			});
	
		}
			function deleteOrderXiangJu(id) {
			//alert(id + "," + deleteOneComment);
			swal({
				title : '确定删除该订单吗？',
				text : '删除之后将无法恢复！',
				type : 'warning',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '确定删除！',
			}).then(function() {
				initAJAX();
				xmlHttp.open("POST", "<%=path%>/sxw/deleteUserOrder?id=" + id + "&order=orderXiangJu", true);
				xmlHttp.send();
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
						var res = xmlHttp.responseText;
						if (res == "success") {
							swal(
								'删除',
								'成功',
								'success'
							);
							setTimeout(function() {
								window.location.reload();
							}, 3000);
						} else {
							swal(
								'删除',
								'失败',
								'warning'
							);
						}
					}
				}
	
			});
	
		}
		function updateUserPwd(){
		var oldPassword  = document.getElementsByName("oldPassword")[0];
		var newPassword = document.getElementsByName("newPassword")[0];
		var reNewPassword = document.getElementsByName("reNewPassword")[0];
		if(oldPassword.value == ''){
						swal(
								'请输入',
								'原密码',
								'warning'
							);
							return;
		}
		if(newPassword.value == ''){
							swal(
								'请输入',
								'新密码',
								'warning'
							);
							return;
		}
		if(reNewPassword.value == ''){
							swal(
								'请再次输入',
								'新密码',
								'warning'
							);
							return;
		}
		if(reNewPassword.value != newPassword.value){
							swal(
								'新密码和原密码',
								'不一致！',
								'warning'
							);
							return;
		}
		if(reNewPassword.value == newPassword.value){
		initAJAX();
		xmlHttp.open("POST","<%=path%>/sxw/updateUserPwd?oldPassword=" + oldPassword.value + "&newPassword=" + newPassword.value + "&ifuser=0",true);
		xmlHttp.send();
		xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
		   var res = xmlHttp.responseText;
		   if(res == "0"){
						 		swal(
										'原密码',
										'错误！',
										'warning'
									);
		   }else if (res == "1"){
		      					swal(
										'新修改的密码',
										'不能和原密码一致！',
										'warning'
									);
		   }else if (res == "2"){
		     					swal(
										'修改密码成功！',
										'2秒后跳转到登录界面！',
										'success'
									);					
					setTimeout(function() {
						window.location.href = '<%=path%>/sxw/loginout';
					}, 2000);
								
		   }
		}
		}
		}
		}

	</script>
</body>
	</html>
</c:forEach>