$(function(){ 
	$(".nTab dt span").click(function(){
		var i = $(".nTab dt span").index(this);
		$(".nTab dt span").removeClass("hover");
		$(this).addClass("hover");
		$(".nTab dd .none").hide();
		$(".nTab dd .none").eq(i).show();
	});

	$("#logout").click(function () {
	    $.ajax({
	        type: "POST",
	        url: "ajax/AjaxInterface.aspx?action=logout",
	        dataType: "json",
	        beforeSend: function () {
	            layer.load("正在退出，请稍后...");
	        },
	        success: function () {
	            layer.closeAll("loading");
	            if (result) {
	                if (result.status == "success") {
	                    layer.msg(result.content, function () {
	                        window.location = "/";
	                    });
	                } else {
	                    layer.msg(result.content);
	                }
	            } else {
	                layer.msg("网络错误！");
	            }
	        }
	    })
	})

	//$(window).scroll(function(){
	//	$("#header").addClass("h_mini");
	//	if($(window).scrollTop()==0){
	//		$("#header").removeClass("h_mini");
	//	}
	//});

	$(".picScroll-left1 li").click(function(){
		var _src = $(this).find("img").attr("src");
		$(".m_wrap5 .b_img img").attr("src",_src);
	});
	/*banner自适应屏幕*/
	//var w_img = window.screen.width
	//$(".slideBox .bd").find("img").width(w_img);
	/*banner自适应屏幕*/
	/*回顶部*/
	/*$("#totop").click(function() {
        $('body,html').animate({
            scrollTop : 0
        }, 500);
        return false;
    }); */
	/*回顶部*/
	/*$(window).scroll(function () {
		if($(window).scrollTop()>500){
			$("#totop").show();
		}else{
			$("#totop").hide();
		}
	});*/
});
/*setTimeout(function(){
alert(msg);
},1000);*/
//console.log()

function Nav(h) {
    var wz = jQuery(".nav li:not(.clear)");
    wz.find('a').removeClass("hover").eq(h - 1).addClass("hover");
}

function GoThis(a)
{
    location.href = a;
}