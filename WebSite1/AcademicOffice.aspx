<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AcademicOffice.aspx.cs" Inherits="AcademicOffice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Academic Office Login</title>
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
            position: relative;
        }

        .welcome-banner {
            position: absolute;
            top: 20px;
            left: 0;
            right: 0;
            text-align: center;
            color: #ffffff;
            font-size: 24px;
            font-weight: bold;
        }

        .container {
            max-width: 400px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        input[type=text], input[type=password] {
            border-radius: 50px;
        }

        .input-group-text {
            border-top-right-radius: 50px;
            border-bottom-right-radius: 50px;
        }

        .form-group {
                        margin-bottom: 20px;
        }

        .show-password {
            cursor: pointer;
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function togglePasswordVisibility(inputId, iconId) {
            var passwordInput = document.getElementById(inputId);
            var passwordIcon = document.getElementById(iconId);

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                passwordIcon.classList.remove("glyphicon-eye-open");
                passwordIcon.classList.add("glyphicon-eye-close");
            } else {
                passwordInput.type = "password";
                passwordIcon.classList.remove("glyphicon-eye-close");
                passwordIcon.classList.add("glyphicon-eye-open");
            }
        }
    </script>
</head>
<body>
    <div class="welcome-banner">Welcome to Flex - Academic Office Login</div>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Academic Office Login</h2>
            <div class="form-group">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" />
            </div>
            <div class="form-group">
                <div class="input-group">
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password" />
                    <div class="input-group-append">
                        <span class="input-group-text show-password" onclick="togglePasswordVisibility('txtPassword', 'password-icon')">
                            <i class="glyphicon glyphicon-eye-open" id="password-icon"></i>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="LoginButton" runat="server" CssClass="btn btn-primary btn-block" Text="Login" OnClick="LoginButton_Click" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <asp:Button ID="SignUpButton" runat="server" CssClass="btn btn-secondary btn-block" Text="Sign Up" OnClick="SignUpButton_Click" />
            </div>
        </div>
    </form>

    <!-- Sign Up Modal -->
    <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signupModalLabel">Sign Up</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                                                        <input type="text" class="form-control" id="signupName" placeholder="Name" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="signupUsername" placeholder="Username" />
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="password" class="form-control" id="signupPassword" placeholder="Password" />
                                <div class="input-group-append">
                                    <span class="input-group-text show-password" onclick="togglePasswordVisibility('signupPassword', 'signup-password-icon')">
                                        <i class="glyphicon glyphicon-eye-open" id="signup-password-icon"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>


