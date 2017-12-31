<%@ page language="java"
	import="java.sql.*,java.io.*,java.util.*,util.DBUtil,dao.userDao,entity.User"
	pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
			+ request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1)
			+ "PagerComment";

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
<title>用户评论管理</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.js" type="text/javascript"></script>
<link rel="icon" type="image/png" href="../i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="../i/app-icon72x72@2x.png">
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
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../js/jquery.pagination.js"></script>
<script type="text/javascript">

	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		$("#comment").attr("action", "<%=path%>/test2/PagerComment?pageNum=" + (new_page_index + 1));
		$("#comment").submit();
		return false;
	}

	$(function(){
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

	<div class="tpl-page-container tpl-page-header-fixed">

		<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-title">功能列表</div>
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a href="<%=path%>/test2/showBackIndex"
						class="nav-link"> <i class="am-icon-home"></i> <span>首页</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="<%=path %>/test2/getFileName"
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
							</a> <a href="<%=path%>/test2/pagerViewStory"> <i class="am-icon-angle-right"></i> <span>景点、故事管理</span>
										 <a href="<%=path%>/test2/pagerExperience"> <i class="am-icon-angle-right"></i> <span>体验管理</span>

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
				<li><a href="<%=path%>/test2/PagerComment">用户和评论管理</a></li>
				<li class="am-active">评论管理</li>
			</ol>
			<div class="tpl-portlet-components">
				<div class="tpl-block">
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-xs">
									&nbsp;&nbsp;<span class="am-icon-eye am-icon-sm" style="float:right;">表示评论在前台可见</span>
									<span class="am-icon-eye-slash am-icon-sm" style="float:right;">表示评论在前台不可见&nbsp;&nbsp;</span>
								</div>
							</div>
						</div>
						<form action="<%=path%>/test2/PagerComment" id="comment"
							method="post" name="comment">
							<div class="am-u-sm-12 am-u-md-3">
								<div class="am-form-group">
									<select data-am-selected="{btnSize: 'sm'}" name="commentType"
										id="commentType" onchange="pagerComment()">
										<c:if test="${commentType == 'all' }">
											<option value="all" selected>所有类别</option>
											<option value="story">故事</option>
											<option value="view">景点</option>
											<option value="experience">体验</option>
										</c:if>
										<c:if test="${commentType == 'story' }">
											<option value="all">所有类别</option>
											<option value="story" selected>故事</option>
											<option value="view">景点</option>
											<option value="experience">体验</option>
										</c:if>
										<c:if test="${commentType == 'view' }">
											<option value="all">所有类别</option>
											<option value="story">故事</option>
											<option value="view" selected>景点</option>
											<option value="experience">体验</option>
										</c:if>
										<c:if test="${commentType == 'experience' }">
											<option value="all">所有类别</option>
											<option value="story">故事</option>
											<option value="view">景点</option>
											<option value="experience" selected>体验</option>
										</c:if>
									</select>
								</div>
							</div>
							<div class="am-u-sm-12 am-u-md-3">
								<div class="am-input-group am-input-group-sm">
									<input type="text" class="am-form-field" name="keyword"
										value="${keyword }"> <span class="am-input-group-btn">
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
											class="tpl-table-fz-check" onClick="selectUser()"
											id="selectAllBox"></th>
											<th class="table-id serial-number">序号</th>
										<th class="table-id">ID</th>
										<th class="table-title">评论用户</th>
										<th class="table-type">评论内容</th>
										<th class="table-author am-hide-sm-only">评论时间</th>
										<th class="table-date am-hide-sm-only">评论编号</th>
										<th class="table-date am-hide-sm-only">评论类型</th>
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
											<span>在<c:if test="${commentType == 'all' }">
													<span style="color:red;">所有类别</span>中查询
												<span style="color:red">${keyword }</span>
												</c:if> <c:if test="${commentType == 'story' }">
													<span style="color:red;">故事</span>中查询
												<span style="color:red">${keyword }</span>
												</c:if> <c:if test="${commentType == 'view' }">
													<span style="color:red;">景点</span>中查询
												<span style="color:red">${keyword }</span>
												</c:if><c:if test="${commentType == 'experience' }">
													<span style="color:red;">景点</span>中查询
												<span style="color:red">${keyword }</span>
												</c:if>的结果：总共有${totalPages }条记录
											</span>
										</c:if>
									</c:if>
									<c:if test="${keyword == '' || keyword == null  }">
										<span>目前共有${totalPages }条评论</span>
									</c:if>
									<form action="<%=path%>/sxw/Delete" id="deleteUser"
										method="post" onsubmit="return false";>
										<input type="hidden" value="deleteComment"
											name="deleteComment">
										<c:forEach items="${result}" var="comment" varStatus="status">
											<tr>
												<td><input type="checkbox" name="id[]"
													value="${comment.id }"></td>
												<td>${(currentPage - 1) * 10 + status.index + 1}</td>
												<td>${comment.id }</td>
												<td><a href="#">${comment.commentName }</a></td>
												<td style="width:300px;height:60px;">${comment.content }<c:if test="${comment.state == '1'}"><span class="am-icon-eye am-icon-sm" style="float:right;"></span></c:if>
										<c:if test="${comment.state == '0'}"><span class="am-icon-eye-slash am-icon-sm" style="float:right;"></span></c:if></td>
												<td class="am-hide-sm-only">${fn:substring(comment.commentTime,0,10) }</td>
												<td class="am-hide-sm-only">${comment.commentId }</td>
												<c:if test="${comment.commentType == 'story' }">
												<td class="am-hide-sm-only">故事</td>
												</c:if>
												<c:if test="${comment.commentType == 'view' }">
												<td class="am-hide-sm-only">景点</td>
												</c:if>
												<c:if test="${comment.commentType == 'experience' }">
												<td class="am-hide-sm-only">体验</td>
												</c:if>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<button
																class="am-btn am-btn-default am-btn-xs am-text-secondary"
																data-toggle="modal" data-target="#myModal"
																onclick="passParameter('${comment.id }','${comment.commentName }','${comment.content }','${comment.commentTime }','${comment.commentId }','${comment.commentType }','${comment.state}')">
																<span class="am-icon-pencil-square-o"></span> 编辑
															</button>
															<button
																class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
																onclick="deleteOneComment('${comment.id}','deleteOneComment')">
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
					<h4 class="modal-title" id="myModalLabel">添加评论</h4>
				</div>
				<div class="modal-body">
					<div class="form-group" style="display:none">
						<label for="exampleInputEmail1">ID</label> <input type="text"
							class="form-control" id="ID" placeholder="请输入用户名" maxlength="10">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">评论用户</label> <input type="text"
							class="form-control" name="commentName" id="commentName"
							placeholder="请输入评论用户" maxlength="10" onblur="checkComment()">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">评论内容</label> <br />
						<textarea class="form-control" name="content" id="content"
							maxlength="200" rows="3" placeholder="请输入评论内容"></textarea>
					</div>
					<div class="form-group" id="commentTimeShow">
						<label for="exampleInputPassword1">评论时间</label> <br /> <input
							type="text" class="form-control" name="commentTime"
							id="commentTime" placeholder="请输入评论时间，格式 2017-08-13"
							maxlength="10" onblur="checkComment()">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">评论所属故事，景点或者体验编号</label> <input
							type="text" class="form-control" name="commentId" id="commentId"
							placeholder="请输入所属故事，景点或者景点的id，只能输入数字" maxlength="5"
							onblur="checkComment()">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">评论类型</label><br /> <label
							class="radio-inline"> <input type="radio" name="radio1"
							id="storyRadio" value="0"> 故事
						</label> <label class="radio-inline"> <input type="radio"
							name="radio1" id="viewRadio" value="1"> 景点
						</label>
						<label class="radio-inline"> <input type="radio"
							name="radio1" id="experienceRadio" value="2"> 体验
						</label>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">评论状态</label><br/> 
						<label class="radio-inline"> <input type="radio"
							name="radio2" id="notShow" value="0"> 隐藏
						</label>
						<label class="radio-inline"> <input type="radio"
							name="radio2" id="show" value="1"> 显示
						</label>
					</div>
					<button type="button" class="btn btn-default" id="submitAddComment"
						onclick="checkAddComment()">添加评论</button>
				</div>

				<div class="modal-footer">
					<p id="remind" style="color:red;"></p>
					<p id="remind2" style="color:red;"></p>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="saveUpdate"
						onclick="checkUpdateComment()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
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
	<script src="../js/amazeui.min.js"></script>
	<script src="../js/app.js"></script>
	<script src="../js/selectall.js"></script>
	<script type="text/javascript">
		function checkComment() {
			var reg = /\s+/g;
			var regId = /\d+/g;
			var commentName = document.getElementById("commentName").value;
			var content = document.getElementById("content").value;
			var commentId = document.getElementById("commentId").value;
			var remind = document.getElementById("remind");
			if( (reg.test(commentName) || reg.test(commentId)) ) {
				remind.innerHTML = "不能包含空格等非法字符";
				return;
			} else if (!regId.test(commentId) && commentId != '') {
				remind.innerHTML = "评论所属故事或景点编号只能输入数字";
				return;
			} else if (commentName == '' || content == '' || commentId == '') {
				remind.innerHTML = "任意一项不能为空";
				return;
			} else {
				remind.innerHTML = "";
			}
		}
		function checkAddComment() {
			var reg = /\s+/g;
			var regId = /\d+/g;
			var commentName = document.getElementById("commentName").value;
			var content = document.getElementById("content").value;
			var commentId = document.getElementById("commentId").value;
			var remind = document.getElementById("remind");
			var radio1 = document.getElementsByName("radio1");
			var radio2 = document.getElementsByName("radio2");
			var radiovalue;
			var radio2value;
			if( (reg.test(commentName) || reg.test(commentId)) ) {
				remind.innerHTML = "不能包含空格等非法字符";
				return;
			} else if (!regId.test(commentId) && commentId != '') {
				remind.innerHTML = "评论所属故事或景点编号只能输入数字";
				return;
			} else if (commentName == '' || content == '' || commentId == '') {
				remind.innerHTML = "任意一项不能为空";
				return;
			} else {
				remind.innerHTML = "";
	
	
			}
			//if (!reg.test(commentName) && regId.test(commentId) && content != '' && commentId != '' && commentName != '') {
				initAJAX();
				for (var i = 0; i < radio1.length; i++) {
					if (radio1[i].checked) {
						radiovalue = i;
					}
				}
				for (var i = 0; i < radio2.length; i++) {
					if (radio2[i].checked) {
						radio2value = i;
					}
				}
				xmlHttp.open("POST", "<%=path%>/check/checkComment?commentName=" + encodeURI(encodeURI(commentName)) + "&commentId=" + commentId + "&content=" + encodeURI(encodeURI(content)) + "&commentType=" + radiovalue + "&state=" + radio2value +  "&addComment=addComment", true);
				xmlHttp.send();
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
						var res = xmlHttp.responseText;
						if (res == "true") {
							swal(
								'评论',
								'添加成功！',
								'success'
							)
						} else if (res == "false") {
						   //var remind2 = document.getElementById("remind2");
							//remind2.innerHTML == "用户名不存在";
							swal(
								'用户不存在',
								'不能添加评论！',
								'warning'
							)
						}
					}
				}
			//}
		}
		
		function passParameter(id,commentName,content,commentTime,commentId,commentType,state){
		var IDs = document.getElementById("ID");
		var commentNames = document.getElementById("commentName");
		var contents = document.getElementById("content");
		var commentTimes =  document.getElementById("commentTime");
	    var commentIds =  document.getElementById("commentId");
		//var commentTypes =  document.getElementById("commentType");
		var commentTimeShow = document.getElementById("commentTimeShow");
		var storyRadio = document.getElementById("storyRadio");
		var viewRadio = document.getElementById("viewRadio");
		var show = document.getElementById("show");
		var notShow = document.getElementById("notShow");
		var experienceRadio = document.getElementById("experienceRadio");
		var submitAddComment = document.getElementById("submitAddComment");
		var saveUpdate = document.getElementById("saveUpdate");
		var myModalLabel = document.getElementById("myModalLabel");
			if (commentName != '' && content != '' && commentTime != '' && commentId != '' && commentType != '' && state != '') {
				IDs.value = id;
				commentNames.value = commentName;
				contents.value = content;
				commentTimes.value = commentTime.substr(0,10);
				commentIds.value = commentId;
				//commentTypes.value = commentType;
				saveUpdate.style.display = "inline-block";
				commentTimeShow.style.display = "block";
				submitAddComment.style.display = "none";
				myModalLabel.innerHTML = '评论修改';
			}
			if (commentType == 'story') {
				storyRadio.checked = 'checked';
			} else if (commentType == 'view') {
				viewRadio.checked = 'checked';
			} else if(commentType == 'experience'){
			experienceRadio.checked = 'checked';
			}else {
				commentNames.value = '';
				contents.value = '';
				commentTimes.value = '';
				commentIds.value = '';
				storyRadio.checked = 'checked';
				saveUpdate.style.display = "none";
				submitAddComment.style.display = "block";
				commentTimeShow.style.display = "none";
				myModalLabel.innerHTML = '添加评论';
			}
			if(state == '1'){
			show.checked = 'checked';
			} else if(state == '0'){
			notShow.checked = 'checked';
			}
		}
		function checkUpdateComment(){
		    var reg = /\s+/g;
			var regId = /\d+/g;
			var regDate = /((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/g;
			var IDs = document.getElementById("ID").value;
			var commentName = document.getElementById("commentName").value;
			var content = document.getElementById("content").value;
			var commentId = document.getElementById("commentId").value;
			var commentTime = document.getElementById("commentTime").value;
			var remind = document.getElementById("remind");
			var radio1 = document.getElementsByName("radio1");
			var radio2 = document.getElementsByName("radio2");
			var radiovalue;
			var radio2value;
			if( (reg.test(commentName) || reg.test(commentId)) ) {
				remind.innerHTML = "不能包含空格等非法字符";
				return;
			} else if (!regId.test(commentId) && commentId != '') {
				remind.innerHTML = "评论所属故事或景点编号只能输入数字";
				return;
			} else if (commentName == '' || content == '' || commentId == '' || commentTime == '') {
				remind.innerHTML = "任意一项不能为空";
				return;
			} else if(commentTime != '' && !regDate.test(commentTime)) {
			remind.innerHTML = "您输入的日期格式不正确";
			return;
			} else {
				remind.innerHTML = "";
	
			}
			//if (!reg.test(commentName) && regId.test(commentId) && content != '' && commentId != '' && commentName != '') {
				initAJAX();
				for (var i = 0; i < radio1.length; i++) {
					if (radio1[i].checked) {
						radiovalue = i;
					}
				}
				for (var i = 0; i < radio2.length; i++) {
					if (radio2[i].checked) {
						radio2value = i;
					}
				}
				commentTime = commentTime + " 13:36:29";
				xmlHttp.open("POST", "<%=path%>/check/checkComment?commentName=" + encodeURI(encodeURI(commentName)) + "&commentId=" + commentId + "&content=" + encodeURI(encodeURI(content)) + "&commentType=" + radiovalue + "&commentTimeUpdate=" + 
				commentTime + "&state=" + radio2value +  "&updateComment=updateComment" + "&id=" + IDs, true);
				xmlHttp.send();
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
						var res = xmlHttp.responseText;
						if (res == "true") {
							swal(
								'评论',
								'修改成功！',
								'success'
							);
							setTimeout(function() {
								window.location.reload();
							}, 2000);
						} else if (res == "false") {
						   //var remind2 = document.getElementById("remind2");
							//remind2.innerHTML == "用户名不存在";
							swal(
								'用户不存在',
								'不能修改评论！',
								'warning'
							)
						}
					}
				}
		//}
		}
		function deleteOneComment(id, deleteOneComment) {
			//alert(id + "," + deleteOneComment);
			swal({
				title : '确定删除吗？',
				text : '删除之后将无法恢复！',
				type : 'warning',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '确定删除！',
			}).then(function() {
				initAJAX();
				xmlHttp.open("POST", "<%=path%>/sxw/Delete?commentId=" + id + "&deleteOneComment=" + deleteOneComment, true);
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
		function pagerComment(){
		var comment = document.getElementById("comment");
		comment.submit();
		}
	</script>

</body>

</html>