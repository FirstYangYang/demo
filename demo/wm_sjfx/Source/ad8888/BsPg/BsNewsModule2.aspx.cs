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

public partial class admin_BsPg_BsNewsModule2 : AdminPage
{

    protected string mcode = "";
    public string pcode = "";
    public string ptype = "";
    protected string pkid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
      checkUserGoLogin();
      mcode =Com.Util.getStringByObject(Request.QueryString["mcode"]);
      pcode = Com.Util.getStringByObject(Request.QueryString["pcode"]);
      ptype = Com.Util.getStringByObject(Request.QueryString["ptype"]);
      if (ptype == "")
          ptype = "del";

      pkid = Sys.syMenu.GetPkid(mcode);
      mcode = mcode.Length >= 2 ? mcode.Substring(0, 2) : mcode;
    }   
}