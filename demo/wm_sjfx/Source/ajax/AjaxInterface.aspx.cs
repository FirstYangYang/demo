using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using CSA.DAL;
using Com;
using System.IO;
using System.Net;
using System.Text;

public partial class ajax_AjaxInterface : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Com.Util.getStringByObject(Request["action"]);
        string Get_Authcode = "";
        string Sys_Authcode = "";
        DataTable dt;
        SQLBuilder builder = new CSA.DAL.SQLBuilder();
        SQLBuilder builder2 = new CSA.DAL.SQLBuilder();

        switch (action)
        {
            case "addMsg":
                if (Request.Form["checkcode"].ToString().ToLower() == Session[Common.HNKeys.SESSION_CODE].ToString().ToLower())
                {
                    builder = new CSA.DAL.SQLBuilder("Bs_Msg");
                    builder.AddData("IP", CSA.HC.Common.getIP());
                    builder.AddData("Name", Com.Util.getStringByObject(Request.Form["name"]));
                    builder.AddData("Email", Com.Util.getStringByObject(Request.Form["email"]));
                    builder.AddData("Phone", Com.Util.getStringByObject(Request.Form["phone"]));
                    builder.AddData("Company", Com.Util.getStringByObject(Request.Form["company"]));
                    builder.AddData("Content", Com.Util.getStringByObject(Request.Form["content"]));
                    builder.AddData("addtime", DateTime.Now.ToString("s"));
                    builder.AddData("Sy_CodeMT", "0101");

                    if (builder.AutoInsert())
                        Response.Write("{\"status\":\"success\",\"content\":\"提交成功！\"}");
                    else
                        Response.Write("{\"status\":\"error\",\"content\":\"提交失败！\"}");
                }
                else
                    Response.Write("{\"status\":\"error\",\"content\":\"验证码错误！\"}");
                break;

            #region ========= out 登出
            case "logout":
                Factory.getUserBllInstance().logout();
                Response.Write("{\"status\":\"success\",\"content\":\"退出成功！\"}");
                break;
            #endregion

            #region ========= log 登陆
            case "log"://登陆
                Get_Authcode = Com.Util.getStringByObject(Request.Form["checkcode"]).ToLower();
                Sys_Authcode = Com.Util.getStringByObject(Session[Common.HNKeys.SESSION_CODE]).ToLower();

                string login_name = Com.Util.getStringByObject(Request.Form["mobile"]);
                string login_pwd = Com.Util.getStringByObject(Request.Form["password"]);

                if (Get_Authcode == Sys_Authcode)
                {
                    if (login_name == "" || login_name == "")
                        Response.Write("{\"status\":\"error\",\"content\":\"读取登陆信息失败，请重新登陆！\"}");
                    else
                    {
                        if (CurInfo.CurUser != null)
                            Factory.getUserBllInstance().logout();

                        Bs_User user = new Bs_User();
                        user.Mobile = login_name;
                        user.Password = login_pwd;
                        user.Bs_UserGradeCode = "01";
                        Factory.getUserBllInstance().login(user);

                        if (CurInfo.CurUser == null)
                            Response.Write("{\"status\":\"error\",\"content\":\"账号或密码错误！\"}");
                        else
                        {
                            Response.Write("{\"status\":\"success\",\"content\":\"登陆成功！\"}");
                        }
                    }
                }
                else
                {
                    Response.Write("{\"status\":\"error\",\"content\":\"验证码错误！\"}");
                    return;
                }
                break;
            #endregion

            #region ========= reg 注册
            case "reg"://注册
                Get_Authcode = Com.Util.getStringByObject(Request.Form["msgcode"]).ToLower();
                string Name = Com.Util.getStringByObject(Request.Form["mobile"]);
                string Pwd = Com.Util.getStringByObject(Request.Form["password"]);

                try
                {
                    if (Name == "" || Pwd == "" || Get_Authcode == "")
                        Response.Write("{\"status\":\"error\",\"content\":\"参数不能为空\"}");
                    else {
                        StringBuilder sqlStr = new StringBuilder();
                        //sqlStr.Append(string.Format("select top 1 MsCode from Bs_SMSCode where mobile='{0}' and DateDiff (minute,AddTime,'{1}')<=0 order by AddTime desc;", Name, DateTime.Now.AddMinutes(-20)));
                        sqlStr.Append(string.Format("select id from Bs_User where mobile='{0}' and Bs_UserGradeCode='{1}'", Name, "01"));
                        DataSet ds = CSA.DAL.DBAccess.getDS(sqlStr.ToString());

                        //DataTable dt1 = ds.Tables[0];
                        DataTable dt2 = ds.Tables[0];

                        //if (dt1.Rows.Count > 0 && Com.Util.getStringByObject(dt1.Rows[0]["MsCode"]) == Get_Authcode)
                        //{
                            if (dt2.Rows.Count <= 0)
                            {
                                AutoNo ano = new AutoNo();
                                builder = new SQLBuilder("Bs_User");
                                builder.AddData("AddTime", DateTime.Now.ToString("s"));
                                builder.AddData("code", "CC" + ano.autoNo());
                                builder.AddData("name", "User_" + ano.autoNo());
                                builder.AddData("levelname", "User_" + ano.GenerateRandom(2) + new Random().Next(0, 9999));
                                builder.AddData("pkid", CSA.Text.Util.getNewGuid());
                                builder.AddData("mobile", Name);
                                builder.AddData("password", CSA.Security.Encrypt.getMD5(Pwd));
                                builder.AddData("Bs_UserGradeCode", "01");
                                builder.AddData("status", 1);
                                if (builder.AutoInsert())
                                {
                                    //DBAccess.ExecuteNonQuery(string.Format("delete Bs_SMSCode where mobile='{0}'", Name));

                                    Bs_User user = new Bs_User();
                                    user.Mobile = Name;
                                    user.Password = Pwd;
                                    user.Bs_UserGradeCode = "01";
                                    Factory.getUserBllInstance().login(user);

                                    if (CurInfo.CurUser != null)
                                        Response.Write("{\"status\":\"success\",\"content\":\"注册成功\"}");
                                    else
                                        Response.Write("{\"status\":\"error\",\"content\":\"获取用户信息失败！\"}");
                                }
                                else
                                    Response.Write("{\"status\":\"error\",\"content\":\"注册失败\"}");
                            }
                            else
                                Response.Write("{\"status\":\"error\",\"content\":\"该手机号码已被注册！\"}");
                        //}
                        //else
                        //    Response.Write("{\"status\":\"error\",\"content\":\"验证码错误或失效！\"}");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("{\"status\":\"error\",\"content\":\"" + ex.ToString() + "\"}");
                }
                break;
            #endregion

            #region ========= pwd 忘记密码
            case "pwd"://忘记密码
                Get_Authcode = Com.Util.getStringByObject(Request.Form["authcode"]).ToLower();
                string p_Name = Com.Util.getStringByObject(Request.Form["username"]);
                string p_Pwd = Com.Util.getStringByObject(Request.Form["pwd"]);

                if (Session["msg_code"] != null)
                {
                    if (Get_Authcode == Session["msg_code"].ToString())
                    {
                        if (p_Name != "" && p_Pwd != "")
                        {
                            Bs_User user = new Bs_User();
                            string sql = "select * from Bs_User where Name='" + p_Name + "'";
                            dt = CSA.DAL.DBAccess.getRS(sql);

                            if (dt.Rows.Count > 0)
                            {
                                Factory.getUserBllInstance().EditPwd(CSA.Security.Encrypt.getMD5(p_Pwd), Convert.ToInt32(dt.Rows[0]["ID"]));
                                Factory.getUserBllInstance().logout();
                                //SendMsg(p_Name, "安全提示：您的密码在" + DateTime.Now + "时被修改，如非本人操作，请联系管理处。【实体店导购】");
                                Response.Write("{\"status\":\"success\",\"content\":\"修改成功,请使用新密码登陆!\"}");
                            }
                            else
                            {
                                Response.Write("{\"status\":\"error\",\"content\":\"找不到该用户！\"}");
                            }
                        }
                        else
                        {
                            Response.Write("{\"status\":\"error\",\"content\":\"读取信息失败！\"}");
                        }
                    }
                    else
                    {
                        Response.Write("{\"status\":\"error\",\"content\":\"验证码错误！\"}");
                    }
                }
                else
                {
                    Response.Write("{\"status\":\"error\",\"content\":\"读取验证码失败！\"}");
                }
                break;
            #endregion

            #region ========= editor_pwd 修改密码
            case "editor_pwd"://修改密码
                if (CurInfo.CurUser != null)
                {
                    Get_Authcode = Com.Util.getStringByObject(Request.Form["authcode"]).ToLower();
                    string old_Pwd = Com.Util.getStringByObject(Request.Form["o_pwd"]);
                    string new_Pwd = Com.Util.getStringByObject(Request.Form["n_pwd"]);

                    if (Session[Common.HNKeys.SESSION_CODE] != null)
                    {
                        if (Get_Authcode == Session[Common.HNKeys.SESSION_CODE].ToString().ToLower())
                        {
                            if (old_Pwd != "" && new_Pwd != "")
                            {
                                Bs_User user = new Bs_User();
                                string sql = "select id from Bs_User where id=" + CurInfo.CurUser.ID + " and Password='" + CSA.Security.Encrypt.getMD5(old_Pwd) + "'";
                                dt = CSA.DAL.DBAccess.getRS(sql);

                                if (dt.Rows.Count > 0)
                                {
                                    Factory.getUserBllInstance().EditPwd(CSA.Security.Encrypt.getMD5(new_Pwd), Convert.ToInt32(dt.Rows[0]["ID"]));
                                    Factory.getUserBllInstance().logout();
                                    Response.Write("{\"status\":\"success\",\"content\":\"修改成功,请重新登陆！\"}");
                                }
                                else
                                {
                                    Response.Write("{\"status\":\"error\",\"content\":\"用户名或密码错误！\"}");
                                }
                            }
                            else
                            {
                                Response.Write("{\"status\":\"error\",\"content\":\"读取信息失败！\"}");
                            }
                        }
                        else
                        {
                            Response.Write("{\"status\":\"error\",\"content\":\"验证码错误！\"}");
                        }
                    }
                    else
                    {
                        Response.Write("{\"status\":\"error\",\"content\":\"读取验证码失败！\"}");
                    }
                }
                else
                {
                    Response.Write("{\"status\":\"error\",\"content\":\"登陆信息已失效，请重新登陆！\"}");
                }
                break;
            #endregion

            #region ========= editor_info 修改个人信息
            case "editor_info"://修改个人信息
                if (CurInfo.CurUser != null)
                {
                    string info_name = Com.Util.getStringByObject(Request.Form["name"]);
                    string info_sex = Com.Util.getStringByObject(Request.Form["sex"]);
                    string info_email = Com.Util.getStringByObject(Request.Form["email"]);
                    string info_address = Com.Util.getStringByObject(Request.Form["address"]);

                    builder = new CSA.DAL.SQLBuilder("Bs_User");
                    builder.AddData("realname", info_name);
                    builder.AddData("sex", info_sex);
                    builder.AddData("email", info_email);
                    builder.AddData("address", info_address);
                    builder.Where = string.Format(" and {0}={1}", "id", CurInfo.CurUser.ID);

                    if (builder.AutoUpdate())
                    {
                        Bs_UserDao dao = new Bs_UserDao();
                        Bs_User user = dao.getUserByID(CurInfo.CurUser.ID);
                        if (user != null)
                            CurInfo.CurUser = user;

                        Response.Write("{\"status\":\"success\",\"content\":\"修改个人信息成功！\"}");
                    }
                    else
                        Response.Write("{\"status\":\"error\",\"content\":\"修改个人信息失败！\"}");
                }
                else
                {
                    Response.Write("{\"status\":\"error\",\"content\":\"参数错误！\"}");
                }
                break;
                #endregion
        }
    }
}