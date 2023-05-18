using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class AllocateCourseToFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Database connection string. 
        // Please replace with your own connection string
        string connectionString = "Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True";

        // SQL query to insert data into Allocates table
        string query = "INSERT INTO Allocates (AcadOffID, FacultyId, SectionID, CourseID) VALUES (@AcadOffID, @FacultyId, @SectionID, @CourseID)";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@AcadOffID", txtAcademicOfficerID.Text);
                command.Parameters.AddWithValue("@FacultyId", txtFacultyId.Text);
                command.Parameters.AddWithValue("@SectionID", txtSectionId.Text);
                command.Parameters.AddWithValue("@CourseID", txtCourseId.Text);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        lblSuccess.Visible = true;
        lblSuccess.Text = "Successfully allocated course to the faculty.";
        btnBack.Visible = true;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AcademicMain.aspx");
    }
}
