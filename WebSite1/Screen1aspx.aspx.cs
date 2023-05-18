using System;
using System.Web.UI;

public partial class Screen1aspx : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // Redirect to the Academic Office page or perform desired actions
        Response.Redirect("AcademicOffice.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        // Redirect to the Faculty page or perform desired actions
        Response.Redirect("Faculty.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        // Redirect to the Student page or perform desired actions
        Response.Redirect("StudentLogin.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("About.aspx");
    }
}
