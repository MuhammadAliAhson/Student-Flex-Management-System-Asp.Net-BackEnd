<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Evaluations.aspx.cs" Inherits="Evaluations" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Evaluations</title>
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
            
            max-width: 800vh;
            padding: 20px;
            background-color:aliceblue;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
            /*height: 600px; */
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
            padding-right: 2em;
        }
        #obtained div{
            display:flex;
        }
        p{
            padding-right: 4em;
        }
        .alertheading{
            display:flex;
        }
        .alertheading b{
            padding-right: 2.5em;
        }
        .form1{
            
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
        <div class="title">Welcome to Evaluation Portal</div>
        <div class="title" id="courseidname" runat="server">Hello</div>
        <div class="container">
            <div class="alertheading">
                <b>RegNo</b>                           
                <b>Name</b> 
                <b>CourseID</b> 
                <b>CourseName</b> 
                <b>EvaluationType</b> 
                <b>Section</b>
                <b>ObtainedMarks</b> 
                <b>TotalMarks</b> 
            </div>
            <div class="Lists">
                <asp:DataList class="list" ID="regno" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("RegNo") %></p>
                            
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="snames" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("Name") %></p>
                           
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="courseid" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("CourseId") %></p>
                            
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="coursename" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("CourseName") %></p>
                            
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="evaltype" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("EvaluationType") %></p>
                            
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="section" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("Section") %></p>
                            
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="obtained" runat="server">
                    <ItemTemplate>
                        <div>
                            <input type="number" class="obtainedInput" id="obtainedInput" runat="server" min="1" />
                            <p style="opacity: 0.5;" class="prev" id="prev"><%# Eval("ObtainedWeightage") %></p>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList class="list" ID="total" runat="server">
                    <ItemTemplate>
                        <div>
                            <p class="total"><%# Eval("TotalWeightage") %></p>
                            
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Save" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" CssClass="button" Text="Main Menu" OnClick="Button2_Click" />
    </form>
</body>
</html>

<script>
    function validateInput() {
        var obtainedInputs = document.querySelectorAll('.obtainedInput');
        var obtainedTotals = document.querySelectorAll('.total');
        for (var i = 0; i < obtainedInputs.length; i++) {
            var obtainedInput = obtainedInputs[i];
            var total = obtainedTotals[i];
            var maxVal = parseInt(total.innerText);

            if (parseInt(obtainedInput.value) > maxVal) {
                obtainedInput.value = '';
                alert('Value should not be greater than ' + maxVal);
            }
        }
    }

    var obtainedInputs = document.querySelectorAll('.obtainedInput');
    for (var i = 0; i < obtainedInputs.length; i++) {
        obtainedInputs[i].addEventListener('change', validateInput);
    }
</script>

