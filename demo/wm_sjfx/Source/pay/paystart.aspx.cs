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
public partial class pay_paystart : System.Web.UI.Page
{
    public string code, type, num, payaccount;
    public double amount;
    protected void Page_Load(object sender, EventArgs e)
    {
        //支付成功前,统一跳转到此页面
        code = Request.QueryString["code"];//支付接口编号
        type = Request.QueryString["type"];//支付类型, OD为订单
        num = Request.QueryString["num"];//相应的单号

        BLL.Pay.PayEntity entity = new BLL.Pay.PayEntity(code);
        //在线支付的,跳转到指定支付页
        if (code == "01")
        {
            if (!string.IsNullOrEmpty(entity.sendURL))
            {
                string key = BLL.Pay.PayHepler.dataEncrypt(num + type + code);
                string url = entity.sendURL + "?code=" + code
                    + "&num=" + num + "&type=" + type + "&key=" + key;
                Response.Redirect(entity.sendURL + "?code=" + code
                    + "&num=" + num + "&type=" + type + "&key=" + key);
                Response.End();
            }
            else
            {
                //非在线支付的,直接输出内容
                Response.Write(entity.content);
                Response.End();
            }
        }
        else if (code == "02")
        {
            PayType paytype = PayTypeFac.getPayType(type, num);//生成一个支付类型
            payaccount = entity.payAccount;
            amount = paytype.amount * 100;
        }  
      
    }
}
