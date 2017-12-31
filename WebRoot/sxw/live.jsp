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
			+ "showLive";

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
<title>乡居</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/nav.css">
<link rel="stylesheet" href="../css/necessary.css">
<link rel="stylesheet" href="../css/mask1.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/live.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/foot.css" media="screen"
	title="no title">
<script src="../js/sweetalert2.min.js"></script>
<link href="../css/sweetalert2.min.css" rel="stylesheet">
</head>
<style media="screen">
footer.foot-footer {
	background: rgba(97, 144, 148, 0.23);
	margin-top: 100px;
}
</style>
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../js/jquery.pagination.js"></script>
<script type="text/javascript">
	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		$("#showlive").attr("action", "<%=path%>/sxw/showLive?pageNum=" + (new_page_index + 1));
		$("#showlive").submit();
		return false;
	}

	$(function(){
		$("#News-Pagination").pagination(${totalPages}, {
			items_per_page : 3, // 每页显示多少条记录
			current_page :  ${currentPage} - 1, // 当前显示第几页数据
			num_display_entries : 6, // 分页显示的条目数
			next_text : "下一页",
			prev_text : "上一页",
			num_edge_entries : 2, // 连接分页主体，显示的条目数
			callback : handlePaginationClick
		});
	});
</script>
<body style="background-image:url(../img/bbbg.jpg)">

	<header class="nav-header">
		<div class="nav-bao">
			<nav class="nav-nav">
				<a href="<%=path%>/sxw/showIndex" class="nav-logo"> <img src="../img/logo.png" alt=""
					class="nav-logo-img">
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
						<li class="nav-li"><a href="<%=path%>/sxw/showView"
							class="nav-lia">景点</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showActivity"
							class="nav-lia">体验</a></li>
						<li class="nav-li nav-active"><a href="<%=path%>/sxw/showLive"
							class="nav-lia nav-lia-active">乡居</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showStory"
							class="nav-lia">故事</a></li>
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

	<div class="allcont">
		<div class="cont row">
			<c:forEach items="${result}" var="showlive" varStatus="status">
				<div class="contfirst col-md-12">
					<c:set value="${fn:split(showlive.imageUrl,';')}"
						var="splitImageUrl"></c:set>
					<c:forEach items="${splitImageUrl}" begin="0" end="0"
						var="outSplitImageUrl">
							<img src="<%=path%>${outSplitImageUrl}" alt="" />
					</c:forEach>
					<div class="text">
						<h3>${showlive.roomTitle}</h3>
						<p>特点</p>
						<p>${showlive.feature}</p>
					</div>
					<div class="price">￥${showlive.price}</div>
					  <button type="button" name="button" id="btn${status.index}" class="live-button">查看照片</button>
				</div>
			</c:forEach>
            <!-- 这里的form表单是为了向后台传递页码数，从而后台返回相应页数的数据 -->
			<form action="<%=path%>/sxw/showLive" method="post" id="showlive"></form>
			<!-- 这里的News-Pagination用来渲染分页的，插件用的是pagination.js -->
			<div id="News-Pagination" style="float:right;"></div>
		</div>
		</div>
		<form class="user-formtable" action="<%=path%>/sxw/addOrder" method="post"  onsubmit="return checkAll()">
        <h1>预约</h1>
        <div class="tablerow">
            <div class="tableline">
                <label for="user-name">姓名：</label>
            </div>
            <div class="tableline">
                <input type="text" name="user-name" value="" id="user-name" placeholder="请输入您的名字" onblur="checkname()">
                <span id="linkman" class="explain"></span>
            </div>
        </div>
        <div class="tablerow">
            <div class="tableline">
                <label for="user-phone">手机：</label>
            </div>
            <div class="tableline">
                <input type="text" name="user-phone" onblur="checkphone()" value="" id="user-phone" placeholder="请输入您的手机号码">
                <span id="linkphone" class="explain"></span>
            </div>
        </div>
        <div class="tablerow">
            <div class="tableline">
                <label for="user-house">乡居名称：</label>
            </div>
            <div class="tableline">
                <!-- <input type="text" name="user-house" value="" id="user-house"> -->
                <select class="user-selhouses" name="user-house" id="user-house">
                    <!-- 表示各个菜单单项 -->
                    <c:forEach items="${result}" var="showlive" varStatus="status">
                    <option value="${showlive.roomTitle}">${showlive.roomTitle}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="tablerow">
            <div class="tableline">
                <label for="user-rudate">入住时间：</label>
            </div>
            <div class="tableline">
                <input type="date" name="user-rudate" value="" id="user-rudate" placeholder="请选择入住日期" onclick="WdatePicker()" onblur="checkgodate()">
                <span id="godate" class="explain"></span>
            </div>
        </div>
        <div class="tablerow">
            <div class="tableline">
                <label for="user-lidate" >离开时间：</label>
            </div>
            <div class="tableline">
                <input type="date" name="user-lidate" value="" id="user-lidate" placeholder="请选择离开日期" onclick="WdatePicker()" onblur="checkdate()">
                <span id="outdate" class="explain"></span>
            </div>
        </div>
        <div class="tablerow">
            <div class="tableline">
                <label for="user-number">人数：</label>
            </div>
            <div class="tableline">
                <input type="number" name="user-number" value="" id="user-number" onblur="checknum()" placeholder="请输入几人入住">
                <span id="livenum" class="explain"></span>
            </div>
        </div>
        <div class="tablerow">
            <div class="tableline">
                <label for="user-require">其他要求：</label>
            </div>
            <div class="tableline">
                <input type="text" name="user-require" value="" id="user-require" placeholder="请输入您的具体要求">
            </div>
        </div>
        <div class="tablerow button-yuyt">
            <div class="tableline">

            </div>
            <div class="tableline">
                <input type="submit" name="user-button" value="预约" id="user-button" onclick="return checkAll()">
            </div>

        </div>
    </form>
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
					<a href="<%=path%>/sxw/showIndex">首页</a> · <a href="<%=path%>/sxw/showView">景点</a>
					· <a href="<%=path%>/sxw/showActivity">体验</a> · <a
						href="<%=path%>/sxw/showLive">乡居</a> · <a
						href="<%=path%>/sxw/showStory">故事</a> · <a href="login.jsp">登录/注册</a>

				</div>
				<div class="foot-down">
					<p class="foot-p">Copyright © 2017尚书悠 版权归 our team 所有</p>
				</div>
		</footer>
		<!-- 查看图片功能开始 -->
		<div id="showImage">
			<c:forEach items="${result}" var="showImage" varStatus="status1">
				<div class="showImage${status1.index}">
					<a href="javascript:;" class="close${status1.index}">×</a>
					<div class="bbb">
					<div class="wrap">
						<ul>
							<c:set value="${fn:split(showImage.imageUrl,';')}" var="imageUrl"></c:set>
							<c:forEach items="${imageUrl}" var="outImageUrl">
									<li><img src="<%=path%>${outImageUrl}" alt="" /></li>
							</c:forEach>
						</ul>
					</div>
					<div class="wrrap">
						<ul>
							<c:forEach items="${imageUrl}" var="outImageUrl"
								varStatus="status">
								<c:if test="${status.index == 0 }">
									<li class="action"><img src="<%=path%>${outImageUrl}" alt="" /></li>
								</c:if>
								<c:if test="${status.index != 0 }">
									<li><img src="<%=path%>${outImageUrl}" alt="" /></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					</div>
					<div class="btn${status1.index + 7}">
						<span class="prev">&lt;</span> <span class="next">&gt;</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 查看图片功能结束 -->
		<script src="../My97DatePicker/My97DatePicker/WdatePicker.js"></script>
		<script src="../js/bootstrap.js"></script>
		<!-- 开启与关闭功能 -->
		<script type="text/javascript">
        $("#btn0").click(function(){
        $(".showImage0").css("display","block");
        });
        //隐藏遮罩层
        $(".close0").click(function(){
        $(".showImage0").css("display","none");
        $("body").css("overflow","visible");
      });
      
      
      $("#btn1").click(function(){
      $(".showImage1").css("display","block");
      });
      //隐藏遮罩层
      $(".close1").click(function(){
      $(".showImage1").css("display","none");
      $("body").css("overflow","visible");
    });


    $("#btn2").click(function(){
    $(".showImage2").css("display","block");
    });
    //隐藏遮罩层
    $(".close2").click(function(){
    $(".showImage2").css("display","none");
    $("body").css("overflow","visible");
  });
function checkAll(){
    if(userName==true&&lianxi==true&&ruzhu==true&&likai==true&&personnum==true){
        return true;
    } else if (${userName == null}){
    window.location.href = '<%=path%>/sxw/login.jsp';
		return false;
    }
    else{
      //alert("");
      swal({
			title : '您输入的信息有误，请重新检查！',
			timer : 1500,
			showConfirmButton:false
		});
  	return false;
    }


}
  </script>
	<script src="../js/mask1.js"></script>
	<script src="../js/formtest.js"></script>
	<script src="../js/initAJAX.js"></script>
</body>
</html>
