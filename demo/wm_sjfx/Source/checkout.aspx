<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%= BLL.Sys.Config.getSiteConfig("结算", "", "")%>

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
        .pay li{width:160px;}
       .pay .on{border:1px solid #2a6496;}
        em {font-style:normal;}
        i{font-style:normal;}
    </style>
    <script>
        $(function () {
            $("input[name=address]:eq(0)").attr("checked",'checked');
        });
    </script>
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
                <div class="bg">


                    <div class="Container m">
                        <div class="lineheight"></div>

                        <div class="bord">
                            <form id="frmList" name="frmList" method="post" action="CheckOut.aspx?do=submit" onsubmit="return CheckForm()" runat="server">


                                <div class="goods_checkout">
                                    <p class="title">请选择支付方式<em>支持银联支付</em></p>
                                    <div class="goods_checkout_content">

                                        <div class="zxf" style="width: 960px;">
                                            <ul class="pay clearfix" style="margin-bottom: 10px; padding-top: 10px;">
                                                <%--<li class="on" zcode="01">
                                                    <a href="javascript:void(0)">
                                                        <img src="images/PayPal_std.png" alt="" />
                                                    </a></li>--%>
                                                <li zcode="02" class="on"><a href="javascript:void(0)">
                                                    <img src="images/pic_42.png" alt="" />
                                                </a></li>
                                                <%--<li zcode="03">
                                                    <a href="javascript:void(0)">
                                                        <img src="images/pic_40.png" alt="" />
                                                    </a></li>
                                                <li zcode="04"><a hhref="javascript:void(0)">
                                                    <img src="images/pic_41.png" alt="" />
                                                </a></li>
                                                --%>
                                            </ul>

                                            <input class="payType" name="payType" id="payType" type="hidden" value="02" />
                                        </div>
                                    </div>
                                </div>
                                <div class="goods_checkout">

                                    <div class="containerTitle">
                                        <span>收货地址</span>
                                        <%if(dt.Rows.Count>0){ %>
                                        <ul>
                                            <%foreach(DataRow dr in dt.Rows){ %>
                                            <li style="color:#333;font-family:'Microsoft YaHei';font-weight:normal;">
                                               <input type="radio" name="address"  value="<%=dr["id"] %>" /> <%=dr["csgname"] %> <%=dr["CsgTel"] %>  <%=dr["CsgMobile"] %>  <%=dr["CsgProv"] %> <%=dr["CsgCity"] %>  <%=dr["CsgCounty"] %>    <%=dr["CsgAddress"] %>
                                                <%if(dr["Ischeck"].ToString()=="1"){ %>
                                               <span style="color:red;"> 默认地址</span>
                                                <%} %>
                                            </li>
                                            <%} %>
                                        </ul> 
                                        <%}else{ %>
                                       <a style="color:red" href="Address.aspx">暂时没有收货地址，马上去添加吧！</a>
                                        <%} %>
                                    </div>
                                
                                    <div class="containerTitle">
                                        <span>配送方式</span>
                                        <%if(dt.Rows.Count>0){ %>
                                        <ul>
                                            <%foreach (DataRow dr in dtliverType.Rows)
                                              { %>
                                            <li style="color:#333">
                                               <input type="radio" name="deliverType" checked="checked"  value="<%=dr["code"] %>" /> <%=dr["name"] %> 邮费：￥<%=dr["Amount"] %>
                                            </li>
                                            <%} %>
                                        </ul> 
                                        <%}else{ %>
                                       <a style="color:red" href="Address.aspx">暂时没有收货地址，马上去添加吧！</a>
                                        <%} %>
                                    </div>
                                </div>

                                <div class="goods_checkout">
                                    <div class="containerTitle" style="background: none;">
                                        <span>客户留言</span>
                                    </div>
                                    <textarea id="txtNotes" name="txtNotes" class="txt" maxlength="200" style="width: 960px; height: 80px;"></textarea><br />
                                    <font color="gray">200个字符内</font>
                                </div>
                                <div class="blank4"></div>
                                <div class="m_box1">
                                    <table cellpadding="0" cellspacing="0" class="table">
                                        <tr>
                                            <td class="bg1" width="520">商品</td>

                                            <td class="bg1">数量</td>
                                            <td class="bg1">价格</td>
                                            <td class="bg1">小计</td>
                                        </tr>
                                        <%
                                            int recordcount = 0;
                                            decimal totalpay = 0;

                                            if (cart.Values.Count > 0)
                                            {
                                                foreach (BLL.ShoppingCart.Product pro in cart.Values.Values)
                                                {
                                                    string[] photos = pro.Pic.Split(Com.Const.cutProPre);
                                                    string pic = "";
                                                    if (photos.Length > 0)
                                                    {
                                                        pic = photos[0];
                                                    }
                                                    
                                                    totalpay += pro.Pay;

                                                    recordcount += pro.Qty;
                                                    decimal proSum = pro.Qty * pro.Price;
                                        
                                        %>
                                        <tr>
                                            <td>
                                                <div class="box">
                                                    <div class="img"><a href="showpro.aspx?id=<%= pro.ProId%>" target="_blank">
                                                        <img src="upload/<%= pic%>" width="96"></a></div>
                                                    <div class="con"><a href="showpro.aspx?id=<%= pro.ProId%>" target="_blank"><%=pro.Name%></a></div>
                                                    <div class="clear"></div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="box1"><%= pro.Qty%></div>
                                            </td>
                                            <td><span><%=pro.Price.ToString("f1") %></span></td>
                                            <td><span><%=proSum.ToString("f1") %></span></td>
                                        </tr>
                                        <%}
                                }
                                else
                                {
                                        %>
                                        <tr>
                                            <td style="text-align: center" colspan="5">购物车暂无商品！</td>
                                        </tr>
                                        <%} %>
                                    </table>
                                    <div class="blank"></div>
                                    <script type="text/javascript">
                                        var usableScore=<%=usableScore%>;
                                        var totalpay="<%=(totalpay).ToString("f1")%>";
                                    </script>
                                    <%
                                        if (cart.Values.Count > 0)
                                        {
                                    %>
                                    <div class="p1"><span><i><%= recordcount%></i>件商品</span></div>
                                    <div class="p2">
                                        <div class="totalpay">订单总金额(商品总额)：<i id="proFee" val="<%=totalpay.ToString("f1") %>">
                                            <span id="proFeeall"><%=totalpay.ToString("f1") %>
                                           + 运费：42.0=<%=totalpay+42 %></span>
                                            <span style="display: none" id="totalPay"><%=totalpay.ToString("f1") %></span></i>

                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                                <div class="goods_checkout" style="padding-top: 20px">
                                    <input type="submit" class="bgBtn" value=" " />
                                    <a type="button" class="backCart" href="ShopCar.aspx">返回购物车</a>
                                </div>
                            </form>
                        </div>
                        <div class="clear" style="height: 10px">
                        </div>
                    </div>
                    <div style="height: 50px;"></div>
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
