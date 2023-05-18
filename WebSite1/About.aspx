<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About</title>
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

        .about-container {
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

        .email-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .email {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .back-button {
            border-radius: 20px;
            padding: 5px 10px;
            background-color: transparent;
            border: 2px solid #4CAF50;
            color: #4CAF50;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            margin: 0 5px;
            box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.1);
        }

        .back-button:hover {
            background-color: #4CAF50;
            color: white;
            box-shadow: 0px 5px 15px 0px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="about-container">
            <div class="title">Database Systems Project "Flex Management System"</div>
            <div class="title">Done by Muhammad Faiq Fahim, Ali Ahson, and Muhammad Affan</div>
            <div class="email-container">
                <div class="email">Muhammad Faiq Fahim: i210627@nu.edu.pk</div>
                <div class="email">Ali Ahson: 21i-2535@nu.edu.pk</div>
                <div class="email">Muhammad Affan: 21i-047@nu.edu.pk</div>
            </div>
            <asp:Button ID="btnBackToHome" runat="server" CssClass="back-button" Text="Move to Home Page" OnClick="btnBackToHome_Click" />
        </div>
    </form>
</body>
</html>
