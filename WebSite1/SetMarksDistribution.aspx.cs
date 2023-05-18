using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class SetMarksDistribution : System.Web.UI.Page
{
    public static class global    // Just a class that is keeping track of global variable
    {
        public static string passString = "";  // That string will be passed to next page
        public static int courseId;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        global.passString = Application["global.passString"] as string;
        //System.Diagnostics.Debug.WriteLine("global.passString received = " + global.passString);

        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string CourseName = global.passString;

        SqlCommand cm;
        string query = "select CourseId from Course where CourseName = '" + CourseName + "'"; // finds course ID through name

        cm = new SqlCommand(query, conn);
        object result = cm.ExecuteScalar();
        global.courseId = Convert.ToInt32(result);

        cm.Dispose();
        conn.Close();

        courseidname.InnerText = "Course Name: " + global.passString + ", Id: " + global.courseId.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string assignmentVal = assignment.Value;
        string finalVal = final.Value;
        string quizVal = quiz.Value;
        string sessionalVal = sessional.Value;
        string projectVal = project.Value;
        int courseId = global.courseId;

        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        SqlCommand cm;
        
        string assignmentQuery = "Update Marks set TotalWeightage = '" + assignmentVal + "' where CourseId = " + courseId + " and Name = 'Assignments'";
        string finalQuery = "Update Marks set TotalWeightage = '" + finalVal + "' where CourseId = " + courseId + " and Name = 'Final'";
        string quizQuery = "Update Marks set TotalWeightage = '" + quizVal + "' where CourseId = " + courseId + " and Name = 'Quizzes'";
        string sessQuery = "Update Marks set TotalWeightage = '" + sessionalVal + "' where CourseId = " + courseId + " and Name = 'Sessional'";
        string projectQuery = "Update Marks set TotalWeightage = '" + projectVal + "' where CourseId = " + courseId + " and Name = 'Project'";

        cm = new SqlCommand(assignmentQuery, conn);
        cm.ExecuteNonQuery();

        cm = new SqlCommand(finalQuery, conn);
        cm.ExecuteNonQuery();

        cm = new SqlCommand(quizQuery, conn);
        cm.ExecuteNonQuery();

        cm = new SqlCommand(sessQuery, conn);
        cm.ExecuteNonQuery();

        cm = new SqlCommand(projectQuery, conn);
        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();

        Application["global.courseId"] = global.courseId;

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("FacultyMain.aspx");
    }
}