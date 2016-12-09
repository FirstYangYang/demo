<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%= BLL.Sys.Config.getSiteConfig("", "", "")%>
    <uc:info ID="global1" runat="server" />
</head>

<body>
    <!--头部-->
    <uc:head ID="head1" runat="server" />
    <!--头部-->
    <div class="space_hx">&nbsp;</div>
    <div class="inner" style="margin-top: 20px;">
        <div class="content">
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="user.aspx">用户信息</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="user clearfix">
                        <uc:left ID="left1" runat="server" nav="1" />
                        <div class="u_r">
                            <div class="r_name">个人资料</div>
                            <div class="user_m clearfix">
                                <form id="login_form" method="post">
                                    <ul class="u_ml">
                                        <li class="clearfix">
                                            <span class="title"><i>*</i>&nbsp;&nbsp;姓名：</span>
                                            <div class="li_m">
                                                <input id="name" name="name" type="text" value="<%=CurInfo.CurUser!=null?CurInfo.CurUser.RealName:"" %>" />
                                            </div>
                                        </li>
                                        <li class="clearfix sex">
                                            <span class="title">性 别：</span>
                                            <div class="li_m">
                                                <input name="sex" type="radio" value="0" <%=CurInfo.CurUser!=null&&CurInfo.CurUser.Sex=="0"?"checked":"" %> />
                                                <span>
                                                    <label for="s1">保密</label></span>
                                                <input name="sex" type="radio" value="1" <%=CurInfo.CurUser!=null&&CurInfo.CurUser.Sex=="1"?"checked":"" %> />
                                                <span>
                                                    <label for="s2">男</label></span>
                                                <input name="sex" type="radio" value="2" <%=CurInfo.CurUser!=null&&CurInfo.CurUser.Sex=="2"?"checked":"" %> />
                                                <span>
                                                    <label for="s3">女</label></span>
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <span class="title">手 机：</span>
                                            <div class="li_m">
                                                <%=CurInfo.CurUser!=null?CurInfo.CurUser.Mobile:"***" %>
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <span class="title">邮箱：</span>
                                            <div class="li_m">
                                                <input name="email" type="text" value="<%=CurInfo.CurUser!=null?CurInfo.CurUser.EMail:"" %>" />
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <span class="title">联系地址：</span>
                                            <div class="li_m">
                                                <textarea name="address"><%=CurInfo.CurUser!=null?CurInfo.CurUser.Address:"" %></textarea>
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
                var currentVal = $("#name").val();
                if (currentVal == "") {
                    layer.msg("姓名不能为空！");
                    return false;
                }
                currentVal = $("#checkcode").val();
                if (currentVal == "") {
                    layer.msg("请填写验证码！");
                    return false;
                }
                $.ajax({
                    type: "POST",
                    url: "ajax/AjaxInterface.aspx?action=editor_info",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: $("#login_form").serialize(),
                    dataType: "json",
                    beforeSend: function () {
                        layer.load("正在保存，请稍后...");
                    },
                    success: function (result) {
                        layer.closeAll("loading");
                        if (result) {
                            if (result.status == "success") {
                                layer.msg(result.content,function () {
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
    <div class="space_hx">&nbsp;</div>
    <!--底部-->
    <uc:foot ID="foot1" runat="server" />
    <!--底部-->
</body>
</html>
