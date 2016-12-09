<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Book.aspx.cs" Inherits="Book" %>

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
<div class="scd">
	<div class="pst">
    	<span>您现在的位置：</span>
        <a href="/">首页></a>
        <a href="User.aspx">会员中心</a>
    </div>
    <div class="user clearfix">
    	<uc:left ID="left1" runat="server" />
        <div class="u_r">
            <div class="user_m clearfix">
            	<ul class="u_ml book">
                	<li class="clearfix sex">
                    	<span class="title">留言类型：</span>
                        <div class="li_m">
                        	<input name="ly" type="radio" value="" id="s1" checked>
                            <span><label for="s1">留言</label></span>
                            <input name="ly" type="radio" value="" id="s2">
                            <span><label for="s2">投诉</label></span>
                            <input name="ly" type="radio" value="" id="s3">
                            <span><label for="s3">售后</label></span>
                            <input name="ly" type="radio" value="" id="s4">
                            <span><label for="s4">求购</label></span>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">标题：</span>
                        <div class="li_m">
                        	<input name="" type="text"><i>*</i>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">联系人：</span>
                        <div class="li_m">
                        	<input name="" type="text"><i>*</i>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">E-mail：</span>
                        <div class="li_m">
                        	<input name="" type="text"><i>*</i>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">单位名称：</span>
                        <div class="li_m">
                        	<input name="" type="text">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">主页：</span>
                        <div class="li_m">
                        	<input name="" type="text">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">电话：</span>
                        <div class="li_m">
                        	<input name="" type="text">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">传真：</span>
                        <div class="li_m">
                        	<input name="" type="text">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">内容：</span>
                        <div class="li_m">
                        	<textarea name="" cols="" rows=""></textarea>
                            <i>*</i>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">&nbsp;</span>
                        <div class="li_m">
                        	<i class="f14">注：带*为必填项！</i>
                        </div>
                    </li>
                    <li class="btn"><input name="" type="submit" value="提交"></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="space_hx">&nbsp;</div>
<!--底部-->
<uc:foot ID="foot1" runat="server" />
<!--底部-->
</body>
</html>

