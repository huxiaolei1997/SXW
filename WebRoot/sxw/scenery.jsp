<%@ page language="java"
	import="java.sql.*,java.io.*,java.util.*,util.DBUtil,dao.userDao,entity.User"
	pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
			+ request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/") + 1)
			+ "showView";

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
<title>景点</title>
		<link rel="stylesheet" href="../css/common.css">
        <link rel="stylesheet" type="text/css" href="../css/pubu-base.css">
    	<link rel="stylesheet" type="text/css" href="../css/pubu.css">
        <link rel="stylesheet" href="../css/necessary.css">
        <link rel="stylesheet" href="../css/nav.css">
<!-- <link href="static/css/bootstrap.min.css" rel="stylesheet"> -->
        <link rel="stylesheet" href="../css/scenery1.css">
        <link rel="stylesheet" href="../css/foot.css">


    	<!--[if lt IE 9]>
    		<script src="js/css3-mediaqueries.js"></script>
    	<![endif]-->
    	<script type="text/javascript" src="../js/jquery-1.12.1.min.js"></script>
    	<script type="text/javascript" src="../js/jQueryColor.js"></script>
    	<!--这个插件是瀑布流主插件函数必须-->
    	<script type="text/javascript" src="../js/jquery.masonry.min.js"></script>
    	<!--这个插件只是为了扩展jquery的animate函数动态效果可有可无-->
    	<script type="text/javascript" src="../js/jQeasing.js"></script>
    	<script type="text/javascript" src="../js/pubu.js"></script>
</head>
<body>
	<div class="scenery-body">
		<img src="../img/sunflower3.jpg" alt=""
			class="scenery-body-img">
	</div>
	
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
						<li class="nav-li "><a href="<%=path%>/sxw/showIndex" class="nav-lia ">首页</a>
						</li>
						<li class="nav-li  nav-active"><a href="<%=path%>/sxw/showView"
							class="nav-lia nav-lia-active">景点</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showActivity"
							class="nav-lia">体验</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showLive" class="nav-lia">乡居</a>
						</li>
						<li class="nav-li"><a href="<%=path%>/sxw/showStory" class="nav-lia">故事</a>
						</li>
						<li class="nav-li"><c:if test="${userName == null}">
								<a href="<%=path%>/sxw/login.jsp" class="nav-lia"> 登录/注册 </a>
							</c:if> <c:if test="${userName != null}">
								<a href="<%=path%>/sxw/showUser" class="nav-lia"> ${userName} </a>
							</c:if></li>
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
		<div class="sign-sun">
		  <section id="aws" class="aws-section">
                  <div class="leaf-header-container">
                        <div class="bg-animation">
                          <img alt="Cloud-1" class="cloud cloud-1" src="../img/cloud-1.png" width="300">
                          <img alt="Cloud-2" class="cloud cloud-2" src="../img/cloud-2.png" width="347">
                          <img alt="corel" class="cloud corel" src="../img/corel.png" width="50">
                          <img alt="Cloud-3" class="cloud cloud-3" src="../img/cloud-3.png" width="470">
                          <img alt="Cloud-4" class="cloud cloud-4" src="../img/cloud-4.png" width="762">
                          <img alt="Cloud-5" class="cloud cloud-5" src="../img/cloud-5.png" width="587">
                          <img alt="Cloud-6" class="cloud cloud-6" src="../img/cloud-6.png" width="857">
                        </div>
                        <div class="htmleaf-header-content">
                          <h2>尚书悠之旅<br> 乡村 自然 文化 悠闲 于一体的景色</h2>
                        </div>
                  </div>
            </section>
		</div>
	<div class="sign-pubulq">
		<div class="content">
			<!-- 瀑布流样式开始 -->
			<div class="waterfull clearfloat" id="waterfull">
				<ul>
					<c:forEach items="${views}" var="view">
							<li class="item">
        					<a href="<%=path%>/sxw/showSingleViewServlet?id=${view.id}&type=view" class="a-img">
        						<img src="<%=path%>${view.imageUrl}" alt="">
        					</a>
        					<h2 class="li-title" title="${view.viewTitle}">${view.viewTitle}</h2>
        					<p class="description">${view.introduction}</p>
        					<div class="qianm clearfloat">
        						<span class="sp1"><img src="../img/see.png" alt=""  class="dianzan"><b>${view.browsingTimes}</b></span>
        						<span class="sp2"><img src="../img/zan.png" alt="" class="dianzan">
                                    <b>${view.likes}</b>
                                </span>
        						<!-- <span class="sp3">2小时前&nbsp;By</span> -->
        					</div>
        				</li>
					</c:forEach>
					<!-- <li class="item">
        					<a href="#" class="a-img">
        						<img src="images/t2.jpg" alt="">

        					</a>
        					<h2 class="li-title" title="手把手教你用css3来创建loading动画(二)">手把手教你用css3来创建loading动画(二)</h2>
        					<p class="description">HTML 5以前的标准由于考虑到浏览器安全问题并不允许直接跨域通信并不允许直接跨域通信并不允许直接跨域通信，于...</p>
                            <div class="qianm clearfloat">
        						<span class="sp1"><img src="../img/see.png" alt=""  class="dianzan"><b>688</b></span>
        						<span class="sp2"><img src="../img/zan.png" alt="" class="dianzan">
                                    <b>10</b>
                                </span>
        						<span class="sp3">2小时前&nbsp;By</span>
        					</div>
        				</li> -->
					<!-- <li class="item">
        					<a href="#" class="a-img">
        						<img src="images/t2.jpg" alt="">

        					</a>
        					<h2 class="li-title" title="手把手教你用css3来创建loading动画(二)">手把手教你用css3来创建loading动画(二)</h2>
        					<p class="description">HTML 5以前的标准由于考虑到浏览器安全问题并不允许直接跨域通信并不允许直接跨域通信并不允许直接跨域通信，于...</p>
                            <div class="qianm clearfloat">
        						<span class="sp1"><img src="../img/see.png" alt=""  class="dianzan"><b>688</b></span>
        						<span class="sp2"><img src="../img/zan.png" alt="" class="dianzan">
                                    <b>10</b>
                                </span>
        						<span class="sp3">2小时前&nbsp;By</span>
        					</div>
        				</li> -->
					<!-- <li class="item">
        					<a href="#" class="a-img">
        						<img src="images/t2.jpg" alt="">

        					</a>
        					<h2 class="li-title" title="手把手教你用css3来创建loading动画(二)">手把手教你用css3来创建loading动画(二)</h2>
        					<p class="description">HTML 5以前的标准由于考虑到浏览器安全问题并不允许直接跨域通信并不允许直接跨域通信并不允许直接跨域通信，于...</p>
                            <div class="qianm clearfloat">
        						<span class="sp1"><img src="../img/see.png" alt=""  class="dianzan"><b>688</b></span>
        						<span class="sp2"><img src="../img/zan.png" alt="" class="dianzan">
                                    <b>10</b>
                                </span>
        						<span class="sp3">2小时前&nbsp;By</span>
        					</div>
        				</li> -->
					<!-- <li class="item">
        					<a href="#" class="a-img">
        						<img src="images/t2.jpg" alt="">

        					</a>
        					<h2 class="li-title" title="手把手教你用css3来创建loading动画(二)">手把手教你用css3来创建loading动画(二)</h2>
        					<p class="description">HTML 5以前的标准由于考虑到浏览器安全问题并不允许直接跨域通信并不允许直接跨域通信并不允许直接跨域通信，于...</p>
                            <div class="qianm clearfloat">
        						<span class="sp1"><img src="../img/see.png" alt=""  class="dianzan"><b>688</b></span>
        						<span class="sp2"><img src="../img/zan.png" alt="" class="dianzan">
                                    <b>10</b>
                                </span>
        						<span class="sp3">2小时前&nbsp;By</span>
        					</div>
        				</li> -->
				</ul>
			</div>
			<!-- loading按钮自己通过样式调整 -->
			<!-- <div id="imloading" style="width:150px;height:30px;line-height:30px;font-size:16px;text-align:center;border-radius:3px;opacity:0.7;background:#000;margin:10px auto 30px;color:#fff;display:none">
        		素材加载中.....
        		</div> -->
		</div>
	</div>
	<div class="sign-trans"></div>
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
				<a href="<%=path%>/sxw/showIndex">首页</a> · <a href="<%=path%>/sxw/showView">景点</a> · <a href="<%=path%>/sxw/showActivity">体验</a> · <a
					href="#">乡居</a> · <a href="<%=path%>/sxw/showStory">故事</a> · <a href="<%=path%>/sxw/login.jsp">登录/注册</a>

			</div>
			<div class="foot-down">
				<p class="foot-p">Copyright © 2017尚书悠 版权归 our team 所有</p>
			</div>
	</footer>
 	<script>
		window.onscroll = function(e){
			e.stopPropagation();

			if(window.scrollY >= document.querySelector('div.nav-bao').offsetHeight){
				document.querySelector('div.nav-bao').className = 'nav-bao nav-bao-scroll';
			}else{
				document.querySelector('div.nav-bao').className = 'nav-bao';
			}
		}
	</script>
</body>
</html>
