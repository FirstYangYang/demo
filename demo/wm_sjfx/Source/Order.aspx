<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%= BLL.Sys.Config.getSiteConfig("订单中心", "", "")%>
    <uc:info ID="global1" runat="server" />
</head>

<body>
    <!--头部-->
    <uc:head ID="head1" runat="server" />
    <!--头部-->
    <div class="space_hx">&nbsp;</div>
    <div class="inner" style="margin-top: 20px;">
        <div class="content">
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="Order.aspx">订单中心</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="user clearfix">
                        <uc:left ID="left1" runat="server" nav="2-1" />
                        <div class="u_r">
                            <div class="user_m user_ma clearfix">
                                <div>
                                    <div class="orderManagement">
                                        <div class="tableHeader mb10">
                                            <table width="100%">
                                                <thead>
                                                    <tr>
                                                        <th width="250">商品信息</th>
                                                        <th width="91">单价</th>
                                                        <th width="91">数量</th>
                                                        <th width="91">状态</th>
                                                        <th width="119">实付金额</th>
                                                        <th width="119">收货人</th>
                                                        <th width="120">操作</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="select-page nomarg clearfix" style="padding: 0 20px;">
                                            <div class="form-horizontal fl">
                                                <div class="mar forced" style="display:none">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" id="selAll" class="allselect">全选</label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input type="button" class="btn btn-primary resetSize" value="批量备注" onclick="RemarkOrderFun('0', '', '', '', '')">
                                                            <input type="submit" name="ctl00$ContentPlaceHolder1$btnDeleteCheck" value="批量删除" onclick="return HiConform('<strong>订单删除后将进入订单回收站！</strong><p>确定要批量删除所选择的订单吗？</p>', this);" id="ctl00_ContentPlaceHolder1_btnDeleteCheck" class="btn btn-danger resetSize">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="orderManagementList orderManagementListOther" style="padding: 0 10px;">
                                        <ul>
                                            <%foreach(DataRow dr in dt.Rows){ %>
                                            <li>
                                                <div class="listTitle">
                                                    <label>
                                                        <input name="CheckBoxGroup" type="checkbox" value="<%=dr["code"] %>">
                                                        订单编号：<%=dr["code"] %></label>&nbsp;<span><%=dr["addtime"] %></span>
                                                      
                                                    <span class="ml10 logistics"></span>
                                                    <div style="float: right; padding-right: 10px; width: 26px;" data-toggle="tooltip" data-placement="left" title="" onclick="RemarkOrderFun('161113064414675','2016-11-13 6:44:14','229.8000','','')" data-original-title="">
                                                        <span class="glyphicon glyphicon-flag help" style="color: #ababab"></span>
                                                    </div>
                                                </div>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td width="550">
                                                                <div class="listInfoLeft">

                                                                    <div class="orderInfolist clearfix">
                                                                        <div class="orderImg fl clearfix">
                                                                            <div class="img fl">
                                                                                <img src="upload/product/<%=dr["pic"] %>" style="height: 60px; width: 60px; border-width: 0px;">
                                                                            </div>
                                                                            <div class="imgInfo fl">
                                                                                <p class="setColor"><a href="showpro.aspx?Id=<%=dr["id"] %>" target="_blank"><%=dr["name"] %></a></p>
                                                                                <p></p>
                                                                            </div>
                                                                        </div>
                                                                        <p class="fl orderP">￥<%=dr["price"] %></p>
                                                                        <p class="fl orderP"><%=dr["Quantity"] %></p>
                                                                        <p class="fl orderP ">

                                                                            <% string cls = "";
                                       foreach (DataRow dr2 in status.Select("code ='" + dr["status"].ToString() + "'"))
                                       {
                                           if (dr2["name"].ToString() == "支付成功")
                                           {
                                               cls = "red";

                                           }
                                           if (dr2["name"].ToString() == "已发货待发货")
                                           {
                                               cls = "Green";

                                           }
                                    %>

                                    <%if (dr2["code"] != "0109")
                                      { %>
                                    <span class="<%=cls %>"><%=dr2["Name"] %></span>

                                    <%} %>
                                    <%
                                    
                                      } %>
                                                                            <%if (dr["payno"].ToString() != "")
                                      {%>
                                    已支付
                                   <%-- <%=dr["payno"].ToString() %>--%>
                                    <%}
                                      else
                                      { %>
                                                未支付
                                                <%} %>

                                                                        </p>
                                                                    </div>

                                                                </div>
                                                            </td>
                                                            <td width="400">
                                                                <div class="listInfoRight clearfix">
                                                                    <div class="paymentAmount fl">
                                                                        <p>
                                                                            <strong>￥<%=dr["amount"] %></strong>
                                                                        </p>
                                                                    </div>
                                                                    <div class="username fl">
                                                                        <p>
                                                                            <%=dr["CsgName"] %><br><%=dr["CsgMobile"] %> <%=dr["CsgTel"] %>
                                                                        </p>
                                                                        <span data-toggle="tooltip" title="" style="display: none" data-original-title="">
                                                                            <img src="../images/xi.gif" border="0"></span>
                                                                    </div>
                                                                    <div class="operation fr">
                                                                        <a href="OrderDetails.aspx?OrderId=<%=dr["code"] %>" target="_blank" class="btn btn-info resetSize inputw100 btnvieworders bl mb5">查看详情</a>
                                                                       
                                                                         <%if (dr["payno"].ToString().Length > 0)
                                      {
                                          if (dr["status"].ToString() == Com.Const.orderState_sended_wait_submit)
                                          { %>
                                    <input type="button" class="btn btn-primary resetSize" id="btn_SubmitOrder" onclick="submitorder('<%=dr["code"].ToString()%> ')"
                                        value="确认订单" />
                                    <%}
                                      else
                                      { %>
                                    <span>已支付</span>
                                    <%}
                                  }
                                      else
                                      {
                                          if (dr["status"].ToString() == "0101")
                                          {
                                    %>
                                                                       <div style="height:10px;"></div>
                                    <a class="btn btn-danger resetSize" target="_blank" href="pay/paystart.aspx?code=<%=dr["sy_payCode"].ToString()%>&type=OD&num=<%=dr["code"].ToString()%>">
                                       在线支付</a>
                                    <%}
                                  } %>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </li>
                                            <%} %>



                                        </ul>
                                        <div class="page">
                        <%if (dt != null && dt.Rows.Count > 0)
                          {%>
                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="true" PageSize="6"
                            CssClass="paginator" CurrentPageButtonClass="cpb" LastPageText=">" FirstPageText="<"
                            PrevPageText="上一页" NextPageText="下一页" UrlPaging="true" NumericButtonTextFormatString="{0}" ShowFirstLast="false"
                            LayoutType="Table" HorizontalAlign="Center">
                        </webdiyer:AspNetPager>
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

