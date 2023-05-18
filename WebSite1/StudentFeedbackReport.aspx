<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentFeedbackReport.aspx.cs" Inherits="StudentFeedbackReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Feedback Report</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content:center;
            align-items:center;
            height: 100vh;
            flex-direction: column;
        }
        .title {
            color: #ffffff;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .container {
            position:relative;
            max-width: 1000vh;
            padding: 20px;
            background-color:aliceblue;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
            height: 600px;
            overflow: auto;
        }
        .col-form-label{
            padding-inline: 2vh;
        }
        .valuesInputs{
            display:grid;
            inline-size:min-content;
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
        .Lists{
            display:flex;
        }
        .list{
            padding-right: 8em;
        }
        #obtained div{
            display:flex;
        }
        p{
            padding-right: 6em;
        }
        .alertheading{
            display:flex;
            position:sticky;
        }
        .alertheading b{
            padding-right: 2.5em;
        }
        #form1{
            
        }
        .button:hover {
            background-color: #4CAF50;
            color: white;
        }
        .obtainedInput{
            max-inline-size:40px;
            inline-size:min-content;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="title">Welcome to Student Feedback Report Portal</div>
        <div class="container">
            <div class="alertheading">
                <b>StudentId</b>                           
                <b>FacultyId</b> 
                <b>Rating</b> 
                <b>Feedback</b>
            </div>
            <div class="Lists">
                <asp:DataList class="list" ID="student" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("StudentId") %></p>
                            
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="faculty" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("FacultyId") %></p>
                           
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="rating" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("Rating") %></p>
                            
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="feedback" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("Feedback") %></p>
                            
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <asp:Button ID="Button2" runat="server" CssClass="button" Text="Main Menu" OnClick="Button2_Click" />
    </form>
</body>
</html>





