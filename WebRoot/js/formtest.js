var userName=false;
var lianxi=false;
var ruzhu=false;
var likai=false;
var personnum=false;
//验证姓名
function checkname(){
  var inputNode=document.getElementById("user-name");
  var spanNode=document.getElementById("linkman")
  var content=inputNode.value;
  var reg=/^[\u4E00-\u9FFF]+$/i;
  if(reg.test(content)){
    spanNode.innerHTML="正确".fontcolor("green");
    userName=true;
    return true;
  }
  else {
    spanNode.innerHTML="错误".fontcolor("red");
    userName=false;
    return false;
  }
}
//验证手机号
function checkphone(){
  var inputNode=document.getElementById("user-phone");
  var spanNode=document.getElementById("linkphone")
  var content=inputNode.value;
  var reg=/^\d{11}$/i;
  if(reg.test(content)){
    spanNode.innerHTML="正确".fontcolor("green");
    lianxi=true;
    return true;
  }
  else {
    spanNode.innerHTML="错误".fontcolor("red");
    lianxi=false;
    return false;
  }
}
//检验入住日期
function checkgodate(){
  var ruzhuNode=document.getElementById("user-rudate");
  var ruzhutime=ruzhuNode.value;
  var nowNode=new Date();
  var start=document.getElementById("godate");
  var startTmp=ruzhutime.split("-");
  var sd=new Date(startTmp[0],startTmp[1],startTmp[2]);

  var ed=new Date(nowNode.getFullYear(),(nowNode.getMonth()+1),nowNode.getDate());

  if(sd.getTime()<ed.getTime()){
    start.innerHTML="错误".fontcolor("red");
    ruzhu=false;
    return false;
  }
  else {
    start.innerHTML="正确".fontcolor("green");
    ruzhu=true;
    return true;
 }
}
//验证离开日期要大于入住日期
function checkdate(){
  var ruzhuNode=document.getElementById("user-rudate");
  var ruzhutime=ruzhuNode.value;
  var likaiNode=document.getElementById("user-lidate");
  var likaitime=likaiNode.value;
  var finish=document.getElementById("outdate");
  var startTmp=ruzhutime.split("-");
  var endTmp=likaitime.split("-");
  var sd=new Date(startTmp[0],startTmp[1],startTmp[2]);
  var ed=new Date(endTmp[0],endTmp[1],endTmp[2]);
  if(sd.getTime()>ed.getTime()){
    finish.innerHTML="错误".fontcolor("red");
    likai=false;
    return false;
  }
  else {
    finish.innerHTML="正确".fontcolor("green");
    likai=true;
    return true;
}

}
//验证参加人数
function checknum(){
  var inputNode=document.getElementById("user-number");
  var spanNode=document.getElementById("livenum")
  var content=inputNode.value;
  var reg=/^[1-9]+$/i;
  if(reg.test(content)){
    spanNode.innerHTML="正确".fontcolor("green");
    personnum=true;
    return true;
  }
  else {
    spanNode.innerHTML="错误".fontcolor("red");
    personnum=false;
    return false;
  }
}

