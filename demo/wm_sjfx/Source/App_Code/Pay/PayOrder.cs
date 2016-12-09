using System;
using System.Data;
using System.Configuration;
namespace BLL.Pay
{
    /// <summary>
    ///PayOrder 的摘要说明
    /// </summary>
    class PayOrder:PayType
    {
        private string tblName = "Bs_Orders";
        /// <summary>
        /// 传入订单号,初始化一个订单支付实体
        /// </summary>
        /// <param name="num"></param>
        public PayOrder(string num,string payno)
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
            _num = num;
            _type = "OD";
            _typeName = "订单支付";
            _payNo = payno;

            string sql = "select amount,Sy_DeliverCode from {0} where code='{1}'";
            sql = string.Format(sql, tblName, num);

            DataTable obj = CSA.DAL.DBAccess.getRS(sql);
            if (obj != null&&obj.Rows.Count!=0)
            {
                DataRow dr=obj.Rows[0];
                _amount = double.Parse(dr["amount"].ToString());
                Bs_OrderDao bs_orderDao=new Bs_OrderDao();
                DataTable dtDelive = bs_orderDao.getDeliverByCode(dr["Sy_DeliverCode"].ToString());
                if (dtDelive != null && dtDelive.Rows.Count != 0)
                {
                    _delivName = dtDelive.Rows[0]["Name"].ToString();
                }
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
            string sql = "update {0} set status='{4}',Sy_PayCode='{2}',PayNo='{3}',ispay=1 where code='{1}'";
            sql = string.Format(sql, tblName,num,_payCode,_payNo,status);
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