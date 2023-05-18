<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentMarks.aspx.cs" Inherits="StudentMarks" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Marks</title>
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

        .search-container {
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: none; /* remove the max-width restriction */
        }

        #gvMarks {
            width: 100%;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 10px;
        }

        #gvMarks th, #gvMarks td {
            border: 1px solid #ccc;
            padding: 5px;
            text-align: left;
        }

        #gvMarks th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        #gvMarks tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="search-container">
            <asp:DropDownList ID="ddlMarksType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMarksType_SelectedIndexChanged">
                <asp:ListItem Value="Assignments">Assignments</asp:ListItem>
                <asp:ListItem Value="Final">Final</asp:ListItem>
                <asp:ListItem Value="Project">Project</asp:ListItem>
                <asp:ListItem Value="Quizzes">Quizzes</asp:ListItem>
                <asp:ListItem Value="Sessional">Sessional</asp:ListItem>
            </asp:DropDownList>
                <asp:GridView ID="gvMarks" runat="server" AutoGenerateColumns="true"></asp:GridView>
        </div>
    </form>
</body>
</html>
