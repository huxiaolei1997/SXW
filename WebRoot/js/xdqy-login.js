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
        var height=$(this).scrollTop(); //��ù������ര�ڶ����ĸ߶�
        $(".tt").css('margin-top',(height+80));
    });
})