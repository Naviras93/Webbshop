using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary1;
using System.Web.Security;

namespace Webbshop.Public_Pages
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {

                if (Session["ShoppingCartList"] != null)
                {
                    FillShoppingCart();
                }
                else
                {
                    Label9.Text = "Kundvagnen är tom!";
                }
            }
        }
        protected void ClearPage()
        {
            AdoMethods am = new AdoMethods();
            int customerid = am.GetCustomerID((string)Session["CurrentCustomer"]);
            Session["ShoppingCartList"] = null;
            TextBox2.Text = "";
            am.EmptyShoppingCart(customerid);
            GridView2.Visible = false;
            TextBox2.Visible = false;
            Label3.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label10.Visible = false;
            Button1.Visible = false;

            Label9.Text = "Ordern skapades! Tack för din order!";
        }
        protected void FillShoppingCart()
        {
            List<int> shoppingList = new List<int>();
            shoppingList = (List<int>)Session["ShoppingCartList"];
            AdoMethods am = new AdoMethods();
            int customerid = am.GetCustomerID((string)Session["CurrentCustomer"]);

            foreach (var item in shoppingList)
            {
                am.ShoppingCart(item , customerid);

            }
            GridView2.DataSource = am.ShoppingCartItemsList();
            GridView2.DataBind();

            Label7.Text = am.TotalPrice().ToString();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Session["ShoppingCartList"]!= null)
            {
                AdoMethods am = new AdoMethods();
                int customerid = am.GetCustomerID((string)Session["CurrentCustomer"]);

                string deliveryAd = TextBox2.Text;

            foreach (GridViewRow row in GridView2.Rows)
            { 
               TextBox tb = row.FindControl("TextBox1") as TextBox;
              
               Label lab = row.FindControl("Label8") as Label;
               
               am.AddNewOrder(customerid, Convert.ToInt32(lab.Text), Convert.ToInt32(tb.Text), deliveryAd);
              
               
            }
                ClearPage();
           
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            AdoMethods am = new AdoMethods();
            int customerid = am.GetCustomerID((string)Session["CurrentCustomer"]);
            am.EmptyShoppingCart(customerid);
            Session.Clear();
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage("~/Login.aspx");
          
        }
    }
}