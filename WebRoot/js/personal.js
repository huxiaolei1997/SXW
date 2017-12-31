var Oli=$(".box-top ul li");
var Odiv=$(".box-text");
Oli.click(function(){
  var index=$(this).index();
  Oli.eq(index).addClass("clicked").siblings().removeClass("clicked");
  Odiv.eq(index).css("display","block").siblings().css("display","none");
});

//var flag=false;
//var reg =/\s+/g;
//function checklogin(){
//
//if(login1.username.value.replace(/(^\s*$)/g,'') == ''){
//	//alert("false");
//	var prompt1 = document.getElementById("prompt1");
//	prompt1.innerHTML = "用户名不能为空";
//  flag=false;
//  return flag;
//
//}else if(reg.test(login1.username.value)){
//	var prompt1 = document.getElementById("prompt1");
//	prompt1.innerHTML = "用户名不能包含空格等特殊字符";
//  flag=false;
//  return flag;
//
//}
//else if(login1.username.value.replace(/(^\s*)|(\s*$)/g,'') != ''){
//	xmlHttp.open("POST",encodeURI("checkuser?username=" + login1.username.value),true);
//	xmlHttp.send();
//	xmlHttp.onreadystatechange = function(){
//		if(xmlHttp.readyState == 4 && xmlHttp.status == 200 ){
//			var res = xmlHttp.responseText;
//			if(res == "true"){
//				var prompt1 = document.getElementById("prompt1");
//				prompt1.innerHTML = "用户名可以使用";
//				var ifsubmit = document.getElementById("ifsubmit");
//				ifsubmit.innerHTML = "1";
//        return true;
//				//alert("1");
//
//			}else if( res == "false"){
//				var prompt1 = document.getElementById("prompt1");
//				prompt1.innerHTML = "用户名已经存在";
//				var ifsubmit = document.getElementById("ifsubmit");
//				ifsubmit.innerHTML = "0";
//        flag=false;
//        return flag;
//               // alert("0");
//
//			}
//		}
//
//	}
//}
//}

