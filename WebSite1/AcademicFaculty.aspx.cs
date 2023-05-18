using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class AcademicFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string facultyId = txtFacultyID.Text.Trim();
        if (!string.IsNullOrEmpty(facultyId))
        {
            FetchFacultyDetails(facultyId);
        }
    }

    protected void btnListAllFaculty_Click(object sender, EventArgs e)
    {
        FetchFacultyDetails(null);
    }

    private void FetchFacultyDetails(string facultyId)
    {
        string connectionString = "Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Faculty", con))
            {
                if (!string.IsNullOrEmpty(facultyId))
                {
                    cmd.CommandText += " WHERE UserId = @FacultyId";
                    cmd.Parameters.AddWithValue("@FacultyId", facultyId);
                }

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvFaculty.DataSource = dt;
                    gvFaculty.DataBind();
                }
            }
        }
    }

    protected void gvFaculty_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].CssClass = "align-middle";
        }
    }

    protected void gvFaculty_PreRender(object sender, EventArgs e)
    {
        if (gvFaculty.Rows.Count > 0)
        {
            gvFaculty.UseAccessibleHeader = true;
            gvFaculty.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}
