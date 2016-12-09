<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RePwd.aspx.cs" Inherits="RePwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%= BLL.Sys.Config.getSiteConfig("修改密码", "", "")%>
    <uc:info ID="global1" runat="server" />
</head>

<body>
    <!--头部-->
    <uc:head ID="head1" runat="server" />
    <!--头部-->
    <div class="space_hx">&nbsp;</div>
    <div class="inner" style="margin-top: 20px;">
        <div class="content">
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="RePwd.aspx">修改密码</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="user clearfix">
                        <uc:left ID="left1" runat="server" nav="3" />
                        <div class="u_r">
                            <div class="user_m clearfix">
                                <form id="login_form" method="post">
                                    <ul class="u_ml book">
                                        <li class="clearfix">
                                            <span class="title">当前登录密码：</span>
                                            <div class="li_m">
                                                <input id="o_pwd" name="o_pwd" type="password" value="" />
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <span class="title">新密码：</span>
                                            <div class="li_m">
                                                <input id="n_pwd" name="n_pwd" type="password" value="" />
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <span class="title">确认密码：</span>
                                            <div class="li_m">
                                                <input id="n_pwd2" name="n_pwd2" type="password" value="" />
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <span class="title">验证码：</span>
                                            <div class="li_m" style="position: relative;">
                                                <input id="checkcode" name="authcode" type="text" value="" />
                                                <img src="tools/verify_code.ashx" onclick="this.src='tools/verify_code.ashx?t='+Math.random()" style="cursor: pointer; width: 90px; height: 25px; position: absolute; right: 30px; top: 2px;" />
                                            </div>
                                        </li>
                                        <li class="btn">
                                            <input id="save" type="button" value="确 定" /></li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $("#save").click(function () {
                var reg = /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;
                var currentVal = $("#o_pwd").val();
                if (currentVal == "") {
                    layer.msg("请输入当前密码！");
                    return false;
                }
                if (!reg.test(currentVal)) {
                    layer.msg("当前密码格式不正确，密码由6-22位英文、数字及标点符号组成！");
                    layer.msg("", 2);
                    return false;
                }
                currentVal = $("#n_pwd").val();
                var currentVal2 = $("#n_pwd2").val();
                if (currentVal == "") {
                    layer.msg("请输入新密码！");
                    return false;
                }
                if (!reg.test(currentVal)) {
                    layer.msg("新密码格式不正确，密码由6-22位英文、数字及标点符号组成！");
                    return false;
                }
                if (currentVal != currentVal2) {
                    layer.msg("两次输入密码不一致！");
                    return false;
                }
                currentVal = $("#checkcode").val();
                if (currentVal == "") {
                    layer.msg("请填写验证码！");
                    return false;
                }
                $.ajax({
                    type: "POST",
                    url: "ajax/AjaxInterface.aspx?action=editor_pwd",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: $("#login_form").serialize(),
                    dataType: "json",
                    beforeSend: function () {
                        layer.load("正在修改，请稍后...");
                    },
                    success: function (result) {
                        layer.closeAll("loading");
                        if (result) {
                            if (result.status == "success") {
                                layer.msg(result.content, function () {
                                    window.location.reload();
                                });
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
    <div class="space_hx">&nbsp;</div>
    <!--底部-->
    <uc:foot ID="foot1" runat="server" />
    <!--底部-->
</body>
</html>

