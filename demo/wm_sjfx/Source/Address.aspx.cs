using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Address : System.Web.UI.Page
{
    protected DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
       

       if (CurInfo.CurUser == null)
       {
           Response.Redirect("login.aspx?from=address.aspx");
       }

       dt = CSA.DAL.DBAccess.getRS("select * from Bs_userAddress where uid=" + CurInfo.CurUser.ID + " order by  Ischeck desc");


       

       
    }
}