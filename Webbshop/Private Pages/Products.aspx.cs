using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary1;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;



namespace Webbshop
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label5.Text = (string)Session["CurrentCustomer"];
            
            if (Session["RefinedList"] == null)
            {
                AdoMethods cs = new AdoMethods();
                GridView1.DataSource = cs.AllProducts();
                GridView1.DataBind();


            }
            else
            {
                GridView1.DataSource = (DataTable)Session["RefinedList"];
                GridView1.DataBind();

           
            }
            if (Session["ShoppingCartList"] != null)
            {
                List<int> clickedList = new List<int>();
                clickedList = Session["ShoppingCartList"] as List<int>;

                foreach (var prodId in clickedList)
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        Button button = row.FindControl("Button2") as Button;

                        if (prodId == int.Parse(button.CommandArgument))
                        {
                            button.Text = "Tillagd i kundvagnen";
                            button.BackColor = System.Drawing.Color.MistyRose;


                        }
                    }
                }
            }
            

           
        }
       
        protected void Button2_Click(object sender, EventArgs e)
        {

            
            Button bt = (Button)sender;
            List<int> productList = new List<int>();
         
            if (Session["ShoppingCartList"] != null)
                productList = (List<int>)Session["ShoppingCartList"];
        
           

             foreach (GridViewRow row in GridView1.Rows)
             {
                 Button bt2 = row.FindControl("Button2") as Button;
                 
                 
                 if(bt.CommandArgument == bt2.CommandArgument)
                 {
                     bt2.Text = "Tillagd i kundvagnen";
                     bt2.BackColor = System.Drawing.Color.MistyRose;
                     productList.Add(int.Parse(bt2.CommandArgument));

                 }
             }

             Session["ShoppingCartList"] = productList;
            
          
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            int? category = (DropDownList1.SelectedValue != "") ? (int?)(DropDownList1.SelectedIndex) : null;
            string color = (DropDownList2.SelectedItem.Value.ToString()!= "") ? DropDownList2.SelectedItem.Value.ToString(): null;
            int? price = (DropDownList3.SelectedValue != "") ? (int?)DropDownList3.SelectedIndex : null;

            string sort = DropDownList4.SelectedItem.Value.ToString();

            DataSet ds = new DataSet();
            AdoMethods am = new AdoMethods();
            ds = am.RefineSearch(category, color, price);

            if (sort != "")
            {
                
                ds.Tables[0].DefaultView.Sort = "Price " + sort;

                
            }
           
                GridView1.DataSource =ds.Tables[0];
                GridView1.DataBind();
                
                Session["RefinedList"] = ds.Tables[0];

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