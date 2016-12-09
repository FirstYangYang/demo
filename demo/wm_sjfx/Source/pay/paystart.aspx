<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paystart.aspx.cs" Inherits="pay_paystart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>去支付</title>
</head>
<%if (code == "02")
  { %>
<body onload="javascript:document.payForm.submit()">
    <form action="http://sundayly.gz11.hostadm.net/upacp_demo_b2c/demo/api_01_gateway/Form_6_2_FrontConsume.php" name="payForm" method="post">
        <input id="merId" type="hidden" name="merId" value="<%=payaccount %>" />
        <input id="txnAmt" type="hidden" name="txnAmt" value="<%=amount %>" />
        <input id="txnTime" type="hidden" name="txnTime" value="<%= DateTime.Now.ToString("yyyyMMddHHmmss") %>" />
        <input id="orderId" type="hidden" name="orderId" value="<%=num %>" />
    </form>
</body>
<%} %>
</html>
