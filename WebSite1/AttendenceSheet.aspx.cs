using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class AttendenceSheet : System.Web.UI.Page
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
        public string FacultyId { get; set; }
        public string UserId { get; set; }
        public string AttendDate { get; set; }
        public string Attendance { get; set; }
        public string CourseId { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        global.passString = Application["global.passString"] as string;
        global.UserId = Application["global.UserId"] as string;
        System.Diagnostics.Debug.WriteLine("global.UserId received = " + global.UserId);

        // Getting the Course ID
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string CourseName = global.passString;

        SqlCommand cm;
        string query = "select CourseId from Course where CourseName = '" + CourseName + "'"; // finds course ID through name

        cm = new SqlCommand(query, conn);
        object result = cm.ExecuteScalar();
        global.courseId = Convert.ToInt32(result);

        courseidname.InnerText = "Course Name: " + global.passString + ", Id: " + global.courseId.ToString() + ", FacultyId: " + global.UserId;

        int courseId = global.courseId;
        string facultyId = global.UserId;

        // Now getting the lists with separate connection


        global.evaluationResults = new List<EvaluationResult>();

        
        string query2 = "Select * from Attendance where CourseId = " + courseId.ToString() + " AND FacultyId = " + facultyId + ";";

        // Execute the modified SQL query
        cm = new SqlCommand(query2, conn);
        SqlDataReader reader = cm.ExecuteReader();

        // Populate the lists with the data from the SQL query
        while (reader.Read())
        {
            EvaluationResult evaluationResult = new EvaluationResult();
            evaluationResult.FacultyId = reader["FacultyId"].ToString();
            evaluationResult.UserId = reader["UserID"].ToString();
            evaluationResult.AttendDate = reader["AttendDate"].ToString();
            evaluationResult.Attendance = reader["Attendance"].ToString();
            evaluationResult.CourseId = reader["CourseId"].ToString();

            global.evaluationResults.Add(evaluationResult);
        }

        if (!IsPostBack)
        {
            // Bind the data to the DataList controls
            faculty.DataSource = global.evaluationResults;
            faculty.DataBind();
            user.DataSource = global.evaluationResults;
            user.DataBind();
            attenDate.DataSource = global.evaluationResults;
            attenDate.DataBind();
            attendance.DataSource = global.evaluationResults;
            attendance.DataBind();
            course.DataSource = global.evaluationResults;
            course.DataBind();

        }


        cm.Dispose();
        conn.Close();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        int count = 0;  // 0=Assignment, 1=Final, 2=Project, 3=Quizes, 4=Sessional

        foreach (DataListItem item in attendance.Items)
        {
            string Attendance;
            string facultyId = global.evaluationResults[count].FacultyId;
            string userId = global.evaluationResults[count].UserId;
            string attendDate = global.evaluationResults[count].AttendDate;
            string courseId = global.evaluationResults[count].CourseId;

            HtmlInputControl dataRead = item.FindControl("obtainedInput") as HtmlInputControl;
            Attendance = dataRead.Value;

            conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
            conn.Open();

            if (Attendance.Length != 0)
            {
                string updateQuery = "Update Attendance set Attendance = @attendance where FacultyId = @facultyId AND UserId = @userId AND AttendDate = @attendDate AND CourseId = @courseId";

                using (conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True"))
                {
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@attendance", Attendance);
                        cmd.Parameters.AddWithValue("@facultyId", facultyId);
                        cmd.Parameters.AddWithValue("@userId", userId);
                        cmd.Parameters.AddWithValue("@attendDate", attendDate);
                        cmd.Parameters.AddWithValue("@courseId", courseId);

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

                System.Diagnostics.Debug.WriteLine("Attendance Value = " + Attendance);
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