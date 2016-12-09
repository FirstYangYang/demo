<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucLeft.ascx.cs" Inherits="uc_ucLeft" %>

<div class="u_l">
    <div class="u_lb">
        <div class="box_h"><span>个人中心</span></div>
        <div class="box_m">
            <ul>
                <li class="<%=nav=="1"?"now":"" %>"><a href="user.aspx">用户信息</a></li>
                <li class="<%=nav=="2"?"now":"" %>"><a href="shopcar.aspx">我的购物车</a></li>
                <li class="<%=nav=="3"?"now":"" %>"><a href="repwd.aspx">修改密码</a></li>
                <li class="<%=nav=="4"?"now":"" %>"><a href="address.aspx">收货地址</a></li>
            </ul>
        </div>
        <div class="box_h"><span>销售中心</span></div>
        <div class="box_m">
            <ul>
                <li class="<%=nav=="2-1"?"now":"" %>"><a href="Order.aspx">订单中心</a></li>
                <li class="<%=nav=="2-2"?"now":"" %>"><a href="MyMember.aspx">我的下线</a></li>
                <li class="<%=nav=="2-3"?"now":"" %>"><a href="MyCommission.aspx">我的佣金</a></li>
            </ul>
        </div>
    </div>
</div>
