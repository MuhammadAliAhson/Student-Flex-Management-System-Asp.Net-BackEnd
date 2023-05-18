using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class OfferedCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // No need to bind the grid here
        }
    }

    protected void btnGenerateResults_Click(object sender, EventArgs e)
    {
        // Call the method to fetch data and bind the grid when the button is clicked
        string semester = ddlSemesters.SelectedValue;
        BindCoursesGrid(semester);
    }

    private DataTable FetchOfferedCourses(string semester)
    {
        string connectionString = "Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand("SELECT * FROM Course WHERE SemesterId = @semester", connection))
            {
                command.Parameters.AddWithValue("@semester", semester);
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
        }
    }

    protected void ddlSemesters_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Call the method to fetch data and bind the grid when the semester is selected
        BindCoursesGrid(ddlSemesters.SelectedValue);
    }

    private void BindCoursesGrid(string semester)
    {
        DataTable dt = FetchOfferedCourses(semester);
        myGridView.DataSource = dt;
        myGridView.DataBind();
    }

}
