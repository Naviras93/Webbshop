using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary1;

namespace Webbshop.Public_Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = CheckBox1.Checked;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          if(Page.IsValid)
          {
              AdoMethods am = new AdoMethods();
              am.RegisterCustomer(
                  TextBox1.Text,
                  TextBox2.Text,
                  TextBox3.Text,
                  TextBox4.Text,
                  (int.Parse(TextBox5.Text)),
                  TextBox6.Text,
                  TextBox9.Text,
                  TextBox7.Text
                  
                  );
              Label1.Text = "Ny kund skapades!";
              
          }
        }
    }
}