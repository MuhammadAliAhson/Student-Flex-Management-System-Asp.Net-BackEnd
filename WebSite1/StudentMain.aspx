<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentMain.aspx.cs" Inherits="StudentMain" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Main</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: white;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
        }

        .button {
            border-radius: 20px;
            padding: 10px 20px;
            background-color: transparent;
            border: 2px solid #4CAF50;
            color: #4CAF50;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            margin: 0 5px;
        }

        .button:hover {
            background-color: #4CAF50;
            color: white;
        }

        .welcome {
            font-size: 24px;
            font-weight: bold;
            color: #ffffff;
            text-align: center;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <span>Role: Student</span>
        </div>
        <div class="welcome">
            <asp:Label ID="Label1" runat="server" Text="Welcome to the Student Main Page"></asp:Label>
        </div>
        <p>
            <asp:Button ID="MarksButton" runat="server" CssClass="button" Text="Marks" OnClick="MarksButton_Click" />
            <asp:Button ID="AttendanceButton" runat="server" CssClass="button" Text="Attendance" OnClick="AttendanceButton_Click" />
            <asp:Button ID="CoursesButton" runat="server" CssClass="button" Text="Courses" OnClick="CoursesButton_Click" />
            <asp:Button ID="FeedbackButton" runat="server" CssClass="button" Text="Feedback" OnClick="FeedbackButton_Click" />
            <asp:Button ID="GoBackButton" runat="server" CssClass="button" Text="Go Back to Main Page" OnClick="GoBackButton_Click" style="position:absolute; bottom:0; left:0; margin:20px;" />
        </p>
        </form>
    </body>
</html>

