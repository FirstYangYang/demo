﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace BLL.Product
{
    /// <summary>
    /// Product 的摘要说明
    /// </summary>
    public class Product
    {
        public Product()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        /// <summary>
        /// 按
        /// </summary>
        /// <param name="parentId"></param>
        /// <returns></returns>
        public DataTable GetProCommonByParentID(int parentId)
        {
            return null;
        }

        /// <summary>
        /// 按产品ID来获得产品
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataRow GetByID(int id)
        {
            string sql = string.Format(@"select bs_products.*,bs_ProKind.Name as KindName
                                            from bs_products
                                            join bs_ProKind on (bs_ProKind.Code=bs_products.bs_ProKindCode)
                                            where bs_products.id = {0}", id);
            DataTable dt = CSA.DAL.DBAccess.getRS(sql);
            if (dt != null && dt.Rows.Count != 0)
                return dt.Rows[0];
            else
                return null;

        }

        /// <summary>
        /// 按条件查询商品
        /// </summary>
        /// <param name="condition"></param>
        /// <param name="num"></param>
        /// <returns></returns>
        public static DataTable GetByCondition(string condition, int num)
        {
            return GetByCondition(condition, num, "");
        }
        public static DataTable GetByCondition(string condition, int num, string orderBy)
        {
            string top = "";
            string order = " order by sortNo";
            if (num != 0)
                top = "top " + num;
            if (orderBy != "")
                order = " order by "+orderBy;
            string sql = string.Format("select {1} * from bs_products where {0} and status=0 {2}", condition, top, order);
            return CSA.DAL.DBAccess.getRS(sql);
        }
        public static DataTable ProByCondition(string condition, int num, string orderBy)
        {
            string top = "";
            string order = " order by bs_products.sortNo";
            if (num != 0)
                top = "top " + num;
            if (orderBy != "")
                order = " order by " + orderBy;
            string sql = string.Format(@"select {1} *,Series.name SeriesName,Color.name ColorName from bs_products
                      left join Bs_ProProperty Series on (Series.Code=bs_products.Series) 
                      left join Bs_ProProperty Color on (Color.Code=bs_products.Color) 
                      where {0} and bs_products.status=0 {2}", condition, top, order);
            return CSA.DAL.DBAccess.getRS(sql);
        }
        /// <summary>
        ///  按条件查询商品ＳＱＬ
        /// </summary>
        /// <param name="condition"></param>
        /// <param name="num"></param>
        /// <returns></returns>
        public static String ToCondtion(string condition, int num)
        {
            string top = "";
            if (num != 0)
                top = "top " + num;
            string sql = string.Format("select {1} * from bs_products where {0} order by sortNo", condition, top);
            return sql;



        }

        /// <summary>
        /// 按商品类型编号及文本查询商品的ＳＱＬ
        /// </summary>
        /// <param name="kindCode"></param>
        /// <param name="searchText"></param>
        /// <returns></returns>
        public static String ToByNameBrandKind(string kindCode, string searchText)
        {
            string sql = string.Format(@"select bs_products.* from bs_products join bs_prokind on(bs_products.Bs_prokindcode=bs_prokind.code)
                    where (bs_products.Name like '%{0}%' or bs_prokind.Name like '%{0}%' or bs_products.Code like '%{0}%') and bs_products.bs_prokindcode like '" + kindCode + "%'", searchText);
            return sql;
        }
        /// <summary>
        /// 按商品品牌编号及文本查询商品的ＳＱＬ
        /// </summary>
        /// <param name="kindCode"></param>
        /// <param name="searchText"></param>
        /// <returns></returns>
        public static String ToByNameBrandCode(string kindCode, string searchText)
        {
            string sql = string.Format(@"select bs_products.* from bs_products join bs_prokind on(bs_products.Bs_BrandCode=bs_prokind.code)
                    where (bs_products.Name like '%{0}%' or bs_prokind.Name like '%{0}%' or bs_products.Code like '%{0}%') and bs_products.Bs_BrandCode like '" + kindCode + "%'", searchText);
            return sql;
        }


        /// <summary>
        /// 按商品类型编号及文本查询商品
        /// </summary>
        /// <param name="kindCode"></param>
        /// <param name="searchText"></param>
        /// <returns></returns>
        public static DataTable GetByNameBrandKind(string kindCode, string searchText)
        {
            string sql = string.Format(@"select bs_products.* from bs_products join bs_Brand on(bs_products.Bs_BrandCode=bs_Brand.code)
                    where (bs_products.Name like '%{0}%' or bs_Brand.Name like '%{0}%' or bs_products.Code like '%{0}%') and bs_products.bs_proKindCode = '" + kindCode + "'", searchText);
            return CSA.DAL.DBAccess.getRS(sql);
        }

        /// <summary>
        /// 添加收藏商品
        /// </summary>
        /// <param name="userId">会员ID</param>
        /// <param name="ProductId">商品ID</param>
        /// <returns>添加成功返回true</returns>
        public static bool AddProFav(int userId, int ProductId)
        {
            string sql = string.Format("insert into bs_ProFav(bs_userId,bs_ProductsId)values({0},{1})", userId, ProductId);
            return CSA.DAL.DBAccess.ExecuteNonQuery(sql) > 0;

        }

        /// <summary>
        /// 按会员的ID及商品的ID来查询收藏的商品是否存在
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="ProductId"></param>
        /// <returns></returns>
        public static DataRow GetProFav(int userId, int ProductId)
        {
            string sql = string.Format("select * from bs_ProFav where bs_UserId = {0} and bs_ProductsId = {1}", userId, ProductId);
            DataTable dt = CSA.DAL.DBAccess.getRS(sql);
            if (dt != null && dt.Rows.Count != 0)
                return dt.Rows[0];
            return null;


        }

        /// <summary>
        /// 按会员的ID来查询所有的收藏商品
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static DataTable GetProFavByUserId(int userId)
        {
            string sql = string.Format("select bs_Products.* from bs_ProFav" +
                " join bs_Products on(bs_ProFav.bs_ProductsID=bs_Products.ID)" +
                " where bs_ProFav.bs_UserID = {0}", userId);
            return CSA.DAL.DBAccess.getRS(sql);
        }

        /// <summary>
        /// 按会员的ID及产品的ID删除收藏的商品
        /// </summary>
        /// <param name="userId">会员ID</param>
        /// <param name="productId">商品ID</param>
        /// <returns>成功返回true</returns>
        public static bool DeleteProFav(int userId, int productId)
        {
            string sql = string.Format("delete from bs_ProFav where bs_UserId = {0} and bs_ProductsId= {1}", userId, productId);
            return CSA.DAL.DBAccess.ExecuteNonQuery(sql) > 0;
        }
        /// <summary>
        /// 获取热门关键字
        /// </summary>
        /// <returns>关键字</returns>
        public static DataTable GetProFel()
        {
            string sql = "select keyCode from bs_proFel where status='0' order by sortNo";
            return CSA.DAL.DBAccess.getRS(sql);

        }
        /// <summary>
        /// 获取热销产品
        /// </summary>
        /// <param name="size">条数</param>
        /// <returns>DataTable 产品的ID</returns>
        public static DataTable GetHotPro(int size)
        {
            string top = "";
            if (size != 0)
                top = "top " + size;
            string sql = "select {0} sum(ord.quantity) as b,BS_productscode as proCode from BS_ordersDtl ord inner join bs_products pro on(ord.BS_productsCode=pro.id) GROUP BY BS_productscode order by b desc";
            sql = string.Format(sql, top);
            DataTable dtTemp = CSA.DAL.DBAccess.getRS(sql);
            string getProSql = "select * from bs_products where id in({0}) and status=0";
            string condition = "";
            foreach (DataRow dr in dtTemp.Rows)
            {
                condition += dr["proCode"].ToString() + ",";
            }
            condition = condition.Substring(0, condition.Length - 1);
            getProSql = string.Format(getProSql, condition);
            return CSA.DAL.DBAccess.getRS(getProSql);
        }
        /// <summary>
        /// 加点击数
        /// </summary>
        /// <param name="id"></param>
        public static int addHit(int id)
        {
            return CSA.DAL.DBAccess.ExecuteNonQuery("update bs_products set hits=ifnull(hits,0)+1 where id=" + id);
        }
        public static double GetPrice(string pkid, int num)
        {
            string sql = "select price from bs_proprice where bs_products_pkid='{0}' and (startNum >={1} and startNum<={1})";
            sql = string.Format(sql, pkid, num, num);
            DataTable dt = CSA.DAL.DBAccess.getRS(sql);
            if (dt != null && dt.Rows.Count != 0)
            {
                return Convert.ToDouble(dt.Rows[0][0]);
            }
            return 0d;
        }

        /// <summary>
        /// 获取上一篇文章
        /// </summary>
        /// <param name="id">当前文章id</param>
        /// <param name="kindCode">当前文章分类</param>
        /// <returns></returns>
        public static DataTable getPackArtice(DataRow dr)
        {
            DataTable dt = CSA.DAL.DBAccess.getRS(string.Format("select top 1 id,Name,Name_en,bs_ProkindCode from bs_products where Bs_ProKindCode='{0}' and sortno = {1} and id>{2} order by sortno,id", dr["Bs_ProKindCode"].ToString(), Convert.ToInt32(dr["SortNo"].ToString()), Convert.ToInt32(dr["id"].ToString())));
            if (dt.Rows.Count > 0)
                return dt;
            else
                return CSA.DAL.DBAccess.getRS(string.Format("select top 1 id,Name,Name_en,bs_ProkindCode from bs_products where Bs_ProKindCode='{0}' and sortno > {1} and id<>{2} order by sortno,id", dr["Bs_ProKindCode"].ToString(), Convert.ToInt32(dr["SortNo"].ToString()), Convert.ToInt32(dr["id"].ToString())));
        }
        public static string getPackProLink(DataRow dr, string PageName,bool lan)
        {
            string links = "";
            string Tit_lan = "";
            if (lan)
            {
                links = "已经到顶了";
                Tit_lan = "Name";
            }
            else
            {
                links = "Null";
                Tit_lan = "Name_en";
            }

            DataTable dt = getPackArtice(dr);
            if (dt.Rows.Count > 0)
            {
                links = "<a href='" + PageName + ".aspx?id=" + dt.Rows[0]["id"] + "' title='" + dt.Rows[0][Tit_lan] + "'>" + CSA.Text.Util.SubString(50, dt.Rows[0][Tit_lan]) + "</a>";
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
            DataTable dt = CSA.DAL.DBAccess.getRS(string.Format("select top 1 id,Name,Name_en,bs_prokindCode from bs_products where bs_proKindCode='{0}' and sortno = {1} and id<{2} order by sortno desc,id desc", dr["Bs_ProKindCode"].ToString(), Convert.ToInt32(dr["SortNo"].ToString()), Convert.ToInt32(dr["id"].ToString())));
            if (dt.Rows.Count > 0)
                return dt;
            else
                return CSA.DAL.DBAccess.getRS(string.Format("select top 1 id,Name,Name_en,bs_prokindCode from bs_products where bs_proKindCode='{0}' and sortno < {1} and id<>{2} order by sortno desc,id desc", dr["Bs_ProKindCode"].ToString(), Convert.ToInt32(dr["SortNo"].ToString()), Convert.ToInt32(dr["id"].ToString())));
        }
        public static string getNextProLink(DataRow dr, string PageName,bool lan)
        {
            string links = "";
            string Tit_lan = "";
            if (lan)
            {
                links = "已经到底了";
                Tit_lan = "Name";
            }
            else
            {
                links = "Null";
                Tit_lan = "Name_en";
            }

            DataTable dt = getNextArtice(dr);
            if (dt.Rows.Count > 0)
            {
                links = "<a href='" + PageName + ".aspx?id=" + dt.Rows[0]["id"] + "' title='" + dt.Rows[0][Tit_lan] + "'>" + CSA.Text.Util.SubString(50, dt.Rows[0][Tit_lan]) + "</a>";
            }
            return links;
        }
    }
}