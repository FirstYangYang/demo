<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucBanner.ascx.cs" Inherits="uc_ucBanner" %>



<div class="fullSlidea">
  <div class="bd">
    <ul>
       <li _src="url(images/1.jpg)" style="background:center 0 no-repeat;">
           <a href="" target="_blank" Title="1" > </a></li> 
        <li _src="url(images/2.jpg)"  style="background:center 0 no-repeat;">
            <a href="" target="_blank" Title="2" > </a></li> 
    </ul>
  </div>
  <div class="hd">
    <ul>
    </ul>
  </div>
  <span class="prev"></span> <span class="next"></span> </div>

<script type="text/javascript">
    $(".fullSlidea").hover(function () {
        $(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.5)
    },
    function () {
        $(this).find(".prev,.next").fadeOut()
    });
    $(".fullSlidea").slide({
        titCell: ".hd ul",
        mainCell: ".bd ul",
        effect: "fold",
        autoPlay: true,
        autoPage: true,
        trigger: "click",
        startFun: function (i) {
            var curLi = jQuery(".fullSlidea .bd li").eq(i);
            if (!!curLi.attr("_src")) {
              
                curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
            }
        }
    });
    $('.fullSlidea a').each(function () { if ($(this).attr('href') == "") $(this).css("cursor", "default"); });
    $('.fullSlidea a').click(function () { if ($(this).attr('href') == "") return false; });
</script>