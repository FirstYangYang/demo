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
using BLL.Pay;

public partial class paypalPay : System.Web.UI.Page
{
    //测试 https://www.sandbox.paypal.com/cgi-bin/webscr 
    //生产环境 https://www.paypal.com/cgi-bin/webscr
    protected string fromUrl = "https://www.paypal.com/cgi-bin/webscr";
    protected string business = string.Empty;
    protected string item_name = string.Empty;
    protected string item_number = string.Empty;
    protected string a3 = string.Empty;
    protected string cn = string.Empty;
    protected string notify_url = string.Empty;
    protected string returnUrl = string.Empty;
    protected string cancel_return = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        string code = Request.QueryString["code"];//支付接口编号
        string type = Request.QueryString["type"];//支付类型, OD为订单
        string num = Request.QueryString["num"];//相应的单号
        string md5sign = Request.QueryString["key"]; //MD5 Sign
        string webSite = "http://" + Request.Url.Host;
        //检查数据传递完整
        if (!PayHepler.dataCheck(num + type + code, md5sign))
        {
            Response.Redirect("~/default.aspx"); 
            Response.End();
        }
        PayEntity entity = new PayEntity(code);//生成一个接口类型
        PayType paytype = PayTypeFac.getPayType(type, num);//生成一个支付类型

        business = entity.payAccount;
        item_name = paytype.num;
        item_number = paytype.num;
        a3 = paytype.amount.ToString("f2");
        notify_url = webSite + "/" + entity.notifyURL + "?code=" + code + "&type=" + type + "&key=" + md5sign + "&num=" + num;
        returnUrl = webSite + "/" + entity.returnURL + "?code=" + code + "&type=" + type + "&key=" + md5sign + "&num=" + num;
        cancel_return = webSite + "/pay/payend.aspx?code=" + code + "&type=" + type + "&key=" + md5sign + "&num=" + num + "&status=failed";
    }
}
