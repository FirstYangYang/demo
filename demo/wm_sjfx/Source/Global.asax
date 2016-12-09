<%@ Application Language="C#" %>
<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        //在应用程序启动时运行的代码

    }

    void Application_End(object sender, EventArgs e)
    {
        //在应用程序关闭时运行的代码

    }

    void Application_Error(object sender, EventArgs e)
    {
        //在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        //在新会话启动时运行的代码
    }

    void Session_End(object sender, EventArgs e)
    {
        //在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式 
        //设置为 StateServer 或 SQLServer，则不会引发该事件。

    }
    ///  <summary>          
    /// 在 Application_BeginRequest中加入函数StartProcessRequest()        
    ///  </summary>          
    protected void Application_BeginRequest(Object sender, EventArgs e)
    {
     string curpage = Request.ServerVariables["SCRIPT_NAME"];
     if (!curpage.ToLower().Contains("ad8888"))
     {
         StartProcessRequest();
     }

    }
    #region SQL注入式攻击代码分析
    ///  <summary>          
    /// 处理用户提交的请求         
    ///  </summary>          
    private void StartProcessRequest()
    {
        try
        {
            string curpage = HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"];
            //string q = "<div style='position:fixed;top:0px;width:100%;height:100%;background-color:white;color:green;font-weight:bold;border-bottom:5px solid #999;'><br>您的提交带有不合法参数,谢谢合作!<br></div>";
            StringBuilder illegalRequest = null;
            if (HttpContext.Current.Request.UrlReferrer != null)
            {
                bool result = false;
                result = ProcessSqlStr(HttpContext.Current.Request.UrlReferrer.ToString());
                if (result)
                {

                    illegalRequest = new StringBuilder();
                    illegalRequest.Append("非法操作！系统做了如下记录 ↓<br/>");
                    illegalRequest.AppendFormat("操 作 I P ：{0}<br/>",HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]);
                    illegalRequest.AppendFormat("操 作 时 间：{0}<br/>", DateTime.Now.ToString());
                    illegalRequest.AppendFormat("操 作 页 面：" + HttpContext.Current.Request.ServerVariables["URL"] + "<br/>");
                    illegalRequest.AppendFormat("提 交 方 式：UrlReferrer<br/>");
                    illegalRequest.AppendFormat("提 交 数 据：{0}<br/><br/>", HttpContext.Current.Request.UrlReferrer.ToString());
                    illegalRequest.Append("<hr/><br/><br/>");
                    WriteIllegalRequestLog(illegalRequest.ToString());
                    HttpContext.Current.Response.Redirect("/");

                    HttpContext.Current.Response.End();
                }

            }
            if (HttpContext.Current.Request.Cookies != null)
            {
                for (int i = 0; i < HttpContext.Current.Request.Cookies.Count; i++)
                {
                    bool result = false;
                    result = ProcessSqlStr(HttpContext.Current.Request.Cookies[i].Value.ToLower());
                    if (result)
                    {

                        illegalRequest = new StringBuilder();
                        illegalRequest.Append("非法操作！系统做了如下记录 ↓<br/>");
                        illegalRequest.AppendFormat("操 作 I P ：{0}<br/>",HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]);
                        illegalRequest.AppendFormat("操 作 时 间：{0}<br/>", DateTime.Now.ToString());
                        illegalRequest.AppendFormat("操 作 页 面：" + HttpContext.Current.Request.ServerVariables["URL"] + "<br/>");
                        illegalRequest.AppendFormat("提 交 方 式：Cookies <br/>");
                        illegalRequest.AppendFormat("提 交 数 据：{0}<br/>", HttpContext.Current.Request.Cookies);
                        WriteIllegalRequestLog(illegalRequest.ToString());
                        HttpContext.Current.Response.Redirect("/");

                        HttpContext.Current.Response.End();

                    }
                }
            }
            if (HttpContext.Current.Request.RequestType.ToUpper() == "POST")
            {
                for (int i = 0; i < HttpContext.Current.Request.Form.Count; i++)
                {
                    bool result = false;
                    result = ProcessSqlStr(HttpContext.Current.Request.Form[i].ToString());

                    if (result)
                    {

                        illegalRequest = new StringBuilder();
                        illegalRequest.Append("非法操作！系统做了如下记录 ↓<br/>");
                        illegalRequest.AppendFormat("操 作 I P ：{0}<br/>",HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]);
                        illegalRequest.AppendFormat("操 作 时 间：{0}<br/>", DateTime.Now.ToString());
                        illegalRequest.AppendFormat("操 作 页 面：" + HttpContext.Current.Request.ServerVariables["URL"] + "<br>");
                        illegalRequest.AppendFormat("提 交 方 式：P O S T <br/>");
                        illegalRequest.AppendFormat("提 交 数 据：{0}<br/>", HttpContext.Current.Request.Form);
                        illegalRequest.Append("<hr/><br/><br/>");
                        WriteIllegalRequestLog(illegalRequest.ToString());
                        HttpContext.Current.Response.Redirect("/");

                        HttpContext.Current.Response.End();

                    }
                }
            }
            if (HttpContext.Current.Request.RequestType.ToUpper() == "GET")
            {
                for (int i = 0; i < HttpContext.Current.Request.QueryString.Count; i++)
                {
                    bool result = false;
                    result = ProcessSqlStr(HttpContext.Current.Request.QueryString[i].ToString());
                    if (result)
                    {

                        illegalRequest = new StringBuilder();
                        illegalRequest.Append("非法操作！系统做了如下记录 ↓<br/>");
                        illegalRequest.AppendFormat("操 作 I P ：{0}<br/>",HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]);
                        illegalRequest.AppendFormat("操 作 时 间：{0}<br/>", DateTime.Now.ToString());
                        illegalRequest.AppendFormat("操 作 页 面：" + HttpContext.Current.Request.ServerVariables["URL"] + "<br/>");
                        illegalRequest.AppendFormat("提 交 方 式：G E T <br/>");
                        illegalRequest.AppendFormat("提 交 数 据：{0}<br/><br/>", HttpContext.Current.Request.QueryString);
                        illegalRequest.Append("<hr/><br/><br/>");
                        WriteIllegalRequestLog(illegalRequest.ToString());
                        HttpContext.Current.Response.Redirect("/");

                        HttpContext.Current.Response.End();

                    }
                }
            }


        }
        catch
        {
            // 错误处理: 处理用户提交信息!             
        }
    }

    ///  <summary>          
    /// 分析用户请求是否正常          
    ///  </summary>          
    ///  <param name="Str">传入用户提交数据  </param>          
    ///  <returns>返回是否含有SQL注入式攻击代码  </returns>   
    private bool ProcessSqlStr(string inputData)
    {
        const string StrRegex = @"\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|<|>|'|<\/\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)";
        if (Regex.IsMatch(inputData, StrRegex))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public void WriteIllegalRequestLog(string info)
    {

        System.IO.StreamWriter writer = null;
        System.IO.FileStream fileStream = null;
        try
        {

            string ym = DateTime.Now.ToString("yyyyMM");
            string logPath = Server.MapPath("~") + @"\App_Data\Requestlog\" + ym + "\\";
            if (!System.IO.Directory.Exists(logPath))//是否存在年月命名文件夹
                System.IO.Directory.CreateDirectory(logPath);
            string fileName = DateTime.Now.ToString("yyyy-MM-dd");
            string filePath = logPath + fileName + ".htm";
            System.IO.FileInfo fileInfo = new System.IO.FileInfo(filePath);
            if (!fileInfo.Exists)
            {
                fileStream = fileInfo.Create();
                writer = new System.IO.StreamWriter(fileStream);
                info = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>" + fileName + "  注入日志</title></head>" + info;
            }
            else
            {
                fileStream = fileInfo.Open(System.IO.FileMode.Append, System.IO.FileAccess.Write);
                writer = new System.IO.StreamWriter(fileStream);
            }
            writer.WriteLine(info);

        }
        finally
        {
            if (writer != null)
            {
                writer.Close();
                writer.Dispose();
                fileStream.Close();
                fileStream.Dispose();
            }
        }
    }
    #endregion 
</script>
