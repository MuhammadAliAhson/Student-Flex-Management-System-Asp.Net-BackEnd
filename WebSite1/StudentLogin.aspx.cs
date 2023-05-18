using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Lifetime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Code for handling page load
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string un = txtUsername.Text; // Access the entered username
        string pass = txtPassword.Text; // Access the entered password

        SqlCommand cm;
        string query = "SELECT COUNT(*) FROM Users WHERE Username = @username AND Password = @password AND UserType = 'Student'";

        cm = new SqlCommand(query, conn);
        cm.Parameters.AddWithValue("@username", un);
        cm.Parameters.AddWithValue("@password", pass);

        int result = (int)cm.ExecuteScalar();

        if (result > 0) // If the user is found
        {
            // Store the username in a session variable
            Session["Username"] = un;
            Response.Redirect("StudentMain.aspx");
        }
        else
        {
            // Display an error message
            lblMessage.Text = "Invalid username or password"; // lblMessage is a Label where the error message is displayed
            lblMessage.Visible = true;
        }

        cm.Dispose();
        conn.Close();
    }

    protected void SignUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentLogin.aspx");
    }
}
