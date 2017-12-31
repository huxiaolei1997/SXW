<%@ page language="java"
	import="java.sql.*,java.io.*,java.util.*,util.DBUtil,dao.userDao,entity.User"
	pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>体验订单管理</title>
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
<script src="../js/echarts.min.js"></script>
<script
	src="../js/sweetalert2.min.js"></script>
<link
	href="../css/sweetalert2.min.css"
	rel="stylesheet">
<script
	src="../js/core.js"></script>
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.pagination.js"></script>
<script type="text/javascript">

	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		$("#orderActivity").attr("action", "<%=request.getContextPath()%>/test2/showOrderActivity?pageNum=" + (new_page_index + 1));
		$("#orderActivity").submit();
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

<body data-type="index">


	<%@ include file="header.jsp"%>


	<!-- content start -->
	<div class="tpl-page-container tpl-page-header-fixed">


		<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-title">功能列表</div>
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a href="<%=path%>/test2/showBackIndex"
						class="nav-link active"> <i class="am-icon-home"></i> <span>首页</span>
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
		<div class="admin-content" style="overflow-y:hidden;height:1000px;margin-left:250px;">
			<div class="admin-content-body">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">首页</strong>
					</div>
				</div>

				<ul
					class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
					<li><a href="<%=path%>/test2/showBackIndex" class="am-text-success"><span
							class="am-icon-btn am-icon-file-text"></span><br />乡居订单管理<br />${countXiangJu}</a></li>
					<li><a href="<%=path%>/test2/showOrderActivity" class="am-text-warning"><span
							class="am-icon-btn am-icon-briefcase"></span><br />活动体验订单管理<br />${totalPages}</a></li>
					<li><a href="javascript:;" class="am-text-danger" style="cursor:default;"><span
							class="am-icon-btn am-icon-recycle"></span><br />未审核订单<br />${countXiangJu + totalPages - countReviewActivity - countReviewXiangJu}</a></li>
					<li><a href="javascript:;" class="am-text-secondary" style="cursor:default;"><span
							class="am-icon-btn am-icon-user-md"></span><br />已审核订单<br />${countReviewActivity + countReviewXiangJu}</a></li>
				</ul>

				<div class="am-g">
					<div class="am-u-sm-12">
						<table
							class="am-table am-table-bd am-table-striped admin-content-table">
							<thead>
								<tr>
									<th>ID</th>
									<th>用户名</th>
									<th>真实姓名</th>
									<th>联系电话</th>
									<th>预定活动类型</th>
									<th>参加活动日期</th>
									<th>管理</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${result}" var="orderActivity">
									<tr>
										<td><c:if test="${orderActivity.review == '1' }"><p style="display:inline-block;color:red;">（已审核）</p></c:if><c:if test="${orderActivity.review == '0' }"><p style="display:inline-block;">（未审核）</p></c:if>${orderActivity.id}</td>
										<td>${orderActivity.userName}</td>
										<td>${orderActivity.realName}</td>
										<td>${orderActivity.phoneNumber}</td>
										<td>${orderActivity.activityType}</td>
										<td>${orderActivity.checkInDate}</td>
										<td>
											<div class="am-dropdown" data-am-dropdown>
												<button
													class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
													data-am-dropdown-toggle>
													<span class="am-icon-cog"></span> <span
														class="am-icon-caret-down"></span>
												</button>
												<ul class="am-dropdown-content">
													<li><a href="javascript:;"
														onclick="update('${orderActivity.id}','${orderActivity.checkInDate}','${orderActivity.activityType }')"
														class="am-btn"
														data-am-modal="{target: '#doc-modal-3', closeViaDimmer: 0, width: 400, height: 390}"><c:if test="${orderActivity.review == '1'}">重新审核</c:if><c:if test="${orderActivity.review == '0'}">审核</c:if></a></li>
													<li><a href="javascript:;"
														onclick="deleteOrderActivity('${orderActivity.id}','orderActivity')">删除</a></li>
												</ul>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<div id="News-Pagination" style="float:right;"></div>
						<form action="<%=path%>/test2/showOrderActivity" method="post"
							id="orderActivity"></form>
					</div>
				</div>
	<!--  
				<div class="am-g">
					<div class="am-u-md-6">
						<div class="am-panel am-panel-default">
							<div class="am-panel-hd am-cf"
								data-am-collapse="{target: '#collapse-panel-1'}">
								文件上传<span class="am-icon-chevron-down am-fr"></span>
							</div>
							<div class="am-panel-bd am-collapse am-in" id="collapse-panel-1">
								<ul class="am-list admin-content-file">
									<li><strong><span class="am-icon-upload"></span>
											Kong-cetian.Mp3</strong>
										<p>3.3 of 5MB - 5 mins - 1MB/Sec</p>
										<div
											class="am-progress am-progress-striped am-progress-sm am-active">
											<div class="am-progress-bar am-progress-bar-success"
												style="width: 82%">82%</div>
										</div></li>
									<li><strong><span class="am-icon-check"></span>
											好人-cetian.Mp3</strong>
										<p>3.3 of 5MB - 5 mins - 3MB/Sec</p></li>
									<li><strong><span class="am-icon-check"></span>
											其实都没有.Mp3</strong>
										<p>3.3 of 5MB - 5 mins - 3MB/Sec</p></li>
								</ul>
							</div>
						</div>
						<div class="am-panel am-panel-default">
							<div class="am-panel-hd am-cf"
								data-am-collapse="{target: '#collapse-panel-2'}">
								浏览器统计<span class="am-icon-chevron-down am-fr"></span>
							</div>
							<div id="collapse-panel-2" class="am-in">
								<table
									class="am-table am-table-bd am-table-bdrs am-table-striped am-table-hover">
									<tbody>
										<tr>
											<th class="am-text-center">#</th>
											<th>浏览器</th>
											<th>访问量</th>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="/i/examples/admin-chrome.png" alt=""></td>
											<td>Google Chrome</td>
											<td>3,005</td>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="/i/examples/admin-firefox.png" alt=""></td>
											<td>Mozilla Firefox</td>
											<td>2,505</td>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="/i/examples/admin-ie.png" alt=""></td>
											<td>Internet Explorer</td>
											<td>1,405</td>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="/i/examples/admin-opera.png" alt=""></td>
											<td>Opera</td>
											<td>4,005</td>
										</tr>
										<tr>
											<td class="am-text-center"><img
												src="/i/examples/admin-safari.png" alt=""></td>
											<td>Safari</td>
											<td>505</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="am-u-md-6">
						<div class="am-panel am-panel-default">
							<div class="am-panel-hd am-cf"
								data-am-collapse="{target: '#collapse-panel-4'}">
								任务 task<span class="am-icon-chevron-down am-fr"></span>
							</div>
							<div id="collapse-panel-4" class="am-panel-bd am-collapse am-in">
								<ul class="am-list admin-content-task">
									<li>
										<div class="admin-task-meta">Posted on 25/1/2120 by John
											Clark</div>
										<div class="admin-task-bd">The starting place for
											exploring business management; helping new managers get
											started and experienced managers get better.</div>
										<div class="am-cf">
											<div class="am-btn-toolbar am-fl">
												<div class="am-btn-group am-btn-group-xs">
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-check"></span>
													</button>
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-pencil"></span>
													</button>
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-times"></span>
													</button>
												</div>
											</div>
											<div class="am-fr">
												<button type="button"
													class="am-btn am-btn-default am-btn-xs">删除</button>
											</div>
										</div>
									</li>
									<li>
										<div class="admin-task-meta">Posted on 25/1/2120 by 呵呵呵</div>
										<div class="admin-task-bd">
											基兰和狗熊出现在不同阵营时。基兰会获得BUFF，“装甲熊憎恨者”。狗熊会获得BUFF，“时光老人憎恨者”。</div>
										<div class="am-cf">
											<div class="am-btn-toolbar am-fl">
												<div class="am-btn-group am-btn-group-xs">
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-check"></span>
													</button>
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-pencil"></span>
													</button>
													<button type="button" class="am-btn am-btn-default">
														<span class="am-icon-times"></span>
													</button>
												</div>
											</div>
											<div class="am-fr">
												<button type="button"
													class="am-btn am-btn-default am-btn-xs">删除</button>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="am-panel am-panel-default">
							<div class="am-panel-hd am-cf"
								data-am-collapse="{target: '#collapse-panel-3'}">
								最近留言<span class="am-icon-chevron-down am-fr"></span>
							</div>
							<div class="am-panel-bd am-collapse am-in am-cf"
								id="collapse-panel-3">
								<ul class="am-comments-list admin-content-comment">
									<li class="am-comment"><a href="#"><img
											src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96"
											alt="" class="am-comment-avatar" width="48" height="48"></a>
										<div class="am-comment-main">
											<header class="am-comment-hd">
												<div class="am-comment-meta">
													<a href="#" class="am-comment-author">某人</a> 评论于
													<time>2014-7-12 15:30</time>
												</div>
											</header>
											<div class="am-comment-bd">
												<p>遵循 “移动优先（Mobile First）”、“渐进增强（Progressive
													enhancement）”的理念，可先从移动设备开始开发网站，逐步在扩展的更大屏幕的设备上，专注于最重要的内容和交互，很好。</p>
											</div>
										</div></li>

									<li class="am-comment"><a href="#"><img
											src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96"
											alt="" class="am-comment-avatar" width="48" height="48"></a>
										<div class="am-comment-main">
											<header class="am-comment-hd">
												<div class="am-comment-meta">
													<a href="#" class="am-comment-author">某人</a> 评论于
													<time>2014-7-12 15:30</time>
												</div>
											</header>
											<div class="am-comment-bd">
												<p>有效减少为兼容旧浏览器的臃肿代码；基于 CSS3
													的交互效果，平滑、高效。AMUI专注于现代浏览器（支持HTML5），不再为过时的浏览器耗费资源，为更有价值的用户提高更好的体验。</p>
											</div>
										</div></li>

								</ul>
								<ul class="am-pagination am-fr admin-content-pagination">
									<li class="am-disabled"><a href="#">&laquo;</a></li>
									<li class="am-active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed
					under MIT license.</p>
			</footer>
		</div> -->
		<!-- wrapper end -->



	</div>
	<!-- content end -->

	<!-- 订单管理 modal start -->
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-3">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				用户订单 <a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<form action="<%=path%>/test2/updateOrderActivity" method="post"
					id="updateXiangJu">
					<input type="hidden" id="updateId" name="updateId" /> <input
						type="text" name="checkInDate" class="am-form-field"
						placeholder="选择参加日期" data-am-datepicker readonly /><br> <input
						type="text" name="activityType" class="am-form-field am-radius"
						placeholder="参加活动类型" maxlength="20"/><br> <label style="float:left;">有效订单：<input
						type="radio" name="doc-radio-1" value="1" checked
						onclick="hiddenReason()"></label> <label style="float:left;">无效订单：<input
						type="radio" name="doc-radio-1" value="0" onclick="showReason()"></label><br />
					<label style="float:left;display:none;" id="reason">不通过理由：<input
						type="text" name="passOrNotPass" id="passOrNotPass"
						style="border:1px solid red;" maxlength="100"/></label><br /><br />
					<label style="float:left;"><input type="button" value="确定"
						class="am-btn am-btn-success" onclick="updateOrderActivity()" /></label>
				</form>
			</div>
		</div>
	</div>
	<!-- 订单管理 modal end -->

	<script src="../js/amazeui.min.js"></script>
	<script src="../js/iscroll.js"></script>
	<script src="../js/app.js"></script>
	<script src="../js/initAJAX.js"></script>
	<script type="text/javascript">
		var flag = true;
		function addList() {
			if (flag) {
				var orderList = document.getElementById("orderList");
				orderList.innerHTML = "<li><div class='task-checkbox'><input type='hidden' value='1' name='test'><input type='checkbox' class='liChild' value='2' name='test'></div><div class='task-title'>" +
					"<span class='task-title-sp'> Amaze UI Icon 组件目前使用了Font Awesome </span> <span class='label label-sm label-success'>技术部</span><span class='task-bell'> <i class='am-icon-bell-o'></i></span></div>"
					+ "<div class='task-config'><div class='am-dropdown tpl-task-list-dropdown' data-am-dropdown><a href='###' class='am-dropdown-toggle tpl-task-list-hover' data-am-dropdown-toggle> <i class='am-icon-cog'></i><span class='am-icon-caret-down'></span></a><ul class='am-dropdown-content tpl-task-list-dropdown-ul'><li><a href='javascript:;'>" +
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
	
		function hiddenReason() {
			var reason = document.getElementById("reason");
			reason.style.display = 'none';
		}
		function showReason() {
			var reason = document.getElementById("reason");
			reason.style.display = 'block';
		}
		function update(id,checkInDate1,activityType1) {
			var checkInDate = document.getElementsByName("checkInDate")[0];
			//var checkOutDate = document.getElementsByName("checkOutDate")[0];
			var activityType = document.getElementsByName("activityType")[0];
			//var requirement = document.getElementsByName("requirement")[0];
			var updateId = document.getElementById("updateId");
			checkInDate.value = checkInDate1;
			//checkOutDate.value = checkOutDate1;
			activityType.value = activityType1;
			//requirement.value = requirement1;
			updateId.value = id;
	
		}
		function updateOrderActivity() {
			var radioPass = document.getElementsByName("doc-radio-1");
			var updateXiangJu = document.getElementById("updateXiangJu");
			var checkInDate = document.getElementsByName("checkInDate")[0];
			var activityType = document.getElementsByName("activityType")[0];
			var passOrNotPass = document.getElementById("passOrNotPass");
			for (var i = 0; i < radioPass.length; i++) {
				if (radioPass[i].checked) {
					if (radioPass[i].value == '1') {
						if (checkInDate.value != '' && checkInDate.value != '' && activityType.value != '')
							updateXiangJu.submit();
					}
	
					if (radioPass[i].value == '0') {
						if (checkInDate.value != '' && passOrNotPass.value != '' && activityType.value != '')
							updateXiangJu.submit();
					}
				}
			}
		}
	function deleteOrderActivity(id,orderActivity) {
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
				xmlHttp.open("POST", "<%=path%>/test2/deleteOrderXiangJu?id=" + id + "&order=" + orderActivity, true);
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
	</script>

</body>

</html>