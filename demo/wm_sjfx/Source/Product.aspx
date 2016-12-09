<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%= BLL.Sys.Config.getSiteConfig("产品介绍", "", "")%>

    <uc:info ID="global1" runat="server" />

 

</head>
<body>
<!-- head -->
    <uc:head ID="head1" runat="server" />
   

  
        <uc:banner ID="banner1" runat="server" />

<!--fullSlidea end--> 

 

<!-- content -->
<div class="inner" style="margin-top:20px;"><!-- <div class="lm">
<h2>产品中心<b>·</b></h2>
<ul>

</ul>
</div>
-->
  <div class="content"> <h2 class="cona">当前位置：<a href="index.htm" tppabs="/" title="首页">首页</a> >  <a href="product.aspx">产品介绍</a> 

    </h2>
<div class="conb"> 

 	<ul class="ExhibitList">
         <%foreach(DataRow dr in dt.Rows){ %>
		<li>
  <a href="showpro.aspx?id=<%=dr["id"] %>"   title="<%=dr["name"] %>"> <img src="upload/product/<%=dr["pic"] %>"  /></a> 
  <div class="ImageTitle"> <%=dr["name"] %></div>
</li>

         <%} %>
<%--<li>
  <a href="#"    title="纳米球斯太尔小盒"> <img src="images/pro2.jpg"   /></a> 
  <div class="ImageTitle"> 纳米球斯太尔小盒</div>
</li>--%>



	</ul>
	
 </div>
 </div>
  </div>
  <div class="clear"></div>



    <uc:foot ID="foot1" runat="server" />


 
</body>
</html>
