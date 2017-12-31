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
			+ "showSingleActivityServlet";

	if (request.getQueryString() != null) {
		url += "?" + request.getQueryString();
	}
	session.setAttribute("url", url);
	session.removeAttribute("urlLogin");
%>
<c:forEach items="${singleExperience}" var="singleExperience">
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${singleExperience.experTitle}</title>
<link rel="stylesheet" href="../css/nav.css">
<link rel="stylesheet" href="../css/necessary.css" media="screen" title="no title">
<link rel="stylesheet" href="../css/bamboo.css" media="screen" title="no title">
<link rel="stylesheet" href="../css/foot.css" media="screen" title="no title">
<script src="../js/sweetalert2.min.js"></script>
<link href="../css/sweetalert2.min.css" rel="stylesheet">
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.pagination.js"></script>
<script type="text/javascript">

	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		//alert(new_page_index + 1);
		$("#pager").attr("action", "<%=request.getContextPath()%>/sxw/showSingleActivityServlet?id=${singleExperience.id}&type=experience&pageNum=" + (new_page_index + 1));
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
		<style media="screen">
		      .img4{
		        margin-left: 10%;
		        width: 80%;
		      }
		      .detail-share{
		          margin-bottom: 50px;
		          width: 95%;
		      }
			footer.foot-footer {
				background: rgba(97, 144, 148, 0.23);
			}
		</style>
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
						<a href="<%=path%>/sxw/login.jsp" class="nav-lia">
						登录/注册
						</a>
						</c:if>
						<c:if test="${userName != null}">
						<a href="<%=path%>/sxw/showUser" class="nav-lia">
							${userName}
						</a>
						</c:if>
						</li>
						<c:if test="${userName != null}">
						<li class="nav-li">
						<a href="<%=path%>/sxw/loginout" class="nav-lia">
							退出
						</a>
						</li>
						</c:if>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	<div class="conttext">
		<h2 class="title1">${singleExperience.experTitle}</h2>
         ${singleExperience.content}   
		<div class="detail-share">
	       	<div id="share">
				<div class="bdsharebuttonbox" data-tag="share_1">
					<a class="bds_weixin" data-cmd="weixin"></a> <a class="bds_tqq"
						data-cmd="tqq"></a> <a class="bds_tsina" data-cmd="tsina"></a>
				</div>
			</div>
            <div class="detail-all">
                <span class="detail-lspan">浏览<b id="browsingTimes">${singleExperience.browsingTimes}</b>次</span>
                <span class="detail-rspan"><img src="../img/praise.png" alt="" class="detail-rspan-img" id="praise" onclick="likes()"><b id="praiseTimes">${singleExperience.likes}次</b></span>
                <span class="detail-rspan"><a href="#comment"><img src="../img/message1.png" alt="" class="detail-rspan-img" /></a></span>
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
	                     	 	 <input name="commentId" id="commentId" style="display:none;" value="${singleExperience.id}"/>
	                     	 	 <input name="commentType" id="commentType" style="display:none;" value="experience"/>
	                     	 	 <input name="commentOrReply" id="commentOrReply" style="display:none;" value="comment" />
	                     	 	 <input name="parentCommentId" id="parentCommentId" style="display:none" />
		                         <textarea name="comment" id="comment" class="detail-point" placeholder="评论"></textarea>
		                         <button type="button" id="buttonReset" class="detail-button" onclick="cancel()" style="display:none;">取消回复</button>
 		                         <button type="button" name="button" class="detail-button" onclick="addcomment()">发表</button>
                    	 </form>

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

	</footer>
	<script src="../My97DatePicker/My97DatePicker/WdatePicker.js"></script>
	<script src="../js/initAJAX.js"></script>
	<script type="text/javascript">
        var userName=false;
        var linkPhone=false;
        var joinTime=false;
        function checkname(){
          var inputNode=document.getElementById("mingzi");
          var spanNode=document.getElementById("joinn");
          var content=inputNode.value;
          var reg=/^[\u4E00-\u9FFF]+$/i;
          if(reg.test(content)){
            spanNode.innerHTML="正确".fontcolor("green");
            userName=true;
            return true;
          }
          else {
            spanNode.innerHTML="错误".fontcolor("red");
            return false;
          }
        }
        //验证手机号
        function checkphone(){
          var inputNode=document.getElementById("lianxi");
          var spanNode=document.getElementById("linkphone")
          var content=inputNode.value;
          var reg=/^\d{11}$/i;
          if(reg.test(content)){
            spanNode.innerHTML="正确".fontcolor("green");
            linkPhone=true;
            return true;
          }
          else {
            spanNode.innerHTML="错误".fontcolor("red");
            return false;
          }
        }
        function checkgodate(){
          var ruzhuNode=document.getElementById("canjia");
          var ruzhutime=ruzhuNode.value;
          var nowNode=new Date();
          var likai=document.getElementById("canj");
          var startTmp=ruzhutime.split("-");
          var sd=new Date(startTmp[0],startTmp[1],startTmp[2]);
          var ed=new Date(nowNode.getFullYear(),(nowNode.getMonth()+1),nowNode.getDate());
          if(sd.getTime()<ed.getTime() || ruzhuNode.value == ''){
            likai.innerHTML="错误".fontcolor("red");
            return false;
          }
          else {
            likai.innerHTML="正确".fontcolor("green");
            joinTime=true;
            return true;
        }
      }
      function checkAll(){
        if(userName==true&&linkPhone==true&&joinTime==true)
        return true;
        else {
          //alert("您填入的信息有误！");
          swal({
     				title : '您填写的信息有误！',
     				timer : 1500,
     				showConfirmButton:false
     		  });
          return false;
      }
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
		 
	window._bd_share_config = {
		common : {
			bdText : '${singleView.viewTitle}',	
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
      var browsingTimes = ${singleExperience.browsingTimes} + 1;
      var id = ${singleExperience.id};
      xmlHttp.open("POST","<%=path%>/sxw/browsingTimesActivity?browsingTimes="+ browsingTimes + "&id=" + id,true);
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
	var praise = document.getElementById("praise");
	//alert(praiseTimes.innerHTML);
	initAJAX();
	xmlHttp.open("POST","<%=path%>/sxw/experienceLikes?experience_id=${singleExperience.id}&likes=findlikes",true);
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
		} else if (${userName != null}){
			var praise = document.getElementById("praise");
			var praiseTimes = document.getElementById("praiseTimes");
			//alert(praiseTimes.innerHTML);
			initAJAX();
			xmlHttp.open("POST","<%=path%>/sxw/experienceLikes?experience_id=${singleExperience.id}&likes=likes",true);
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
<script src="../js/amazeui.min.js"></script>
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
</c:forEach>