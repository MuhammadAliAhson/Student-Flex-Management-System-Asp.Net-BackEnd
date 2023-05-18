using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



public partial class SelectCourse : System.Web.UI.Page
{
    public static class global    // Just a class that is keeping track of global variable
    {
        public static string passString = "";  // That string will be passed to next page
        public static string semID = "";
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        global.passString = courses.Value;
        System.Diagnostics.Debug.WriteLine("global.passString sent = " + global.passString);

        Application["global.passString"] = global.passString;
        Application["global.semID"] = global.semID;
        if (global.passString.Length != 0)
        {
            Response.Redirect("FacultyMain.aspx");
        }
    }
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        string temp = semester.SelectedValue;   // Geting the semester option picked
        //System.Diagnostics.Debug.WriteLine("temp = " + temp);
        string semID = "";

        if (temp == "Fall 22")     // Selecting appropriate semesters according to the database
        {
            semID = "SEM001";
            global.semID = semID;
        }
        else if(temp == "Spring 22")
        {
            semID = "SEM002";
            global.semID = semID;
        }
        else if (temp == "Summer 23")
        {
            semID = "SEM003";
            global.semID = semID;
        }
        else if (temp == "Fall 21")
        {
            semID = "SEM004";
            global.semID = semID;
        }
        else if(temp == "Spring 21")
        {
            semID = "SEM005";
            global.semID = semID;
        }
        

        SqlCommand cm;
        string query = "select CourseName from Course where SemesterId = '" + semID + "'";

        cm = new SqlCommand(query, conn);

        SqlDataReader reader = cm.ExecuteReader();

        List<string> items = new List<string>();
        while (reader.Read())
        {
            string item = reader["CourseName"].ToString();
            items.Add(item);
        }

        cm.Dispose();
        conn.Close();

        courses.DataSource = items;
        courses.DataBind();
        
    }
}