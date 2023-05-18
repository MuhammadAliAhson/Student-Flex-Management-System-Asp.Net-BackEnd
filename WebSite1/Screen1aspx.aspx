<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Screen1aspx.aspx.cs" Inherits="Screen1aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Role Selection</title>
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
            max-width: 600px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
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
            color: #ffffff;
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
    <div class="title">Welcome to Role Selection Page of FLEX</div>
    <form id="form1" runat="server">
        <div class="container">
            <div class="text-center">
                <h2>Select the Option to Log into</h2>
            </div>
            <label>Select a role:</label>
            <div class="btn-group">
                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" Text="Academic Office" CssClass="btn btn-outline-primary" OnClick="Button1_Click" />
                </div>
                <div class="form-group">
                    <asp:Button ID="Button2" runat="server" Text="Faculty" CssClass="btn btn-outline-primary" OnClick="Button2_Click" />
                </div>
                <div class="form-group">
                    <asp:Button ID="Button3" runat="server" Text="Student" CssClass="btn btn-outline-primary" OnClick="Button3_Click" />
                </div>
                <div class="form-group">
                    <asp:Button ID="Button4" runat="server" Text="About" CssClass="btn btn-outline-primary" OnClick="Button4_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
