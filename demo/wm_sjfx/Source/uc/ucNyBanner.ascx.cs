using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class uc_ucNyBanner : System.Web.UI.UserControl
{
    public string adId, Str;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(adId))
        {
            adId = "19";
        }
        Str = BLL.Ad.Ad.getpicbyidlinks(int.Parse(adId), "upload/", "../images/ebanner.jpg");
    }
}