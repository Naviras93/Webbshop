using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using ClassLibrary1;


namespace Webbshop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RememberMe_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                AdoMethods am = new AdoMethods();

                if(am.UserAthentication(TextBox1.Text,TextBox2.Text))
                {
                    Session["CurrentCustomer"] = TextBox1.Text;
                    FormsAuthentication.RedirectFromLoginPage(TextBox1.Text,RememberMe.Checked);

                }
                else
                {
                    Label2.Text = "* Inloggning misslyckades!";
                }

            }
        }
    }
}