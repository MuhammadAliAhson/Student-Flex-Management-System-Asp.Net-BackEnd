<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AcademicFaculty.aspx.cs" Inherits="AcademicFaculty" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty List</title>
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

        .faculty-container {
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

        #txtFacultyID {
            border-radius: 20px;
            padding: 5px 10px;
            border: 1px solid #ccc;
            width: 100%;
            max-width: 300px;
        }

        .search-button {
            border-radius: 20px;
            padding: 5px 10px;
            background-color: transparent;
            border: 2px solid #4CAF50;
            color: #4CAF50;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            margin: 0 5px;
            margin-left: 10px;
            box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.1);
        }

        .search-button:hover {
            background-color: #4CAF50;
            color: white;
            box-shadow: 0px 5px 15px 0px rgba(0, 0, 0, 0.2);
        }

        .search-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="faculty-container">
            <div class="title">Faculty List</div>
            <div class="search-container">
                <asp:TextBox ID="txtFacultyID" runat="server" placeholder="Search by Faculty ID"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="search-button" Text="Search" OnClick="btnSearch_Click" />
            </div>
            <asp:Button ID="btnListAllFaculty" runat="server" CssClass="search-button" Text="List All Faculty Members" OnClick="btnListAllFaculty_Click" />
            <asp:GridView ID="gvFaculty" runat="server" AutoGenerateColumns="true" CssClass="table table-striped table-bordered" OnRowDataBound="gvFaculty_RowDataBound" OnPreRender="gvFaculty_PreRender"></asp:GridView>
        </div>
    </form>
</body>
</html>
