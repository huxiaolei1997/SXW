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
			+ "pagerUser";

	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	}
	session.setAttribute("url", url);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>用户管理</title>
<meta name="description" content="这是一个  index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.js" type="text/javascript"></script>
<link rel="icon" type="image/png" href="../i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="../i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="../css/amazeui.min.css" />
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/app.css">
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<script
	src="../js/sweetalert2.min.js"></script>
<link
	href="../css/sweetalert2.min.css"
	rel="stylesheet">
<script
	src="../js/core.js"></script>
<style type="text/css">
#myModal {
	top: 10%;
}

.pagination a {
	border-radius: 3px;
}

.pagination a, .pagination span {
	border-radius: 3px;
}
</style>

<script src="../js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../js/jquery.pagination.js"></script>
<script type="text/javascript">

	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		$("#pager").attr("action", "<%=path%>/test2/pagerUser?pageNum=" + (new_page_index + 1));
		$("#pager").submit();
		return false;
	}

	$(function() {
		$("#News-Pagination").pagination(${totalPages}, {
			items_per_page : 10, // 每页显示多少条记录
			current_page : ${currentPage} - 1, // 当前显示第几页数据
			num_display_entries : 6, // 分页显示的条目数
			next_text : "下一页",
			prev_text : "上一页",
			num_edge_entries : 2, // 连接分页主体，显示的条目数
			callback : handlePaginationClick
		});
	});
</script>

</head>

<body data-type="generalComponents">




	<header class="am-topbar am-topbar-inverse admin-header">
		<div class="am-topbar-brand">
			<a href="<%=path%>/test2/showBackIndex" class="tpl-logo"> <img
				src="../img/logo.png" alt="">
			</a>
		</div>
		<button
			class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
			data-am-collapse="{target: '#topbar-collapse'}">
			<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
		</button>
<div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right" style="margin-left:30px;"></div>
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
							<li><a href="javascript:;" data-am-modal="{target: '#doc-modal-2', closeViaDimmer: 0, width: 400, height: 300}"><span class="am-icon-cog"></span>修改密码</a></li>
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







	<div class="tpl-page-container tpl-page-header-fixed">

		<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-title">功能列表</div>
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a href="<%=path%>/test2/showBackIndex"
						class="nav-link"> <i class="am-icon-home"></i> <span>首页</span>
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





		<div class="tpl-content-wrapper">
			<div class="tpl-content-page-title">用户和评论管理</div>
			<ol class="am-breadcrumb">
				<li><a href="<%=path%>/test2/showBackIndex" class="am-icon-home">首页</a></li>
				<li><a href="<%=path%>/test2/pagerUser">用户和评论管理</a></li>
				<li class="am-active">用户管理</li>
			</ol>
			<div class="tpl-portlet-components">

				<div class="tpl-block">
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-xs">
									<button type="button"
										class="am-btn am-btn-default am-btn-success"
										data-toggle="modal" data-target="#myModal"
										onclick="al('','','','','','','','')">
										<span class="am-icon-plus"></span> 新增用户
									</button>
								</div>
							</div>
						</div>
						<form action="<%=path%>/test2/pagerUser" id="pager" method="post"
							name="pager">
							<div class="am-u-sm-12 am-u-md-3">
								<div class="am-form-group">
									<select data-am-selected="{btnSize: 'sm'}" name="ifadmin"
										id="ifadmin" onchange="pagerUser()">
										<c:if test="${ifadmin == 0 }">
											<option value="0" selected>用户类别</option>
											<option value="1">普通用户</option>
											<option value="2">管理员</option>
										</c:if>
										<c:if test="${ifadmin == 1 }">
											<option value="0">用户类别</option>
											<option value="1" selected>普通用户</option>
											<option value="2">管理员</option>
										</c:if>
										<c:if test="${ifadmin == 2 }">
											<option value="0">用户类别</option>
											<option value="1">普通用户</option>
											<option value="2" selected>管理员</option>
										</c:if>
									</select>
								</div>
							</div>
							<div class="am-u-sm-12 am-u-md-3">
								<div class="am-input-group am-input-group-sm">
									<input type="text" class="am-form-field" name="keyword"
										value="${keyword}"> <span class="am-input-group-btn">
										<input
										class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search"
										type="submit" value="查询"></input>
									</span>
								</div>
							</div>
						</form>
					</div>
					<div class="am-g">
						<div class="am-u-sm-12">

							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox"
											onClick="selectUser()" id="selectAllBox"
											class="tpl-table-fz-check"></th>
										<th class="table-id serial-number">序号</th>
										<th class="table-id">ID</th>
										<th class="table-headImageUrl">头像</th>
										<th class="table-sex">性别</th>
										<th class="table-title">用户名</th>
										<th class="table-type">密码</th>
										<th class="table-author am-hide-sm-only">联系方式</th>
										<th class="table-date am-hide-sm-only">自我介绍</th>
										<th class="table-set">
											<input type="button" value="反选"
											onClick="selectBox('reverse')" style="cursor: pointer;"
											class="am-btn am-btn-default am-btn-xs" /> <input
											type="button" name="button" value="删除"
											style="cursor: pointer;"
											class="am-btn am-btn-default am-btn-xs am-text-danger"
											onclick="deleteUser()" /></th>

									</tr>
								</thead>
								<tbody>
									<c:if test="${fn:length(result) eq 0 }">
										<span>查询的结果为空</span>
									</c:if>
									<c:if test="${keyword != '' && keyword != null }">
										<c:if test="${fn:length(result) ne 0 }">
											<span>在<c:if test="${ifadmin == 0 }">
													<span style="color:red;">所有用户</span>中查询
												<span style="color:red">${keyword }</span>
												</c:if> <c:if test="${ifadmin == 1 }">
													<span style="color:red;">普通用户</span>中查询
												<span style="color:red">${keyword }</span>
												</c:if> <c:if test="${ifadmin == 2 }">
													<span style="color:red;">管理员用户</span>中查询
												<span style="color:red">${keyword }</span>
												</c:if>的结果：总共有${totalPages }条记录
											</span>
										</c:if>
									</c:if>
									<c:if test="${keyword == '' || keyword == null  }">
										<span>目前共有${totalPages}个用户</span>
									</c:if>
									<form action="<%=path%>/sxw/Delete" id="deleteUser"
										method="post" onsubmit="return false";>
										<input type="hidden" value="deleteUser" name="deleteUser">
										<c:forEach items="${result}" var="user" varStatus="status">
											<tr>
												<td><input type="checkbox" name="id[]"
													value="${user.id}"></td>
												<td>${(currentPage - 1) * 10 + status.index + 1}</td>
												<td>${user.id}</td>
												<td><img src="<%=path%>${user.headImageUrl}"
													class="am-circle am-img-thumbnail am-btn"
													style="width:60px;height:60px;border-radius:50%;" onclick="showImage('${user.id}','<%=path%>${user.headImageUrl}')" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 260}"/></td>
												<td><c:if test="${user.sex == '0'}">
												男
												</c:if> <c:if test="${user.sex == '1'}">
												女
												</c:if> <c:if test="${user.sex == '2'}">
												保密
												</c:if></td>
												<c:if test="${user.ifadmin == '0'}">
													<td><a href="#">${user.name}</a></td>
												</c:if>
												<c:if test="${user.ifadmin == '1'}">
													<td><a href="#" style="color:red;">${user.name}</a></td>
												</c:if>
												<td>*********</td>
												<td class="am-hide-sm-only">${user.conninfo}</td>
												<td class="am-hide-sm-only">${user.introduce}</td>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<button
																class="am-btn am-btn-default am-btn-xs am-text-secondary"
																data-toggle="modal" data-target="#myModal"
																onclick="al('${user.id}','${user.name}','${user.headImageUrl}','${user.sex}','${user.pwd}','${user.conninfo}','${user.introduce}','${user.ifadmin}')">
																<span class="am-icon-pencil-square-o"></span> 编辑
															</button>
															<button
																class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
																onclick="deleteOneUser('${user.id}','deleteOneUser')">
																<span class="am-icon-trash-o"></span> 删除
															</button>

														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
									</form>
								</tbody>
							</table>

							<div class="am-cf">
								<c:if test="${fn:length(result) ne 0 }">
									<div id="News-Pagination" style="float:right;"></div>
								</c:if>
							</div>
							<hr>
						</div>
					</div>
				</div>
				<div class="tpl-alert"></div>
			</div>
		</div>
	</div>
	<button type="button" >
  Modal
</button>
<!-- 模态框展示修改头像start -->
<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
  <div class="am-modal-dialog">
    <div class="am-modal-hd"><p id="message">更换头像</p>
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
    <form action="<%=path%>/sxw/updateHeadImage" id="updateHeadImage" method="post" enctype="multipart/form-data">
     <img src="" id="showHeadImageUrl" style="width:100px;height:100px;border-radius:50%;" />
	 <div class="am-form-group am-form-file">
		<button type="button" class="am-btn am-btn-default am-btn-sm">
			<i class="am-icon-cloud-upload"></i> 浏览本地文件
		</button>
		<input name="file" type="file" id="myfile" onchange="preImg(this.files)">
	</div>
	<input type="hidden" name="id" value="" id="updateHeadImageId"/>
	<input type="button" id="update" class="am-btn am-btn-primary" value="确认更换" onclick="updateHeadImage('abc')"/>
	</form>
    </div>
  </div>
</div>
<!-- 模态框展示修改头像end -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">用户信息修改</h4>
				</div>
				<div class="modal-body">
					<form action="<%=path%>/test2/addUser" name="addUser" method="post">
						<div class="form-group" style="display:none">
							<label for="exampleInputEmail1">ID</label> <input type="text"
								class="form-control" id="ID" placeholder="请输入用户名" maxlength="10">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">用户名</label> <input type="text"
								class="form-control" id="userName" placeholder="请输入用户名"
								maxlength="10">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">密码</label> <input
								type="password" class="form-control" id="password"
								placeholder="请输入密码" maxlength="20">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">联系方式</label> <input
								type="text" class="form-control" id="connInfo"
								placeholder="请输入联系方式" maxlength="20">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">自我介绍</label>
							<textarea class="form-control" rows="3" id="introduce"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">性别</label><br /> <label
								class="radio-inline"> <input type="radio"
								name="sexRadio1" id="manRadio" value="0"> 男
							</label> <label class="radio-inline"> <input type="radio"
								name="sexRadio1" id="womanRadio" value="1"> 女
							</label> <label class="radio-inline"> <input type="radio"
								name="sexRadio1" id="secretRadio" value="2"> 保密
							</label>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">用户类型</label><br /> <label
								class="radio-inline"> <input type="radio"
								name="userRadio1" id="userRadio" value="0"> 普通用户
							</label> <label class="radio-inline"> <input type="radio"
								name="userRadio1" id="adminRadio" value="1"> 管理员
							</label>
						</div>
						<button type="button" class="btn btn-default" id="submitAddUser"
							onclick="checkAddUser()">增加用户</button>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="saveUpdate"
						onclick="checkUpdate()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-2">
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
	<script src="../js/amazeui.min.js"></script>
	<script src="../js/app.js"></script>
	<script src="../js/selectall.js"></script>
	<script src="../js/initAJAX.js"></script>
	<script type="text/javascript">
		var oldPassword = document.getElementsByName("oldPassword")[0];
		var newPassword = document.getElementsByName("newPassword")[0];
		var updatePwdMessage = document.getElementById("updatePwdMessage");
		function updatePwd() {
			if (oldPassword.value == '') {
				updatePwdMessage.innerHTML = "请输入原密码";
				updatePwdMessage.style.color = 'red';
				return;
			}
			if (newPassword.value == '') {
				updatePwdMessage.innerHTML = "请输入新密码";
				updatePwdMessage.style.color = 'red';
				return;
			}
			if (oldPassword.value != '' && newPassword.value != '') {
				initAJAX();
				xmlHttp.open("POST", "<%=path%>/sxw/updateUserPwd?oldPassword=" + oldPassword.value + "&newPassword=" + newPassword.value, true);
				xmlHttp.send();
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
						var res = xmlHttp.responseText;
						if (res == "0") {
							updatePwdMessage.innerHTML = "原密码错误";
							updatePwdMessage.style.color = 'red';
						} else if (res == "1") {
							updatePwdMessage.innerHTML = "新修改的密码不能和原密码一致！";
							updatePwdMessage.style.color = 'red';
						} else if (res == "2") {
							updatePwdMessage.innerHTML = "修改密码成功！";
							updatePwdMessage.style.color = 'green';
						}
					}
				}
			}
		}
	</script>
	<script type="text/javascript">

		var Id = document.getElementById("ID");
		var userName = document.getElementById("userName");
		var password = document.getElementById("password");
		var connInfo = document.getElementById("connInfo");
		var introDuce = document.getElementById("introduce");
		var userRadio = document.getElementById("userRadio");
		var adminRadio = document.getElementById("adminRadio");
		var manRadio = document.getElementById("manRadio");
		var womanRadio = document.getElementById("womanRadio");
		var secretRadio = document.getElementById("secretRadio");
		var submitAddUser = document.getElementById("submitAddUser");
		var saveUpdate = document.getElementById("saveUpdate");
		var reg = /\s+/g;
		function al(id, name, headImageUrl, sex, pwd, conninfo, introduce, ifadmin) {
			var myModalLabel = document.getElementById("myModalLabel");
			//alert(id + "," + name + "," + pwd + "," + conninfo + "," + introduce + "," + ifadmin);
			if (name != '' && pwd != '' && connInfo != '' && introduce != '' && ifadmin != '') {
				Id.value = id;
				userName.value = name;
				password.value = pwd;
				connInfo.value = conninfo;
				introDuce.value = introduce;
				saveUpdate.style.display = "inline-block";
				submitAddUser.style.display = "none";
				myModalLabel.innerHTML = '用户信息修改';
			}
			if (ifadmin == '0') {
				userRadio.checked = 'checked';
			} else if (ifadmin == '1') {
				adminRadio.checked = 'checked';
			}
			if (sex == '0') {
				manRadio.checked = 'checked';
			} else if (sex == '1') {
				womanRadio.checked = 'checked';
			} else if (sex == '2') {
				secretRadio.checked = 'checked';
			} else {
				userName.value = '';
				password.value = '';
				connInfo.value = '';
				introDuce.value = '';
				userRadio.checked = 'checked';
				manRadio.checked = 'checked';
				saveUpdate.style.display = "none";
				submitAddUser.style.display = "block";
				myModalLabel.innerHTML = '添加用户';
			}
	
		}
		/*
		*添加用户
		*/
		function checkAddUser() {
			initAJAX();
			//function updateUser() {
			//	xmlHttp.open("POST", "/sxw/checkuser?name=" + encodeURI(encodeURI(userName.value)) + "&checkUpdateUser=checkUpdateUser")
			//	}
			if (reg.test(userName.value) || reg.test(password.value) || reg.test(connInfo.value) || reg.test(introDuce.value)) {
				//alert("不能包含空格等非法字符！");
				swal(
					'不能包含空格等',
					'非法字符',
					'warning'
				)
				return false;
			}
			if (userName.value == '' || password.value == '' || connInfo.value == '' || introDuce.value == '') {
				//alert("任意一项不能为空！");
				swal(
					'任意一项',
					'不能为空',
					'warning'
				)
				return false;
			}
			if (!reg.test(userName.value) && userName.value != '') {
				var fla = false;
				var userRadio1 = document.getElementsByName("userRadio1");
				var sexRadio1 = document.getElementsByName("sexRadio1");
				var userRadioChecked,
					sexRadioChecked;
				for (var i = 0; i < userRadio1.length; i++) {
					if (userRadio1[i].checked) {
						userRadioChecked = i;
					//alert(userRadioChecked);
					}
				}
				for (var i = 0; i < sexRadio1.length; i++) {
					if (sexRadio1[i].checked) {
						sexRadioChecked = i;
					//alert(userRadioChecked);
					}
				}
				xmlHttp.open("POST", "<%=path%>/sxw/checkAddUser?name=" + encodeURI(encodeURI(userName.value)) + "&checkAddUser=checkAddUser"
					+ "&pwd=" + password.value + "&conninfo=" + connInfo.value + "&introduce=" + encodeURI(encodeURI(introDuce.value)) + "&ifadmin=" + userRadioChecked + "&sex=" + sexRadioChecked, true);
				xmlHttp.send();
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
						var res = xmlHttp.responseText;
						if (res == "false") {
							//alert("用户名已经存在！");
							swal(
								'用户名',
								'已经存在',
								'warning'
							)
							return fla;
						} else if (res == "true") {
							fla = true;
							swal(
								'用户',
								'添加成功！',
								'success'
							);
							setTimeout(function() {
								window.location.reload();
							}, 2000);
						//addUser.submit();
						}
					}
				}
				return fla;
			}
		//addUser.submit();
		//alert("提交表单成功！");
		}
		/*
		*修改用户信息
		*/
		function checkUpdate() {
			initAJAX();
	
			if (reg.test(userName.value) || reg.test(password.value) || reg.test(connInfo.value) || reg.test(introDuce.value)) {
				swal(
					'不能包含空格等',
					'非法字符',
					'warning'
				)
				//alert("不能包含空格等非法字符！");
				return false;
			}
			if (userName.value == '' || password.value == '' || connInfo.value == '' || introDuce.value == '') {
				swal(
					'任意一项',
					'不能为空',
					'warning'
				)
				//alert("任意一项不能为空！");
				return false;
			}
	
			if (!reg.test(userName.value) && userName.value != '') {
				var userRadio1 = document.getElementsByName("userRadio1");
				var sexRadio1 = document.getElementsByName("sexRadio1");
				var userRadioChecked,
					sexRadioChecked;
				for (var i = 0; i < userRadio1.length; i++) {
					if (userRadio1[i].checked) {
						userRadioChecked = i;
					//alert(userRadioChecked);
					}
				}
				for (var i = 0; i < sexRadio1.length; i++) {
					if (sexRadio1[i].checked) {
						sexRadioChecked = i;
					//alert(userRadioChecked);
					}
				}
				var flag = false;
				xmlHttp.open("POST", "<%=path%>/sxw/checkuser?name=" + encodeURI(encodeURI(userName.value)
						+ "&checkUpdateUser=checkUpdateUser&id=" + Id.value + "&pwd=" + password.value
						+ "&conninfo=" + connInfo.value + "&introduce=" + encodeURI(introDuce.value) + "&ifadmin=" + userRadioChecked + "&sex=" + sexRadioChecked), true);
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
							);
							setTimeout(function() {
								window.location.reload();
							}, 2000);
						//addUser.submit();
						}
					}
				}
				return flag;
			}
	
		//addUser.submit();
		//alert("提交表单成功！");
		}
		function deleteOneUser(id, deleteOneUser) {
			//alert(id + "," + deleteOneUser);
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
				xmlHttp.open("POST", "<%=path%>/sxw/Delete?userId=" + id + "&deleteOneUser=" + deleteOneUser, true);
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
		//下拉选择时自动提交表单
		function pagerUser() {
			var pager = document.getElementById("pager");
			pager.submit();
		}
		function showImage(id,headImageUrl){
		var showHeadImageUrl = document.getElementById("showHeadImageUrl");
		var updateHeadImageId = document.getElementById("updateHeadImageId");
		var message = document.getElementById("message");
		message.innerHTML = '更换头像';
		message.style.color = 'black';
		showHeadImageUrl.src = headImageUrl;
		updateHeadImageId.value = id;
		
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
		function updateHeadImage(abc){
		var updateHeadImage = document.getElementById("updateHeadImage");
		//var update = document.getElementById("update");
		var myfile = document.getElementById("myfile").value;
		var message = document.getElementById("message");
		if(myfile == '' || myfile == null){
		message.innerHTML = '请选择要更换的头像';
		message.style.color = 'red';
		return;
		}
		updateHeadImage.submit();
		}
	</script>
</body>
</html>