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
			+ "showActivity";

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
<title>
<c:forEach items="${shortExperiences}" var="shortTerms">
    ${shortTerms.experTitle}、
</c:forEach>
</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/necessary.css">
    <link rel="stylesheet" href="../css/nav.css">
    <link rel="stylesheet" href="../css/head.css">
    <link rel="stylesheet" href="../css/style2.css">
    <link rel="stylesheet" href="../css/foot.css">
    <style media="screen">
         footer.foot-footer{
           /*position: absolute;
           top:236%;*/
           background: rgba(97, 144, 148, 0.23);
         }

     </style>
<script src="../js/sweetalert2.min.js"></script>
<link href="../css/sweetalert2.min.css" rel="stylesheet">
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
						<li class="nav-li"><a href="<%=path%>/sxw/showIndex" class="nav-lia">首页</a>
						</li>
						<li class="nav-li"><a href="<%=path%>/sxw/showView"
							class="nav-lia">景点</a></li>
						<li class="nav-li nav-active"><a
							href="<%=path%>/sxw/showActivity" class="nav-lia nav-lia-active">体验</a>
						</li>
						<li class="nav-li"><a href="<%=path%>/sxw/showLive" class="nav-lia">乡居</a>
						</li>
						<li class="nav-li"><a href="<%=path%>/sxw/showStory" class="nav-lia">故事</a>
						</li>
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
	<div class="act-head">
		<div class="head">
			<div class="headtext">您想玩啥？</div>
			<div class="headsearch">
				<form action="<%=path%>/sxw/showActivity" method="post"
					id="searchActivity">
					<div class="inputdiv">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						<input type="text" name="keyword" id="keyword" value="${keyword}"
							placeholder="请输入你想体验的活动"> <a href="javascript:;"
							onclick="searchActivity()">
							<div class="gobtn">GO</div>
						</a>
					</div>
				</form>
				<div class="inputbot">
					<ul>
						<c:forEach items="${shortExperiences}" step="2" var="shortTerms">
							<a
								href="<%=path%>/sxw/showSingleActivityServlet?id=${shortTerms.id}&type=experience"
								target="_blank"><li>${shortTerms.experTitle}</li></a>
						</c:forEach>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="act-rec">
		<div class="recommend">
			<div class="top">
				<img src="../img/tuijian.png" alt="" />
				<c:if test="${keyword != null}">
					<span class="title">搜索结果</span>
				</c:if>
				<c:if test="${keyword == null}">
					<span class="title">我们的推荐</span>
				</c:if>

			</div>
			<div class="switch">
				<ul>
					<li id="long"><a href="javascript:;">长期活动</a></li>
					<li id="short" class="act"><a href="javascript:;">短期活动</a></li>
				</ul>
			</div>


			<div class="experience">
				<div id="dv" class="show">

					<ul class="et-experience shortview">
						<c:forEach items="${shortExperiences}" var="shortTerms">
							<li class="item view1"
								data-scroll-reveal="enter from the left after 0.2s">
								<figure>
									<div class="view">
										<a
											href="<%=path%>/sxw/showSingleActivityServlet?id=${shortTerms.id}&type=experience"><img
											src="<%=path%>${shortTerms.imageUrl}" alt="" /></a>
									</div>
									<figcaption>
										<p>
											<span><a
												href="<%=path%>/sxw/showSingleActivityServlet?id=${shortTerms.id}&type=experience">${shortTerms.experTitle}</a></span>
										</p>
										<p>
											<span><a
												href="<%=path%>/sxw/showSingleActivityServlet?id=${shortTerms.id}&type=experience">点我看看</a></span>
										</p>
									</figcaption>
								</figure>
							</li>
						</c:forEach>
					</ul>
					<ul class="et-experience shortview">
						<c:forEach items="${shortExperiences}" begin="3" end="5"
							var="shortTerms2">
							<li class="item view1"
								data-scroll-reveal="enter from the left after 0.2s">
								<figure>
									<div class="view">
										<a
											href="<%=path%>/sxw/showSingleActivityServlet?id=${shortTerms2.id}&type=experience"><img
											src="<%=path%>${shortTerms2.imageUrl}" alt="" /></a>
									</div>
									<figcaption>
										<p>
											<span><a
												href="<%=path%>/sxw/showSingleActivityServlet?id=${shortTerms2.id}&type=experience">${shortTerms2.experTitle }</a></span>
										</p>
										<p>
											<span><a
												href="<%=path%>/sxw/showSingleActivityServlet?id=${shortTerms2.id}&type=experience">点我看看</a></span>
										</p>
									</figcaption>
								</figure>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div id="lv" class="hide">
					<ul class="et-experience">
						<c:forEach items="${longExperiences}" begin="0" end="2"
							var="longTerms">

							<li class="item view1">
								<figure>
									<div class="view">
										<a
											href="<%=path%>/sxw/showSingleActivityServlet?id=${longTerms.id}&type=experience"><img
											src="<%=path%>${longTerms.imageUrl}" alt="" /></a>
									</div>
									<figcaption>
										<p>
											<span><a
												href="<%=path%>/sxw/showSingleActivityServlet?id=${longTerms.id}&type=experience">${longTerms.experTitle}</a></span>
										</p>
										<p>
											<span><a
												href="<%=path%>/sxw/showSingleActivityServlet?id=${longTerms.id}&type=experience">点我看看</a></span>
										</p>
									</figcaption>
								</figure>
							</li>
						</c:forEach>
					</ul>
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
				<a href="<%=path%>/sxw/showIndex">首页</a> · <a href="<%=path%>/sxw/showView">景点</a> · <a href="<%=path%>/sxw/showActivity">体验</a> · <a
					href="#">乡居</a> · <a href="<%=path%>/sxw/showStory">故事</a> · <a href="<%=path%>/sxw/login.jsp">登录/注册</a>

			</div>
			<div class="foot-down">
				<p class="foot-p">Copyright © 2017尚书悠 版权归 our team 所有</p>
			</div>
	</footer>

	<script type="text/javascript" src="../js/scrollReveal.js"></script>
	<script>
           window.scrollReveal = new scrollReveal();
           //或者，elem 为动画元素的任何级别的父元素
           window.scrollReveal2 = new scrollReveal({elem: document.getElementById('srcontent')});
     </script>
	<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.js "></script>
	<script>
     //长期短期活动变换
        var Long=document.getElementById("long");
        var Short=document.getElementById("short");
        var Lv=document.getElementById("lv");
        var Dv=document.getElementById("dv");
        Long.onclick=function(){
          Lv.className="show";
          Dv.className="hide";
          Long.className="act";
          Short.className="";
        }
        Short.onclick=function(){
          Dv.className="show";
          Lv.className="hide";
          Short.className="act";
          Long.className="";
        }
        //刷新一次页面背景变换一次
        var bg_img=["../img/bg2.jpg","../img/bg81.jpg"];
        var n=bg_img[Math.floor(Math.random()*2)];
        var s="url("+n+")";
        $(".head").css("backgroundImage",s);
        
        function searchActivity(){
        var searchActivity = document.getElementById("searchActivity");
        var keyword = document.getElementById("keyword").value;
        var reg =  /\s*/g;
        if(keyword.replace(reg, '') == '') {
     			//alert("请输入关键词！");
     			swal({
     				title : '请输入关键词',
     				timer : 1500,
     				showConfirmButton:false
     			});
     			return;
        }
         searchActivity.submit();
        }
     </script>
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
