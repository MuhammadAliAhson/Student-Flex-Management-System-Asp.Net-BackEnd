using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class StudentAttendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                FetchAttendance(username);
            }
            else
            {
                // Handle scenario where username is not available in the session.
                // Maybe redirect to login page, etc.
            }
        }
    }

    private DataTable FetchAttendance(string username)
    {
        string connectionString = "Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand("SELECT UserId FROM Users WHERE Username = @username", connection);
            command.Parameters.AddWithValue("@username", username);

            connection.Open();
            object result = command.ExecuteScalar();

            if (result != null)
            {
                int userId = Convert.ToInt32(result);

                // Now fetch the Attendance based on the UserID
                command = new SqlCommand("SELECT * FROM Attendance WHERE UserId = @UserId", connection);
                command.Parameters.AddWithValue("@UserId", userId);

                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
            else
            {
                return null;
            }
        }
    }

    protected void btnGenerateResults_Click(object sender, EventArgs e)
    {
        // Call the method to fetch data and bind the grid when the button is clicked
        if (Session["Username"] != null)
        {
            string username = Session["Username"].ToString();
            BindAttendanceGrid(username);
        }
    }

    private void BindAttendanceGrid(string username)
    {
        DataTable dt = FetchAttendance(username);
        gvAttendance.DataSource = dt;
        gvAttendance.DataBind();
    }
}
