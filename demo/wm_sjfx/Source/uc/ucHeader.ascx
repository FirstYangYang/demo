<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucHeader.ascx.cs" Inherits="uc_ucHeader" %>


<div class="head">
    <div class="inner">
        <div class="logo">
            <img src="images/logo.png" />

        </div>
        <div class="navBar">
            <ul class="nav clearfix">
                <li class="m">
                    <h3><a href="/">网站首页</a></h3>
                </li>
                <li class="m">
                    <h3><a href="about.aspx">公司简介</a></h3>
                </li>
                <li class="m">
                    <h3><a href="product.aspx" id="cho1">产品介绍</a></h3>
                </li>
                <li class="m">
                    <h3><a href="yhgk.aspx" id="cho10">优惠顾客</a></h3>
                </li>
                <li class="m">
                    <h3><a href="whjx.aspx" id="cho3">无货经销</a></h3>
                    <ul class="sub" style="display: none;">
                    </ul>
                </li>
                <li class="m">
                    <h3><a href="sjfx.aspx" id="cho16">三级分销</a></h3>

                </li>

                <li class="m">
                    <h3><a href="contact.aspx" id="cho5">联系我们</a></h3>
                </li>
            </ul>
        </div>


        <script type="text/javascript">
            $(function () {
                var nav = $(".nav");
                var init = $(".nav .m").eq(ind);
                var block = $(".nav .block");
                block.css({
                    "left": init.position().left + 18
                });
                nav.hover(function () { },
                function () {
                    block.stop().animate({
                        "left": init.position().left + 18
                    },
                    100);
                });
                $(".nav").slide({
                    type: "menu",
                    titCell: ".m",
                    targetCell: ".sub",
                    delayTime: 300,
                    triggerTime: 0,
                    returnDefault: true,
                    defaultIndex: ind,
                    startFun: function (i, c, s, tit) {
                        block.stop().animate({
                            "left": tit.eq(i).position().left + 18
                        },
                        100);
                    }
                });
            });

            var ind = 0;
        </script>

        <script language="javascript" type="text/javascript">
            $(function () { $("#cho1").addClass("cho") })
        </script>

        <div class="tel">
            020-66340972
        </div>
        <div class="cnen">
            <%if (CurInfo.CurUser == null)
                { %>
            <a href="login.aspx">登陆</a> &nbsp; <a href="reg.aspx">注册</a>
            <%}
                else { %>
             <a href="user.aspx">个人中心</a>   <a href="shopcar.aspx">我的购物车</a> &nbsp; <a id="logout" href="javascript:;">退出</a>
            
            <%} %>
        </div>
        <div class="clear"></div>
    </div>
</div>
<script>
    $("#logout").click(function () {
        $.ajax({
            type: "POST",
            url: "ajax/AjaxInterface.aspx?action=logout",
            dataType: "json",
            beforeSend: function () {
                layer.load("正在退出，请稍后...");
            },
            success: function (result) {
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
</script>