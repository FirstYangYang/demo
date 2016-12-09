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
    ///支付类型工厂
    /// </summary>
    public class PayTypeFac
    {
        /// <summary>
        /// 获取类型,和单号,取得支付类型
        /// </summary>
        /// <param name="type">类型,如 OD为订单</param>
        /// <param name="num">单号</param>
        /// <returns></returns>
        public static PayType getPayType(string type, string num,string payno)
        {
            switch (type)
            {
                case "OD": return new PayOrder(num,payno);
                case "CZ": return new PayCZ(num);
            }
            return null;
        }
        public static PayType getPayType(string type, string num)
        {
            return getPayType(type, num, "");
        }
    }
}