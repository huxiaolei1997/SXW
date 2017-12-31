window.onload=function(){
  var index1=0;
  var num1 = $(".showImage0 .wrap ul li");
  var number1=$(".showImage0 .wrrap ul li");
  var len1=num1.length;
  var m,xx,yy;
  // var aa=600/len1;
  // var oimg=$(".abc .wrap ul li img");
  // for(var i=0;i<len1;i++)
  // {
  //     oimg[i].css("width",aa,"hight",aa);
  // }

  //图片点击事件
  number1.click(function(){
    m=$(this).index();
   //alert(m);
    number1.eq(m).addClass('action').siblings().removeClass('action');
    num1.eq(m).fadeIn().siblings().fadeOut();
  })
  $(".btn7 span").click(function(){
    m=$(this).index();

    if(m){index1++;}
    else index1--;
    if(index1>=len1)
    index1=index1%len1;
    if(index1<0)index1=len1-1;
    num1.eq(index1).fadeIn().siblings().fadeOut();
    number1.eq(index1).addClass('action').siblings().removeClass('action');
    // alert(index1);
  })
  var index2=0;
  var num2 = $(".showImage1 .wrap ul li");
  var number2=$(".showImage1 .wrrap ul li");
  var len2=num2.length;
  var n;
  number2.click(function(){
    xx=$(this).index();
    number2.eq(xx).addClass('action').siblings().removeClass('action');
    num2.eq(xx).fadeIn().siblings().fadeOut();
  })
  $(".btn8 span").click(function(){
    n=$(this).index();
    if(n){index2++;}
    else index2--;
    if(index2>=len2)
    index2=index2%len2;
    if(index2<0)index2=len2-1;
    num2.eq(index2).fadeIn().siblings().fadeOut();
    number2.eq(index2).addClass('action').siblings().removeClass('action');
    // alert(index2);
  })

  var index3=0;
  var number3=$(".showImage2 .wrrap ul li");
  var num3 = $(".showImage2 .wrap ul li");
  var len3=num3.length;
  var x;
  number3.click(function(){
    yy=$(this).index();
    number3.eq(yy).addClass('action').siblings().removeClass('action');
    num3.eq(yy).fadeIn().siblings().fadeOut();
  })
  $(".btn9 span").click(function(){
    x=$(this).index();
    if(x){index3++;}
    else index3--;
    if(index3>=len3)
    index3=index3%len3;
    if(index3<0)index3=len3-1;
    num3.eq(index3).fadeIn().siblings().fadeOut();
    number3.eq(index3).addClass('action').siblings().removeClass('action');
    // alert(index3);
  })


}
