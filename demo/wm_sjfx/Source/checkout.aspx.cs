using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL.ShoppingCart;
using Com;
public partial class checkout : System.Web.UI.Page
{
    public DataTable dtPay = new DataTable();
    public DataTable dtDeliver = new DataTable();
    public Bs_User user = new Bs_User();
    public Cart cart = Shopping.getCart();
    public decimal deliverPay = 0;
    protected int usableScore = 0;
    protected DataTable dt;
    protected DataTable dtliverType;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurInfo.CurUser == null)
        {
            Response.Redirect("login.aspx?from=CheckOut.aspx");
        }
        dtPay = Factory.getOrderBllInstance().getPayList();
        dtDeliver = Factory.getOrderBllInstance().getDeliverList();
        dt = CSA.DAL.DBAccess.getRS("select * from Bs_userAddress where uid=" + CurInfo.CurUser.ID + " order by ischeck desc");
        dtliverType = CSA.DAL.DBAccess.getRS("select * from Sy_Deliver");
        string action = Request.QueryString["do"];
        if (CurInfo.CurUser != null)
        {
            user = CurInfo.CurUser;
        }
        if (cart.Values.Count > 0)
        {
            switch (action)
            {
                case "submit":

                    string txt_name = Util.getStringByObject(Request.Form["txt_name"]);
                    string mobile = CurInfo.CurUser.Mobile;
                    string phone = CurInfo.CurUser.Phone;
                    string postcode = Util.getStringByObject(Request.Form["txt_zip"]);
                    string qq_msn = Util.getStringByObject(Request.Form["txt_QQ_msn"]);
                    string province = Util.getStringByObject(Request.Form["province"]);
                    string city = Util.getStringByObject(Request.Form["city"]);
                    string county = Util.getStringByObject(Request.Form["county"]);
                    
                    string address = Util.getStringByObject(Request.Form["address"]);//用来绑定用户关联地址ID

                    //使用积分购买
                    //int mallPoint = Common.Utils.StrToInt(Request.Form["mallPoint"], 0) * 10;

                    string note = Request.Form["txtNotes"];
                    note = note.Length > 200 ? note.Substring(0, 200) : note;

                    string deliverNo = Request.Form["deliverType"];
                    string payNo = Request.Form["payType"];

                    string csgEmal = user.EMail;
                    Bs_Orders order = new Bs_Orders();
                    order.csgName = txt_name;
                    order.csgProvince = province;
                    order.csgCity = city;
                    order.csgCounty = county;
                    order.Baddress = address;
                    order.csgPostCode = postcode;
                    order.csgMobile = mobile;
                    order.csgPhone = phone;
                    order.csgEmail = csgEmal;
                    order.csgFax = qq_msn;
                    order.Sy_DeliverCode = deliverNo;
                    order.Sy_PayCode = payNo;
                    order.Message = note;
                    

                    CSA.HC.SessionHelper.set(Const.sessionNames[3], order, 24 * 30);
                    Response.Redirect("OrderSubmit.aspx");
                    break;
            }
        }
        else
        {
            CSA.HC.Common.AlertAndRedirect("你的购物车暂无商品", "ShopCar.aspx");
        }
    }
}