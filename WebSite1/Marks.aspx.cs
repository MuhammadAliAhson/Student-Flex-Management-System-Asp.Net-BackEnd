using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Marks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string rollNumber = txtRollNumber.Text;
        DataTable dt = FetchResultsByRollNumber(rollNumber);

        gvMarks.DataSource = dt;
        gvMarks.DataBind();
    }

    private DataTable FetchResultsByRollNumber(string rollNumber)
    {
        string connectionString = "Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True"; // Your connection string here
        DataTable dt = new DataTable();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Marks WHERE StudentId = @rollNumber", conn))
            {
                cmd.Parameters.AddWithValue("@rollNumber", rollNumber);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
        }

        return dt;
    }

}
