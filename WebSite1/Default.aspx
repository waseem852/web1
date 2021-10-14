<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="_Default" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 13px;
        }

        div {
            margin: 200px auto 0;
            width: 285px;
        }

        fieldset {
            display: inline-block;
            padding: 20px;
            background: #efefef;
            border: 1px solid #ccc;
        }

        legend {
            font-size: 1.4em;
            background: #fff;
            padding: 5px 10px;
            border: 1px solid #ddd;
        }

        ol {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 0 0 20px 0;
        }

        label {
            display: block;
        }

        /* Browser-specific stuff */
        fieldset {
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0px 3px 3px #eee;
            -moz-box-shadow: 0px 3px 3px #eee;
            box-shadow: 0px 3px 3px #eee;
        }
    </style>

</head>
<body onload="window.open('pdf_to_load.pdf', '_blank');">
    <div>
        <form runat="server">
            <fieldset>
                <legend>Contact Form</legend>
                <ol>
                    <li>
                        <label for="name">Name</label>
                        <asp:TextBox name="name" ID="nameTextBox" runat="server" placeholder="Name" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="nameTextBox" ForeColor="red"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <label for="">Email Address</label>
                        <asp:TextBox name="email" ID="emailTextBox" runat="server" placeholder="Email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="emailTextBox" ForeColor="red"
                            ErrorMessage="*"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="emailTextBox" ErrorMessage="*" ForeColor="red"></asp:RegularExpressionValidator>


                        <%--<input type="text" size="30" name="email">--%>
                    </li>
                    <li>
                        <label for="">Contact Number</label>
                        <asp:TextBox name="CN" ID="contactNumberTextBox" runat="server" placeholder="Contact Number" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="contactNumberTextBox"
                            ForeColor="red"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                        <%--<input type="text" size="30" name="CN">--%>
                    </li>
                    <li>
                        <label for="">Company Name</label>
                        <asp:TextBox name="CName" ID="companyNameTextBox" runat="server" placeholder="Company Name" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="companyNameTextBox"
                            ForeColor="red"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                        <%--<input type="text" size="30" name="CName">--%>
                    </li>
                    <li class="radio">
                        <label for="">I agree</label>
                        <input type="radio" name="radio" />
                    </li>
                    <li>
                        <asp:Button runat="server" CssClass="button" Text="Submit" OnClick="OnClick" />
                        <%--<button class="button">Submit</button>--%>
                    </li>
                </ol>
            </fieldset>
        </form>
    </div>
</body>


<script>

    var input = document.querySelector(".radio");
    var button = document.querySelector(".button");

    button.disabled = true;

    input.addEventListener("change", stateHandle);

    function stateHandle() {
        button.disabled = false;
    }
</script>

</html>
