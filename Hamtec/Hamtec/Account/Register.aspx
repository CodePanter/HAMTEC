<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="Hamtec.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>Registration</h1>
    <form method="POST" action="register.aspx" name="registerForm"><br />        
        <input id="username" name="username" type="Text" />Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Text="Label" 
        Visible="False"></asp:Label>
    <br />
        <input id="password" name="password" type="Password" />Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:Label ID="Label2" runat="server" ForeColor="#CC0000" Text="Label" 
        Visible="False"></asp:Label>
    <br />
        <input id="password2" name="password2" type="Password" />Retype Password<br />
        <input id="email" name="email" type="Text" />Email adres<br /><br />

        <input id="voornaam"   name="voornaam" type="Text" />First name<br />
        <input id="achternaam" name="achternaam" type="Text" />Last name<br />
        <input value="Save" type="Submit" /><br /><br /><br />
    </form>
    <br /><br /><br /><br />
</asp:Content>
