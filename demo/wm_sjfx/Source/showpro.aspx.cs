using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class showpro : System.Web.UI.Page
{

    public DataTable dtAd, dtclasses, dthotnews;
    public DataRow drDetail;
    public int id;


    protected void Page_Load(object sender, EventArgs e)
    {
        id = Com.Util.getIntByObject(Request["id"]);
        if (id > 0)
        {
            DataTable dt = CSA.DAL.DBAccess.getRS("select * from Bs_Products  where id=" + id + "");
            if (dt != null && dt.Rows.Count > 0)
            {
                drDetail = dt.Rows[0];
            }

          
        }
    }
}