$(document).ready(function($) {
    $('#login,#reg').click(function(){
        $('.theme-popover-mask').fadeIn(100);
        $('.tt').slideDown(200);
    });
    $("[type='button']").click(function(){
        $('.theme-popover-mask').fadeOut(100);
        $('.tt').slideUp(200);
    })

    $(window).scroll( function() {
        var height=$(this).scrollTop(); //获得滚动条距窗口顶部的高度
        $(".tt").css('margin-top',(height+80));
    });
})