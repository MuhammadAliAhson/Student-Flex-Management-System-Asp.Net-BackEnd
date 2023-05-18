<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Marks.aspx.cs" Inherits="Marks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marks</title>
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

        .search-bar {
            position: relative;
            margin-bottom: 10px;
        }

        #txtRollNumber {
            border-radius: 20px;
            border: 1px solid #ccc;
            padding: 5px 10px;
            width: 100%;
            outline: none;
            box-sizing: border-box;
        }

        #btnSearch {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            cursor: pointer;
            font-size: 16px;
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
    <form id="form1" runat="server">
        <div class="search-container">
            <div class="search-bar">
                <asp:TextBox ID="txtRollNumber" runat="server" placeholder="Enter Roll Number"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="🔍" OnClick="btnSearch_Click" />
            </div>
            <asp:GridView ID="gvMarks" runat="server" AutoGenerateColumns="true"></asp:GridView>
        </div>
    </form>
</body>
</html>
