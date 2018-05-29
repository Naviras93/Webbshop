using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;


namespace ClassLibrary1
{
    public class AdoMethods
    {
        public DataSet AllProducts()
        {
            string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * From Items", con);

                DataSet ds = new DataSet();
                da.Fill(ds);

                return ds;

            }
        }
        public DataSet ShoppingCartItemsList()
        {
            string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * From ShoppingCart", con);

                DataSet ds = new DataSet();
                da.Fill(ds);

                return ds;

            }
        }
       
        public int TotalPrice()
        {
            string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("Select Sum(Price) From ShoppingCart", con))
                {
                    con.Open();
                    return (int)cmd.ExecuteScalar();
                }

            }
        }
        public void EmptyShoppingCart(int customerid)
        {
           string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("Delete From ShoppingCart Where CustomerID = @CustomerID ", con))
                {
                    cmd.Parameters.AddWithValue("@CustomerID", customerid);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            
            }
        }
        public int GetCustomerID(string userName)
        {
            string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("uspGetCustomerID", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserName", userName);
                 

                    con.Open();
                    return (int)cmd.ExecuteScalar();
                }

            }
        }
        public void AddNewOrder(int customerid, int itemid, int orderQuantity, string deliveryAd)
        {
            string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("uspAddNewOrder", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CustomerID", customerid);
                    cmd.Parameters.AddWithValue("@ItemID", itemid);
                    cmd.Parameters.AddWithValue("@OrderQuantity", orderQuantity);
                    cmd.Parameters.AddWithValue("@DeliveryAdress", deliveryAd);
                   
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

            }
        }
        public void ShoppingCart(int itemId, int customerid)
        {
            string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
               using( SqlCommand cmd = new SqlCommand("uspAddToShoppingCart",con))
               {
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@ItemID", itemId);
                   cmd.Parameters.AddWithValue("@CustomerID", customerid);

                   con.Open();
                   cmd.ExecuteNonQuery();
               }
                
                
            }
        }
        public DataSet RefineSearch(int? category, string color, int? price)
        {
            string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {

                SqlDataAdapter da = new SqlDataAdapter("uspRefineSearch", con);

                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.AddWithValue("@CategoryID", category);
                da.SelectCommand.Parameters.AddWithValue("@Color", color);
                da.SelectCommand.Parameters.AddWithValue("@Price", price);

                DataSet ds = new DataSet();
                da.Fill(ds);

                

                return ds;
                    
            }

        }
        public bool UserAthentication(string username,string password)
        {
            string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("uspLoginWeb", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    string encryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", encryptedPass);

                    con.Open();
                    int ReturnCode =(int)cmd.ExecuteScalar();
                    return ReturnCode == 1;
                }
            }
        }
        public void RegisterCustomer(string firstName, string lastName, string email, string adress, int zipcode, string phoneNr, string userName, string password)
        {
            string cs = ConfigurationManager.ConnectionStrings["MyWebstore"].ConnectionString;
           
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("uspAddNewCustomer", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    string encryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@EmailAddress", email);
                    cmd.Parameters.AddWithValue("@Address", adress);
                    cmd.Parameters.AddWithValue("@Zipcode", zipcode);
                    cmd.Parameters.AddWithValue("@Phonenumber", phoneNr);
                    cmd.Parameters.AddWithValue("@Username", userName);
                    cmd.Parameters.AddWithValue("@Password", encryptedPass);
                    
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
