using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class CheckREG : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string action = Request.QueryString["action"];
        if (action != null && action == "checkform")
        {
            string checktpye = Request.QueryString["type"];
            if (checktpye != null && checktpye != "")
            {
                string values = Request["values"];
                switch (checktpye)
                {
                    case "username":
                        if (checkusername(values))
                        {
                            Response.Write("0");
                            Response.End();
                        }
                        else
                        {
                            Response.Write("2");
                            Response.End();
                        }
                        break;
                    case "code":
                        string c = Session["check_code"].ToString();
                        if (Session["check_code"].ToString() == values)
                        {
                            Response.Write("2");
                            Response.End();
                        }
                        else
                        {
                            Response.Write("0");
                            Response.End();
                        }
                        break;

                }
            }
            else
            {
                Response.Write("0");
                Response.End();
            }
        }
    }
    public bool checkusername(string username)
    {
        bool flag = false;
        string sql = "Select name From bs_user where [name]='" + username + "'";
        DataTable dtTemp = CSA.DAL.DBAccess.getRS(sql);
        if (dtTemp.Rows.Count > 0)
        {
            flag = true;
        }
        return flag;
    }
}
