using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AcademicMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AllocateCourseToFacultyButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AllocateCourseToFaculty.aspx");
    }


    protected void MarksButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Marks.aspx");
    }

    protected void OfferedCoursesButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("OfferedCourses.aspx");
    }

    protected void CourseRegisterButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("CourseRegistration.aspx");
    }

    protected void FacultyButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AcademicFaculty.aspx");
    }

    protected void AboutButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("About.aspx");
    }

    protected void Option1Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("OfferedCoursesReport.aspx");
    }

    protected void Option2Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentSectionReport.aspx");
    }

    protected void Option3Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("CourseAllocationReport.aspx");
    }
}
