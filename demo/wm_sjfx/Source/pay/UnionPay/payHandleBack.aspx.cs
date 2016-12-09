using BLL.Pay;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pay_UnionPay_payHandleBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        string num = Com.Util.getStringByObject(Request["num"]).ToString();//相应的单号
        string md5sign = Com.Util.getStringByObject(Request["key"]).ToString().ToUpper(); //MD5 Sign
        string traceno = Com.Util.getStringByObject(Request["traceno"]).ToString();
        //Common.Log.WriteLog("Tips====","Back=====","后台处理");
        //Common.Log.WriteLog("Tips====", "Back=====", num);
        //Common.Log.WriteLog("Tips====", "Back=====", md5sign);
        //Common.Log.WriteLog("Tips====", "Back=====", traceno);
        //检查数据传递完整
        if (!PayHepler.dataCheck(num, md5sign))
        {
            Response.End();
        }
        else
        {
            string type = "OD";
            PayType paytype = PayTypeFac.getPayType(type, num);//生成一个支付类型
            paytype.payCode = "02";
            paytype.payNo = traceno;
            paytype.success();
        }
    }
}