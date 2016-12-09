<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyCommission.aspx.cs" Inherits="MyCommission" %>

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
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="MyCommission.aspx">我的佣金</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="user clearfix">
                        <uc:left ID="left1" runat="server" nav="2-3" />
                        <div class="u_r">
                             <div class="r_name">佣金明细</div>
                            <div class="user_m user_ma clearfix">
                                <div class="app-inner clearfix" style="padding:20px 10px;">
                                    <form name="aspnetForm" method="post" action="CommissionsAllList.aspx" id="aspnetForm">
                                        <!--数据列表-->
                                        <div>
                                            <table class="table table-hover mar table-bordered" style="table-layout: fixed">
                                                <thead>
                                                    <tr>
                                                        <th width="120">流水号</th>
                                                        <th width="100">买家昵称</th>
                                                        <th width="120">时间</th>
                                                        <th width="100">类型</th>
                                                        <th width="100">分佣店铺</th>
                                                        <th width="100">佣金</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <tr class="td_bg">
                                                        <td style="border-width: 1px 1px 0px;">&nbsp;<a href="/Admin/trade/OrderDetails.aspx?OrderId=161015185902739" target="_blank">161015185902739</a></td>
                                                        <td style="border-width: 1px 1px 0px;">&nbsp;宋爽</td>
                                                        <td width="200" style="border-width: 1px 1px 0px;">&nbsp;2016-10-16 11:11:11</td>
                                                        <td>&nbsp;成交店铺</td>
                                                        <td>&nbsp;千米科技旗舰店</td>
                                                        <td>&nbsp;￥177.30</td>

                                                    </tr>


                                                    <tr class="td_bg">
                                                        <td style="border-width: 1px 1px 0px;">&nbsp;<a href="/Admin/trade/OrderDetails.aspx?OrderId=160713193441725" target="_blank">160713193441725</a></td>
                                                        <td style="border-width: 1px 1px 0px;">&nbsp;13538824324</td>
                                                        <td width="200" style="border-width: 1px 1px 0px;">&nbsp;2016-08-08 15:00:05</td>
                                                        <td>&nbsp;成交店铺</td>
                                                        <td>&nbsp;太投入</td>
                                                        <td>&nbsp;￥96.30</td>

                                                    </tr>

                                                    <tr class="td_bg">
                                                        <td style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td width="200" style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td>&nbsp;上一级分销商</td>
                                                        <td>&nbsp;使法国</td>
                                                        <td>&nbsp;￥64.20</td>

                                                    </tr>

                                                    <tr class="td_bg">
                                                        <td style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td width="200" style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td>&nbsp;原上级店铺</td>
                                                        <td>&nbsp;iu</td>
                                                        <td>&nbsp;￥32.10</td>

                                                    </tr>


                                                    <tr class="td_bg">
                                                        <td style="border-width: 1px 1px 0px;">&nbsp;<a href="/Admin/trade/OrderDetails.aspx?OrderId=160717143954419" target="_blank">160717143954419</a></td>
                                                        <td style="border-width: 1px 1px 0px;">&nbsp;13538824324</td>
                                                        <td width="200" style="border-width: 1px 1px 0px;">&nbsp;2016-08-07 16:00:05</td>
                                                        <td>&nbsp;成交店铺</td>
                                                        <td>&nbsp;太投入</td>
                                                        <td>&nbsp;￥59.10</td>

                                                    </tr>

                                                    <tr class="td_bg">
                                                        <td style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td width="200" style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td>&nbsp;上一级分销商</td>
                                                        <td>&nbsp;使法国</td>
                                                        <td>&nbsp;￥39.40</td>

                                                    </tr>

                                                    <tr class="td_bg">
                                                        <td style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td width="200" style="border-width: 0px 1px 0px 0px;"></td>
                                                        <td>&nbsp;原上级店铺</td>
                                                        <td>&nbsp;iu</td>
                                                        <td>&nbsp;￥19.70</td>

                                                    </tr>


                                                </tbody>
                                            </table>
                                        </div>


                                        <!--数据列表底部功能区域-->
                                        <br>
                                        <div class="select-page clearfix">
                                            <div class="form-horizontal fl">
                                                &nbsp;佣金总额：￥500.10
                                            </div>
                                            <div class="page fr">
                                                <div class="pageNumber">
                                                    <div class="pagination" style="margin: 0px">
                                                        <span class="page-cur">1</span><span class="page-skip">第1/1页 共3记录<input type="text" class="text" value="1" size="3" id="txtGoto">页<input type="button" class="button" value="确定" onclick="location.href = AppendParameter('pageindex', $.trim($('#txtGoto').val()));"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix" style="height: 30px"></div>
                                    </form>

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

