using System;
using System.Web.UI;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Screen1aspx.aspx");
    }
}
