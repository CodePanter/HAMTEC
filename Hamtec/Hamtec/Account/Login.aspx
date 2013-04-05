<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="Hamtec.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">    
    <form method="POST" action="login.aspx" name="inlogForm"><br />  
        <table id="centertable">   
        <tr>
            <th colspan="2" align=center><h1>Login</h1></th>
        </tr>   
        <tr>
            <td id="td120">Username</td>
            <td><input id="username" name="username" type="Text" /></td>
        </tr>
        <tr>
            <td >Password</td>
            <td><input id="password" name="password" type="Password" /></td>
        </tr>
        <tr>           
            <td></td> 
            <td><input value="Login" type="Submit" /></td>
        </tr>         
        <tr>
            <td colspan="2">No account? <a href="register.aspx">Register</a></td>
        </tr>
        </table>
    </form>        
    <asp:label runat="server" id="TextInput" /> <br /><br /><br /><br />
</asp:Content>
