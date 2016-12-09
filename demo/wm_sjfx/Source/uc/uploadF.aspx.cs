using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class uc_uploadF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpFileCollection files = Request.Files;
        if (files != null && files.Count > 0)
        {
            HttpPostedFile file = files[0];

            string tmpPath = Server.MapPath("/Upload/temp/");
            string fileName = Path.GetFileName(file.FileName);
            string[] NN = fileName.Split('.');
            string[] Ex = { "doc","docx"};
            if (!CSA.Text.Util.inArray(Ex, NN[1].ToString()))
            {
                Response.Write(@"{
                     status : 'error', 
                     msg : '" + "格式错误，请上传work文档格式简历" + @"'
                     }");
                Response.End();
                return;
            }
            Random ra = new Random();
            string Nname = DateTime.Now.ToString("yyyyMMdd")+ ra.Next(1000, 9999).ToString() + "." + NN[1];
            try
            {
                    file.SaveAs(tmpPath + Nname);
                    Response.Write(@"{
                     status : 'success', 
                     msg: { 
                         Origin : '" + Nname + @"'
                     }
                 }");
            }
            catch (Exception ex)
            {
                Response.Write(@"{
                 status : 'error',
                 msg : '" + "上传失败!" + @"'
                 }");
                Response.End();
            }
        }

    }
}