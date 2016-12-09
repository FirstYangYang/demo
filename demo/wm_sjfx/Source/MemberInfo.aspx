<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberInfo.aspx.cs" Inherits="MemberInfo" %>

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
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="MemberInfo.aspx">会员详情</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="user clearfix">
                        <uc:left ID="left1" runat="server" nav="2-2" />
                        <div class="u_r">
                            <div class="r_name">会员详情</div>
                            <div class="user_m user_ma clearfix">
                                <div class="app-inner clearfix" style="padding: 0 10px;">
                                    <form name="aspnetForm" method="post" action="DistributorDetails.aspx?UserId=51" id="aspnetForm">
                                        <!--基本信息-->
                                        <h3 class="templateTitle">基本信息</h3>
                                        <div class="set-switch clearfix">
                                            <div class="infodiv">
                                                <div class="qrCode">
                                                    <img id="ctl00_ContentPlaceHolder1_ListImage1" src="/templates/common/images/user.png" style="height: 90px; width: 90px; border-width: 0px;">
                                                </div>
                                                <div class="infostitle">个人头像</div>
                                            </div>

                                            <div class="infodiv infosdetail">
                                                <ul>
                                                    <li>
                                                        <label>联系人：</label><span id="ctl00_ContentPlaceHolder1_txtRealName"></span></li>
                                                    <li>
                                                        <label>手机号码：</label><span id="ctl00_ContentPlaceHolder1_txtCellPhone">18674886532</span></li>
                                                    <li>
                                                        <label>用户名：</label><span id="ctl00_ContentPlaceHolder1_txtUserName">tab</span></li>
                                                    <li>
                                                        <label>微信昵称：</label><span id="ctl00_ContentPlaceHolder1_txtMicroName">tab</span></li>
                                                </ul>
                                            </div>

                                            <div class="infodiv">
                                                <div class="qrCode">
                                                    <img id="ctl00_ContentPlaceHolder1_StoreCode" src="http://s.jiathis.com/qrcode.php?url=http://www.wxmaiyatang.cn/Default.aspx?ReferralId=51" style="height: 90px; width: 90px; border-width: 0px;">
                                                </div>
                                                <div class="infostitle">店铺二维码</div>
                                            </div>


                                            <div class="infodiv infosdetail infosdetailLong">
                                                <ul>
                                                    <li>
                                                        <label>店铺名：</label><span id="ctl00_ContentPlaceHolder1_txtStoreName">1231312</span>　　　　　　　　　　　　　　　　　　<a id="copybutton" data-clipboard-target="ctl00_ContentPlaceHolder1_txtUrl" style="cursor: pointer; color: #0f63ac">复制链接</a></li>
                                                    <li>
                                                        <label>分销商等级：</label><span id="ctl00_ContentPlaceHolder1_txtName">初级</span></li>
                                                    <li style="overflow: hidden">
                                                        <label>店铺链接：</label><span id="ctl00_ContentPlaceHolder1_txtUrl" style="width: 300px; overflow-x: hidden; margin: 0px">http://www.wxmaiyatang.cn/Default.aspx?ReferralId=51</span></li>
                                                    <li>
                                                        <label>申请时间：</label><span id="ctl00_ContentPlaceHolder1_txtCreateTime">2016-11-21 20:50:53</span></li>
                                                </ul>
                                            </div>



                                        </div>


                                        <!--业绩-->
                                        <h3 class="templateTitle">业绩</h3>
                                        <div class="set-switch  clearfix" style="height: 120px">

                                            <div class="yejiItem">
                                                <div id="ctl00_ContentPlaceHolder1_ReferralOrders" class="money">0</div>
                                                <div class="yejitxt">成交单数</div>
                                            </div>

                                            <div class="yejiItem">
                                                <div id="ctl00_ContentPlaceHolder1_OrdersTotal" class="money">￥0.00</div>
                                                <div class="yejitxt">销售金额</div>
                                            </div>

                                            <div class="yejiItem">
                                                <div id="ctl00_ContentPlaceHolder1_TotalReferral" class="money">￥0.00</div>
                                                <div class="yejitxt">贡献佣金</div>
                                            </div>
                                        </div>

                                        <!--数据列表-->
                                        <h3 class="templateTitle">提现记录</h3>

                                        <div>
                                            <table class="table table-hover mar table-bordered" style="table-layout: fixed">
                                                <thead>
                                                    <tr>
                                                        <th width="120">申请时间</th>
                                                        <th width="120">提现金额</th>
                                                        <th width="100">帐号类型</th>
                                                        <th width="100">帐号</th>
                                                        <th width="100">收款人</th>
                                                        <th width="120">支付日期</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>



                                        <!--数据列表底部功能区域-->
                                        <br>
                                        <div class="select-page clearfix">
                                            <div class="form-horizontal fl">
                                                <a onclick="javascript:history.go(-1)" class="btn btn-primary">返回</a>
                                            </div>
                                            <div class="page fr">
                                                <div class="pageNumber">
                                                    <div class="pagination" style="margin: 0px">
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

