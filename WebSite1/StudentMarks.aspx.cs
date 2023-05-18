using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class StudentMarks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                FetchMarks(username, ddlMarksType.SelectedValue);
            }
            else
            {
                // Handle scenario where username is not available in the session.
                // Maybe redirect to login page, etc.
            }
        }
    }

    protected void FetchMarks(string username, string marksType)
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True");
        conn.Open();

        // Fetch UserID based on the username
        SqlCommand cmd = new SqlCommand("SELECT UserId FROM Users WHERE Username = @username", conn);
        cmd.Parameters.AddWithValue("@username", username);

        object result = cmd.ExecuteScalar();
        if (result != null)
        {
            int userId = Convert.ToInt32(result);

            // Now fetch the marks based on the UserID and MarksType
            cmd = new SqlCommand("SELECT * FROM Marks WHERE StudentID = @userId AND Name = @marksType", conn);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@marksType", marksType);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            // Bind the fetched marks to the GridView
            gvMarks.DataSource = dt;
            gvMarks.DataBind();
        }

        conn.Close();
    }

    protected void ddlMarksType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            string username = Session["Username"].ToString();
            FetchMarks(username, ddlMarksType.SelectedValue);
        }
    }
}
