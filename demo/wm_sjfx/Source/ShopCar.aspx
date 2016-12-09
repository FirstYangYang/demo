<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShopCar.aspx.cs" Inherits="ShopCar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%= BLL.Sys.Config.getSiteConfig("", "", "")%>
    <uc:info ID="global1" runat="server" />
    <script src="js/Product_detail.js"></script>
    <style>
         em{font-style:normal;}
    </style>
</head>

<body>
    <!--头部-->
    <uc:head ID="head1" runat="server" />
    <!--头部-->
    <div class="space_hx">&nbsp;</div>
    <div class="inner" style="margin-top: 20px;">
        <div class="content">
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="ShopCar.aspx">我的购物车</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="user clearfix">
                        <uc:left ID="left1" runat="server" nav="2" />
                        <div class="u_r">
                            <div class="user_m user_ma clearfix">
                                <div class="shopcar">
                                    <div class="car_m">
                                        <table cellpadding="0" cellspacing="0">
                                            <%
                                                if (cart.Values.Count > 0)
                                                {
                                                    foreach (BLL.ShoppingCart.Product pro in cart.Values.Values)
                                                    {
                                                        Bs_Products product = Com.Factory.getProBllInstance().getProById(pro.ProId);
                                            %>
                                            <tr>
                                                <td class="tu"><a href="showpro.aspx?id=<%=product.ID %>">
                                                    <img src="upload/product/<%=product.Pic%>" alt="" /></a></td>
                                                <td class="des">
                                                    <div class="title">品名：<%=product.Name %> (共<%= pro.Qty%>件)</div>
                                                    
                                                   
                                                </td>
                                                <td>
                                                    <%if(product.BS_ProKindCode=="01"){ %>
                                                    <div class="price">RMB:<em><%=product.Price*Convert.ToDecimal(0.8) %></em></div>
                                                    (首次购买享受八折优惠)
                                                    <%}else{ %>
                                                    <div class="price">RMB:<em><%=product.Price %></em></div>

                                                    <%} %>
                                                </td>
                                                <td><a href="javascript:;" onclick="javascript:delProInCart('<%= product.Code%>')">删除</a></td>
                                            </tr>
                                            <%}
                                            }
                                            else { %>
                                            <tr>
                                                <td colspan="4">
                                                    <div class="Tips">购物车为空 <a href="product.aspx" class="backCart">继续逛逛</a></div>
                                                     <div class="p3"></div>
                                                </td>
                                            </tr>
                                            <%} %>
                                        </table>
                                        <div class="s_order">
                                           
                                              <%
                        if (cart.Values.Count > 0)
                        {
                    %>
                                            <a href="javascript:clearShopCar()" class="ico">清空购物车</a> <span>已选：<b><%=cart.Values.Count %></b>件</span>
                                            <span>总计：<b><%=sumMoney.ToString("f2") %></b></span>
                                            <a href="checkout.aspx">立即下单</a>
                                            <%} %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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

