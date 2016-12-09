using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace BLL.Article
{
    /// <summary>
    /// Article 的摘要说明
    /// </summary>
    public class Article
    {
        private static string detailTbl = "bs_news";
        private static string kindTbl = "bs_newskind";

        public Article()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        /// <summary>
        /// 获取文章列表
        /// </summary>
        /// <param name="code">文章类别编码,null或者""则返回全部</param>
        /// <param name="pagesize">条数size,0则返回全部</param>      
        /// <returns></returns>
        public static DataTable getArticle(string code, int size)
        {
            string top = size > 0 ? " top " + size : "";
            string where = "";
            if (code != null && code != "")
            {
                where = " and bs_newsKindCode like '" + CSA.Text.Util.getSqlStr(code) + "%'";
            }

            string sql = "select " + top + " * from " + detailTbl + " where status=0 " + where + " order by sortno desc,addTime desc";
            return CSA.DAL.DBAccess.getRS(sql);
        }
        /// <summary>
        /// 获取文章列表
        /// </summary>
        /// <param name="code">文章类别编码,null或者""则返回全部</param>
        /// <param name="pagesize">条数size,0则返回全部</param>      
        /// <returns></returns>
        public static DataTable getArticle(string code, int size, string orderby, string px)
        {
            string top = size > 0 ? " top " + size : "";
            string where = "";
            if (!string.IsNullOrEmpty(orderby) && !string.IsNullOrEmpty(px))
            {
                orderby = " " + orderby + " " + px + ", ";
            }
            else if (!string.IsNullOrEmpty(orderby))
            {
                orderby = " " + orderby+ ", ";
            }
            else
            {
                orderby = "";
            }
            if (code != null && code != "")
            {
                where = " and bs_newsKindCode like '" + CSA.Text.Util.getSqlStr(code) + "%'";
            }

            string sql = "select " + top + " * from " + detailTbl + " where status=0 " + where + " order by " + orderby + " id desc";
            return CSA.DAL.DBAccess.getRS(sql);
        }
        public static DataTable getArticle(string code, int size, string orderbystr)
        {
            return getArticle(code, size, orderbystr,null);
        }
        /// <summary>
        /// 获取文章内容
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataRow getArticleDetail(int id)
        {
            return getArticleDetail(id, "");
        }
        public static DataRow getArticleDetail(int id, string language
)
        {
            DataTable dtTemp= CSA.DAL.DBAccess.getRS("select top 1 * from " + detailTbl + language
+" where id=" + id);
            if (dtTemp.Rows.Count > 0 && dtTemp != null)
                return dtTemp.Rows[0];
            else
                return null;
        }
        /// <summary>
        /// 获取文章内容
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataRow getArticleDetail(string kindCode)
        {
            DataTable dt = CSA.DAL.DBAccess.getRS("select top 1 * from " + detailTbl + " where bs_Newskindcode='" + kindCode + "'");
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            return null;
        }
        /// <summary>
        /// 加点击数
        /// </summary>
        /// <param name="id"></param>
        public static int addHit(int id)
        {
            return CSA.DAL.DBAccess.ExecuteNonQuery("update " + detailTbl + " set hits=isnull(hits,0)+1 where id=" + id);
        }
        /// <summary>
        /// 获取文章内容
        /// </summary>
        /// <param name="id">文章ID</param>
        /// <returns></returns>
        public static string getArticeContent(int id)
        {
            try
            {
                return CSA.DAL.DBAccess.ExecuteScalar("select content from " + detailTbl + " where id=" + id).ToString().Replace("../", "");
            }
            catch
            {
                return "";
            }
        }
        /// <summary>
        /// 获取文章类别名称
        /// </summary>
        /// <param name="code">类别编码</param>
        /// <returns></returns>
        public static string getArticleKindName(string code)
        {
            return CSA.DAL.DBAccess.ExecuteScalar("select name from " + kindTbl + " where code='"
                + CSA.Text.Util.getSqlStr(code) + "'").ToString();
        }

        public static DataTable getSearchResult(string keyword)
        {
            string sql = "select * from " + detailTbl + " where (title like '%"
                + CSA.Text.Util.getSqlStr(keyword) + "%' or content like '%" + CSA.Text.Util.getSqlStr(keyword) + "%') and pcode<>'05' order by xuhao,id desc";
            return CSA.DAL.DBAccess.getRS(sql);
        }

        /// <summary>
        /// 获取上一篇文章
        /// </summary>
        /// <param name="dr">当前文章</param>
        /// <returns></returns>
        public static DataTable getPackArtice(DataRow dr)
        {
            DataTable dt = CSA.DAL.DBAccess.getRS(string.Format("select top 1 id,Title,Title_en,bs_NewskindCode from bs_News where bs_NewsKindCode='{0}' and sortno = {1} and id>{2} order by sortno,id", dr["Bs_NewsKindCode"].ToString(), Convert.ToInt32(dr["SortNo"].ToString()), Convert.ToInt32(dr["id"].ToString())));
            if (dt.Rows.Count > 0)
                return dt;
            else
                return CSA.DAL.DBAccess.getRS(string.Format("select top 1 id,Title,Title_en,bs_NewskindCode from bs_News where bs_NewsKindCode='{0}' and sortno > {1} and id<>{2} order by sortno,id", dr["Bs_NewsKindCode"].ToString(), Convert.ToInt32(dr["SortNo"].ToString()), Convert.ToInt32(dr["id"].ToString())));
        }
        /// <summary>
        /// 获取上一篇文章链接
        /// </summary>
        /// <param name="dr">当前文章</param>
        /// <param name="PageName">页面名称</param>
        /// <param name="lan">语言,true为中文</param>
        /// <returns></returns>
        public static string getPackArticeLink(DataRow dr, string PageName,bool lan)
        {
            string links = "";
            string Tit_lan="";
            if (lan)
            {
                links = "已经到顶了";
                Tit_lan = "Title";
            }
            else 
            {
                links = "Null";
                Tit_lan = "Title_en";
            }

            DataTable dt = getPackArtice(dr);
            if (dt.Rows.Count > 0)
            {
                links = "<a href='" + PageName + ".aspx?id=" + dt.Rows[0]["id"] + "&code=" + dt.Rows[0]["Bs_NewsKindCode"] + "' title='" + dt.Rows[0][Tit_lan] + "'>" + CSA.Text.Util.SubString(50, dt.Rows[0][Tit_lan]) + "</a>";
            }
            return links;
        }
        /// <summary>
        /// 获取下一篇文章
        /// </summary>
        /// <param name="id">当前文章id</param>
        /// <param name="kindCode">当前文章分类</param>
        /// <returns></returns>
        public static DataTable getNextArtice(DataRow dr)
        {
            DataTable dt = CSA.DAL.DBAccess.getRS(string.Format("select top 1 id,Title,Title_en,bs_NewskindCode from bs_News where bs_NewskindCode='{0}' and sortno = {1} and id<{2} order by sortno desc,id desc", dr["Bs_NewsKindCode"].ToString(), Convert.ToInt32(dr["SortNo"].ToString()), Convert.ToInt32(dr["id"].ToString())));
            if (dt.Rows.Count > 0)
                return dt;
            else
                return CSA.DAL.DBAccess.getRS(string.Format("select top 1 id,Title,Title_en,bs_NewskindCode from bs_News where bs_NewskindCode='{0}' and sortno < {1} and id<>{2} order by sortno desc,id desc", dr["Bs_NewsKindCode"].ToString(), Convert.ToInt32(dr["SortNo"].ToString()), Convert.ToInt32(dr["id"].ToString())));
        }
        public static string getNextArticeLink(DataRow dr, string PageName,bool lan)
        {
            string links = "";
            string Tit_lan = "";
            if (lan)
            {
                links = "已经到底了";
                Tit_lan = "Title";
            }
            else
            {
                links = "Null";
                Tit_lan = "Title_en";
            }
            DataTable dt = getNextArtice(dr);
            if (dt.Rows.Count > 0)
            {
                links = "<a href='" + PageName + ".aspx?code=" + dt.Rows[0]["Bs_NewsKindCode"] + "&id=" + dt.Rows[0]["id"] + "' title='" + dt.Rows[0][Tit_lan] + "'>" + CSA.Text.Util.SubString(50, dt.Rows[0][Tit_lan]) + "</a>";
            }
            return links;
        }

        /// <summary>
        /// 获取分类Code
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static string GetBsNewsKindCode(int id)
        {
            string sql = "select bs_newsKindCode from bs_news where id={0}";
            sql = string.Format(sql, id);
            return CSA.DAL.DBAccess.getRS(sql).Rows[0][0].ToString();
        }

    }
}