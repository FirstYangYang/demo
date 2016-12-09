<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhifu.aspx.cs" Inherits="paypalPay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>提交订单</title>
</head>
<body onload="javascript:document.payPalForm.submit()">
<div style=" text-align:center">
    <h3 style="font-size: 1.5em; line-height: normal; margin: 4em 0 0;">
        from Submit</h3>
    <img border="0" alt="from Submit" style="margin: 1.88em 0 2em" src="icon_load_roundcorner_lock1_186x42_withlock.gif">
    <p style="margin: 1em 0">
        <strong style="color: #1A3665; font-size: 1.25em; margin-top: 2em">PayPal，Payments received by the world's favorite.</strong></p>
        </div>
    <form action="<%=fromUrl %>" name="payPalForm" method="post">
    <!-- Identify your business so that you can collect the payments. -->
    <input type="hidden" name="business" value="<%=business %>">
    <!-- Specify a Subscribe button. -->
    <input type="hidden" name="cmd" value="_xclick">
    <!-- Identify the subscription. -->
    <input type="hidden" name="item_name" value="<%=item_name %>">
    <input type="hidden" name="item_number" value="<%=item_number %>">
    <!-- Set the terms of the regular subscription. -->
    <input type="hidden" name="currency_code" value="HKD">
    <input type="hidden" name="amount" value="<%=a3 %>">
    <input type="hidden" name="p3" value="1">
    <input type="hidden" name="t3" value="M">
    <!-- Set recurring payments until canceled. -->
    <input type="hidden" name="src" value="1">
    <input type="hidden" name="notify_url" value="<%=notify_url %>">
    <input type="hidden" name="return" value="<%=returnUrl %>">
    </form>
</body>
</html>
