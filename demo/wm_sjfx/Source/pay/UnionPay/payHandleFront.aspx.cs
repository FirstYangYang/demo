using BLL.Pay;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pay_UnionPay_payHandleFront : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = "OD";//支付类型, OD为订单
        string num = Request.QueryString["num"];//相应的单号
        string md5sign = Request.QueryString["key"].ToUpper(); //MD5 Sign
        string traceno = Request.QueryString["traceno"];
        //检查数据传递完整
        if (!PayHepler.dataCheck(num, md5sign))
        {
            Response.Redirect("~/default.aspx");
            Response.End();
        }
        else
        {
            PayType paytype = PayTypeFac.getPayType(type, num);//生成一个支付类型
            paytype.payCode = "02";
            paytype.payNo =traceno;
            paytype.success();
            Response.Redirect("../payend.aspx?code=02&type=" + type + "&num=" + num + "&status=success");
        }
    }
}