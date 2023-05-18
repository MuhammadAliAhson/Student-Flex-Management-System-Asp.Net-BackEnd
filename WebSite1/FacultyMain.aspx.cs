using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacultyMain : System.Web.UI.Page
{
    public static class global    // Just a class that is keeping track of global variable
    {
        public static string passString = "";  // That string will be passed to next page
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        global.passString = Application["global.passString"] as string;
        //System.Diagnostics.Debug.WriteLine("global.passString received = " + global.passString);
    }

    protected void MarksButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("SetMarksDistribution.aspx");
    }

    protected void AttendenceButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AttendenceSheet.aspx");
    }

    protected void EvaluationButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Evaluations.aspx");
    }
    protected void Option1Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("AttendenceReport.aspx");
    }

    protected void Option2Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("EvaluationReport.aspx");
    }

    protected void Option3Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("GradeReport.aspx");
    }
    protected void Option4Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("CountGradeReport.aspx");
    }
    protected void Option5Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentFeedbackReport.aspx");
    }
    protected void Option6Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("Screen1aspx.aspx");
    }
}