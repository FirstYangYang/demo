using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_dizhi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Com.Util.getStringByObject(Request["action"]);

        if (CurInfo.CurUser == null)
        {
            Response.Redirect("login.aspx?from=address.aspx");
        }

        if (action == "del")
        {
            string id = Request.Form["id"];
            string sql = "delete bs_useraddress where id=" + id + "";

            if (CSA.DAL.DBAccess.ExecuteNonQuery(sql) > 0)
                Response.Write("{\"status\":\"success\",\"content\":\"删除成功！\"}");

            else
                Response.Write("{\"status\":\"error\",\"content\":\"提交失败！\"}");


        }
        if (action == "edit")
        {

            CSA.DAL.SQLBuilder builder = new CSA.DAL.SQLBuilder("Bs_userAddress");

            string hid = Request.Form["hid"];

          

            string city = Request.Form["city"];
            string[] s = city.Split('/');

            builder.AddData("CsgProv", s[0]);
            builder.AddData("CsgCity", s[1]);
            builder.AddData("CsgCounty", s[2]);
            builder.AddData("CsgAddress", Request.Form["KK_CsgAddress"]);
            builder.AddData("CsgPostcode", Request.Form["KK_CsgPostcode"]);
            builder.AddData("CsgTel", Request.Form["KK_CsgTel"]);
            builder.AddData("CsgMobile", Request.Form["KK_CsgMobile"]);
            builder.AddData("CsgName", Request.Form["KK_CsgName"]);

            builder.AddData("IsCheck", Request.Form["KK_IsCheck"]);


            builder.AddData("uid", CurInfo.CurUser.ID);

            if (!string.IsNullOrEmpty(hid))
            {
                builder.Where = " and id=" + hid;
                if (builder.AutoUpdate())
                    Response.Write("{\"status\":\"success\",\"content\":\"地址保存成功！\"}");

                else
                    Response.Write("{\"status\":\"error\",\"content\":\"提交失败！\"}");


            }
            else
            {


                if (builder.AutoInsert())
                    Response.Write("{\"status\":\"success\",\"content\":\"地址保存成功！\"}");

                else
                    Response.Write("{\"status\":\"error\",\"content\":\"提交失败！\"}");

            }
          

        }
        if (action == "modify")
        {
            string id = Request.Form["id"];
            System.Data.DataTable dt;
            dt = CSA.DAL.DBAccess.getRS("select * from bs_useraddress where id="+id);

            if (dt.Rows.Count>0)
                Response.Write("{\"status\":\"success\",\"CsgProv\":\"" + dt.Rows[0]["CsgProv"] + "\",\"CsgCity\":\"" + dt.Rows[0]["CsgCity"] + "\",\"CsgCounty\":\"" + dt.Rows[0]["CsgCounty"] + "\",\"CsgAddress\":\"" + dt.Rows[0]["CsgAddress"] + "\",\"CsgPostcode\":\"" + dt.Rows[0]["CsgPostcode"] + "\",\"CsgTel\":\"" + dt.Rows[0]["CsgTel"] + "\",\"CsgMobile\":\"" + dt.Rows[0]["CsgMobile"] + "\",\"IsCheck\":\"" + dt.Rows[0]["IsCheck"] + "\",\"CsgName\":\"" + dt.Rows[0]["CsgName"] + "\"}");

            else
                Response.Write("{\"status\":\"error\",\"content\":\"读取失败！\"}");
           
        }

    }
}