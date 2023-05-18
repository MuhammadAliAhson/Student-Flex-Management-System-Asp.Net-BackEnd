using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Feedback : Page
{
    protected string yourConnectionString = "Data Source=LAPTOP-739ALMC5\\SQLEXPRESS;Initial Catalog=DB_project;Integrated Security=True"; // Replace with your actual connection string.

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string GenerateNewFeedbackId()
    {
        Random random = new Random();
        return "F" + random.Next(10000, 99999); // Generate a new Feedback ID with 'F' followed by a random number.
    }

    private string GetUserIdFromUsername(string username)
    {
        string userId = string.Empty; // Initialize the userId variable

        using (SqlConnection conn = new SqlConnection(yourConnectionString))
        {
            conn.Open();

            SqlCommand cmd = new SqlCommand("SELECT UserId FROM Users WHERE Username = @Username", conn);
            cmd.Parameters.AddWithValue("@Username", username);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                userId = reader["UserId"].ToString();
            }

            conn.Close();
        }

        return userId;
    }

    private void InsertIntoGivesTable(string studentId, string facultyId, int rating, string feedbackId)
    {
        using (SqlConnection conn = new SqlConnection(yourConnectionString))
        {
            conn.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO Gives(StudentId, FacultyId, Rating, FeedbackId) VALUES(@StudentId, @FacultyId, @Rating, @FeedbackId)", conn);
            cmd.Parameters.AddWithValue("@StudentId", studentId);
            cmd.Parameters.AddWithValue("@FacultyId", facultyId);
            cmd.Parameters.AddWithValue("@Rating", rating);
            cmd.Parameters.AddWithValue("@FeedbackId", feedbackId);

            cmd.ExecuteNonQuery();

            conn.Close();
        }
    }


    private void InsertIntoFeedbackTable(string feedbackId, string feedback)
    {
        using (SqlConnection conn = new SqlConnection(yourConnectionString))
        {
            conn.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO Feedback(FeedbackId, Feedback) VALUES(@FeedbackId, @Feedback)", conn);
            cmd.Parameters.AddWithValue("@FeedbackId", feedbackId);
            cmd.Parameters.AddWithValue("@Feedback", feedback);

            cmd.ExecuteNonQuery();

            conn.Close();
        }
    }

    private int GetSelectedRating()
    {
        if (ViewState["SelectedRating"] != null)
        {
            return (int)ViewState["SelectedRating"];
        }
        else
        {
            // Default rating if none is selected.
            return 0;
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        // Get the user input
        string facultyIdInput = facultyId.Text;
        string feedbackInput = TextBox1.Text; // Based on your aspx file, TextBox1 is used for feedback.

        // Get the selected rating
        int rating = GetSelectedRating();

        // Generate a new Feedback ID.
        string newFeedbackId = GenerateNewFeedbackId();

        // Get the UserId corresponding to the Username passed in Session variable.
        string username = Session["Username"].ToString();
        string userId = GetUserIdFromUsername(username);

        // Insert into Feedback table first, then the Gives table.
        InsertIntoFeedbackTable(newFeedbackId, feedbackInput);
        InsertIntoGivesTable(userId, facultyIdInput, rating, newFeedbackId);

        // Clear the form
        facultyId.Text = "";
        TextBox1.Text = "";

        Response.Write("<script>alert('Feedback Submitted Successfully!');</script>");
        Response.Redirect("StudentMain.aspx");
    }


    // Add a method to handle the Rate_Click event
    protected void Rate_Click(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        ViewState["SelectedRating"] = int.Parse(button.Text); // Save rating value to ViewState
    }
}

