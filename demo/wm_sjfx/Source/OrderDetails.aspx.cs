using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CSA.DAL;
using Com;
public partial class OrderDetails : System.Web.UI.Page
{
    public string payMode = "";
    public double deliverPay = 0;
    public string deliverMode = "";
    public string timeMode = "";
    public DataTable dtOrderDtl = new DataTable();
    public Bs_Orders order = new Bs_Orders();
    public DataTable dtad;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurInfo.CurUser != null)
        {
            string orderCode = Request.QueryString["OrderId"];
            dtOrderDtl = Factory.getOrderBllInstance().getOrderDetailByCode(orderCode);
            order = Factory.getOrderBllInstance().getOrderByCode(orderCode);
            dtad = CSA.DAL.DBAccess.getRS("select * from Bs_userAddress where id=" + order.Baddress + "");
            DataTable dtDeliver = Factory.getOrderBllInstance().getDeliverByCode(order.Sy_DeliverCode);
            DataTable dtPay = Factory.getOrderBllInstance().getPayByCode(order.Sy_PayCode);
            if (dtDeliver.Rows.Count > 0)
            {
                deliverMode = dtDeliver.Rows[0]["name"].ToString();
                deliverPay = double.Parse(dtDeliver.Rows[0]["amount"].ToString());
            }
            if (dtPay.Rows.Count > 0)
            {
                payMode = dtPay.Rows[0]["name"].ToString();
            }
        }
        else
        {
            Response.Redirect("login.aspx?from=Order.aspx");
        }
    }
}