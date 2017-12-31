// var login1 = document.getElementById("login-form");
// var login2 =document.getElementsByClassName("login-form")[0];
// var li1 = document.getElementById("login-li");
// var li2 = document.getElementById("signup-li");
// var slider1 = document.getElementsByClassName("slider1")[0];
// var slider2 = document.getElementsByClassName("slider2")[0];
// function logins(){
// 		login1.style.display = "block";
// 		login2.style.display = "none";
// 		li1.style.color = "#444";
// 		li1.style.backgroundColor = "white";
// 		li2.style.background = "rgba(17,17,17,0.5)";
// 		li2.style.color = "#444";
// 		slider1.style.display = "block";
// 		slider2.style.display = "none";
// 		}
// function signin(){
// 		login1.style.display = "none";
// 		login2.style.display = "block";
// 		li1.style.color = "#444";
// 		li1.style.background = "rgba(17,17,17,0.5)";
// 		li2.style.backgroundColor = "white";
// 		li2.style.color = "#444";
// 		slider1.style.display = "none";
// 		slider2.style.display = "block";
// 	}


//随机取得数组中的一个
var Arr = ["bgc1","bgc2","bgc3"];
var n = Math.floor(Math.random() * Arr.length + 1)-1;
//alert(Arr[n]);
var flag = true;
if(flag){
	document.body.style.backgroundImage = "url(../img/" + Arr[n] + ".jpg)";
	document.body.style.overflow="hidden";
    document.body.backgroundImage = "no-repeat";
   //alert("url(../images/" + Arr[n] + ".jpg)");
    flag = false;
}
var xmlHttp = false;

function initAJAX() {
  if (window.XMLHttpRequest) {
    xmlHttp = new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    try {
      xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
      try {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (e) {
        window.alert("该浏览器不支持AJAX");
      }
    }
  }
}

function checkpwd(){
    var prompt1 = document.getElementById("prompt1");
	if(login1.password.value == ''){
		prompt1.innerHTML = "密码不能为空";
	}
}
function checkpwd1(){
	if(!flag){
		var prompt1 = document.getElementById("prompt1");
		var ifsubmit = document.getElementById("ifsubmit").innerHTML;
 if(login1.repassword.value == '' && login1.password.value != ''){

	prompt1.innerHTML = "请再次输入密码";

	}else if(login1.password.value != '' && login1.repassword.value != '' && login1.password.value != login1.repassword.value ){
		prompt1.innerHTML = "两次密码输入不一致";


	}else if(login1.password.value != '' && login1.repassword.value != '' && login1.password.value == login1.repassword.value && ifsubmit == "0" ){
		//alert("true");
		var prompt1 = document.getElementById("prompt1");
		//var submit1 = document.getElementById("submit1");
		prompt1.innerHTML = "";
		flag = false;
	    //var flag = true;
	    //return flag;

	}
	else if(login1.password.value != '' && login1.repassword.value != '' && login1.password.value == login1.repassword.value && ifsubmit == "1" ){
		//alert("true");
		var prompt1 = document.getElementById("prompt1");
		//var submit1 = document.getElementById("submit1");
		prompt1.innerHTML = "";
		flag = true;
	    //var flag = true;
	    //return flag;

	}
 }
}
var flag2 = false;
function checklogin2(){

var prompt2 = document.getElementById("prompt2");
if(login2.username.value.replace(/(^\s*$)/g,'') == ''){
	//alert("false");
	prompt2.innerHTML = "用户名不能为空";
	flag2 = false;

}else if(reg.test(login2.username.value)){
	prompt2.innerHTML = "用户名不能包含空格等特殊字符";
	var flag2 = false;

}else {
	prompt2.innerHTML = "";

}

}
function checkpwd2(){
	var prompt2 = document.getElementById("prompt2");
	if(login2.password.value == ''){
		prompt2.innerHTML = "密码不能为空";
		var flag2 = false;
	}else{
		prompt2.innerHTML = "";
	}

}

