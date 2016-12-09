using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Pay;
public partial class pay_PayPal_houtai : System.Web.UI.Page
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
        string payno = num;
        //检查数据传递完整
        if (!PayHepler.dataCheck(num + type + code, md5sign))
        {
            Response.Redirect("~/default.aspx"); 
            Response.End();
        }
        PayEntity entity = new PayEntity(code);//生成一个接口类型
        PayType paytype = PayTypeFac.getPayType(type, num, payno);//生成一个支付类型


        string status = Request["payment_status"];

        if (status == "Completed" || status == "Pending")
        {
            paytype.success();
            Common.WriteToFile.WriteToTxt("PayPal支付异常----支付单号：" + Request["txn_id"] + "----" + Request["business"] + "----" + DateTime.Now.ToString(), "pay/PayPal/Log/");
            //Response.Redirect("../payend.aspx?code=" + code + "&type=" + type + "&key=" + md5sign + "&num=" + num + "&status=success");
        }
        else
        {
            paytype.failed();
            Common.WriteToFile.WriteToTxt("PayPal支付异常----支付单号：" + Request["txn_id"] + "----" + Request["business"] + "----" + DateTime.Now.ToString(), "pay/PayPal/Log/");
            //Response.Redirect("../payend.aspx?code=" + code + "&type=" + type + "&key=" + md5sign + "&num=" + num + "&status=failed");
        }
    }
}