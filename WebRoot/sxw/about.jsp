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
			+ "about.jsp";

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
        <title>关于我们</title>
        <link rel="stylesheet" href="../css/necessary.css">
        <link rel="stylesheet" href="../css/nav.css">
        <style media="screen">
            body {
                background-color: #ececec;
            }
            .about-con{
                width: 50%;
                background-color: #fff;
                margin: 50px auto;
            }
            .about-h1{
                text-align: center;
                line-height: 70px;
                font-weight: lighter;
                border-bottom: 1px solid #ebebeb;
                margin: 0 30px;
            }
            .about-div{
                margin: 30px;
                padding-bottom: 30px;
                line-height: 2;
            }
        </style>
    </head>
    <body>
        <header class="nav-header">
				<nav class="nav-nav">
						<a href="<%=path%>/sxw/showIndex" class="nav-logo">
								<img src="../img/logo.png" alt="" class="nav-logo-img">
						</a>
						<div class="nav-div">
								<!-- <img src="static/images/menu.png" alt="" class="nav-div-img"> -->
								<div class="nav-div-img">
										<span class="nav-div-img-b1">1</span>
										<span class="nav-div-img-b2">1</span>
										<span class="nav-div-img-b3">1</span>
								</div>
								<ul class="nav-ul">
										<li class="nav-li nav-active">
												<a href="<%=path%>/sxw/showIndex" class="nav-lia nav-lia-active">首页</a>
										</li>
										<li class="nav-li">
												<a href="<%=path%>/sxw/showView" class="nav-lia">景点</a>
										</li>
										<li class="nav-li">
												<a href="<%=path%>/sxw/showActivity" class="nav-lia">体验</a>
										</li>
										<li class="nav-li">
												<a href="<%=path%>/sxw/showLive" class="nav-lia">乡居</a>
										</li>
										<li class="nav-li">
												<a href="<%=path%>/sxw/showStory" class="nav-lia">故事</a>
										</li>
										<li class="nav-li">
										 	<c:if test="${userName == null}">
												<a href="<%=path%>/sxw/login.jsp" class="nav-lia"> 登录/注册 </a>
											</c:if> 
											<c:if test="${userName != null}">
												<a href="<%=path%>/sxw/showUser" class="nav-lia"> ${userName} </a>
											</c:if>
										</li>
										<li class="nav-li">
											<c:if test="${userName != null}">
												<a href="<%=path%>/sxw/loginout" class="nav-lia"> 退出 </a>
											</c:if>
										</li>
								</ul>
						</div>
				</nav>
		</header>
        <div class="about-con">
            <h1 class="about-h1">网站简介</h1>
            <div class="about-div">
                <p>欢迎来到尚书悠，我们是一家集尚书圩村宣传服务与向消费者提供优惠信息于一体的网站。</p>
                <p>自2017年创办以来，尚书悠一直保持高速成长，陆续有众多农家乐商户入驻。尚书悠始终坚持以用户为本，为商家提供在线的展示平台，同时为消费者提供了从发现到消费的一条龙服务。</p>
                <h3>尚书悠的来历</h3>
                <p>目前旅游行业的发展以及城市人渴望回归自然的需求，使得各地的农家乐正在形成一种规模，在这种情况下，有许多农家乐店主渴望在网络上进行宣传推广，以此来吸引更多的消费者，但是如果需要在网络上进行宣传，必须要缴纳大量的费用，比如搜索引擎的竞价排名费用以及各地论坛的置顶费用等等，这使得许多农家乐店主对网络望而却步。
另一方面，消费者如果要到某地旅游，想要在该地联系一家农家乐准备入住，但是在网上搜索了一段时间后，便会发现，网络上的一些农家乐信息都是比较零散的，没有详细的介绍，同时，有一些想要省钱的消费者想参加一些正在举办优惠活动的农家乐更是很难找到。
所以，在这种情况下，我们创办了尚书悠，旨在为农家乐商家提供一个在线展示平台，同时为消费者提供一个发现农家乐的地方。</p>
                <h3>我们坚信用户至上</h3>
                <p>您能感受到专业，我们专注尚书圩村在线展示服务。我们集展示、服务分类、消费者点评、促销资讯服务于一体，为您打造全方位的展示及搜索方案。</p>
                <p>您请安心托付，我们的服务理念以贴近用户，服务商家为准。依托强大的技术能力，我们建立了先进的服务系统，为您提供无微不至的客户服务。</p>
                <h3>用心打造的服务理念</h3>
                <p>用户：以人为本，服务至上。</p>
                <p>商家：多赢的合作体系，提供全方位的展示方案。</p>
                <p>消费者：从发现到消费，贴心的一条龙服务。</p>
                <p>诚信：在诚信的基础上与商家建立融洽的合作关系。</p>
                <h3>我们的团队文化</h3>
                <p>目标：做中国最大的农家乐消费，展示平台。</p>
                <p>使命：使农家乐商家的展示方式多一条选择，使消费者发现更地道的农家味。</p>
                <p>品牌定位：尚书悠，发现更地道的农家味。</p>
            </div>
        </div>
    </body>
</html>
