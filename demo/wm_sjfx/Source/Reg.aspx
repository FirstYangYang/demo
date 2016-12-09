<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="Reg" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%= BLL.Sys.Config.getSiteConfig("在线注册", "", "")%>
    <uc:info ID="global1" runat="server" />
</head>
<body>
    <!-- head -->
    <uc:head ID="head1" runat="server" />
    <!--fullSlidea end-->
    <!-- content -->
    <div class="inner" style="margin-top: 20px;">
        <div class="content">
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="reg.aspx">在线注册</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="login ny_pd">
                        <form id="login_form" method="post">
                            <div class="but_tex">
                                <input id="mobile" name="mobile" type="text" class="tex tex1" placeholder="请输入手机号" />
                                <button class="xbut send_Msg" type="button">获取验证码</button>
                            </div>
                            <input id="CheckMsgCode" name="msgcode" type="text" class="tex tex3" placeholder="请输入手机验证码" />
                            <input id="password" name="password" type="password" class="tex tex2" placeholder="请输入密码" />
                            <input id="repassword" name="repassword" type="password" class="tex tex2" placeholder="确认密码" />
                            <div class="radbox radbox2" id="login_radbox">
                                <label for="" class="l1">
                                    &nbsp;<input type="checkbox" name="xieyi" />&nbsp;
                                 我已阅读并接受&nbsp;<a href="javascript:;" style="color: #666; text-decoration: underline;">平台协议</a>
                                </label>
                            </div>
                            <a id="reg_btn" href="javascript:;" class="xbut1 disable">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册
                            </a>
                        </form>
                        <script>
                            $("#login_radbox input[name=xieyi]").removeAttr("checked");
                            $("#login_radbox input[name=xieyi]").click(function () {
                                if ($(this).is(":checked"))
                                    $("#reg_btn").removeClass("disable");
                                else
                                    $("#reg_btn").addClass("disable");
                            });

                            var secs = 60;
                            $(".send_Msg").click(function () {
                                if ($(this).hasClass("Lock"))
                                    return false;

                                var mobile = $("#mobile").val();
                                var mobile_reg = /^(1+\d{10})$/;
                                if (!mobile_reg.test(mobile)) {
                                    layer.msg("请输入正确的手机号码！", 2);
                                    return false;
                                }

                                $.ajax({
                                    type: 'POST',
                                    url: '/ajax/MsgCode.aspx',
                                    data: 'type=reg&mobile=' + mobile,
                                    dataType: 'json',
                                    success: function (msg) {
                                        if (msg) {
                                            if (msg.status == "success") {
                                                $(".send_Msg").attr("disabled", true);
                                                for (i = 1; i <= secs; i++) {
                                                    window.setTimeout("update(" + i + ")", i * 1000);
                                                }
                                            }
                                            else
                                                layer.msg("请输入正确的手机号码！", 2);
                                        } else
                                            layer.msg("请求失败，请稍后重试！", 2);
                                    },
                                    error: function () {
                                        layer.msg("请求失败，请稍后重试！", 2);
                                    }
                                });
                            });

                            function update(num) {
                                if (num == secs) {
                                    $(".send_Msg").html("再次发送");
                                    $(".send_Msg").removeAttr("disabled");
                                    $(".send_Msg").attr("class", "xbut send_Msg");
                                }
                                else {
                                    var printnr = secs - num;
                                    $(".send_Msg").html("短信已发送" + printnr);
                                    $(".send_Msg").attr("class", "xbut send_Msg Lock");
                                }
                            }

                            $("#reg_btn").click(function () {
                                if ($(this).hasClass("disable")) {
                                    layer.msg("请阅读并接受注册协议！", 2);
                                    return false;
                                }
                                var currentVal = $("#mobile").val();
                                var reg = /^(1+\d{10})$/;
                                if (currentVal == "") {
                                    layer.msg("请输入手机号码！", 2);
                                    return false;
                                }
                                if (!reg.test(currentVal)) {
                                    layer.msg("请输入正确的手机号码！", 2);
                                    return false;
                                }
                                currentVal = $("#CheckMsgCode").val();
                                if (currentVal == "") {
                                    layer.msg("请填写手机验证码！", 2);
                                    return false;
                                }
                                currentVal = $("#password").val();
                                reg = /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;
                                if (currentVal == "") {
                                    layer.msg("请输入密码！", 2);
                                    return false;
                                }
                                if (!reg.test(currentVal)) {
                                    layer.msg("密码由6-22位英文、数字及标点符号组成！", 2);
                                    return false;
                                }
                                var currentVal2 = $("#repassword").val();
                                if (currentVal2 == "") {
                                    layer.msg("请输入确认密码！", 2);
                                    return false;
                                }
                                if (currentVal != currentVal2) {
                                    layer.msg("两次输入密码不一致！", 2);
                                    return false;
                                }
                                $.ajax({
                                    type: "POST",
                                    url: "ajax/AjaxInterface.aspx?action=reg",
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
                                                layer.msg(result.content, function () {
                                                    window.location = "User.aspx";
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
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <uc:foot ID="foot1" runat="server" />
</body>
</html>
