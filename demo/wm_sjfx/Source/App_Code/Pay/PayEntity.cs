using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using CSA.DAL;
namespace BLL.Pay
{
    /// <summary>
    ///PayBase 的摘要说明
    /// </summary>
    public  class PayEntity
    {
        /// <summary>
        /// 初始化,传入Code
        /// </summary>
        /// <param name="code"></param>
        public PayEntity(string code)
        {
            string sql = "select * from sy_pay where code='"+code+"'";
            using (DataTable dt = DBAccess.getRS(sql))
            {
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    _content = dr["content"].ToString();
                    _code = dr["code"].ToString();
                    _name = dr["name"].ToString();
                    _notifyURL = dr["notifyURL"].ToString();
                    _payAccount = dr["payaccount"].ToString();
                    _payID = dr["payid"].ToString();
                    _paySafeCode = dr["paysafecode"].ToString();
                    _returnURL = dr["returnURL"].ToString();
                    _sendURL = dr["sendURL"].ToString();
                }
            }
        }
        /// <summary>
        /// 初始化,传入DataRow
        /// </summary>
        /// <param name="dr"></param>
        public PayEntity(DataRow dr)
        {
            _content = dr["content"].ToString();
            _code = dr["code"].ToString();
            _name = dr["name"].ToString();
            _notifyURL = dr["notifyURL"].ToString();
            _payAccount = dr["payaccount"].ToString();
            _payID = dr["payid"].ToString();
            _paySafeCode = dr["paysafecode"].ToString();
            _returnURL = dr["returnURL"].ToString();
            _sendURL = dr["sendURL"].ToString();
        }
        protected string _content;
        /// <summary>
        /// 内容
        /// </summary>
        public string content
        {
            get { return _content; }
            set { _content = value; }
        }
        protected string _code;
        /// <summary>
        /// 支付编号
        /// </summary>
        public string code {
            get { return _code; }
            set { _code = value; }
        }
        protected string _name;
        /// <summary>
        /// 支付名称
        /// </summary>
        public string Name {
            get { return _name; }
            set { _name = value; }
        }
        protected string _payAccount;
        /// <summary>
        /// 商户帐号
        /// </summary>
        public string payAccount
        {
            get { return _payAccount; }
            set { _payAccount = value; }
        }
        protected string _payID;
        /// <summary>
        /// 商户签约ID
        /// </summary>
        public string payID
        {
            get { return _payID; }
            set { _payID = value; }
        }
        protected string _paySafeCode;
        /// <summary>
        /// 安全检验码
        /// </summary>
        public string paySafeCode
        {
            get { return _paySafeCode; }
            set { _paySafeCode = value; }
        }
        protected string _sendURL;
        /// <summary>
        /// 支付首页
        /// </summary>
        public string sendURL
        {
            get { return _sendURL; }
            set { _sendURL = value; }
        }
        protected string _returnURL;
        /// <summary>
        /// 前台通知页面
        /// </summary>
        public string returnURL
        {
            get { return _returnURL; }
            set { _returnURL = value; }
        }
        protected string _notifyURL;
        /// <summary>
        /// 后台通知页面
        /// </summary>
        public string notifyURL
        {
            get { return _notifyURL; }
            set { _notifyURL = value; }
        }
    }
}