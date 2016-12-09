using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Source_whjx : System.Web.UI.Page
{
    protected DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        dt = BLL.Article.Article.getArticle("03", 1);
    }
}