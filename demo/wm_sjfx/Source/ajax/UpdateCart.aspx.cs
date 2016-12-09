using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL.ShoppingCart;
using Com;

public partial class UpdateCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Cart cart = Shopping.getCart();
        int pid = 0;
        int qty = 0;
        string color = "";
        string size = "";
        string morepid = "";
        Bs_Products pro = null;

        string action = Util.getStringByObject(Request["action"]);
        Product cartPro = new Product();

        switch (action)
        {
                
            case "add":
                if (CurInfo.CurUser != null)
                {
                    pid = Util.getIntByObject(Request.Form["pid"]);
                    qty = Util.getIntByObject(Request.Form["qty"]);
                    
                    size = "";
                    pro = Factory.getProBllInstance().getProById(pid);


                   
                   
                    if (pro != null)
                    {
                        if (cart.Values.Count > 0)
                        {
                            foreach (BLL.ShoppingCart.Product prooo in cart.Values.Values)
                            {
                                if (prooo.ProId == pid)
                                {
                                    qty = qty + prooo.Qty;
                                }
                            }
                        }
                        decimal price;
                        if(pro.BS_ProKindCode=="01")
                        price = Convert.ToDecimal(pro.Price*Convert.ToDecimal(0.8));
                        else

                            price = Convert.ToDecimal(pro.Price);



                        int status = Convert.ToInt32(pro.pStatus);
                        cartPro = new Product(pro.ID, pro.Name, pro.Code, "product/" + pro.Pic.ToString().Split(',')[0], price, qty, status,color,size);
                        cart.Remove(pro.Code);
                        cart.Add(cartPro);
                        Shopping.saveCart(cart);
                        Response.Write("1");
                    }
                }
                else {
                    Response.Write("0");
                
                }
                //}
                //else
                //{
                //    Response.Write(Inventory);
                //}

                break;
            case "addmore":
                cart = Shopping.getCart();
                morepid = Util.getStringByObject(Request.Form["pid"]);
               string  mpid = Request.Form["mpid"];
               pro = Factory.getProBllInstance().getProById(Convert.ToInt32(mpid));
                decimal prices = Convert.ToDecimal(pro.Price);
                int sta = Convert.ToInt32(pro.pStatus);
                                cartPro = new Product(pro.ID, pro.Name, pro.Code, "product/small/" + pro.Pic.ToString().Split(',')[0], prices, 1, sta,  color, "1");
                                cart.Remove(pro.Code);
                                cart.Add(cartPro);
                                Shopping.saveCart(cart);
                string[] strid = morepid.ToString().Split(',');
                if (strid.Length > 0)
                {
                    for (int i = 0; i < strid.Length; i++)
                    {
                        //根据ID获取组合产品信息
                        DataTable pack = CSA.DAL.DBAccess.getRS("select * from Bs_Package where id="+ strid[i]);

                        pro = Factory.getProBllInstance().getProById(Convert.ToInt32(pack.Rows[0]["Packageid"].ToString()));

                        Product cartProm = new Product();
                        //DataTable dtm = BLL.Product.Product.getProMoreById(pid);
                        int Inventorym = Convert.ToInt32(pro.Quantity);
                        if (1 <= Inventorym)
                        {
                            if (pro != null)
                            {
                                //if (cart.Values.Count > 0)
                                //{
                                //    foreach (BLL.ShoppingCart.Product prooo in cart.Values.Values)
                                //    {
                                //        if (prooo.ProId == pid)
                                //        {
                                //            qty = qty + prooo.Qty;
                                //        }
                                //    }
                                //}
                                decimal price = Convert.ToDecimal(pack.Rows[0]["Packprice"]);
                                int status = Convert.ToInt32(pro.pStatus);
                                cartPro = new Product(pro.ID, pro.Name, pro.Code, "product/" + pro.Pic.ToString().Split(',')[0], price, 1, status,  color, size);
                                cart.Remove(pro.Code);
                                cart.Add(cartPro);
                                Shopping.saveCart(cart);
                            }
                        }
                    }
                    Response.Write("1");
                }
                break;
            case "edit":

                pid = Util.getIntByObject(Request.Form["pid"]);
                qty = Util.getIntByObject(Request.Form["qty"]);
                pro = Factory.getProBllInstance().getProById(pid);
                color = Util.getStringByObject(Request.Form["color"]).ToString();
                //DataTable dt10 = BLL.Product.Product.getProById(pid);
                //int Inventory1 = int.Parse(dt10.Rows[0]["Quantity"].ToString());
                //if (qty <= Inventory1)
                //{
                    if (pro != null)
                    {
                        if (cart.Exist(pro.Code))
                        {
                            color = ((Product)cart.Values[pro.Code]).Color;
                            cart.Remove(pro.Code);
                            decimal price = Convert.ToDecimal(pro.Price);

                            int status = Convert.ToInt32(price);
                            cartPro = new Product(pro.ID, pro.Name, pro.Code, "product/" + pro.Pic.ToString().Split(',')[0], (decimal)(price), qty, status,  color, size);
                            cart.Add(cartPro);
                            Shopping.saveCart(cart);
                            Response.Write("1");
                        }
                    }
                //}
                //else
                //{
                //    Response.Write(Inventory1);
                //}
                break;
            case "add1":
                string Cpid = Util.getStringByObject(Request["pid"]);
                Cpid = Cpid.Substring(0, Cpid.Length - 1);
                qty = Util.getIntByObject(Request["qty"]);

                string[] prolist = Cpid.Split(',');
                int ii = 0;
                decimal price22 = 0;
                foreach (string id in prolist)
                {
                    int ppid = int.Parse(id);
                    pro = Factory.getProBllInstance().getProById(ppid);
                    Product cartPro1 = new Product();
                    if (pro != null)
                    {
                        if (ii == 0)
                        {
                            price22 = decimal.Parse(pro.Price.ToString());
                        }
                      

                        cartPro1 = new Product(pro.ID, pro.Name, pro.Code, "product/" + pro.Pic.ToString().Split(',')[0], (decimal)(price22), qty, 1,  color, size);
                        cart.Remove(pro.Code);
                        cart.Add(cartPro1);
                        Shopping.saveCart(cart);

                    }
                    ii++;
                }
                Response.Write("1");

                break;
            case "clear":
                Shopping.killCart();
                Response.Redirect("../shopcar.aspx");

                break;

            case "del":
                string proCode = Util.getStringByObject(Request.Form["pid"]);
                cart.Remove(proCode);
                Shopping.saveCart(cart);
                Response.Write("1");
                break;

            case "updateprice":
               decimal? amou = Factory.getOrderBllInstance().getOrderByCode(Request.Form["code"]).Amount;
               Response.Write(amou.ToString());
               break;



        }
    }
}