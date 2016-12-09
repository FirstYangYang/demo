<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%= BLL.Sys.Config.getSiteConfig("在线登录", "", "")%>
    <uc:info ID="global1" runat="server" />
</head>
<body>
    <!-- head -->
    <uc:head ID="head1" runat="server" />
    <!--fullSlidea end-->
    <!-- content -->
    <div class="inner" style="margin-top: 20px;">
        <div class="content">
            <h2 class="cona">当前位置：<a href="index.htm" title="首页">首页</a> >  <a href="login.aspx">在线登录</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="login ny_pd">
                        <form id="login_form" method="post">
                            <input id="mobile" name="mobile" type="text" class="tex tex1" placeholder="请输入手机号" />
                            <input id="password" name="password" type="password" class="tex tex2" placeholder="请输入密码" maxlength="16" />
                            <div style="position: relative;">
                                <input id="checkcode" name="checkcode" type="text" class="tex tex4" placeholder="请输入验证码" maxlength="4" />
                                <img src="tools/verify_code.ashx" onclick="this.src='tools/verify_code.ashx?t='+Math.random()" style="cursor: pointer; width: 100px; height: 30px; position: absolute; right: 10px; top: 5px;" />
                            </div>
                        </form>
                        <a id="login_btn" href="javascript:;" class="xbut1">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
                        <div class="line_box">
                            <a class="r" href="#">找回密码？</a>
                            <a class="r" href="Reg.aspx">注册</a>
                        </div>
                        <script>
                            $("#login_radbox label").click(function () {
                                $(this).addClass("on").siblings().removeClass("on");
                                $("#login_radbox input[name='UserType']").val($(this).attr("val"));
                            })

                            $("#login_btn").click(function () {
                                var currentVal = $("#mobile").val();
                                var reg = /^(1+\d{10})$/;
                                if (currentVal == "") {
                                    layer.msg("请输入手机号码！");
                                    return false;
                                }
                                if (!reg.test(currentVal)) {
                                    layer.msg("请输入正确的手机号码！");
                                    return false;
                                }
                                currentVal = $("#password").val();
                                if (currentVal == "") {
                                    layer.msg("请填写登陆密码！");
                                    return false;
                                }
                                currentVal = $("#checkcode").val();
                                if (currentVal == "") {
                                    layer.msg("请填写验证码！");
                                    return false;
                                }
                                $.ajax({
                                    type: "POST",
                                    url: "ajax/AjaxInterface.aspx?action=log",
                                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                    data: $("#login_form").serialize(),
                                    dataType: "json",
                                    beforeSend: function () {
                                        layer.load("正在登陆，请稍后...");
                                    },
                                    success: function (result) {
                                        layer.closeAll("loading");
                                        if (result) {
                                            if (result.status == "success") {
                                                window.location = "User.aspx";
                                            } else {
                                                layer.msg(result.content);
                                            }
                                        } else {
                                            layer.msg("网络错误！");
                                        }
                                    }
                                });
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <uc:foot ID="foot1" runat="server" />
</body>
</html>
