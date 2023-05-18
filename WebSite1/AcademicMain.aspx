<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AcademicMain.aspx.cs" Inherits="AcademicMain" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function reportButtonClick() {
            $('#myModal').modal('show');
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <span>Role: Academic Officer</span>
        </div>
        <div class="welcome">
            <asp:Label ID="Label1" runat="server" Text="Welcome to the Home Page"></asp:Label>
        </div>
        <p>
            <asp:Button ID="Button2" runat="server" CssClass="button" Text="Marks" OnClick="MarksButton_Click" />
            <asp:Button ID="Button3" runat="server" CssClass="button" Text="Offered Courses" OnClick="OfferedCoursesButton_Click" />
            <asp:Button ID="Button4" runat="server" CssClass="button" Text="Course Register" OnClick="CourseRegisterButton_Click" />
            <asp:Button ID="Button5" runat="server" CssClass="button" Text="Faculty" OnClick="FacultyButton_Click" />
            <asp:Button ID="AllocateCourseToFacultyButton" runat="server" CssClass="button" Text="Allocate Course to Faculty" OnClick="AllocateCourseToFacultyButton_Click" />
            <asp:Button ID="Button7" runat="server" CssClass="button" Text="Report Generation" OnClientClick="reportButtonClick(); return false;" />

        </p>

        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Report Generation</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        This feature can be used by going to Visual Studio, not on the website.
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
