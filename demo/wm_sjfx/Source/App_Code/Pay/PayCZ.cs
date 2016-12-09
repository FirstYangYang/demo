using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
namespace BLL.Pay
{
    /// <summary>
    ///PayCZ 的摘要说明
    /// </summary>
    public class PayCZ:PayType
    {
        private string tblName = "Bs_CZOrders";
        /// <summary>
        /// 传入订单号,初始化一个订单支付实体
        /// </summary>
        /// <param name="num"></param>
        public PayCZ(string num)
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
            _num = num;
            _type = "CZ";
            _typeName = "在线充值";

            string sql = "select amount from {0} where code='{1}'";
            sql = string.Format(sql, tblName, num);

            object obj = CSA.DAL.DBAccess.ExecuteScalar(sql);
            if (obj != null)
            {
                _amount = double.Parse(obj.ToString());
            }
            else
            {
                _amount = 0;
            }
        }
        /// <summary>
        /// 成功后执行方法
        /// </summary>
        public override void success()
        {
            string status="0104";//成功后的订单状态
            string sql = "update {0} set status='{4}',Sy_PayCode='{2}',PayNo='{3}' where num='{1}'";
            sql = string.Format(sql, tblName, num,_payCode,_payNo,status);
            CSA.DAL.DBAccess.ExecuteNonQuery(sql);
        }
        /// <summary>
        /// 失败后执行方法
        /// </summary>
        public override void failed()
        {

        }
    }
}