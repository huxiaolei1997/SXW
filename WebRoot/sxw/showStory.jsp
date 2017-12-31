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
			+ "showSingleStoryServlet";

	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	}
	session.setAttribute("url", url);
	session.removeAttribute("urlLogin");
%>
<c:forEach items="${singleStory}" var="singleStory">
	<!DOCTYPE html>
	<html>
<head>
<meta charset="utf-8">
<title>${singleStory.viewTitle}</title>
<link rel="stylesheet" href="../css/necessary.css">
<link rel="stylesheet" href="../css/nav.css">
<link rel="stylesheet" href="../css/detail.css">
<script src="../js/sweetalert2.min.js"></script>
<link href="../css/sweetalert2.min.css" rel="stylesheet">
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.pagination.js"></script>
<script type="text/javascript">

	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		$("#pager").attr("action", "<%=request.getContextPath()%>/sxw/showSingleStoryServlet?id=${singleStory.id}&type=story&pageNum=" + (new_page_index + 1));
		$("#pager").submit();
		return false;
	}

	$(function() {
		$("#News-Pagination").pagination(${totalPages}, {
			items_per_page : 5, // 每页显示多少条记录
			current_page : ${currentPage} - 1, // 当前显示第几页数据
			num_display_entries : 6, // 分页显示的条目数
			next_text : "下一页",
			prev_text : "上一页",
			num_edge_entries : 2, // 连接分页主体，显示的条目数
			callback : handlePaginationClick
		});
	});
</script>
<style type="text/css">
#share a {
	width: 45px;
	height: 45px;
	padding: 0;
	margin: 6px;
}

#share a.bds_weixin {
	background: url(../img/share1.png) no-repeat;
}

#share a.bds_tqq {
	background: url(../img/share2.png) no-repeat;
}

#share a.bds_tsina {
	background: url(../img/share3.png) no-repeat;
}
</style>
</head>
<body>
	<!--  <div class="detail-body">
		<img src="<%=path%>${singleStory.imageUrl}" alt=""
			class="detail-body-img">
	</div>
	-->
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
						<li class="nav-li"><a href="<%=path%>/sxw/showIndex" class="nav-lia">首页</a>
						</li>
						<li class="nav-li"><a href="<%=path%>/sxw/showView"
							class="nav-lia">景点</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showActivity"
							class="nav-lia">体验</a></li>
						<li class="nav-li"><a href="<%=path%>/sxw/showLive"
							class="nav-lia">乡居</a></li>
						<li class="nav-li nav-active"><a
							href="<%=path%>/sxw/showStory" class="nav-lia nav-lia-active">故事</a></li>
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
	<div class="detail-container">
		<div class="detail-main">
			<div class="detail-mcontain">



				<h1 class="detail-title">${singleStory.viewTitle}</h1>
				<time class="detail-time">${fn:substring(singleStory.addtime,0,10)}</time>
				<div class="detail-writing">${singleStory.content}</div>

			</div>
			<div class="detail-share">
				<div id="share">
					<div class="bdsharebuttonbox" data-tag="share_1">
						<a class="bds_weixin" data-cmd="weixin"></a> <a class="bds_tqq"
							data-cmd="tqq"></a> <a class="bds_tsina" data-cmd="tsina"></a>
					</div>
				</div>
				<div class="detail-all">
					<span class="detail-lspan">浏览<b id="browsingTimes">${singleStory.browsingTimes}</b>次
					</span>
						<span class="detail-rspan">
							<img src="../img/praise.png" alt="" class="detail-rspan-img" id="praise" onclick="likes()"><b id="praiseTimes">${singleStory.likes}次</b>
						</span>
						<span class="detail-rspan">
							<a href="#comment"><img src="../img/message1.png" alt="" class="detail-rspan-img" /></a>
						</span>
				   </div>
					<ul class="comment-all">
                       		 <c:forEach items="${comments}" var="comment">
		                         <li class="comment-item">
		                             <div class="comment-single">
		                                     <img src="<%=path%>${comment.headImageUrl}" alt="" class="person-head">
		                                     <div class="comment-content">
		                                         <p>
		                                             <span class="comment-name">${comment.commentName}</span><strong>:</strong><span class="comment-ponts">${comment.content}</span>
		                                         </p>
		                                         <div class="comment-time">
		                                             <time>${comment.commentTime}</time>
		                                             <c:if test="${comment.replyComment.replyContent == null }">
		                                             	<img src="../img/hvfu.png" alt="" class="comment-hvfu" onclick="replyComment('${comment.contentId}')">
		                                             </c:if>
		                                         </div>
		                                     </div>
		                             </div>
		                             <div class="comment-reply">
		                                 <ul>
		                                 <c:if test="${comment.replyComment.replyContent != null }">
		                                    <li>
		                                         <div class="comment-single">
		                                                 	<img src="<%=path%>${comment.user.headImageUrl}" alt="" class="person-head">
		                                                 <div class="comment-content">
		                                                     <p>
		                                                         <span class="comment-name">${comment.replyComment.replyCommentUserName}</span><strong>回复</strong><span class="comment-rename">${comment.commentName}</span><strong>:</strong><span class="comment-ponts">${comment.replyComment.replyContent}</span>
		                                                     </p>
		                                                     <div class="comment-time">
		                                                         <time>${comment.replyComment.commentTime}</time>
		                                                  	 </div>
		                                                 </div>
		                                         </div>
		                                     </li>
		                                     </c:if>                          
		                                 </ul>
		                             </div>
		                         </li>    		
						</c:forEach>
						<c:forEach items="${comments}" var="comment">
							<c:if test="${comment.commentName != null}">
								<form id="pager" method="post"></form>
								<div id="News-Pagination" style="float:left;"></div>
							</c:if>
						</c:forEach>
                     </ul>
                     <div class="detail-discussion">
                          <form action="<%=path%>/sxw/addComment" method="post" id="add">
	                     	 	 <input name="commentName" id="commentName" style="display:none;" value="${userName}"/>
	                     	 	 <input name="commentId" id="commentId" style="display:none;" value="${singleStory.id}"/>
	                     	 	 <input name="commentType" id="commentType" style="display:none;" value="story"/>
	                     	 	 <input name="commentOrReply" id="commentOrReply" style="display:none;" value="comment" />
	                     	 	 <input name="parentCommentId" id="parentCommentId" style="display:none" />
		                         <textarea name="comment" id="comment" class="detail-point" placeholder="评论"></textarea>
		                         <button type="button" id="buttonReset" class="detail-button" onclick="cancel()" style="display:none;">取消回复</button>
 		                         <button type="button" name="button" class="detail-button" onclick="addcomment()">发表</button>
                    	 </form>
                     </div>

			</div>

		</div>
		<div class="detail-right">
			<h2>猜你喜欢</h2>
			<c:forEach items="${randomView}" var="randomView">
			<div class="detail-rcell">
					<a href="<%=path%>/sxw/showSingleViewServlet?id=${randomView.id}&type=view"> <img src="<%=path%>${randomView.imageUrl}" alt="" style="width:100%;height:150px;">
						<h3>景点：${randomView.viewTitle}</h3>
					</a>
				</div>
	        </c:forEach>
			<c:forEach items="${randomExperience}" var="randomExperience">
				<div class="detail-rcell">
					<a
						href="<%=path%>/sxw/showSingleActivityServlet?id=${randomExperience.id}&type=experience">
						<img src="<%=path%>${randomExperience.imageUrl}" alt="" style="width:100%;height:150px;">
						<h3>体验：${randomExperience.experTitle}</h3>
					</a>
				</div>
			</c:forEach>
			<c:forEach items="${randomXiangJu}" var="randomXiangJu">
				<c:set value="${fn:split(randomXiangJu.imageUrl,';')}"
					var="splitImageUrl"></c:set>
				<div class="detail-rcell">
					<c:forEach items="${splitImageUrl}" begin="0" end="0"
						var="outSplitImageUrl">
						<a href="<%=path%>/sxw/showLive"> <img
							src="<%=path%>${outSplitImageUrl}" alt="" style="width:100%;height:150px;"></a>
					</c:forEach>
					<h3>
						<a href="<%=path%>/sxw/showLive" style="color:#666;">乡居：${randomXiangJu.roomTitle}</a>
					</h3>
				</div>
			</c:forEach>

			<c:forEach items="${randomStory}" var="randomStory">
				<div class="detail-rcell">
					<a href="<%=path%>/sxw/showSingleStoryServlet?id=${randomStory.id}&type=story">
						<img src="<%=path%>${randomStory.imageUrl}" alt="" style="width:100%;height:150px;">
						<h3>故事：${randomStory.viewTitle}</h3>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
	</html>
    <script src="../js/initAJAX.js"></script>
	<script>
	function addcomment(){
	if(${userName == null}){
	window.location.href = '<%=path%>/sxw/login.jsp';
	} else if(${userName != null}){
	var comment = document.getElementsByName("comment")[0].value;
	var add = document.getElementById("add");
	var reg =  /\s*/g;
    if(comment.replace(reg, '') == '') {
     			//alert("请输入关键词！");
     			swal({
     				title : '请输入评论内容',
     				timer : 1500,
     				showConfirmButton:false
     			});
     			return;
        }
add.submit();
	}
}

	window._bd_share_config = {
		common : {
			bdText : '${singleStory.viewTitle}',	
			bdDesc : '我分享了一个网页来看看吧',	
			bdUrl : 'www.sxw.com', 	
		},
		share : [{
			"bdSize" : 32
		}]
	}
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];

/**
* 此处往后台发送异步请求，浏览次数+1
*/

	window.onload = function(){
	  initAJAX();
      var browsingTimes = ${singleStory.browsingTimes} + 1;
      var id = ${singleStory.id};
      xmlHttp.open("POST","<%=path%>/sxw/browsingTimesThumbsUp?browsingTimes="+ browsingTimes + "&id=" + id,true);
      xmlHttp.send();
      xmlHttp.onreadystatechange = function(){
	      if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
		        var res = xmlHttp.responseText;
		        if(res == "success"){
		       //alert("success!");
		        } else {
		       //alert("fail!");
		        }
	      	}
      }
   	 var browsingTimes2 = document.getElementById("browsingTimes");
     browsingTimes2.innerHTML = parseInt(browsingTimes2.innerHTML) + 1; 
}
function addcomment(){
		if(${userName == null}){
		window.location.href = '<%=path%>/sxw/login.jsp';
		} else if(${userName != null}){
		var comment = document.getElementsByName("comment")[0].value;
		var add = document.getElementById("add");
		var reg =  /\s*/g;
	 		if(comment.replace(reg, '') == '') {
	     			//alert("请输入关键词！");
	     			swal({
	     				title : '请输入评论内容',
	     				timer : 1500,
	     				showConfirmButton:false
	     			});
	     			return;
	        }
		add.submit();
		}
	}
	function replyComment(parentCommentId1){
		var commentOrReply = document.getElementById("commentOrReply");
		var parentCommentId = document.getElementById("parentCommentId");
		var buttonReset = document.getElementById("buttonReset");
		parentCommentId.value = parentCommentId1;
		commentOrReply.value = 'reply';
		buttonReset.style.display = 'block';
		//alert(parentCommentId1 + " " +  commentOrReply.value);
		window.location.hash = "#comment";
	}
	function cancel(){
		var commentOrReply = document.getElementById("commentOrReply");
		var parentCommentId = document.getElementById("parentCommentId");
		var buttonReset = document.getElementById("buttonReset");
		parentCommentId.value = "none";
		commentOrReply.value = 'comment';
		buttonReset.style.display = 'none';
	    //alert(parentCommentId.value + " " +  commentOrReply.value);
	}
var praise = document.getElementById("praise");
//alert(praiseTimes.innerHTML);
initAJAX();
xmlHttp.open("POST","<%=path%>/sxw/likes?viewStory_id=${singleStory.id}&likes=findlikes",true);
xmlHttp.send();
xmlHttp.onreadystatechange = function(){
if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
var res = xmlHttp.responseText;
if(res == "1"){
praise.src = '../img/praise_fill.png';
} else if (res == "0"){
praise.src = '../img/praise.png';
}
}
}

function likes(){
//alert("success!");
if(${userName == null}){
window.location.href = '<%=path%>/sxw/login.jsp';
}else if(${userName != null}){
var praise = document.getElementById("praise");
var praiseTimes = document.getElementById("praiseTimes");
//alert(praiseTimes.innerHTML);
initAJAX();
xmlHttp.open("POST","<%=path%>/sxw/likes?viewStory_id=${singleStory.id}&likes=likes",true);
xmlHttp.send();
xmlHttp.onreadystatechange = function(){
if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
var res = xmlHttp.responseText;
if(res == "1"){
praise.src = '../img/praise_fill.png';
praiseTimes.innerHTML = parseInt(praiseTimes.innerHTML) + 1 + "次";
} else if (res == "0"){
praise.src = '../img/praise.png';
praiseTimes.innerHTML = parseInt(praiseTimes.innerHTML) - 1 + "次";
}
}
}
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
</c:forEach>