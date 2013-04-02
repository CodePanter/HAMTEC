<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="Hamtec.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<form method="POST" action="register.aspx" name="registerForm"><br /> 
<table id="centertable">
    <tr>
        <th colspan=2><h1>Registration</h1></th>
    </tr>    
    <tr>
        <td id="td120">Username</td>
        <td><input id="username" name="username" type="Text" /></td>
        <td><asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><input id="password" name="password" type="Password" /></td>
        <td><asp:Label ID="Label2" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label></td>
    </tr>   
    <tr>
        <td>Retype password</td>
        <td><input id="password2" name="password2" type="Password" /></td>
    </tr>
    <tr>
        <td>Email adress</td>
        <td><input id="email" name="email" type="Text" /></td>
    </tr>
    <tr>
        <td>Name</td>
        <td><input id="naam"   name="naam" type="Text" /></td>
    </tr>
     <tr>
        <td>City</td>
        <td><input id="city"   name="city" type="Text" /></td>
    </tr>
    <tr>
        <td>Adress</td>
        <td><input id="adress"   name="adress" type="Text" /></td>    
    </tr>
    <tr>
        <td></td>
        <td><input value="Save" type="Submit" /></td>
        <td><asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label></td>
    </tr>    
    </table>
</form>

    <br /><br /><br /><br />
</asp:Content>
