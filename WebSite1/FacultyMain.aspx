<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyMain.aspx.cs" Inherits="FacultyMain" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Home Page</title>
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

        .menu {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
            padding: 12px 16px;
            z-index: 1;
            top: 100%;
            left: 0;
        }


        .report {
            position: relative;
        }

        .report:hover .menu {
            display: block;
        }

        .welcome {
            font-size: 24px;
            font-weight: bold;
            color: #ffffff;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <span>Role: Faculty</span>
        </div>
        <div class="welcome">
            <asp:Label ID="Label1" runat="server" Text="Welcome to the Home Page"></asp:Label>
        </div>
        <p>
            <asp:Button ID="Button2" runat="server" CssClass="button" Text="Set Marks" OnClick="MarksButton_Click" />
            <asp:Button ID="Button3" runat="server" CssClass="button" Text="Attendence" OnClick="AttendenceButton_Click" />
            <asp:Button ID="Button4" runat="server" CssClass="button" Text="Evaluations" OnClick="EvaluationButton_Click" />
            <span class="button report">Report Generation
                <span class="menu">
                    <asp:Button ID="Button7" runat="server" CssClass="button" Text="Attendence Report" OnClick="Option1Button_Click" />
                    <asp:Button ID="Button8" runat="server" CssClass="button" Text="Evaluation Report" OnClick="Option2Button_Click" />
                    <asp:Button ID="Button9" runat="server" CssClass="button" Text="Grade Report" OnClick="Option3Button_Click" />
                    <asp:Button ID="Button12" runat="server" CssClass="button" Text="Count Grade Report" OnClick="Option4Button_Click" />
                    <asp:Button ID="Button13" runat="server" CssClass="button" Text="Student Feedback Report" OnClick="Option5Button_Click" />
                </span>
            </span>
            <asp:Button ID="Button14" runat="server" CssClass="button" Text="Main Menu" OnClick="Option6Button_Click" />
        </p>
    </form>
</body>
</html>
