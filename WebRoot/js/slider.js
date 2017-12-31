window.onload=function(){
  var index=0;
  var num = $("#wwrap ul li");
  var m;
  $("#btn span").click(function(){
    m=$(this).index();
    if(m){index++;}

    else index--;
    if(index>=num.length)
    index=index%(num.length);
    if(index<0)index=(num.length)-1;
    num.eq(index).fadeIn("slow").siblings().fadeOut("slow");
  })
  play();
  function auto(){}
  function play(){
     timer=setInterval(function(){
        index++;
        var m=index;
        if(m>=num.length)m=m%(num.length);

        num.eq(m).fadeIn("slow").siblings().fadeOut("slow"); },4000);
  }

}
