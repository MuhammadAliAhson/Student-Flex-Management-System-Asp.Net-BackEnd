using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class StudentFeedbackReport : System.Web.UI.Page
{
    public static class global    // Just a class that is keeping track of global variable
    {
        public static string passString = "";  // That string will be passed to next page
        public static int courseId;
        public static string UserId;
        public static List<EvaluationResult> evaluationResults;
    }
    public class EvaluationResult
    {
        public string StudentId { get; set; }
        public string FacultyId { get; set; }
        public string Rating { get; set; }
        public string Feedback { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        global.evaluationResults = new List<EvaluationResult>();

        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string query2 = "Select StudentId, FacultyId, Rating, Feedback from Feedback inner join Gives on Gives.FeedbackID = Feedback.FeedbackId";

        // Execute the modified SQL query
        SqlCommand cm = new SqlCommand(query2, conn);
        SqlDataReader reader = cm.ExecuteReader();

        // Populate the lists with the data from the SQL query
        while (reader.Read())
        {
            EvaluationResult evaluationResult = new EvaluationResult();
            evaluationResult.StudentId = reader["StudentId"].ToString();
            evaluationResult.FacultyId = reader["FacultyId"].ToString();
            evaluationResult.Rating = reader["Rating"].ToString();
            evaluationResult.Feedback = reader["Feedback"].ToString();

            global.evaluationResults.Add(evaluationResult);
        }

        if (!IsPostBack)
        {
            // Bind the data to the DataList controls
            student.DataSource = global.evaluationResults;
            student.DataBind();
            faculty.DataSource = global.evaluationResults;
            faculty.DataBind();
            rating.DataSource = global.evaluationResults;
            rating.DataBind();
            feedback.DataSource = global.evaluationResults;
            feedback.DataBind();

        }


        cm.Dispose();
        conn.Close();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("FacultyMain.aspx");
    }
}