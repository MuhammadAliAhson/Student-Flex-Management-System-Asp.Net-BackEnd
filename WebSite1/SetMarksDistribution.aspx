<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetMarksDistribution.aspx.cs" Inherits="SetMarksDistribution" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marks Distribution</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            display:flex;
            max-width: 800vh;
            padding: 20px;
            background-color:aliceblue;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
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
        .form1{
            
        }
        .button:hover {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="title">Welcome to Marks distribution Portal</div>
        <div class="title" id="courseidname" runat="server">Hello</div>
        <div class="container">
            <div class="labels">
                <div class="col-form-label">Evaluation Name</div>
                <div class="col-form-label">Assignment</div>
                <div class="col-form-label">Final Exam</div>
                <div class="col-form-label">Quiz</div>
                <div class="col-form-label">Sessional</div>
                <div class="col-form-label">Project</div>
            </div>
            <div class="valuesInputs">
                <div class="col-form-label">Weightage</div>
                <input type="number" class="weightageInput" id="assignment" runat="server" min="1" max="100" />
                <input type="number" class="weightageInput" id="final" runat="server" min="1" max="100"/>
                <input type="number" class="weightageInput" id="quiz" runat="server" min="1" max="100"/>
                <input type="number" class="weightageInput" id="sessional" runat="server" min="1" max="100"/>
                <input type="number" class="weightageInput" id="project" runat="server" min="1" max="100"/>
            </div>
            <div class="values">
                <div class="col-form-label">Range</div>
                <div class="col-form-label">1-100</div>
                <div class="col-form-label">1-100</div>
                <div class="col-form-label">1-100</div>
                <div class="col-form-label">1-100</div>
                <div class="col-form-label">1-100</div>
            </div>
        </div>
        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Save" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" CssClass="button" Text="Main Menu" OnClick="Button2_Click" />
    </form>
</body>
</html>

<script>
    var inputs = document.querySelectorAll('.weightageInput');
    inputs.forEach(function(input) {
        input.addEventListener('input', function() {
            var value = parseInt(this.value);
            if (isNaN(value) || value < 1 || value > 100) {
                this.value = '';
            }
        });
    });
</script>
