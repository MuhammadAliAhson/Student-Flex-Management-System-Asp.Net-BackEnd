<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseRegistration.aspx.cs" Inherits="CourseRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Registration Form</title>
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

        .registration-form {
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 800px;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        .input-box {
            border-radius: 5px;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }

        .button {
            border-radius: 20px;
            padding: 5px 10px;
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

        .red-button {
            background-color: #ff0000;
            color: white;
            border-color: #ff0000;
        }

        .red-button:hover {
            background-color: #cc0000;
            border-color: #cc0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-form">
            <div class="title">Course Registration Form</div>
            <asp:TextBox ID="txtAcademicId" runat="server" CssClass="input-box" placeholder="Enter Academic ID"></asp:TextBox>
            <asp:TextBox ID="txtCourseId" runat="server" CssClass="input-box" placeholder="Enter Course ID"></asp:TextBox>
            <asp:TextBox ID="txtStudentId" runat="server" CssClass="input-box" placeholder="Enter Student ID"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" CssClass="button" Text="Submit" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblSuccess" runat="server" Visible="False"></asp:Label>
            <asp:Button ID="btnBack" runat="server" CssClass="button red-button" Text="Back" OnClick="btnBack_Click" Visible="False" />
        </div>
    </form>
</body>
</html>
