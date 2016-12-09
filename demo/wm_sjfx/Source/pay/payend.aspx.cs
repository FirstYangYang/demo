using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using BLL.Pay;
public partial class pay_payend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //支付完成后,统一跳转到此页面
        string code = Request.QueryString["code"];//支付接口编号
        string type = Request.QueryString["type"];//支付类型, OD为订单
        string num = Request.QueryString["num"];//相应的单号
        string key = Request.QueryString["key"];//MD5 Sign
        string status = Request.QueryString["status"];

        BLL.Pay.PayEntity entity = new BLL.Pay.PayEntity(code);

        if (status == "success")
        {
            CSA.HC.Common.AlertAndRedirect(entity.Name + "支付成功,我们会及时处理!", "../default.aspx");
        }
        else
        {
            CSA.HC.Common.AlertAndRedirect(entity.Name + "支付失败,请联系管理员!", "../default.aspx");
        }
        
    }
}
