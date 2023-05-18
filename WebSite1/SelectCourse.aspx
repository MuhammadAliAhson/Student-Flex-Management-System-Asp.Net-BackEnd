<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectCourse.aspx.cs" Inherits="SelectCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Course</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Add custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            padding: 20px;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .title {
            color: #ffffff;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .container {
            max-width: 800px;
            padding: 20px;
            background-color:aliceblue;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
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

        .btn {
            border-radius: 50px;
            margin-bottom: 20px;
            transition: all 0.3s;
        }

        .btn:hover {
            background-color: #5cb85c;
            color: #fff;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.2);
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            color: #000000;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
        .form-group{
            padding-left: 50px;
        }
        #form1{
            display: flex;
            align-content:center;
        }
        #Button2{
            padding-inline: 50px;
        }
        .enterButton{
            padding-left: 50px;
        }
        #courses{
            inline-size:max-content;
            /*padding-inline: 150px;*/
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="title">Select a Course</div>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="campus">Campus:</label>
                        <select class="form-control" id="campus">
                            <option value="campus1">Islamabad</option>
                            <option value="campus2">Lahore</option>
                            <option value="campus3">Peshawar</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="semester">Semester:</label>
                        <asp:DropDownList class="form-control" id="semester" runat="server">
                            <asp:ListItem value="Fall 22">Fall 22</asp:ListItem>
                            <asp:ListItem value="Spring 22">Spring 22</asp:ListItem>
                            <asp:ListItem value="Summer 23">Summer 23</asp:ListItem>
                            <asp:ListItem value="Fall 21">Fall 21</asp:ListItem>
                            <asp:ListItem value="Spring 21">Spring 21</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
             </div>
          </div>
        <div class="form-group">
            <label for="courses">Search for Courses:</label>
            <asp:Button ID="Button2" runat="server" CssClass="button" Text="Search" OnClick="SearchButton_Click" />
        </div>
        <div class="form-group">
            <label for="courses">Courses:</label>
            <select class="form-control" id="courses" runat="server" >
                <option value="-- Select a course --">-- Select a course --</option>
            </select>
        </div>
        <div class="enterButton">
            <asp:Button ID="Button1" runat="server" CssClass="button" Text="Continue" OnClick="Button1_Click" />
        </div>
    </form>


</body>
</html>


