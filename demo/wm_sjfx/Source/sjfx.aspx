<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sjfx.aspx.cs" Inherits="sjfx" %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%= BLL.Sys.Config.getSiteConfig("三级分销", "", "")%>

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
  <div class="content"> <h2 class="cona">当前位置：<a href="index.htm" tppabs="/" title="首页">首页</a> >  <a href="sjfx.aspx">三级分销</a> 

    </h2>
    <div class="conb"> <div class="MainContent">
	<div class="DetailContent">
	
     <%if(dt.Rows.Count>0){ %>
       
        <%=dt.Rows[0]["content"] %>
         <%}else{ %>
       
        网站资料更新中...
         <%} %>
    </div>
    </div>
</div>
 </div>
  </div>
  <div class="clear"></div>
</div>

<!--foot-->

<!-- news -->

    <uc:foot ID="foot1" runat="server" />


 
</body>
</html>
