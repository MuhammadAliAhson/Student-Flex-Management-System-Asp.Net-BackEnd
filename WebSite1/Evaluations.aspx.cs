using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class Evaluations : System.Web.UI.Page
{
    public static class global    // Just a class that is keeping track of global variable
    {
        public static string passString = "";  // That string will be passed to next page
        public static int courseId;
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
        global.passString = Application["global.passString"] as string;
        //System.Diagnostics.Debug.WriteLine("global.passString received = " + global.passString);

        // Getting the Course ID
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string CourseName = global.passString;

        SqlCommand cm;
        string query = "select CourseId from Course where CourseName = '" + CourseName + "'"; // finds course ID through name

        cm = new SqlCommand(query, conn);
        object result = cm.ExecuteScalar();
        global.courseId = Convert.ToInt32(result);

        courseidname.InnerText = "Course Name: " + global.passString + ", Id: " + global.courseId.ToString();

        int courseId = global.courseId;

        // Now getting the lists with separate connection

        
        global.evaluationResults = new List<EvaluationResult>();

        
        string query2 = "SELECT RegNo, Student.Name, Marks.CourseId, CourseName, Marks.Name as 'EvaluationType', Section, ObtainedWeightage, TotalWeightage FROM Student, Marks, Course WHERE Student.UserId = Marks.StudentID AND Course.CourseId = Marks.CourseId AND Marks.CourseId = " + courseId.ToString();

        // Execute the modified SQL query
        cm = new SqlCommand(query2, conn);
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
            snames.DataSource = global.evaluationResults;
            snames.DataBind();
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
    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        int count = 0;  // 0=Assignment, 1=Final, 2=Project, 3=Quizes, 4=Sessional

        foreach (DataListItem item in obtained.Items)
        {
            string obtainedWeightage;
            string regNo = global.evaluationResults[count].RegNo;
            string courseId = global.evaluationResults[count].CourseId;
            string evaluationType = global.evaluationResults[count].EvaluationType;

            HtmlInputControl dataRead = item.FindControl("obtainedInput") as HtmlInputControl;
            obtainedWeightage = dataRead.Value;

            conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
            conn.Open();

            string querytoSelectStudentID = "select UserId from Student where Regno = " + regNo;
            SqlCommand cm = new SqlCommand(querytoSelectStudentID, conn);

            object result = cm.ExecuteScalar();
            int StudentID = Convert.ToInt32(result);

            if (obtainedWeightage.Length != 0)
            {
                string updateQuery = "UPDATE Marks SET ObtainedWeightage = @obtainedWeightage WHERE StudentID = @sid AND CourseId = @courseId AND Name = @evaluationType";

                using (conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True"))
                {
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@obtainedWeightage", obtainedWeightage);
                        cmd.Parameters.AddWithValue("@regNo", regNo);
                        cmd.Parameters.AddWithValue("@courseId", courseId);
                        cmd.Parameters.AddWithValue("@evaluationType", evaluationType);
                        cmd.Parameters.AddWithValue("@sid", StudentID);

                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        conn.Close();

                        if (rowsAffected > 0)
                        {
                            System.Diagnostics.Debug.WriteLine("rows affected = " + rowsAffected);
                        }
                        else
                        {
                            System.Diagnostics.Debug.WriteLine("Nothing Updated");
                        }
                    }
                }

                count++;

                System.Diagnostics.Debug.WriteLine("obtainedInputValue = " + obtainedWeightage);
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("The input field is empty!");
            }
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("FacultyMain.aspx");
    }
}