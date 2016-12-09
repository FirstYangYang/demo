<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyMember.aspx.cs" Inherits="MyMember" %>

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
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="MyMember.aspx">我的下线</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="user clearfix">
                        <uc:left ID="left1" runat="server" nav="2-2" />
                        <div class="u_r">
                            <div class="user_m user_ma clearfix">
                                <div class="sell-table">
                                    <div class="title-table tableHeader" style="">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th width="15%">昵称/手机</th>
                                                    <th width="15%">用户名</th>
                                                    <th width="10%" style="text-align: left">店名/联系人</th>
                                                    <th width="10%">下线等级</th>
                                                    <th width="10%">总销售额</th>
                                                    <th width="10%">佣金总额</th>
                                                    <th width="8%">申请时间</th>
                                                    <th width="10%"></th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="content-table" style="padding:0 10px;margin-top:10px;">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td width="15%" style="text-align: left">
                                                        <p><span>tab</span></p>
                                                        <p><span>18674886532</span></p>
                                                    </td>
                                                    <td width="15%">tab</td>
                                                    <td width="10%" style="text-align: left">
                                                        <p>1231312</p>
                                                        <p><span style="color: gray">未填写联系人</span></p>
                                                    </td>
                                                    <td width="10%">初级</td>
                                                    <td width="10%"><em>￥0.00</em></td>
                                                    <td width="10%"><em>￥0.00</em></td>
                                                    <td width="8%">2016-11-21<br>
                                                        20:50:53</td>
                                                    <td width="10%">
                                                        <p>
                                                            <a href="MemberInfo.aspx?UserId=51">详情</a>︱ 
                                                        <a class="table-icon edit" href="#" onclick="ShowEditDistributorInfos(51,this);" data="tab# # 18674886532# ">编辑</a>
                                                        </p>
                                                        <p>
                                                            <a href="CommissionsList.aspx?UserId=51" target="_blank">佣金</a>︱
                                                          <input type="submit" name="ctl00$ContentPlaceHolder1$reDistributor$ctl00$btnFrozen" value="冻结" onclick="return HiConform('<strong>冻结后分销商不能进入分销管理中心，期间也不会获得佣金。</strong><p>确定要冻结该分销商吗？</p>', this);" id="ctl00_ContentPlaceHolder1_reDistributor_ctl00_btnFrozen" class="btnLink pad" isshow="true">
                                                        </p>
                                                        <p><a href="javascript:SetUserCommission('51','0.00');">调整佣金</a></p>
                                                        <p>
                                                            <input type="submit" name="ctl00$ContentPlaceHolder1$reDistributor$ctl00$ImageLinkButton1" value="取消分销商资质" onclick="return HiConform('<strong>取消分销商资质以后不可恢复也不能重新申请。</strong><p>是否继续？</p>', this);" id="ctl00_ContentPlaceHolder1_reDistributor_ctl00_ImageLinkButton1" class="btnLink pad" isshow="true">
                                                            <button type="button" class="btnLink" onclick="ShowSuperior(this)" userid="51">修改所属上级</button>
                                                        </p>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="15%" style="text-align: left">
                                                        <p><span>国双全</span></p>
                                                        <p><span>13366996789</span></p>
                                                    </td>
                                                    <td width="15%">国双全</td>
                                                    <td width="10%" style="text-align: left">
                                                        <p>双全精品</p>
                                                        <p>李大国</p>
                                                    </td>
                                                    <td width="10%">初级</td>
                                                    <td width="10%"><em>￥0.00</em></td>
                                                    <td width="10%"><em>￥0.00</em></td>
                                                    <td width="8%">2016-11-09<br>
                                                        23:08:30</td>
                                                    <td width="10%">
                                                        <p>
                                                            <a href="MemberInfo.aspx?UserId=48">详情</a>︱ 
                                                        <a class="table-icon edit" href="#" onclick="ShowEditDistributorInfos(48,this);" data="国双全# 李大国# 13366996789# ">编辑</a>
                                                        </p>
                                                        <p>
                                                            <a href="CommissionsList.aspx?UserId=48" target="_blank">佣金</a>︱
                                                      
                                                          <input type="submit" name="ctl00$ContentPlaceHolder1$reDistributor$ctl01$btnFrozen" value="冻结" onclick="return HiConform('<strong>冻结后分销商不能进入分销管理中心，期间也不会获得佣金。</strong><p>确定要冻结该分销商吗？</p>', this);" id="ctl00_ContentPlaceHolder1_reDistributor_ctl01_btnFrozen" class="btnLink pad" isshow="true">
                                                        </p>
                                                        <p><a href="javascript:SetUserCommission('48','0.00');">调整佣金</a></p>
                                                        <p>

                                                            <input type="submit" name="ctl00$ContentPlaceHolder1$reDistributor$ctl01$ImageLinkButton1" value="取消分销商资质" onclick="return HiConform('<strong>取消分销商资质以后不可恢复也不能重新申请。</strong><p>是否继续？</p>', this);" id="ctl00_ContentPlaceHolder1_reDistributor_ctl01_ImageLinkButton1" class="btnLink pad" isshow="true">

                                                            <button type="button" class="btnLink" onclick="ShowSuperior(this)" userid="48">修改所属上级</button>

                                                        </p>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="15%" style="text-align: left">
                                                        <p><span>admin001</span></p>
                                                        <p><span></span></p>
                                                    </td>
                                                    <td width="15%">admin001</td>
                                                    <td width="10%" style="text-align: left">
                                                        <p>微小店_170817_admin001</p>
                                                        <p>sag</p>
                                                    </td>
                                                    <td width="10%">初级</td>
                                                    <td width="10%"><em>￥0.00</em></td>
                                                    <td width="10%"><em>￥0.00</em></td>
                                                    <td width="8%">2016-10-24<br>
                                                        17:08:17</td>
                                                    <td width="10%">
                                                        <p>
                                                            <a href="MemberInfo.aspx?UserId=39">详情</a>︱ 
                                                        <a class="table-icon edit" href="#" onclick="ShowEditDistributorInfos(39,this);" data="admin001# sag# # ">编辑</a>
                                                        </p>
                                                        <p>
                                                            <a href="CommissionsList.aspx?UserId=39" target="_blank">佣金</a>︱
                                                      
                                                          <input type="submit" name="ctl00$ContentPlaceHolder1$reDistributor$ctl02$btnFrozen" value="冻结" onclick="return HiConform('<strong>冻结后分销商不能进入分销管理中心，期间也不会获得佣金。</strong><p>确定要冻结该分销商吗？</p>', this);" id="ctl00_ContentPlaceHolder1_reDistributor_ctl02_btnFrozen" class="btnLink pad" isshow="true">
                                                        </p>
                                                        <p><a href="javascript:SetUserCommission('39','0.00');">调整佣金</a></p>
                                                        <p>

                                                            <input type="submit" name="ctl00$ContentPlaceHolder1$reDistributor$ctl02$ImageLinkButton1" value="取消分销商资质" onclick="return HiConform('<strong>取消分销商资质以后不可恢复也不能重新申请。</strong><p>是否继续？</p>', this);" id="ctl00_ContentPlaceHolder1_reDistributor_ctl02_ImageLinkButton1" class="btnLink pad" isshow="true">

                                                            <button type="button" class="btnLink" onclick="ShowSuperior(this)" userid="39">修改所属上级</button>

                                                        </p>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="15%" style="text-align: left">
                                                        <p><span>jolice</span></p>
                                                        <p><span>18190909321</span></p>
                                                    </td>
                                                    <td width="15%">jolice</td>
                                                    <td width="10%" style="text-align: left">
                                                        <p>分销店铺</p>
                                                        <p><span style="color: gray">未填写联系人</span></p>
                                                    </td>
                                                    <td width="10%">初级</td>
                                                    <td width="10%"><em>￥0.00</em></td>
                                                    <td width="10%"><em>￥0.00</em></td>
                                                    <td width="8%">2016-10-24<br>
                                                        12:42:43</td>
                                                    <td width="10%">
                                                        <p>
                                                            <a href="MemberInfo.aspx?UserId=38">详情</a>︱ 
                                                        <a class="table-icon edit" href="#" onclick="ShowEditDistributorInfos(38,this);" data="jolice# # 18190909321# ">编辑</a>
                                                        </p>
                                                        <p>
                                                            <a href="CommissionsList.aspx?UserId=38" target="_blank">佣金</a>︱
                                                      
                                                          <input type="submit" name="ctl00$ContentPlaceHolder1$reDistributor$ctl03$btnFrozen" value="冻结" onclick="return HiConform('<strong>冻结后分销商不能进入分销管理中心，期间也不会获得佣金。</strong><p>确定要冻结该分销商吗？</p>', this);" id="ctl00_ContentPlaceHolder1_reDistributor_ctl03_btnFrozen" class="btnLink pad" isshow="true">
                                                        </p>
                                                        <p><a href="javascript:SetUserCommission('38','0.00');">调整佣金</a></p>
                                                        <p>

                                                            <input type="submit" name="ctl00$ContentPlaceHolder1$reDistributor$ctl03$ImageLinkButton1" value="取消分销商资质" onclick="return HiConform('<strong>取消分销商资质以后不可恢复也不能重新申请。</strong><p>是否继续？</p>', this);" id="ctl00_ContentPlaceHolder1_reDistributor_ctl03_ImageLinkButton1" class="btnLink pad" isshow="true">

                                                            <button type="button" class="btnLink" onclick="ShowSuperior(this)" userid="38">修改所属上级</button>

                                                        </p>
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
    <div class="space_hx">&nbsp;</div>
    <!--底部-->
    <uc:foot ID="foot1" runat="server" />
    <!--底部-->
</body>
</html>

