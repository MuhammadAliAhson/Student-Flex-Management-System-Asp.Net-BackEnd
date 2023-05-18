using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

public partial class FacultyMain : System.Web.UI.Page
{
    public static class global    // Just a class that is keeping track of global variable
    {
        public static string passString = "";  // That string will be passed to next page
        public static string UserId;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string un = username.Value; // Access the entered username
        string pass = password.Value; // Access the entered password

        SqlCommand cm;
        string query = "SELECT UserId FROM Users WHERE Username = @username AND Password = @password AND UserType = 'Faculty'";

        cm = new SqlCommand(query, conn);
        cm.Parameters.AddWithValue("@username", un);
        cm.Parameters.AddWithValue("@password", pass);

        object result = cm.ExecuteScalar();
        int UserId = Convert.ToInt32(result);

        global.UserId = UserId.ToString();
        //query = "Select UserId from Users where Username = @username";
        //cm.Parameters.AddWithValue("@username", un);
        //cm = new SqlCommand(query, conn);

        //object result2 = cm.ExecuteScalar();
        //global.courseId = Convert.ToInt32(result2);

        cm.Dispose();
        conn.Close();

        

        if (UserId != 0) // If the user is found
        {
            Application["global.UserId"] = global.UserId;
            System.Diagnostics.Debug.WriteLine("global.UserId sent = " + global.UserId);
            Response.Redirect("SelectCourse.aspx");
        }
        
    }

    protected void SignUpbutton_click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string name = signupName.Value; // Accessing the name
        string un = signupUsername.Value; // Access the entered username
        string pass = signupPassword.Value; // Access the entered password

        SqlCommand cm;
        string query1 = "Select count(*) from Users";
        

        cm = new SqlCommand(query1, conn);

        int newUserId = (int)cm.ExecuteScalar() + 1;

        string query = "INSERT INTO Users (UserId, Username, Password, UserType) Values ('" + newUserId + "','" + un + "','" + pass + "', 'Faculty');";

        global.UserId = newUserId.ToString();
        cm = new SqlCommand(query, conn);
        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();
        Application["global.UserId"] = global.UserId;
        System.Diagnostics.Debug.WriteLine("global.UserId sent = " + global.UserId);
        Response.Redirect("SelectCourse.aspx");
    }
}