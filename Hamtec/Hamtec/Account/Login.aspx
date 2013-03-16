<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="Hamtec.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>Login</h1>
    <form method="POST" action="register.aspx" name="registerForm"><br />        
        <input id="username" name="username" type="Text" />Username<br />
        <input id="password" name="password" type="Password" />Password<br />
        <input value="Login" type="Submit" /><br /><br /><br />
    </form>        
    <asp:label runat="server" id="TextInput" /> <br /><br /><br /><br />
</asp:Content>
