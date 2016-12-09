using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Product : System.Web.UI.Page
{

    protected DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            dt = BLL.Product.Product.GetByCondition("1=1", 0);
        }
    }
}