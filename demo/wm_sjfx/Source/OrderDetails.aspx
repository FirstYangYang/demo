<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%= BLL.Sys.Config.getSiteConfig("订单明细", "", "")%>
    <uc:info ID="global1" runat="server" />
<link href="css/shopcart.css" rel="stylesheet" />
    <style>
        .goods_checkout{width:900px;}
        .mail table td{width:60px;}
        
#finalPrice {
    color: #e4393c;
    font-family: Verdana,Arial;
    font-size: 16px;
    font-weight: 400;
}

div.goods_checkout_content {
    color: #161a16;
    padding-top: 5px;
    width:980px;
}
div.goods_checkout_content td{line-height:4.1;}
    </style>
     <script type="text/javascript" src="js/Product_detail.js"></script>
</head>

<body>
    <!--头部-->
    <uc:head ID="head1" runat="server" />
    <!--头部-->
    <div class="space_hx">&nbsp;</div>
    <div class="inner" style="margin-top: 20px;">
        <div class="content">
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="Order.aspx">订单中心</a>
                >  <a href="#">订单明细</a>
           
                 </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="user clearfix">
                        <uc:left ID="left1" runat="server" nav="2-1" />
                        <div class="u_r">
                            <div class="user_m user_ma clearfix">
                                <div class="OrderDetail">
                    <div class="goods_checkout" >
                        <div class="containerTitle" style="width:907px;">
                            <span></span>
                        </div>
                        <div class="goods_checkout_content"  style="width:907px;">
                            <table width="100%" style="" border="0" class="ODetail_table" align="center" cellpadding="5" cellspacing="1">
                                <tbody>
                                    <tr align="center" style="background: #f0f0f0; color: #333;">
                                        <th style="height: 30px; " width="15%">图片
                                        </th>
                                        <th width="40%">名称
                                        </th>
                                        <th width="10%">价钱
                                        </th>
                                        <th width="10%">数量
                                        </th>
                                        <th width="15%">小计
                                        </th>
                                    </tr>
                                    <%
                                        DataRow drStatus = Com.Factory.getOrderBllInstance().getOrderStatusByCode(order.Status);
                                        foreach (DataRow dr in dtOrderDtl.Rows)
                                        {
                                    %>
                                    <tr style="background: #fff;">
                                        <td class="bord2" style="text-align:center; padding-top:15px;">
                                            <a href="showpro.aspx?id=<%=dr["proid"] %>" target="_blank">
                                                <img alt="<%= dr["Name"] %>" title="" src="upload/product/<%= Com.Util.getSplitStr(dr["pic"]) %>"
                                                    style="height: 90px" />
                                            </a>
                                        </td>
                                        <td class="bord2" align="left" style="text-align: center; padding-left: 15px;">
                                            <a href="showpro.aspx?id=<%=dr["proid"] %>" target="_blank">
                                                <%= dr["Name"] %> 
                                            </a>
                                        
                                        </td>
                                        <td class="bord2" style="text-align:center;">
                                            <%=dr["price"] %>
                                        </td>
                                        <td class="bord2" style="text-align:center;">
                                            <%=dr["quantity"] %>
                                        </td>
                                        <td class="bord2" style="text-align:center;">
                                            <b>
                                                <%=dr["amount"] %>
                                                        </b>
                                        </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="goods_checkout"  style="width:907px;">
                      
                     
                    </div>
                    <div class="goods_checkout"  style="width:907px;">
                        <div class="containerTitle"  style="width:907px;">
                            <span>你的留言</span>
                        </div>
                        <div class="goods_checkout_content"  style="width:907px;">
                            <%= order.Message %>
                        </div>
                    </div>
                    <div class="goods_checkout"  style="width:907px;">
                        <div class="containerTitle"  style="width:907px;">
                            <span>订单信息</span>
                        </div>
                        <div class="goods_checkout_content"  style="width:907px;">
                            <table width="100%" cellspacing="1" class="box">
                                <colgroup>
                                    <col width="65" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td class="title">订单编号：
                                        </td>
                                        <td>
                                            <span>
                                                <%= order.Code%></span>
                                            <input type="hidden" value="<%= order.Code %>" name="orderCode" id="orderCode" />
                                        </td>
                                    </tr>
                                 

                                    <tr>
                                        <td class="title">订单总额：
                                        </td>
                                        <td>
                                            <span>
                                                产品金额：<%=order.ProductFee %>，运费：<%=order.DeliverFee %>，合计：<span id="finalPrice">¥<%=order.Amount %></span></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="title">订单状态：
                                        </td>
                                        <td>
                                            <span>
                                                <%= drStatus["name"] %></span>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="title">收货地址：</td>
                                         <td>
                                            <span>
                                                <%= dtad.Rows[0]["CsgProv"] %> <%= dtad.Rows[0]["CsgCity"] %> <%= dtad.Rows[0]["CsgProv"] %> <%= dtad.Rows[0]["CsgCounty"] %> <%=dtad.Rows[0]["CsgAddress"] %></span>
                                             
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="title">收货人：</td>
                                        <td>
                                             <span><%= dtad.Rows[0]["CsgName"] %> 电话：<%= dtad.Rows[0]["CsgMobile"] %> <%= dtad.Rows[0]["CsgTel"]%></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="title">操作：
                                        </td>
                                        <td>
                                            <%
                                                if (order.Status == "0101" || order.Status == "0103")
                                                {
                                                   
                                            %>
                                          
                                            <input type="button" value="取消订单" class="btn btn-primary resetSize" onclick="cancel_order()" />
                                            <%
                                                    
                                                }
                                                else if (order.Status == Com.Const.orderState_sended_wait_submit)
                                                {
                                            %>
                                            <input type="button" class="btn btn-danger resetSize" id="btn_SubmitOrder" onclick="submitorder()"
                                                value="确认订单" />
                                            <%
                                                }
                                            %>
                                          
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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

