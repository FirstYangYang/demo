using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
///AutoNo 的摘要说明
/// </summary>
public class AutoNo
{
    static string s;
	public AutoNo()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public string autoNo()
    {
        System.DateTime t = System.DateTime.Now;
        s = "";
        s = t.Year.ToString("##");
        s += t.Month.ToString("0#");
        s += t.Day.ToString("0#");
        s += t.Hour.ToString("0#");
        s += t.Minute.ToString("0#");
        s += t.Second.ToString("0#");
        s += (new System.Random().Next(0, 999999)).ToString("00000#");
        s =GenerateRandom(2) + s;
        return s;
    }
    private static char[] constant = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 
                                         'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                                         'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
    public string GenerateRandom(int Length)
    {
        System.Text.StringBuilder newRandom = new System.Text.StringBuilder(constant.Length);
        Random rd = new Random();
        for (int i = 0; i < Length; i++)
        {
            newRandom.Append(constant[rd.Next(constant.Length - 1)]);
        }
        return newRandom.ToString().ToUpper();
    }
}