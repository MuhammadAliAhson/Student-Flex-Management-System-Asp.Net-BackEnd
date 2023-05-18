<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback Form</title>
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

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form2" runat="server">
        <div class="header">
            <span>Role: Student</span>
        </div>
        <div class="form-container">
            <h2 class="text-center">Feedback Form</h2>
            <div class="form-group">
                <asp:Label runat="server" Text="Faculty ID"></asp:Label>
                <asp:TextBox ID="facultyId" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Rate Your Faculty"></asp:Label>
                <div id="rating">
                    <asp:Button ID="rate1" runat="server" CssClass="button rate" Text="1" OnClick="Rate_Click" />
                    <asp:Button ID="rate2" runat="server" CssClass="button rate" Text="2" OnClick="Rate_Click" />
                    <asp:Button ID="rate3" runat="server" CssClass="button rate" Text="3" OnClick="Rate_Click" />
                    <asp:Button ID="rate4" runat="server" CssClass="button rate" Text="4" OnClick="Rate_Click" />
                    <asp:Button ID="rate5" runat="server" CssClass="button rate" Text="5" OnClick="Rate_Click" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Feedback"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" CssClass="button" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
