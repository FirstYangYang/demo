using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.ShoppingCart;
using Com;
using System.Data;
public partial class OrderSubmit : System.Web.UI.Page
{
    public decimal pay;
    public string orderCode;
    public Bs_Orders order = new Bs_Orders();
    public Cart cart = Shopping.getCart();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (CurInfo.CurUser == null)
        {
            Response.Redirect("login.aspx?from=checkout.aspx");
        }
        if (cart.Values.Count > 0)
        {
            if (CSA.HC.SessionHelper.get(Const.sessionNames[3]) != null)
            {
                order = (Bs_Orders)CSA.HC.SessionHelper.get(Const.sessionNames[3]);
                if (CurInfo.CurUser != null)
                {

                    Factory.getOrderBllInstance().addOrder(order, cart, ref orderCode, ref pay, CurInfo.CurUser.ID);
                    ///
                    if (pay == 0)
                    {
                        int i = CSA.DAL.DBAccess.ExecuteNonQuery("update Bs_Orders set ispay=1 ,Status='0104' where Code='" + orderCode + "'");
                        if (i > 0)
                        {
                            CSA.HC.Common.AlertAndRedirect("购买成功！", "order.aspx");
                        }

                    }
                }
                else
                {
                    Factory.getOrderBllInstance().addOrder(order, cart, ref orderCode, ref pay, 0);
                }
                // SendEmail();
                Shopping.killCart();
                CSA.HC.SessionHelper.clear(Const.sessionNames[3]);
            }
        }
        //else
        //{
        //    CSA.HC.Common.AlertAndRedirect("购物车暂无商品", "ShopCart.aspx");
        //}
    }
    #region 发送邮件
    private void SendEmail()
    {
        try
        {
            CSA.Net.Email email = new CSA.Net.Email();

            string[] amilto = BLL.Sys.Config.getConfigVal("targetEmail").Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
            email.MailTo = amilto;
            email.Title = "新订单-" + BLL.Sys.Config.getConfigVal("sitetitle") + "      " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            email.Content = "<style>div.filter { text-align:left; width: 735px; float:left; border:1px #C60 solid; margin:1px 0; padding:10px 5px; vertical-align:middle; }.tac { text-align: center; }.nopr{text-align:center; padding-top:30px; width:720px;}.uptime{color:#a20521; font-weight: bold;}.Mycart{text-align:left; height:60px; padding-top:20px;}.bord{border:1px #3F3F3F solid; width:958px;font-size:12px}.bord2{border-bottom:1px #ccc dotted; text-align:center;}#goods_cart_total { width:98%; margin: 10px auto 0; border: 1px  dotted #CCCCCC; text-align: right; line-height: 1.8; padding: 5px 0; }#goods_cart_total p { padding-right: 10px; }#goods_cart_total span { padding-left: 10px; }div.goods_cart_button { width: 98%; margin: 0 auto; padding: 15px 0 0; }div.goods_cart_button span.button { float: right; padding-left: 15px; line-height: 30px; }div.goods_cart_button span.info { float: left; padding-left: 15px; line-height: 30px; color: #000; }div.goods_checkout { width: 730px; margin: 0 auto 15px; }div.goods_checkout_content { border: 1px solid #CCCCCC; margin: 10px; }div.goods_checkout_content td.title{width:200px} div.goods_checkout_content td { line-height: 1.8; }div.goods_checkout td p span { padding-left: 10px; }div.goods_checkout{width:98%; margin: 15px auto 15px; text-align:left; }.containerTitle { background-color:#3F3F3F; color:#FFFFFF; font-size:1.1em; font-weight:bold; padding:5px 10px; text-transform:uppercase; }.txt{ height:20px;}.newclas{border-bottom: 1px solid #ccc; margin-top: 10px; margin-left:10px; width:710px;}.hand{cursor:pointer;}.line_blank_10px {height: 10px;}</style>";
            email.Content += "会员：<b class='red'>" + CurInfo.CurUser.Name + "</b>&nbsp;&nbsp;订单金额：<b class='red'>" + pay + "</b>";
            email.Content += " <div class='bord'><div class='goods_checkout'><div class='containerTitle'><span>订单详细</span></div><div class='goods_checkout_content'><table width='100%' border='0' align='center' cellpadding='5' cellspacing='1'  ><tbody><tr align='center' style=' background:#3F3F3F; color:#fff;'><th style=' height:30px;' width='20%'>图片</th><th width='45%'>名称</th><th width='10%'>价格</th><th width='10%'>数量</th><th width='15%'>小计</th></tr>";
            order = (Bs_Orders)CSA.HC.SessionHelper.get(Const.sessionNames[3]);
            DataTable dtDeliver = Factory.getOrderBllInstance().getDeliverByCode(order.Sy_DeliverCode);
            DataTable dtPay = Factory.getOrderBllInstance().getPayByCode(order.Sy_PayCode);
            string payMode = "";
            decimal deliverPay = 0;
            string deliverMode = "";
            if (dtDeliver.Rows.Count > 0)
            {
                deliverMode = dtDeliver.Rows[0]["name"].ToString();
                deliverPay = decimal.Parse(dtDeliver.Rows[0]["amount"].ToString());
            }
            if (dtPay.Rows.Count > 0)
            {
                payMode = dtPay.Rows[0]["name"].ToString();
            }
            int recordcount = 0;
            decimal totalpay = 0;
            if (cart.Values.Count > 0)
            {
                foreach (BLL.ShoppingCart.Product pro in cart.Values.Values)
                {
                    string[] photos = pro.Pic.Split(Com.Const.cutProPre);
                    string pic = "";
                    if (photos.Length > 0)
                    {
                        pic = photos[0];
                    }
                    totalpay += pro.Pay;
                    recordcount += pro.Qty;
                    decimal proSum = pro.Qty * pro.Price;
                    email.Content += "<tr style='background:#fff;'><td class='bord2' ><img src='" + CurInfo.CurUrlLocal + "upload/" + pic + "' style='height:90px'/></td><td class='bord2' align='left' style=' text-align:left; padding-left:15px;'>" + pro.Name + "<br />型号:" + pro.Num + "</td><td class='bord2'>" + pro.Price + "元</td><td class='bord2'>" + pro.Qty + "</td><td class='bord2'><b>" + proSum + " 元</b></td></tr>";
                }
            }
            email.Content += "</tbody></table><div id='goods_cart_total'><p><span>商品数量：<strong class='red' id='Strong1'>" + recordcount + "</strong> 件</span><span>商品总金额：<strong class='red' id='Strong2'>" + (totalpay) + "</strong> 元 </span> </p></div></div></div>";
            email.Content += "<div class='goods_checkout'><div class='containerTitle'><span>配送信息</span></div><div class='goods_checkout_content'><table cellspacing='1' class='box'  width='100%'><tbody><tr><td class='title'>省份/直辖市：</td><td colspan='3'><span>" + order.csgProvince + order.csgCity + order.csgCountry + "</span></td></tr><tr><td class='title'>收货人地址：</td><td colspan='3'><span>" + order.csgAddress + "</span></td></tr><tr><td width='10%' class='title'>收货人姓名：</td><td width='40%'><span>" + order.csgName + "</span></td><td width='10%' class='title'>邮政编码：</td><td width='40%'><span>" + order.csgPostCode + "</span></td></tr><tr><td class='title'>电话：</td><td><span>" + order.csgPhone + "</span></td><td class='title'>手机：</td><td><span>" + order.csgMobile + "</span></td></tr><tr><td class='title'>支付方式：</td><td colspan='3'><span>" + payMode + "</span></td></tr></tbody></table></div></div>";
            email.Content += "<div class='goods_checkout'><div class='containerTitle'><span>客户留言</span></div><div class='goods_checkout_content'>" + order.Message + "</div></div>";
            email.Content += "<div class='goods_checkout'><div class='containerTitle'><span>订单支付金额总计</span></div><div class='goods_checkout_content'><table cellspacing='1' class=''><tbody><tr><td class='tar'><p>";

            decimal allTotalPay = totalpay + deliverPay;

            email.Content += "<span>订单总金额(商品总额+运费)：<strong id='span_order_price_total' class='red'>" + totalpay + "+" + deliverPay + "=" + allTotalPay + "</strong> 元</span></p></td></tr></tbody></table></div></div></div>";
            email.Send();
        }
        catch { }
    }
    #endregion
}