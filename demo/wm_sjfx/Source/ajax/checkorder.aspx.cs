using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Com;
using System.Data;

public partial class ajax_checkorder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurInfo.CurUser != null)
        {
            string action = Util.getStringByObject(Request.Form["action"]);
            string orderCode = Util.getStringByObject(Request.Form["ordercode"]);
            switch (action)
            {
                case "cancel":
                    Factory.getOrderBllInstance().editOrderToFault(orderCode);
                    string strSql = string.Format("select * from bs_orders where code = '{0}' ", orderCode);
                    DataRow drOrder = Com.Util.getDrByTable(CSA.DAL.DBAccess.getRS(strSql)); 
                     // string Jianfee = drOrder["Jianfee"].ToString();
                    //decimal Jianfee = Convert.ToDecimal(drOrder["Jianfee"]);
                    
                      

                   // BLL.User.UserScoreLog.QuXiaoUserCashByCode2(orderCode);
                    //BLL.User.UserScoreLog.QuXiaoUserCashByCode(orderCode);
                    //DataTable dtusercash = CSA.DAL.DBAccess.getRS("select * from bs_usercash where orderno='" + orderCode + "'");
                    //BLL.User.UserScoreLog.UpdateCashStatus(dtusercash.Select(" type =0")[0]["code"].ToString(), 0);
                    Response.Write(1);
                break;
               
                case "cancelgift":
                     Factory.getOrderBllInstance().editgiftOrderToFault(orderCode);
                     Response.Write(1);
                break;

                case "comfirm":
                Factory.getOrderBllInstance().updateOrderStatus(orderCode, Com.Const.orderState_submit_receive);
                Response.Write(1);
                break;

                case "confirmgift":
                    Factory.getOrderBllInstance().updategiftOrderStatus(orderCode, "0304");
                    Response.Write(1);
                break;

            }
        }
        else
        {
            Response.Write(0);
        }

    }


}