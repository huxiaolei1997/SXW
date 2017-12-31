<%@ page language="java"
	import="java.sql.*,java.io.*,java.util.*,util.DBUtil,dao.userDao,entity.User"
	pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>添加景点或故事</title>
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
</head>

<body data-type="generalComponents">


	<%@ include file="header.jsp"%>







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
									class="am-icon-angle-right"></i> <span>景点、故事管理</span>
									 <a href="<%=path%>/test2/pagerExperience"> <i
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
			<div class="tpl-content-page-title">综合管理</div>
			<ol class="am-breadcrumb">
				<li><a href="<%=path%>/test2/showBackIndex" class="am-icon-home">首页</a></li>
				<li><a href="<%=path%>/test2/pagerViewStory">综合管理</a></li>
				<li class="am-active">景点、故事管理</li>
			</ol>
			<div class="tpl-portlet-components">
				<div class="portlet-title">
					<div class="caption font-green bold">
						<span class="am-icon-modx"></span> 景点、故事管理
					</div>



				</div>

				<div class="tpl-block">

					<div class="am-g">
						<div class="tpl-form-body tpl-form-line">
							<form class="am-form tpl-form-line-form"
								action="<%=path%>/test2/addViewStory" method="post"
								id="uploadimage" name="uploadimage"
								enctype="multipart/form-data">
								<div class="am-form-group">
									<label for="title" class="am-u-sm-3 am-form-label">标题 <span
										class="tpl-form-line-small-title">Title</span>
									</label>
									<div class="am-u-sm-9">
										<input type="text" class="tpl-form-input" id="title"
											placeholder="请输入标题文字" name="title" maxlength="20"> <small>请填写标题文字最多20字。</small>
									</div>
								</div>
								<div class="am-form-group">
									<label for="introduction" class="am-u-sm-3 am-form-label">简短介绍
										<span class="tpl-form-line-small-title">Introduction</span>
									</label>
									<div class="am-u-sm-9">
										<input type="text" class="tpl-form-input" id="introduction"
											placeholder="请输入景点或故事介绍文字" name="introduction"
											maxlength="200"> <small>请填写景点或故事介绍文字最多100字。</small>
									</div>
								</div>
								<div class="am-form-group">
									<label for="addtime" class="am-u-sm-3 am-form-label">发布时间
										<span class="tpl-form-line-small-title">Time</span>
									</label>
									<div class="am-u-sm-9">
										<input type="text" id="addtime" name="addtime"
											class="am-form-field tpl-form-no-bg" placeholder="发布时间"
											data-am-datepicker="" readonly /> <small>发布时间为必填</small>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-weibo" class="am-u-sm-3 am-form-label">封面图
										<span class="tpl-form-line-small-title">Images</span>
									</label>
									<div class="am-u-sm-9">
										<div class="am-form-group am-form-file">
											<div class="tpl-form-file-img">
												<img alt="" src="../img/a5.png" id="previewImg"
													style="width:300px;height:200px;">
											</div>

											<button type="button" class="am-btn am-btn-danger am-btn-sm">
												<i class="am-icon-cloud-upload"></i> 添加封面图片
											</button>
											<input name="file" type="file" id="myfile" onchange="preImg(this.files)">
										</div>

									</div>
								</div>

								<div class="am-form-group">
									<label for="type" class="am-u-sm-3 am-form-label">添加分类
										<span class="tpl-form-line-small-title">Type</span>
									</label>
									<div class="am-u-sm-9">
										<select data-am-selected="{btnSize: 'sm'}" name="type">
											<option value="view">景点</option>
											<option value="story">故事</option>
										</select>
										<div></div>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-intro" class="am-u-sm-3 am-form-label">文章内容</label>
									<div class="am-u-sm-9">
										<!-- 加载编辑器的容器 -->
										<script id="container" name="content" type="text/plain">这里填写初始化内容</script>
									</div>
								</div>
								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-3">
										<button type="button"
											class="am-btn am-btn-primary tpl-btn-bg-color-success"
											onclick="addViewStory()">提交</button>
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="../js/jquery.min.js"></script>
	<script src="../js/amazeui.min.js"></script>
	<script src="../js/app.js"></script>
	<!-- 配置文件 -->
	<script type="text/javascript" src="<%=path%>/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="<%=path%>/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor('container', {
			toolbars : [ [
				'fullscreen', 'source', '|', 'undo', 'redo', '|',
				'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
				'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
				'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
				'directionalityltr', 'directionalityrtl', 'indent', '|',
				'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
				'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
				'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
				'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
				'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
				'print', 'preview', 'searchreplace', 'drafts', 'help'
			] ],
			initialFrameWidth : 750,
			initialFrameHeight : 500
		});
	</script>
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
		//function uploadImage(){
		//var uploadimage = document.getElementById("uploadimage");
		//uploadimage.submit();
		//var showimage = document.getElementById("showimage");
		// showimage.src = '${imageUrl}?t='  + Math.random();
		//  window.location.reload();
		//alert("已选择图片！");	
		//}
		function preImg(files) {
			//alert(files.length);
			var file = files[0];
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				//$(".previewImg")[i].attr("src", e.target.result);
				$("#previewImg").attr("src", e.target.result);
	
			}
		}
		function addViewStory() {
			var reg = /\s+/g;
			var reg2 =  /\s*/g;
			var title = document.getElementById("title").value;
			var introduction = document.getElementById("introduction").value;
			var addtime = document.getElementById("addtime").value;
			var file = document.getElementsByName("file")[0].value;
			var uploadimage = document.getElementById("uploadimage");
			if (reg.test(title)) {
				swal(
					'标题不能',
					'包含空格等非法字符！',
					'warning'
				);
				return;
			}
			if (title == '' || title.replace(reg2, '') == '') {
				swal(
					'标题',
					'不能为空！',
					'warning'
				);
				return;
			}
			if (introduction == '' || introduction.replace(reg2, '') == '') {
				swal(
					'介绍',
					'不能为空！',
					'warning'
				);
				return;
			}
			if (addtime == '') {
				swal(
					'发布时间',
					'不能为空！',
					'warning'
				);
				return;
			}
			if (file == '' || file == null) {
				swal(
					'请选择',
					'封面图片！',
					'warning'
				);
				return;
			}
			uploadimage.submit();
		}
	</script>
</body>

</html>

