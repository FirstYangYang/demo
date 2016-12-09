using System;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Net;
using Com;

/// <summary>
/// BasePage 的摘要说明
/// </summary>
public class UserBasePage : System.Web.UI.Page
{
    Bs_UserBLL UserBll = new Bs_UserBLL();
    public Bs_User UserEnt = new Bs_User();
    public DataRow base_DrUser;
    public UserBasePage()
	{
        this.Load += new EventHandler(UserBasePage_Load);
    }

    void UserBasePage_Load(object sender, EventArgs e)
    {
        try
        {
            if (CurInfo.CurUser == null)
                Response.Redirect("Login.aspx");
        }
        catch (Exception)
        {
            Response.Redirect("Login.aspx");
        }
    }
}