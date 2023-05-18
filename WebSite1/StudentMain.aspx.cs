using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // This method is called when the page loads
    }

    protected void MarksButton_Click(object sender, EventArgs e)
    {
        // Implement the functionality for when the Marks button is clicked
        Response.Redirect("StudentMarks.aspx");
    }

    protected void AttendanceButton_Click(object sender, EventArgs e)
    {
        // Implement the functionality for when the Attendance button is clicked
        Response.Redirect("StudentAttendance.aspx");
    }

    protected void CoursesButton_Click(object sender, EventArgs e)
    {
        // Implement the functionality for when the Courses button is clicked
        Response.Redirect("StudentCourse.aspx");
    }

    protected void TranscriptButton_Click(object sender, EventArgs e)
    {
        // Implement the functionality for when the Transcript button is clicked
    }

    protected void FeedbackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Feedback.aspx");
    }

    protected void GoBackButton_Click(object sender, EventArgs e)
    {
        // Implement the functionality for when the Go Back button is clicked
        Response.Redirect("Screen1aspx.aspx");
    }
}
