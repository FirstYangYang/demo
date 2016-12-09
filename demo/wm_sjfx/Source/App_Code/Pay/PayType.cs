using System;
using System.Data;
using System.Configuration;
using CSA.DAL;
namespace BLL.Pay
{
    /// <summary>
    ///支付类型的基类
    /// </summary>
    public abstract class PayType
    {
        protected string _typeName = "";
        /// <summary>
        /// 类型的名字
        /// </summary>
        public string typeName {
            get { return _typeName; }
            set { _typeName = value; }
        }
        protected string _type = "";
        /// <summary>
        /// 类型编号,如 OD为订单
        /// </summary>
        public string type {
            get { return _type; }
            set { _type = value; }
        }

        protected double _amount = 0;
        /// <summary>
        /// 订单金额
        /// </summary>
        public double amount {
            get { return _amount; }
            set { _amount = value; }
        }

        protected string _num = "";
        /// <summary>
        /// 订单号
        /// </summary>
        public string num {
            get { return _num; }
            set { _num = value; }
        }
        protected string _payNo = "";
        /// <summary>
        /// 支付流水号,可以为空
        /// </summary>
        public string payNo {
            get { return _payNo; }
            set { _payNo = value; }
        }
        protected string _payCode = "";
        /// <summary>
        /// 支付类型编号,如:01为支付宝
        /// </summary>
        public string payCode {
            get { return _payCode; }
            set { _payCode = value; }
        }

        protected string _delivName = "";
        /// <summary>
        /// 物流公司
        /// </summary>
        public string delivName
        {
            get { return _delivName; }
            set { _delivName = value; }
        }

        protected string _mj;
        public string Mj
        {
            get { return _mj; }
            set { _mj = value; }
        }

        protected string _sj;
        public string Sj
        {
            get { return _sj; }
            set { _sj = value; }
        }

        /// <summary>
        /// 成功后执行方法
        /// </summary>
        public abstract void success();
        /// <summary>
        /// 失败后执行方法
        /// </summary>
        public abstract void failed();

    }
}