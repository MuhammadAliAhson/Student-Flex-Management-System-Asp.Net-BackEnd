using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class CourseRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string academicId = txtAcademicId.Text.Trim();
        string courseId = txtCourseId.Text.Trim();
        string studentId = txtStudentId.Text.Trim();

        if (!string.IsNullOrEmpty(academicId) && !string.IsNullOrEmpty(courseId) && !string.IsNullOrEmpty(studentId))
        {
            RegisterCourse(academicId, courseId, studentId);
        }
    }

    private void RegisterCourse(string academicId, string courseId, string studentId)
    {
        SqlConnection con = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");


        con.Open();

            SqlCommand cmd = new SqlCommand("SELECT MAX(RegNo) FROM Registers", con);
            int maxRegNo = Convert.ToInt32(cmd.ExecuteScalar()) + 1;

            cmd = new SqlCommand("INSERT INTO Registers (RegNo, AcademicId, CourseId, StudentId) VALUES (@RegNo, @AcademicId, @CourseId, @StudentId)", con);
            cmd.Parameters.AddWithValue("@RegNo", maxRegNo);
            cmd.Parameters.AddWithValue("@AcademicId", academicId);
            cmd.Parameters.AddWithValue("@CourseId", courseId);
            cmd.Parameters.AddWithValue("@StudentId", studentId);

            cmd.ExecuteNonQuery();

            // Show success message and display back button
            lblSuccess.Visible = true;
            lblSuccess.Text = "Registration successful!";
            btnBack.Visible = true;
        
    }


    protected void btnBack_Click(object sender, EventArgs e)
    {
        // Redirect back to AcademicMain.aspx
        Response.Redirect("AcademicMain.aspx");
    }
}
