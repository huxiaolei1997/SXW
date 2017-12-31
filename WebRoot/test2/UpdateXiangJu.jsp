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
<title>更新乡居</title>
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
				<li><a href="<%=path%>/test2/pagerXiangJu">综合管理</a></li>
				<li class="am-active">乡居管理</li>
			</ol>
			<div class="tpl-portlet-components">
				<div class="portlet-title">
					<div class="caption font-green bold">
						<span class="am-icon-modx"></span> 乡居管理
					</div>



				</div>

				<div class="tpl-block">

					<div class="am-g">
						<div class="tpl-form-body tpl-form-line">
							<form class="am-form tpl-form-line-form"
								action="<%=path%>/test2/updateXiangJu" method="post"
								id="uploadimage" name="uploadimage"
								enctype="multipart/form-data">
								<div class="am-form-group">
									<label for="roomTitle" class="am-u-sm-3 am-form-label">民宿类型
										<span class="tpl-form-line-small-title">roomTitle</span>
									</label>
									<div class="am-u-sm-9">
										<input type="text" class="tpl-form-input" id="roomTitle"
											placeholder="请输入民宿类型" name="roomTitle" value="${roomTitle}"
											maxlength="20"> <small>请填写民宿类型10-20字左右。</small>
									</div>
								</div>
								<div class="am-form-group">
									<label for="feature" class="am-u-sm-3 am-form-label">民宿简短介绍
										<span class="tpl-form-line-small-title">feature</span>
									</label>
									<div class="am-u-sm-9">
										<textarea id="feature" rows="5" placeholder="请输入民宿介绍文字"
											name="feature" maxlength="100">${feature}</textarea>
										<small>请填写民宿介绍文字10-100字左右。</small>
									</div>
								</div>
								<div class="am-form-group">
									<label for="price" class="am-u-sm-3 am-form-label">民宿价格
										<span class="tpl-form-line-small-title">price</span>
									</label>
									<div class="am-u-sm-9">
										<input type="text" class="tpl-form-input" id="price"
											placeholder="请输入民宿价格，价格区间0-999" name="price" maxlength="3"
											value="${price}"/> <small>请输入民宿价格</small>
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-weibo" class="am-u-sm-3 am-form-label">民宿介绍图片
										<span class="tpl-form-line-small-title">Images</span>
									</label>
									<div class="am-u-sm-9">
										<div class="am-form-group am-form-file">

											<div class="tpl-form-file-img">
											<div id="dd" style="width:600px;">
											<c:if test="${fn:contains(imageUrl,';')}">
											<c:set value="${fn:split(imageUrl,';')}" var="splitImageUrl"></c:set>
										</c:if>
										<c:forEach items="${splitImageUrl}" var="outImageUrl">
											<img src="<%=path%>${outImageUrl}" alt=""
												style="width:100px;height:100px;float:left;">
										</c:forEach>
											</div>
											<button type="button" class="am-btn am-btn-danger am-btn-sm">
												<i class="am-icon-cloud-upload"></i> 添加民宿介绍图片
											</button>
											<input name="file" type="file" id="doc" multiple="multiple"
											onchange="javascript:setImagePreviews();"
											accept="image/gif,image/jpeg,image/jpg,image/png,image/svg">
											<input type="hidden" name="imageUrl" id="imageUrl"
												value="${imageUrl}" /> <input type="hidden" name="updateId"
												id="updateId" value="${id}" />
										</div>

									</div>
								</div>
									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<button type="button"
												class="am-btn am-btn-primary tpl-btn-bg-color-success"
												onclick="addXiangJu()">提交</button>
										</div>
									</div></form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="../js/jquery.min.js"></script>
	<script src="../js/amazeui.min.js"></script>
	<script src="../js/app.js"></script>
	<script type="text/javascript">
		function addXiangJu() {
			var reg = /\s+/g;
			var reg2 = /\s*/g;
			var reg3 = /^[+]{0,1}(\d+)$/g;
			var roomTitle = document.getElementById("roomTitle").value;
			var feature = document.getElementById("feature").value;
			var doc = document.getElementById("doc").value;
			var imageUrl = document.getElementById("imageUrl").value;
			var price = document.getElementById("price").value;
			var uploadimage = document.getElementById("uploadimage");
			if (reg.test(roomTitle)) {
				swal(
					'民宿标题不能',
					'包含空格等非法字符！',
					'warning'
				);
				return;
			}
			if (roomTitle == '' || roomTitle.replace(reg2, '') == '') {
				swal(
					'民宿标题',
					'不能为空！',
					'warning'
				);
				return;
			}
		 
			if (feature == '' || feature.replace(reg2, '') == '') {
				swal(
					'民宿介绍',
					'不能为空！',
					'warning'
				);
				return;
			}
			  if (price == '' || price.replace(reg2, '') == '') {
				swal(
					'民宿价格',
					'不能为空！',
					'warning'
				);
				return;
			}
			if (!reg3.test(price)) {
				swal(
					'民宿价格',
					'只能为正整数数字！',
					'warning'
				);
				return;
			}
			if (doc == '' && imageUrl == '') {
				swal(
					'请选择',
					'民宿介绍图片！',
					'warning'
				);
				return;
			}
			uploadimage.submit();
		}	
	</script>
	<script type="text/javascript">
		//下面用于多图片上传预览功能
		function setImagePreviews(avalue) {
			var docObj = document.getElementById("doc");
			var dd = document.getElementById("dd");
			var imageUrl = document.getElementById("imageUrl");
			dd.innerHTML = "";
		    
			//$("#dd").html("");
			var fileList = docObj.files;
			if(fileList.length > 5) {
					swal({
						title : '最多只能上传五张图片！',
						timer : 1500
					}) ;
					//alert("最多只能上传十张图片！");
					return;
			}
			for (var i = 0; i < fileList.length; i++) {
			    imageUrl.value = null;
				dd.innerHTML += "<div style='float:left' > <img id='img" + i + "'  /> </div>";
				var imgObjPreview = document.getElementById("img" + i);
				if (docObj.files && docObj.files[i]) {
					//火狐下，直接设img属性
					imgObjPreview.style.display = 'block';
					imgObjPreview.style.width = '150px';	
					imgObjPreview.style.height = '150px';	
					//imgObjPreview.src = docObj.files[0].getAsDataURL();	
					//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式	
					imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);	
				} else {	
					//IE下，使用滤镜	
					docObj.select();	
					var imgSrc = document.selection.createRange().text;	
					//alert(imgSrc)	
					var localImagId = document.getElementById("img" + i);	
					//必须设置初始大小	
					localImagId.style.width = "100px";	
					localImagId.style.height = "100px";
					//图片异常的捕捉，防止用户修改后缀来伪造图片	
					try {
						localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
						localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;	
					} catch (e) {
						//alert("");
						swal({
							title : '您上传的图片格式不正确，请重新选择!',
							timer : 1500
						});
						return false;
					}	
					imgObjPreview.style.display = 'none';	
					document.selection.empty();	
				}	
			}		
			return true;	
		}
	</script>
</body>

</html>

