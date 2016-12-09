using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class uc_ucBanner : System.Web.UI.UserControl
{
    public DataTable dtAd;
    protected void Page_Load(object sender, EventArgs e)
    {
        dtAd = BLL.Ad.Ad.GetAdByAdKindCode("01");
    }
}