using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class uc_ucHeader : System.Web.UI.UserControl
{
    public DataRow[] dr,dr1, dr2, dr3, dr4, dr5, dr6;
    public DataTable dt,dtPro;
    protected void Page_Load(object sender, EventArgs e)
    {
        dt = BLL.Article.Kind.getKind(null,0);

        dr = dt.Select("len(Code)=2","Code");
        dr1 = dt.Select("len(Code)=4 and Code like'01%'","Code");
        dr2 = dt.Select("len(Code)=4 and Code like'02%'", "Code");
        dr3 = dt.Select("len(Code)=4 and Code like'03%'", "Code");
        dr4 = dt.Select("len(Code)=4 and Code like'04%'", "Code");
        dr5 = dt.Select("len(Code)=4 and Code like'05%'", "Code");

        dtPro = BLL.Product.Kind.getList("",0);
    }
}