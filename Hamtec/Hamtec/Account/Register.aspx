<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="Hamtec.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <form method="POST" action="register.aspx" name="registerForm"><br />        
        <input id="username" name="username" type="Text" />Username<br />
        <input id="password" name="password" type="Password" />Password<br />
        <input id="voornaam"   name="voornaam" type="Text" />Voornaam<br />
        <input id="achternaam" name="achternaam" type="Text" />Achternaam<br />
        <input value="Save" type="Submit" /><br /><br /><br />
    </form>
    <asp:TextBox runat="server" id="TextInput" /> <br /><br /><br /><br />
</asp:Content>
