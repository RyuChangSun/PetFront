/**
 * Project : BODY CODI - Mobile
 * Date : 2017.03.31
 * Author : Sinjin Lim
 */


/*=======================================================================
 * Document Ready
 =======================================================================*/
$(function(){

    /* Top fix Area Set */
    topFix();

    $(".calendar_section").find(".call_calendar").click(function () {
        var $callBtn = $(this),
            $title = $("#temp_title"),
            $titleH = $title.outerHeight(true),
            $lesson = $(".lesson_info"),
            $lessonH = $lesson.outerHeight(true),
            $elH = $(".calendar_section").outerHeight(true);

        if ($callBtn.hasClass("active")){
            $(".ui-datepicker").css("top", $titleH + $lessonH + $elH);
            $("html, body").one("click", function () {
                $callBtn.removeClass("active");
            });
        }
        return false;
    });


    // Menu event
    $("#temp_title").filter(function(){
        $(this).find(".hamburger").click(function(){
            var $menu = $(this).next(),
                $speed = 300;
            if (!$(this).hasClass("active")){
                $(this).addClass("active");
                $menu.show().stop().animate({right : 0}, $speed);
                $("body").css("overflow", "hidden");
            } else {
                $(this).removeClass("active");
                $menu.stop().animate({right: "-100%"}, $speed, function(){
                    $(this).hide();
                    $("body").removeAttr("style");
                });
            }

            $("body").find(".dim").bind("click", function(){
                $("#temp_title").find(".hamburger").click();
            });

            return false;
        });
    });


    // Input Label Motion Effect
    $(".float_label").filter(function(){
        labelMotion($(this));

        $(this).focus(function(){
            var $label = $(this).prev();
            $label.addClass("floating");
        });

        $(this).keyup(function(){
            labelMotion($(this));
        });

        $(this).blur(function(){
            labelMotion($(this));
        });
    });



    // 참여 회원 수 영역 이벤트
    $(".total_count").filter(function(){
        var $this = $(this),
            $btn = $(this).find("> p:first-child"),
            $btnH = $btn.height(),
            $countH = $this.outerHeight(true);

        $(".mb_list").css("paddingBottom", $btnH);

        $btn.find("a").click(function(){
           if (!$this.hasClass("active")){
               $this.addClass("active");
               $(".mb_list").css("paddingBottom", $countH);
           } else {
               $this.removeClass("active");
               $(".mb_list").css("paddingBottom", $btnH);
           }

           return false;
        });
    });



    // 하단 고정 버튼 영역 이벤트
    $(".floating_btn").filter(function(){
        var $btnH = $(this).outerHeight(true);
        $(this).prev().css("paddingBottom", $btnH);
    });



    // Window Scroll Event
    var $conScTop = 0;

    $("body").on("click", ".page_top", function(){
        var $speed = 300;
        $("html, body").animate({scrollTop : 0}, $speed);
        return false;
    });

    $(window).scroll(function(){
        var $scTop = $(this).scrollTop();

        if ($scTop > 0){
            $(".lesson_info").addClass("active");
            /* Top fix Area Set */
            topFix();
        } else {
            $(".lesson_info").removeClass("active");
            /* Top fix Area Set */
            topFix();
        }

        if ($scTop > $conScTop || $scTop == 0){
            if ($("body").find(".page_top").size() > 0){
                $("body").find(".page_top").remove();
            }
        } else {
            if ($("body").find(".page_top").size() == 0){
                $("body").append("<p class='page_top'><a href='#'>TOP</a></p>")
            }
        }

        setTimeout(function(){
            $conScTop = $scTop;
        },200);
    });
});




/* Input Label Motion */
function labelMotion(obj){
    var $label = obj.prev();

    if (obj.val().length > 0){
        $label.addClass("floating");
    } else {
        $label.removeClass("floating");
    }
}


/* Top fix Area Set */
function topFix(){
    // 캘린더 Scroll Effect
    if ($("body").find(".lesson_info").size() > 0){
        $(".lesson_info").filter(function(){
            var $titleH = $("#temp_title").outerHeight(true),
                $elH = $(this).outerHeight(true);

            $(this).css("top", $titleH);

            if ($("body").find(".calendar_section").size() == 0){
                $(this).next().css("marginTop", $elH);
            }
        });
    }

    if ($("body").find(".calendar_section").size() > 0) {
        $(".calendar_section").filter(function () {
            var $title = $("#temp_title"),
                $titleH = $title.outerHeight(true),
                $lesson = $(".lesson_info"),
                $lessonH = $lesson.outerHeight(true),
                $elH = $(this).outerHeight(true);

            if ($("body").find($lesson).size() > 0) {
                $(this).css("top", $titleH + $lessonH);
                $(this).next().css("marginTop", $lessonH + $elH);
            } else {
                $(this).css("top", $titleH);
                $(this).next().css("marginTop", $elH);
            }

        });
    }
}


/*=======================================================================
 * Cell phone formatter
 =======================================================================*/
function phoneFomatter(str) {
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }

    if ($("body").find(".calendar_section").size() > 0) {
        $(".calendar_section").filter(function () {
            var $title = $("#temp_title"),
                $titleH = $title.outerHeight(true),
                $lesson = $(".lesson_info"),
                $lessonH = $lesson.outerHeight(true),
                $elH = $(this).outerHeight(true);

            if ($("body").find($lesson).size() > 0) {
                $(this).css("top", $titleH + $lessonH);
                $(this).next().css("marginTop", $lessonH + $elH);
            } else {
                $(this).css("top", $titleH);
                $(this).next().css("marginTop", $elH);
            }

        });
    }
}