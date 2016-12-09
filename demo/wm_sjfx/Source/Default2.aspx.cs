using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Source_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime tempTime = (new DateTime(temp.Year, temp.Month, temp.Day));
       // Response.Write(tempTime+"sss"+tempTime.AddDays(1));


        prit(tempTime, tempTime.AddDays(1));
        
    }

    public static void prit(DateTime beginDate, DateTime endDate)
    {    
        
        DateTime oriDateTime = new DateTime(1970, 1, 1);
        long begin = (beginDate.ToUniversalTime().Ticks - oriDateTime.Ticks) / 10000000;
        long end = (endDate.ToUniversalTime().Ticks - oriDateTime.Ticks) / 10000000;



        Response.Write(begin + "sss" + end);

    }
}