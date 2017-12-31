<%@ page language="java"
	import="java.sql.*,java.io.*,java.util.*,util.DBUtil,dao.userDao,entity.User"
	pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path1 = request.getContextPath();
	//String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			//+ path + "/" + request.getServletPath();
	String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
			+ request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1)
			+ "getFileName";

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
<title>图片文件管理</title>
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
<script
	src="../js/sweetalert2.min.js"></script>
<link
	href="../css/sweetalert2.min.css"
	rel="stylesheet">
<script
	src="../js/core.js"></script>
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../js/jquery.pagination.js"></script>
<script type="text/javascript">

	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		$("#getFileName").attr("action", "<%=path1%>/test2/getFileName?pageNum=" + (new_page_index + 1));
		$("#getFileName").submit();
		return false;
	}

	$(function(){
		$("#News-Pagination").pagination(${totalPages}, {
			items_per_page : 10, // 每页显示多少条记录
			current_page : ${pageNum} - 1, // 当前显示第几页数据
			num_display_entries : 6, // 分页显示的条目数
			next_text : "下一页",
			prev_text : "上一页",
			num_edge_entries : 2, // 连接分页主体，显示的条目数
			callback : handlePaginationClick
		});
	});
</script>
<style type="text/css">
.pagination a {
	border-radius: 3px;
}

.pagination a, .pagination span {
	border-radius: 3px;
}
</style>
</head>

<body data-type="chart">

	<%@ include file="header.jsp"%>

	<div class="tpl-page-container tpl-page-header-fixed">


		<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-title">功能列表</div>
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a href="<%=path%>/test2/showBackIndex"
						class="nav-link"> <i class="am-icon-home"></i> <span>首页</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="<%=path %>/test2/getFileName"
						class="nav-link tpl-left-nav-link-list active"> <i
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
							</a>
							 <a href="<%=path%>/test2/pagerViewStory"> <i class="am-icon-angle-right"></i> <span>景点、故事管理</span></a>
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
			<div class="tpl-content-page-title">文件和图片管理</div>
			<ol class="am-breadcrumb">
				<li><a href="<%=path%>/test2/showBackIndex" class="am-icon-home">首页</a></li>
				<li><a href="<%=path%>/test2/getFileName">文件和图片管理</a></li>
				<li class="am-active"><c:if test="${action == 'images' }">
				图片管理
				</c:if> <c:if test="${action == 'file' }">
				文件管理
				</c:if></li>
			</ol>
			<div class="tpl-portlet-components">
			    
				<div class="portlet-title">
					<div class="caption font-green bold">
						</span> <c:if test="${action == 'images' }">
				<span class="am-icon-image"> 图片管理
				</c:if> <c:if test="${action == 'file' }">
				<span class="am-icon-file"> 文件管理
				</c:if>
					</div>
					<div class="tpl-portlet-input tpl-fz-ml">
						<div class="portlet-input input-small input-inline"></div>
					</div>


				</div>
				<div class="tpl-block">
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
							<div class="am-btn-toolbar" >
								<div class="am-btn-group am-btn-group-xs">
								    <c:if test="${action == 'images'}">
								    <span>当前共有${totalPages}张图片</span>
								    </c:if>
									<c:if test="${action == 'file'}">
								    <span>当前共有${totalPages}个文件</span>
								    </c:if>
								</div>
							</div>
						</div>
						<form action="<%=path%>/test2/getFileName" method="post"
							id="getFileName">
							<div class="am-u-sm-12 am-u-md-3">
								<div class="am-form-group"></div>
							</div>
							<div class="am-u-sm-12 am-u-md-3">
								<div class="am-form-group">
								
									<select data-am-selected="{btnSize: 'sm'}" name="action"
										onchange="change()">
										<c:if test="${action == 'images' }">
											<option value="images" selected>图片</option>
											<option value="file">文件</option>
										</c:if>
										<c:if test="${action == 'file' }">
											<option value="images">图片</option>
											<option value="file" selected>文件</option>
										</c:if>
									</select>

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
										<th class="table-id">文件名</th>
										<th class="table-title"><c:if
												test="${action == 'images' }">
                                                                                                                     图片
                                            </c:if> <c:if
												test="${action == 'file' }">
                                                                                                                     文件
                                            </c:if> <c:if
												test="${action != 'file' && action != 'images'}">
                                                                                                                     目录
                                            </c:if>
										<th>操作<input type="button" value="全选"
											onClick="selectBox('all')" style="cursor: pointer;margin-left:15px;"
											class="am-btn am-btn-default am-btn-xs am-text-secondary" />
											<input type="button" value="反选"
											onClick="selectBox('reverse')" style="cursor: pointer;"
											class="am-btn am-btn-default am-btn-xs" /> <input
											type="button" name="button" value="删除"
											style="cursor: pointer;"
											class="am-btn am-btn-default am-btn-xs am-text-danger"
											onclick="deleteFPic()" />
										</th>

									</tr>
								</thead>
								<tbody>
									<form action="<%=path%>/test2/deleteFilePic?action=${action}"
										method="post" id="deleteFPic" onsubmit="return false;">
										<c:forEach items="${directory}" var="dir" varStatus="status">

											<tr>
												<td><input type="checkbox" name="id[]" value="${dir}"></td>
												<td>${(pageNum - 1) * 10 + status.index + 1}</td>
												<td>${dir}</td>
												<c:if test="${action == 'images' }">
													<td><img src="<%=path %>/upload/images/${dir}"
														style="width:100px;height:100px;" /></td>
												</c:if>
												<c:if test="${action == 'file' }">
													<td><a href="<%=path %>/upload/file/${dir}"
														target="_blank" />${dir}</a></td>
												</c:if>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<button
																class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
																onclick="deleteOneFPic('${dir}','${action}')">
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
								<c:if test="${fn:length(directory) ne 0 }">
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
	function deleteOneFPic(dir,action){
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
		xmlHttp.open("POST", "<%=path%>/test2/deleteFilePic?dir=" + dir + "&actionType=" + action, true);
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
				} else if(res == 'fail'){
					swal(
						'删除',
						'失败',
						'warning'
					);
				} else if(res == 'No exist'){
					swal(
						'文件',
						'不存在',
						'warning'
					);
				}
			}
		}

	});

}
function change(){
var getFileName = document.getElementById("getFileName");
getFileName.submit();
}
	</script>
	<script src="../js/amazeui.min.js"></script>
	<script src="../js/app.js"></script>
	<script src="../js/selectall.js"></script>
</body>

</html>