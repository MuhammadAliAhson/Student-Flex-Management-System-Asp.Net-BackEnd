using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class AcademicOffice : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Your page load logic here
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string un = txtUsername.Text; // Access the entered username
        string pass = txtPassword.Text; // Access the entered password

        SqlCommand cm;
        string query = "SELECT COUNT(*) FROM Users WHERE Username = @username AND Password = @password AND UserType = 'AcademicOfficer'";

        cm = new SqlCommand(query, conn);
        cm.Parameters.AddWithValue("@username", un);
        cm.Parameters.AddWithValue("@password", pass);

        int result = (int)cm.ExecuteScalar();

        cm.Dispose();
        conn.Close();

        if (result > 0) // If the user is found
        {
            Response.Redirect("AcademicMain.aspx");
        }
        else
        {
            // Display an error message
            lblMessage.Text = "Invalid username or password"; // lblMessage is a Label where the error message is displayed
        }

    }


    protected void SignUpButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }

}
