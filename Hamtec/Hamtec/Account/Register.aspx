﻿<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
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
        <input id="email" name="email" type="Text" />Email adres<br />

        <input id="naam"   name="naam" type="Text" />Name<br />
        <input id="city"   name="city" type="Text" />City<br />
        <input id="adress"   name="adress" type="Text" />Adress<br />
        <input value="Save" type="Submit" /><br />
    <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
    <br /><br />
    </form>
    <br /><br /><br /><br />
</asp:Content>
