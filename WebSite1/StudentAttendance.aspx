<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentAttendance.aspx.cs" Inherits="StudentAttendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Attendance</title>
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

    .courses-container {
        background-color: white;
        border-radius: 5px;
        padding: 20px;
        box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        width: 100%;
        max-width: 800px;
        margin-top: 40px; /* Add this line */
    }

        .title {
            font-size: 24px;
            font-weight: bold;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        #gvCourses {
            width: 100%;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 10px;
        }

        #gvCourses th, #gvCourses td {
            border: 1px solid #ccc;
            padding: 5px;
            text-align: left;
        }

        #gvCourses th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        #gvCourses tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .generate-results {
            border-radius: 20px;
            padding: 10px 20px;
            background-color: transparent;
            border: 2px solid #4CAF50;
            color: #4CAF50;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            margin: 0 5px;
            box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.1);
        }

        .generate-results:hover {
            background-color: #4CAF50;
            color: white;
            box-shadow: 0px 5px 15px 0px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="courses-container">
            <div class="title">Student Attendance</div>
            <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="true"></asp:GridView>
            <asp:Button ID="btnGenerateResults" runat="server" CssClass="generate-results" Text="Generate Results" OnClick="btnGenerateResults_Click" />
        </div>
    </form>
</body>
</html>
