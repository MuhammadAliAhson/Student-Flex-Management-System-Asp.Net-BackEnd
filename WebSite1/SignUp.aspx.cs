using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void signupButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT MAX(UserId) FROM Users", conn);

        object result = cmd.ExecuteScalar();
        int maxId = (result == null) ? 1 : Convert.ToInt32(result) + 1;

        cmd.CommandText = "INSERT INTO Users(UserId, Username, Password, UserType) VALUES(@UserId, @Username, @Password, @UserType)";
        cmd.Parameters.AddWithValue("@UserId", maxId);
        cmd.Parameters.AddWithValue("@Username", inputUsername.Text);
        cmd.Parameters.AddWithValue("@Password", inputPassword.Text);
        cmd.Parameters.AddWithValue("@UserType", inputUserType.Text);
        cmd.ExecuteNonQuery();

        conn.Close();

        Response.Redirect("AcademicOffice.aspx");
    }
}
