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
			+ "showAccessIpAddress";

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
<title>网站访客统计</title>
<meta name="description" content="这是一个  index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.js" type="text/javascript"></script>
<link rel="icon" type="image/png" href="../i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="../i/app-icon72x72@2x.png">
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
<script type="text/javascript" src="../js/echarts.min.js"></script>
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
		$("#pager").attr("action", "<%=path%>/test2/showAccessIpAddress?pageNum=" + (new_page_index + 1));
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

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

			<ul
				class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
				<li class="am-hide-sm-only"><a href="javascript:;"
					id="admin-fullscreen" class="tpl-header-list-link"><span
						class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>

				<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
					<a class="am-dropdown-toggle tpl-header-list-link"
					href="javascript:;"> <span class="tpl-header-list-user-nick">${adminName}</span><span
						class="tpl-header-list-user-ico"> <img
							src="<%=path%>${HeadImageUrl}"
							style="width:50px;height:50px;border-radius:50%;"></span>
				</a>
					<ul class="am-dropdown-content">
						<li><a href="<%=path%>/test2/showAdmin"><span
								class="am-icon-bell-o"></span> 资料</a></li>
						<li><a href="javascript:;"
							data-am-modal="{target: '#doc-modal-2', closeViaDimmer: 0, width: 400, height: 300}"><span
								class="am-icon-cog"></span>修改密码</a></li>
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
					<li class="tpl-left-nav-item"><a
						href="<%=path%>/test2/showBackIndex" class="nav-link"> <i
							class="am-icon-home"></i> <span>首页</span>
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
						<li class="tpl-left-nav-item"><a href="<%=path%>/test2/showAccessIpAddress" class="nav-link active"> <i class="am-icon-bar-chart"></i> <span>网站访客统计</span>
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
			<div class="tpl-content-page-title">网站访客管理</div>
			<ol class="am-breadcrumb">
				<li><a href="<%=path%>/test2/showBackIndex"
					class="am-icon-home">首页</a></li>
				<li><a href="<%=path%>/test2/showAccessIpAddress">网站访客管理</a></li>
				<li class="am-active">访客管理</li>
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
										onclick="al('','','','','','','','')" style="visibility:hidden;">
										<span class="am-icon-plus"></span> 新增用户
									</button>
								</div>
							</div>
						</div>
						<form action="<%=path%>/test2/showAccessIpAddress" id="pager"
							method="post" name="pager">
							<div class="am-u-sm-12 am-u-md-3">
								<div class="am-form-group">
									<select data-am-selected="{btnSize: 'sm'}" name="type"
										id="type" onchange="pagerUser()">
										<c:if test="${type == 0 }">
											<option value="0" selected>所有访客</option>
											<option value="1">单一访客（去除重复访客）</option>
										</c:if>
										<c:if test="${type == 1 }">
											<option value="0">所有访客</option>
											<option value="1" selected>单一访客（去除重复访客）</option>
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
										<th class="table-id serial-number">序号</th>
										<th class="table-id">ID</th>
										<th class="table-headImageUrl">IP地址</th>
										<th class="table-sex">IP所属地区</th>
										<th class="table-title">访问时间</th>
									</tr>
									</thead>
								<tbody>
										<c:if test="${keyword != '' && keyword != null }">
										<c:if test="${fn:length(result) ne 0 }">
											<span>在<c:if test="${type == 0 }">
													<span style="color:red;">所有访客</span>中查询
												<span style="color:red">${keyword }</span>
												</c:if> <c:if test="${type == 1 }">
													<span style="color:red;">单一访客（去除重复访客）</span>中查询
												<span style="color:red">${keyword }</span>
												</c:if>的结果：总共有${totalPages }条记录
											</span>
										</c:if>
									</c:if>
									<c:if test="${keyword == '' || keyword == null  }">
										<span>目前共有${totalPages}个访客</span>
									</c:if>
										<c:forEach items="${result}" var="showIpAddress" varStatus="status">
											<tr>
												<td>${(currentPage - 1) * 10 + status.index + 1}</td>
												<td>${showIpAddress.id}</td>
												<td>${showIpAddress.ipAddress}</td>
												<td>${showIpAddress.location}</td>
												<td class="am-hide-sm-only">${showIpAddress.accessTime}</td>
											</tr>
										</c:forEach>	
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
				 <div id="main" style="width: 600px;height:400px;"></div>
			</div>
		</div>
	</div>


<script src="../js/amazeui.min.js"></script>
<script src="../js/app.js"></script>
<script type="text/javascript">
//下拉选择时自动提交表单
		function pagerUser() {
			var pager = document.getElementById("pager");
			pager.submit();
		}

</script>
	
 <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '最近七天网站访客统计'
            },
            tooltip: {},
            legend: {
                data:['访客']
            },
            xAxis: {
                data: ${data}
            },
            yAxis: {},
            series: [{
                name: '访客',
                type: 'bar',
                barWidth : 60,
                itemStyle: {
                    normal: {
　　　　　　　　　　　　　　//好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，
                        color: function(params) {
                            // build a color map as your need.
                            var colorList = [
                              '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                               '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                               '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                            ];
                            return colorList[params.dataIndex]
                        },
　　　　　　　　　　　　　　//以下为是否显示，显示位置和显示格式的设置了
                        label: {
                            show: true,
                        }
                    }
                },
                data: ${data2}
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</body>
</html>