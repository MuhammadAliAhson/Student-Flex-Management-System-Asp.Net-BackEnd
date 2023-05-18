using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
public partial class EvaluationReport : System.Web.UI.Page
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
        public string RegNo { get; set; }
        public string Name { get; set; }
        public string CourseId { get; set; }
        public string CourseName { get; set; }
        public string EvaluationType { get; set; }
        public string Section { get; set; }
        public string ObtainedWeightage { get; set; }
        public string TotalWeightage { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        global.evaluationResults = new List<EvaluationResult>();

        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string query2 = "Select RegNo, Student.Name, Marks.CourseId, CourseName, Marks.Name as 'EvaluationType', Section, ObtainedWeightage, TotalWeightage from Student, Marks, Course where Student.UserId = Marks.StudentID AND Course.CourseId = Marks.CourseId";

        // Execute the modified SQL query
        SqlCommand cm = new SqlCommand(query2, conn);
        SqlDataReader reader = cm.ExecuteReader();

        // Populate the lists with the data from the SQL query
        while (reader.Read())
        {
            EvaluationResult evaluationResult = new EvaluationResult();
            evaluationResult.RegNo = reader["RegNo"].ToString();
            evaluationResult.Name = reader["Name"].ToString();
            evaluationResult.CourseId = reader["CourseId"].ToString();
            evaluationResult.CourseName = reader["CourseName"].ToString();
            evaluationResult.EvaluationType = reader["EvaluationType"].ToString();
            evaluationResult.Section = reader["Section"].ToString();
            evaluationResult.ObtainedWeightage = reader["ObtainedWeightage"].ToString();
            evaluationResult.TotalWeightage = reader["TotalWeightage"].ToString();

            global.evaluationResults.Add(evaluationResult);
        }

        if (!IsPostBack)
        {
            // Bind the data to the DataList controls
            regno.DataSource = global.evaluationResults;
            regno.DataBind();
            name.DataSource = global.evaluationResults;
            name.DataBind();
            courseid.DataSource = global.evaluationResults;
            courseid.DataBind();
            coursename.DataSource = global.evaluationResults;
            coursename.DataBind();
            evaltype.DataSource = global.evaluationResults;
            evaltype.DataBind();
            section.DataSource = global.evaluationResults;
            section.DataBind();
            obtained.DataSource = global.evaluationResults;
            obtained.DataBind();
            total.DataSource = global.evaluationResults;
            total.DataBind();

        }


        cm.Dispose();
        conn.Close();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("FacultyMain.aspx");
    }
}