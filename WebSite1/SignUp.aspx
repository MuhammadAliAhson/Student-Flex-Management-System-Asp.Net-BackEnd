<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
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

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .form-group label {
            margin-bottom: 5px;
        }

        .form-group input {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form runat="server">
        <h2 class="header">Sign Up</h2>
        <div class="form-group">
            <label for="inputUsername" class="sr-only">Username</label>
            <asp:TextBox runat="server" ID="inputUsername" class="form-control" placeholder="Username" required="" autofocus="" type="text"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="sr-only">Password</label>
            <asp:TextBox runat="server" ID="inputPassword" class="form-control" placeholder="Password" required="" type="password"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="inputRole" class="sr-only">Role</label>
            <asp:TextBox runat="server" ID="inputUserType" class="form-control" placeholder="UserType" required="" type="text"></asp:TextBox>
        </div>
                <asp:Button runat="server" ID="signupButton" class="button" Text="Sign Up" OnClick="signupButton_Click" />
    </form>
</body> 
</html>

