using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class StudentCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                FetchCourses(username);
            }
            else
            {
                // Handle scenario where username is not available in the session.
                // Maybe redirect to login page, etc.
            }
        }
    }

    protected void FetchCourses(string username)
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        // Fetch UserID based on the username
        SqlCommand cmd = new SqlCommand("SELECT UserId FROM Users WHERE Username = @username", conn);
        cmd.Parameters.AddWithValue("@username", username);
        object result = cmd.ExecuteScalar();
        if (result != null)
        {
            int userId = Convert.ToInt32(result);

            // Now fetch the CourseIDs based on the UserID
            cmd = new SqlCommand("SELECT CourseId FROM Registers WHERE StudentID = @userId", conn);
            cmd.Parameters.AddWithValue("@UserId", userId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            // Add the 'CourseName' column to the 'dt' data table
            dt.Columns.Add("CourseName", typeof(string));

            // Now fetch the course names using the CourseID and populate the GridView
            foreach (DataRow row in dt.Rows)
            {
                cmd = new SqlCommand("SELECT CourseName FROM Course WHERE CourseId = @CourseId", conn);
                cmd.Parameters.AddWithValue("@CourseId", Convert.ToInt32(row["CourseId"]));

                object courseResult = cmd.ExecuteScalar();
                if (courseResult != null)
                {
                    // Add the course name to a new column in the row
                    row["CourseName"] = courseResult.ToString();
                }
            }

            // Bind the fetched course names to the GridView
            gvCourses.DataSource = dt;
            gvCourses.DataBind();
        }

        conn.Close();
    }

}
