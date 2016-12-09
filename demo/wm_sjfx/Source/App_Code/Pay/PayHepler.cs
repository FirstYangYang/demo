using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using CSA.DAL;
namespace BLL.Pay
{
    /// <summary>
    ///PayHepler 的摘要说明
    /// </summary>
    public class PayHepler
    {
        public const string compare_key = "kdj9018";//用于验证信息传递的
        public PayHepler()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }
        /// <summary>
        /// 将发送的数据结合网站密匙进行加密码
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string dataEncrypt(string data)
        {
            return CSA.Security.Encrypt.getMD5(data + compare_key);
        }
        /// <summary>
        /// 检验数据
        /// </summary>
        /// <param name="data"></param>
        /// <param name="md5str"></param>
        /// <returns></returns>
        public static bool dataCheck(string data, string md5str)
        {
            return dataEncrypt(data) == md5str;
        }
        /// <summary>
        /// 获取可用的支付列表
        /// </summary>
        /// <returns></returns>
        public static List<PayEntity> getList()
        {
            List<PayEntity> lst = new List<PayEntity>();
            string sql = "select * from sy_pay where status=0 order by sortno,id";
            using (DataTable dt = DBAccess.getRS(sql))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    lst.Add(new PayEntity(dr));
                }
            }
            return lst;
        }
    }
}