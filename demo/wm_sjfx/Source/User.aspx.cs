using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : UserBasePage
{
    Bs_UserBLL UBLL = new Bs_UserBLL();
    public Bs_User user = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurInfo.CurUser != null)
        {
            Bs_UserDao dao = new Bs_UserDao();
            Bs_User user = dao.getUserByID(CurInfo.CurUser.ID);
            if (user != null)
                CurInfo.CurUser = user;
        }
    }
}