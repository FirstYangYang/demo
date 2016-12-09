using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL.ShoppingCart;
using Com;

public partial class ShopCar : UserBasePage
{
    public Bs_User user = new Bs_User();
    public DataRow drUser, drArea;
    protected Cart cart = Shopping.getCart();
    //购物车小计
    public decimal sum = 0;
    public string type, action;
    public DataTable dtAdd = new DataTable();
    //总支付费用(购物车小计+积分抵用+运费费用)
    public decimal sumMoney = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        type = Com.Util.getStringByObject(Request["type"]);
        action = Com.Util.getStringByObject(Request["action"]);

        if (CurInfo.CurUser != null)
        {
            drUser = Factory.getUserBllInstance().getDrUserByID(CurInfo.CurUser.ID);

            user = CurInfo.CurUser;

            //初始化购物车
            if (cart.Values.Count > 0)
            {
                Bs_Products product = null;
                foreach (BLL.ShoppingCart.Product pro in cart.Values.Values)
                {
                    product = Factory.getProBllInstance().getProById(pro.ProId);
                    //获取总价钱
                  
                    sum += pro.Price * pro.Qty;
                   
                 
                    //获取产品信息
                   
                }
                sumMoney = sum;
            }
        }
    }
}