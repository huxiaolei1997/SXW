var u = navigator.userAgent,
app = navigator.appVersion;
var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //android终端或者uc浏览器
var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
if (isAndroid || isiOS) {
    $('#fix-box1').hide();
    $('#fix-box1 a').hide();
    $('.iosSlider_nav').hide();

}
 else {
    $(function() {
        //返回顶部
        $(window).scroll(function() {
            if ($(window).scrollTop() > $(window).height()) {
                $("#fix-box1 #totop1").css("display", "block");
            } else {
                $("#fix-box1 #totop1").css("display", "none");
            }
        });
        $("a#totop1").click(function() {
            $('body,html').animate({
                scrollTop: 0
            },
            500);
            return false;
        });
    })
}

$(document).ready(function() {
    $("#show-order").click(function() {
        $(".top-myorder").toggle();
    })
    getheight();
    $("#show_weibo").click(function() {
        $("#show_weibo .weixin").toggle();
        $("#show_weixin .weixin").hide();
    })
    $("#show_weixin").click(function() {
        $("#show_weixin .weixin").toggle();
        $("#show_weibo .weixin").hide();
    })
     $(".iosSlider_nav").hide();
    

});

$(window).resize(function() {
    getheight();
});

function getheight() {
    var outwidth = $(window).width();
    var outheight = $(window).height();

    if (outwidth < 780) {
        $(".top-right").hide();
        $(".nav-top").hide();
       
        $("#fix-box1 a").hide();
        $(".mobile-menu").show();

        $(".timebox").hide();
        $(".fun-from .btn").css({'position':'fixed','left':'0','bottom':'0'});
        $(".fun-from .btn").click(function(){
            $(".timebox").css({'position':'fixed','left':'10%','top':'10%','width':'80%'});
            $(".timebox").show();
            $(".ui-mask").show();
        })
    } else {
        $(".top-right").show();
        $(".nav-top").show();
        $(".mobile-menu").hide();
    }

    $(".menu-nav").click(function() {
        $(".mobile-menu ul").toggle();
        $(this).toggleClass("open");
    }); 
    $(".close").bind("click",function(){
        $(".sweep-login").hide(500);
    })
    $("#weixin-login").click(function(){
       $(this).toggleClass("showimg");
       $(".login-box").toggle();
       $(".show-weixin-box").toggle();
    })

    var contenter_h = $(window).height() - $('.header').height() - $('.footer').height();
    var contenter_h2 = $(window).height() - $('.pay-header').height() - $('.pay-footer').height()-140;
    var hwx=$(window).height()-50;
    $('.contenter').css('min-height', contenter_h);
    $('.container').css('min-height', contenter_h);
    $('.wx').css('min-height', hwx);
    $('.weixin-box').css('min-height', contenter_h2);

    var map_h=outheight*0.8;
    var map_w=outwidth*0.8;
    $('.ui-mask').hide();
    $('.ui-mask').css('z-index','1');
    var cli_num=0;
    $("#fullscreen").click( function(){
       if(cli_num%2==0){         
        
        $("#scorll2").css({"width":map_w,'height':map_h,"position":"fixed",'top':'10%','left':'10%','z-index':'1100'});
        $("#fullscreen img").attr('src','tpl/default//xxfimg/closescreen.png');
        $(this).attr('title','取消全屏');
        $('.ui-mask').show();
        
        }
        else{

            $("#scorll2").css({'height':'450px','width':'100%',"position":"relative",'top':'0','left':'0','z-index':'100'});
            $("#fullscreen img").attr('src','tpl/default//xxfimg/fullscreen.png');
            $(this).attr('title','全屏显示');
            $('.ui-mask').hide();

        }
        cli_num++;
    })




}
/*倒计时*/
 function lxfEndtime(){
 $(".lxftime").each(function(){
     var endtime = new Date($(this).attr("endtime")).getTime();
  //取结束日期(毫秒值)
  var nowtime =  new Date().getTime();
  //今天的日期(毫秒值)
  var youtime = endtime-nowtime;//还有多久(毫秒值)
  var seconds = youtime/1000;
  var minutes = Math.floor(seconds/60);
  var hours = Math.floor(minutes/60);
  var days = Math.floor(hours/24);
  var CDay= days ;
  var CHour= hours % 24;
  var CMinute= minutes % 60;
  var CSecond= Math.floor(seconds%60);
   $(this).html("<span>"+days+"</span><em>天</em><span>"+CHour+"</span><em>时</em><span>"+CMinute+"</span><em>分</em><span>"+CSecond+"</span><em>秒</em>");
 });
 setTimeout("lxfEndtime()",1000);
 };
 $(function(){
 lxfEndtime();
});