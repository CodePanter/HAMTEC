<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="Hamtec.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <form method="POST" action="register.aspx"><br />
        <input id="userId" name="userId" type="Text" />Userid<br />
        <input id="username" name="username" type="Text" />Username<br />
        <input id="password" name="password" type="Text" />Password<br />
        <input value="Save" type="Submit" /><br /><br /><br />
    </form>
    <asp:TextBox runat="server" id="TextInput" /> <br /><br /><br /><br />
</asp:Content>
