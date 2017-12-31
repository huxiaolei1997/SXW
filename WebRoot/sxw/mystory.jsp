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
			+ "mystory.jsp";

	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	}
	session.setAttribute("url", url);
	session.removeAttribute("urlLogin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的故事</title>
<link rel="stylesheet" href="../css/necessary.css">
<link rel="stylesheet" href="../css/nav.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/amazeui.min.css">
<link rel="stylesheet" href="../css/app.css">
<script src="../js/sweetalert2.min.js"></script>
<link href="../css/sweetalert2.min.css" rel="stylesheet">
<style type="text/css">
.nav-bao a{
font-size:14px;
}
</style>
</head>
<body>
	<header class="nav-header">
		<div class="nav-bao">
			<nav class="nav-nav">
				<a href="<%=path%>/sxw/showIndex" class="nav-logo"> <img src="../img/logo.png"
					alt="" class="nav-logo-img">
				</a>
				<div class="nav-div">
					<!-- <img src="../img/menu.png" alt="" class="nav-div-img"> -->
					<div class="nav-div-img">
						<span class="nav-div-img-b1">1</span> <span class="nav-div-img-b2">1</span>
						<span class="nav-div-img-b3">1</span>
					</div>
					<ul class="nav-ul">
						<li class="nav-li"><a href="<%=path%>/sxw/showIndex"
							class="nav-lia">首页</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showView" class="nav-lia">景点</a>
						</li>
						<li class="nav-li"><a href="<%=path%>/sxw/showActivity"
							class="nav-lia">体验</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showLive" class="nav-lia">乡居</a>
						</li>
						<li class="nav-li nav-active"><a href="<%=path%>/sxw/showStory"
							class="nav-lia nav-lia-active">故事</a></li>
						<li class="nav-li">
							<c:if test="${userName == null}">
									<a href="<%=path%>/sxw/login.jsp" class="nav-lia"> 登录/注册 </a>
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
	<div class="my-back">
		<div class="tpl-block">

			<div class="am-g">
				<div class="tpl-form-body tpl-form-line">
					<form class="am-form tpl-form-line-form" action="<%=path%>/sxw/addStory"
						method="post" id="addStory" name="addStory"
						enctype="multipart/form-data">
						<div class="am-form-group">
							<label for="title" class="am-u-sm-3 am-form-label">标题 <span
								class="tpl-form-line-small-title">Title</span></label>
							<div class="am-u-sm-9">
								<input type="text" class="tpl-form-input" id="title"
									name="title" placeholder="请输入标题文字" maxlength="12"> <small>请填写标题文字最多12字。</small>
							</div>
						</div>
						<div class="am-form-group">
							<label for="introduction" class="am-u-sm-3 am-form-label">故事简要
								<span class="tpl-form-line-small-title">Title</span>
							</label>
							<div class="am-u-sm-9">
								<input type="text" class="tpl-form-input" id="introduction"
									name="introduction" placeholder="请输入故事简要" maxlength="60">
								<small>请输入故事简要最多60字。</small>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-weibo" class="am-u-sm-3 am-form-label">封面图
								<span class="tpl-form-line-small-title">Images</span>
							</label>
							<div class="am-u-sm-9">
								<div class="am-form-group am-form-file">
									<div class="tpl-form-file-img">
										<img src="../img/1.jpg" alt="" id="previewImg" style="width:300px;height:200px;">
									</div>
									<button type="button" class="am-btn am-btn-danger am-btn-sm">
										<i class="am-icon-cloud-upload"></i> 添加封面图片
									</button>
									<input name="file" type="file" id="myfile" onchange="preImg(this.files)">
								</div>

							</div>
						</div>
						<div class="am-form-group">
							<label for="user-intro" class="am-u-sm-3 am-form-label">文章内容</label>
							<div class="am-u-sm-9">
								<!-- 加载编辑器的容器 -->
								<script id="container" name="content" type="text/plain">这里填写你的故事内容</script>
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
	<script src="../js/jquery.min.js"></script>
	<script src="../js/amazeui.min.js"></script>
	<script src="../js/app.js"></script>
	<script src="../js/iscroll.js"></script>
	<script src="../js/initAJAX.js"></script>
	<!-- 配置文件 -->
	<script type="text/javascript" src="../ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="../ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
        var ue = UE.getEditor('container',{
        toolbars: [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
             'simpleupload', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'print', 'preview', 'searchreplace', 'drafts', 'help'
        ]],
        initialFrameWidth:900,
        initialFrameHeight:600
        });
    </script>
	<script type="text/javascript">
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
			var reg2 = /\s*/g;
			var title = document.getElementById("title").value;
			var introduction = document.getElementById("introduction").value;
			var myfile = document.getElementById("myfile").value;
			var addStory = document.getElementById("addStory");
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
					'故事简要',
					'不能为空！',
					'warning'
				);
				return;
			}
			if (myfile == '') {
				swal(
					'请选择',
					'封面图片！',
					'warning'
				);
				return;
			}
			addStory.submit();
		}
	    if(${userName == null}){
	    window.location.href='<%=path%>/sxw/showStory';
	    }
	</script>
</body>
</html>
