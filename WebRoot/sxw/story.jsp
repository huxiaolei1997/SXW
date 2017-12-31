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
			+ "showStory";

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
        <title>story</title>
        <link rel="stylesheet" href="../css/necessary.css">
        <link rel="stylesheet" href="../css/nav.css">
        <link rel="stylesheet" href="../css/story-hero-slider-style.css">
        <link rel="stylesheet" href="../css/story-templatemo-style.css">
        <link rel="stylesheet" href="../css/story.css">
        <link rel="stylesheet" href="../css/foot.css">
        <link href="../css/pagination.css" rel="stylesheet" type="text/css" />
		<script src="../js/jquery-1.11.3.js"></script>
		<script type="text/javascript" src="../js/jquery.pagination.js"></script>
		<script type="text/javascript">

	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		$("#showstory").attr("action", "<%=path%>/sxw/showStory?pageNum=" + (new_page_index + 1));
		$("#showstory").submit();
		return false;
	}

	$(function(){
		$("#News-Pagination").pagination(${totalPages}, {
			items_per_page : 6, // 每页显示多少条记录
			current_page :  ${currentPage} - 1, // 当前显示第几页数据
			num_display_entries : 6, // 分页显示的条目数
			next_text : "下一页",
			prev_text : "上一页",
			num_edge_entries : 2, // 连接分页主体，显示的条目数
			callback : handlePaginationClick
		});
	});
	</script>
    </head>
    <body>
        <header class="nav-header">
        	<div class="nav-bao">
	            <nav class="nav-nav">
	                <a href="<%=path%>/sxw/showIndex" class="nav-logo">
	                    <img src="../img/logo.png" alt="" class="nav-logo-img">
	                </a>
	                <div class="nav-div">
	                    <!-- <img src="../img/menu.png" alt="" class="nav-div-img"> -->
	                    <div class="nav-div-img">
	                        <span class="nav-div-img-b1">1</span>
	                        <span class="nav-div-img-b2">1</span>
	                        <span class="nav-div-img-b3">1</span>
	                    </div>
	                    <ul class="nav-ul">
	                        <li class="nav-li">
	                            <a href="<%=path%>/sxw/showIndex" class="nav-lia">首页</a>
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
	                        <li class="nav-li nav-active">
	                            <a href="<%=path%>/sxw/showStory" class="nav-lia nav-lia-active">故事</a>
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
        <div class="story-photo">
            <img src="../img/story.jpg" alt="" class="story-photo-img">
        </div>
        <div class="story-container">
         <div class="story-baobao">
            <div class="story-con-title">
                <div class="story-share">
                    分享快乐
                </div>
                <div class="story-write">
                    <a class="story-write-a" style="cursor:pointer;" onclick="mystory()">讲述我的乡村故事</a>
                </div>
            </div>
            <div class="cd-hero-slider small-screen">

                <!-- Page 3 Gallery Two -->
                <div class="selected from-right height-auto">
                    <div class="cd-full-width">
                        <div class="container-fluid js-tm-page-content" data-page-no="3" data-page-type="gallery">
                            <div class="tm-img-gallery-container tm-img-gallery-container-2">
                                <div class="tm-img-gallery gallery-two">
                                <!-- Gallery Two pop up connected with JS code below -->
                                 <c:forEach items="${result}" var="story">
                                    <div class="grid-item">
                                        <figure class="effect-ruby">
                                            <img src="<%=path%>${story.imageUrl}" alt="Image" class="img-fluid tm-img">
                                            <figcaption>
                                                <h2 class="tm-figure-title">${story.viewTitle}</h2>
                                                <p class="tm-figure-description">${story.introduction}</p>
                                                <a href="<%=path%>/sxw/showSingleStoryServlet?id=${story.id}&type=story">View more</a>
                                            </figcaption>
                                        </figure>
                                    </div>
                                  </c:forEach>
                                    <form action="<%=path%>/sxw/showStory" method="post" id="showstory"></form>
                                  
                                </div>
                            </div>
                        </div>
                          <div id="News-Pagination" style="float:right;"></div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <footer class="foot-footer">
            <div class="foot-div">
                <div class="foot-friendship">
                    <h4 class="foot-friend-h4">友情链接</h4>
                    <div class="foot-friends">
                        <a href="http://www.ctrip.com/" class="foot-friend">携程旅行</a>
                        <a href="http://www.tuniu.com/" class="foot-friend">途牛旅游</a>
                        <a href="https://www.ly.com/" class="foot-friend">同程旅游</a>
                        <a href="https://www.alitrip.com/" class="foot-friend">淘宝旅行</a>
                        <a href="https://www.qunar.com/" class="foot-friend">去哪儿网</a>
                        <a href="http://guide.qyer.com/" class="foot-friend">穷游锦囊</a>
                        <a href="http://map.baidu.com/" class="foot-friend">百度地图</a>
                        <a href="http://www.autonavi.com/" class="foot-friend">高德地图</a>
                        <a href="<%=path%>/sxw/about.jsp" class="foot-friend">关于我们</a>

                </div>
            </div>
            <div class="foot-nav">
                <a href="<%=path%>/sxw/showIndex">首页</a> ·
                <a href="<%=path%>/sxw/showView">景点</a> ·
                <a href="<%=path%>/sxw/showActivity">体验</a> ·
                <a href="#">乡居</a> ·
                <a href="<%=path%>/sxw/showStory">故事</a> ·
                <a href="<%=path%>/sxw/login.jsp">登录/注册</a>

            </div>
            <div class="foot-down">
                <p class="foot-p">Copyright © 2017尚书悠 版权归 our team 所有 </p>
            </div>
        </footer>
    </body>
</html>
<script type="text/javascript">
function mystory(){
if(${userName == null}){
window.location.href='<%=path%>/sxw/signup.jsp';
} else {
window.location.href='<%=path%>/sxw/mystory.jsp';
}
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
