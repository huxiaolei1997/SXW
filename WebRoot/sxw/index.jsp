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
			+ "showIndex";

	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	}
	session.setAttribute("url", url);
	session.removeAttribute("urlLogin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link rel="stylesheet" href="../css/necessary.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/nav.css" media="screen"
	title="no title">
<link rel="stylesheet" type="text/css" href="../css/htmleaf-demo.css"
	media="all">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/font-awesome.min.css" rel="stylesheet" media="all">
<link href="../css/animate.min.css" rel="stylesheet" media="all">
<!-- Bootstrap bootstrap-touch-slider Slider Main Style Sheet -->
<link href="../css/bootstrap-touch-slider.css" rel="stylesheet"
	media="all">
<link rel="stylesheet" href="../css/demostyle.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/introduce.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/foot.css" media="screen"
	title="no title">
<link rel="stylesheet" href="../css/nav.css" media="screen"
	title="no title">
<script type="text/javascript" src="../js/buzhido.js"></script>
<style>
footer.foot-footer {
	background: rgba(97, 144, 148, 0.23);
}

.tab-content p {
	text-indent: 2em;
}

#map {
	height: 300px;
	width: 35%;
	float: right;
	margin-top: 8%;
	margin-right: 2%;
}

body {
	font-family: "微软雅黑", Verdana, "Lantinghei SC", "Hiragino Sans GB",
		"Microsoft Yahei", Helvetica, arial, \5b8b\4f53, sans-serif;
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=g7G3g6jF4wHKqhQgEvkErdyDuzPWudtq"></script>
</head>
<body>
	<header class="nav-header">
	<div class="nav-bao">
				<nav class="nav-nav">
						<a href="<%=path%>/sxw/showIndex" class="nav-logo"> <img src="../img/logo.png" alt="" class="nav-logo-img">
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
	<div class="htmleaf-container">
		<div id="bootstrap-touch-slider"
			class="carousel bs-slider fade  control-round indicators-line"
			data-ride="carousel" data-pause="hover" data-interval="3000">

			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#bootstrap-touch-slider" data-slide-to="0"
					class="active"></li>
				<li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
				<li data-target="#bootstrap-touch-slider" data-slide-to="2"></li>
				<li data-target="#bootstrap-touch-slider" data-slide-to="3"></li>
				<li data-target="#bootstrap-touch-slider" data-slide-to="4"></li>
			</ol>

			<!-- Wrapper For Slides -->
			<div class="carousel-inner" role="listbox">

				 <div class="item active">

		                    <!-- Slide Background -->
		                    <img src="../img/hhhh.jpg" alt="Bootstrap Touch Slider"  class="slide-image"/>
		                    <div class="bs-slider-overlay"></div>

		                    <div class="container">
		                        <div class="row">

		                            <div class="slide-text slide_style_left">
		                                <!-- <h1 data-animation="animated zoomInRight">Bootstrap Carousel</h1> -->
		                                <p data-animation="animated fadeInLeft">接受青竹的洗礼，感受大自然的鬼斧神工</p>

		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="item">

		                    <!-- Slide Background -->
		                    <img src="../img/zzz.jpg" alt="Bootstrap Touch Slider"  class="slide-image"/>
		                    <div class="bs-slider-overlay"></div>

												<div class="container">
														<div class="row">

																<div class="slide-text slide_style_right">
																		<!-- <h1 data-animation="animated zoomInRight">Bootstrap Carousel</h1> -->
																		<p data-animation="animated fadeInRight">悠闲地品品茶，看看书，体悟人生的慢</p>

																</div>
														</div>
												</div>
		                </div>
		                <div class="item">

		                    <!-- Slide Background -->
		                    <img src="../img/ty.jpg" alt="Bootstrap Touch Slider"  class="slide-image"/>
		                    <div class="bs-slider-overlay"></div>

												<div class="container">
		                        <div class="row">

		                            <div class="slide-text slide_style_left">
		                                <!-- <h1 data-animation="animated zoomInRight">Bootstrap Carousel</h1> -->
		                                <p data-animation="animated fadeInLeft">一场和向日葵的约会，尽情地陶醉于花海中</p>

		                            </div>
		                        </div>
		                    </div>
		                </div>
						<div class="item">

		                    <!-- Slide Background -->
		                    <img src="../img/uuhw.jpg" alt="Bootstrap Touch Slider"  class="slide-image"/>
		                    <div class="bs-slider-overlay"></div>

												<div class="container">
														<div class="row">

																<div class="slide-text slide_style_left">
																		<!-- <h1 data-animation="animated zoomInRight">Bootstrap Carousel</h1> -->
																		<p data-animation="animated fadeInLeft">静静地观赏那枝头曾被你忽视无数次的花儿</p>

																</div>
														</div>
												</div>
		                </div>
						<div class="item">

								<!-- Slide Background -->
								<img src="../img/jy.jpg" alt="Bootstrap Touch Slider"  class="slide-image"/>
								<div class="bs-slider-overlay"></div>

								<div class="container">
										<div class="row">

												<div class="slide-text slide_style_center">
														<!-- <h1 data-animation="animated zoomInRight">Bootstrap Carousel</h1> -->
														<p data-animation="animated fadeInRight">学会快乐的学习，尽情的在知识的海洋中遨游</p>

												</div>
										</div>
								</div>
						</div>
				<!-- End of Slide -->
			</div>
			<!-- End of Wrapper For Slides -->

			<!-- Left Control -->
			<a class="left carousel-control" href="#bootstrap-touch-slider"
				role="button" data-slide="prev"> <span class="fa fa-angle-left"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a>

			<!-- Right Control -->
			<a class="right carousel-control" href="#bootstrap-touch-slider"
				role="button" data-slide="next"> <span class="fa fa-angle-right"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>

		</div>
		<!-- End  bootstrap-touch-slider Slider -->
	</div>
	 <div class="fanzhuan">
            <h2>尚书圩村</h2>
    		<div class="wrapper">
	            <div class="cols" >
					<div class="col col-first" ontouchstart="this.classList.toggle('hover');">
						<div class="col-container">
							<div class="front" style="background-image: url(../img/shi7.jpg)">
								<div class="inner" >
									<p>尚书概括</p>
		                            <span>尚书圩村，位于浙江安吉县皈山乡境内，距安吉县城18公里，是隐匿在浙皖西北交界处的一个美丽的小村落</span>
								</div>
							</div>
							<div class="back">
								<div class="inner">
								  <p>东邻皈山场村，南接白杨村，西邻上堡村。尚书圩村属于小村落，她四面群山簇拥，
                                      1000余村民日出而作日落而息，全村仅有一条县道与外界相通。该村获得很多美丽乡村的称号，该村以“弘扬尚书文化，发展休闲经济”为目标，2008年成功创建美丽乡村，走在了“中国美丽乡村”建设的前列。</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col col-second" ontouchstart="this.classList.toggle('hover');">
						<div class="col-container">
							<div class="front" style="background-image: url(../img/shi4.jpg)">
								<div class="inner">
									<p>尚书由来</p>
		                            <span>山不在高，有仙则灵。六百多年前的一天，
                                        村落的农家娃杨氏振普勤奋苦读，十年寒窗高中状元，后官拜礼部尚书</span>
								</div>
							</div>
							<div class="back">
								<div class="inner">
									<p>小山村也因为出了一位朝廷高官而喧闹起来，尚书街、尚书阁、尚书台……
                                        小山村因此有了"尚书"而闻名，"尚书"也就成了当地的代名词。
                                        杨尚书返乡探亲之际，留下"格物、致知、诚意、正心、修身、齐家、治国、平天下"
                                        八个词，教育后辈要从内在的德智修养，到外在的事业完成，
                                        构成一贯不断开展的过程，达到"止于至善"的境界。</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col col-third" ontouchstart="this.classList.toggle('hover');">
						<div class="col-container">
							<div class="front"  style="background-image: url(../img/shi3.jpg)">
								<div class="inner">
									<p>尚书预览</p>
		                            <span>进入尚书圩村，柏油路穿行于青青幽篁山间，绵延数十里的竹乡风情映入眼帘。一座高约10米的花岗岩石牌坊耸立村口</span>
								</div>
							</div>
							<div class="back">
								<div class="inner">
									<p>石牌坊正中央镌刻“尚书揽胜”四个大字遒劲有力。
                                        穿过石牌坊前行数十米，眼前豁然开朗，处在半山坳的尚书圩村，
                                        层次分明地展现在眼前，层楼叠榭，景色雅致。
                                      在入口的尚书阁，依次有九曲桥、金榜门、尚书文化展示馆等富有特色的文化建筑。
                                      展示馆内精美的蜡像和励志、传奇的故事，人文并茂。</p>
								</div>
							</div>
						</div>
					</div>
    		    </div>
    		</div>
    	</div>
	<div class="sceneMainResort">
	    <p class="scene-title">享受自然</p>
		<div class="cmt">
         <c:forEach items="${randomView}" var="randomView">
			<a href="<%=path%>/sxw/showSingleViewServlet?id=${randomView.id}&type=view">
				<div class="box1" data-scroll-reveal="enter from the left after 0.2s">
					<div class="box1-box">
						<img src="<%=path%>${randomView.imageUrl}" alt="" class="box1-img" />
					</div>
					<div class="sceneshadow"><div class="scenetext">${randomView.viewTitle}</div></div>
	
				</div>
			</a> 
		 </c:forEach>
   	     <c:forEach items="${randomExperience}" var="randomExperience">
			<a href="<%=path%>/sxw/showSingleActivityServlet?id=${randomExperience.id}&type=experience">
			<div class="box2" data-scroll-reveal="enter from the bottom after 0.4s">
					<div class="box1-box">
					<img src="<%=path%>${randomExperience.imageUrl}" alt="" class="box1-img" />
					</div>
					<div class="sceneshadow"><div class="scenetext">${randomExperience.experTitle}</div></div>

				</div>
			 </a>
	   	</c:forEach>
		   	<c:forEach items="${randomXiangJu}" var="randomXiangJu">
					 <a href="<%=path%>/sxw/showLive">
					 <div class="box3" data-scroll-reveal="enter from the top after 0.4s">
						<div class="box1-box">
						<c:set value="${fn:split(randomXiangJu.imageUrl,';')}"
							var="splitImageUrl"></c:set>
						<c:forEach items="${splitImageUrl}" begin="0" end="0" var="outSplitImageUrl">
							<img src="<%=path%>${outSplitImageUrl}" alt="" class="box1-img" />
						</c:forEach>	
						</div>
						<div class="sceneshadow"><div class="scenetext">${randomXiangJu.roomTitle}</div></div>
	
					</div>
					</a>
			</c:forEach> 
		<c:forEach items="${randomStory}" var="randomStory">
		<a href="<%=path%>/sxw/showSingleActivityServlet?id=${randomStory.id}&type=experience"><div class="box4"
					data-scroll-reveal="enter from the right after 0.3s">
					<div class="box1-box">
						<img src="<%=path%>${randomStory.imageUrl}" alt="" class="box1-img" />
					</div>
					<div class="sceneshadow"><div class="scenetext">${randomStory.viewTitle}</div></div>
		
				</div>
				</a>
		</c:forEach> 
		</div>
	</div>
	<div class="address">
		<h2>安吉尚书休闲村落交通指南</h2>
		<div class="arrival">

			<h4 class="address1">安吉尚书休闲村落地址：浙江省安吉县皈山乡尚书圩村</h4>
			<h4>安吉尚书休闲村落自驾车路线：</h4>
			<ol>
				<li>S14高速—安吉下——直走（安吉大道—云鸿西路）——右转（康一南路）——左转（到球山的位置往皈山乡方向）——右转（S204省道）——左转至尚书休闲村落（皈山中学—325县道）</li>
				<li>S14高速—安吉北下——右转走马良线到（良朋镇）——S204省道（西亩乡）—继续走S204到皈山乡观音桥村的二百岭（皈山中学）——右转走严省线至尚书休闲村落（325县道） </li>
				<li>G50沪渝高—泗安互通高架下——走S204省道到西亩乡—继续走S204倒皈山乡观音桥村的二百岭（皈山中学）——右转走严省线至尚书休闲村落（325县道）</li>
				<li>306省道（古障东路—古障西路—左转灵峰北路—右转浦源大道）——右转（康一南路）——左转（到球山的位置往皈山乡方向）——皈山加油站右转（S204省道）——二百岭左转至尚书休闲村落（皈山中学—325县道）</li>
			</ol>
			<h4 class="line">乘车路线：</h4>
			<p>安吉县城长途汽车站：乘坐（递铺—孝丰）到孝丰，再换乘（孝丰—上堡）的车至尚书干村）</p>
		</div>
		<div id="map"></div>
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
						href="http://www.autonavi.com/" class="foot-friend">高德地图</a>
						<a href="<%=path%>/sxw/about.jsp" class="foot-friend">关于我们</a>
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

		<script src="../js/jquery-1.12.1.min.js" type="text/javascript"></script>
		<script src="../js/bootstrap.min.js"></script>
	    <script src="../js/jquery.touchSwipe.min.js"></script>
	    <script src="../js/bootstrap-touch-slider.js"></script>
	    <script type="text/javascript">
	      $('#bootstrap-touch-slider').bsTouchSlider();
	    </script>
	<script type="text/javascript">
		var map = new BMap.Map("map"); // 创建地图实例
		var point = new BMap.Point(119.571117, 30.664235); //119.571117,30.664235// 创建点坐标
		map.centerAndZoom(point, 16); // 初始化地图，设置中心点坐标和地图级别
	
		//var map = new BMap.Map("allmap");
		//map.centerAndZoom(new BMap.Point(116.4035,39.915),8);
		map.enableScrollWheelZoom(true);
		//var pt = new BMap.Point(116.417, 39.909);
		var myIcon = new BMap.Icon("http://lbsyun.baidu.com/jsdemo/img/fox.gif", new BMap.Size(300, 157));
		var marker2 = new BMap.Marker(point, {
			icon : myIcon
		}); // 创建标注
		map.addOverlay(marker2);
		/*下方是地图上的控件*/
		var top_left_control = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_TOP_LEFT
		}); // 左上角，添加比例尺
		var top_left_navigation = new BMap.NavigationControl(); //左上角，添加默认缩放平移控件
		map.addControl(top_left_control);
		map.addControl(top_left_navigation);
		  //alert("${userName}");
	</script>
	<script type="text/javascript" src="../js/scrollReveal.js"></script>
	<script>
			window.scrollReveal = new scrollReveal();
			//或者，elem 为动画元素的任何级别的父元素
			// window.scrollReveal2 = new scrollReveal({elem: document.getElementById('srcontent')});
	</script>
	<script type="text/javascript" src="../js/initAJAX.js"></script>
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
	<script type="text/javascript">
	//访问首页时向后台发送一个请求，统计访问人数
		 initAJAX();
		 xmlHttp.open("POST", "<%=path%>/sxw/getIpAddress",true);
		 xmlHttp.send();
		 xmlHttp.onreadystatechange = function(){
		 if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
		 //alert("success");
		 }
		 }
	
	</script>
</body>
</html>