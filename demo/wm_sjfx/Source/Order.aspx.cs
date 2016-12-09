using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Order : UserBasePage
{
    protected DataTable dt;
    public DataTable status = new DataTable();
    public DataTable dtDeliver = new DataTable();
    private int size = 10;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (CurInfo.CurUser != null)
        {
            BindData();
        }
        else
        {
            Response.Redirect("login.aspx?from=Order.aspx");
        }
    }
    public void BindData()
    {
        string sql = @"select a.status,a.payno,a.code,c.Bs_ProductsCode,a.Bs_UserID,a.Quantity,a.DeliverFee,a.amount,a.productFee,a.sy_paycode,
  a.sy_paycode,a.ispay,b.CsgName,b.CsgMobile,b.CsgTel,a.AddTime,c.Quantity,d.name,d.pic,d.ID,c.Price from Bs_Orders a 
  inner join  Bs_userAddress b on a.Baddress=b.id
  inner join  Bs_OrdersDtl c on a.Code=c.Bs_OrdersCode

  inner join Bs_Products d on c.Bs_ProductsCode=d.ID where a.Bs_UserID=" +CurInfo.CurUser.ID+"";

        dt = CSA.DAL.DBAccess.getRS(sql);

        status = CSA.DAL.DBAccess.getRS("select name,code from sy_code where code like '01%' order by sortno,code");
        dtDeliver = CSA.DAL.DBAccess.getRS("select name,code,url from Sy_Deliver where status=0 order by sortno,code");

        int pageindex = Common.Utils.StrToInt(Request.QueryString["page"], 1);
        dt = CSA.DAL.PageHelper.getPage(dt, size, pageindex);
        this.AspNetPager1.PageSize = size;
        this.AspNetPager1.RecordCount = dt.Rows.Count;
    }

     
}