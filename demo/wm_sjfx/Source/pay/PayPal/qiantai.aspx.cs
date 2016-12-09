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

public partial class paysuccess : System.Web.UI.Page
{
    public string num = "";
    public string type = "";
    public string md5 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       
        string code = Request["code"];//支付接口编号
        string type = Request["type"];//支付类型, OD为订单
        string num = Request["num"];//相应的单号
        string md5sign = Request["key"]; //MD5 Sign
        //检查数据传递完整
        if (!PayHepler.dataCheck(num + type + code, md5sign))
        {
            Response.Redirect("~/default.aspx"); 
            Response.End();
        }
        PayEntity entity = new PayEntity(code);//生成一个接口类型
        PayType paytype = PayTypeFac.getPayType(type, num);//生成一个支付类型

        string status = Request["payment_status"];
        Response.Write(status);
       
        if (!string.IsNullOrEmpty(status))
        {
            if (status == "Completed" || status == "Pending")
            {
                try
                {
                    paytype.payNo = Request["txn_id"];
                    paytype.Sj = Request["business"];
                    paytype.Mj = Request["payer_email"];
                    paytype.payCode = code;
                    paytype.success();
                    Response.Redirect("../payend.aspx?code=" + code + "&type=" + type + "&key=" + md5sign + "&num=" + num + "&status=success");
                }
                catch (Exception ex)
                {
                   Common.WriteToFile.WriteToTxt("PayPal支付异常----支付单号：" + paytype.num + "----" + ex.Message + "----" + DateTime.Now.ToString(), "pay/PayPal/Log/");
                }

            }
            else
            {
                paytype.failed();
            }
        }
    }
}
