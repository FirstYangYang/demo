<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderSubmit.aspx.cs" Inherits="OrderSubmit" %>


<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%= BLL.Sys.Config.getSiteConfig("购买成功", "", "")%>

    <uc:info ID="global1" runat="server" />

<link href="css/shopcart.css" rel="stylesheet" />
    <script src="js/Product_detail.js"></script>
    <style>
        .title {
            border-bottom: 1px solid #e6e6e6;
            height: 55px;
            line-height: 55px;
            font-size: 22px;
            color: #333333;
        }
        em i{font-style:normal;}
    </style>
</head>
<body>
<!-- head -->
    <uc:head ID="head1" runat="server" />
   

  
<%--        <uc:banner ID="banner1" runat="server" />--%>

<!--fullSlidea end--> 

 

<!-- content -->
<div class="inner" style="margin-top:20px;"><!-- <div class="lm">
<h2>产品中心<b>·</b></h2>
<ul>

</ul>
</div>
-->
  <div class="content"> <h2 class="cona">当前位置：<a href="index.htm" tppabs="/" title="首页">首页</a> >  <a href="checkout.aspx">结算</a> 

    </h2>
<div class="conb"> 

 	
	<div class="main-warp">
            <div class="layout">
               
                <div class="m_box f01">

                    <p class="p2">
                        订单号：<span class="red"><%= orderCode %></span><br>
                        您的应付款金额为: <span class="red">￥<%= pay %></span>
                    </p>
                    <p class="p3">
                        您的订单已经确认<br />
                        请尽快完成支付，祝您购物愉快！
                    </p>
                    <p class="p3">
                        * 您可以在“<a href="Order.aspx">订单管理</a>”中支付或取消您的订单，点击“<a id="btn_OpenPayWin" href="javascript:order_pay();">立刻支付</a>”完成在线支付步骤。
                    <input type="hidden" id="orderCode" value="<%= orderCode %>" />
                        <input id="payType" type="hidden" value="<%= order.Sy_PayCode %>" />
                    </p>
                    <div class="btn"><a href="javascript:order_pay();">
                        <img src="images/paynow.jpg"></a></div>
                </div>
                <div style="height: 60px;"></div>
            </div>
        </div>
 </div>
 </div>
  </div>
  <div class="clear"></div>
  

    <uc:foot ID="foot1" runat="server" />


 
</body>
</html>
