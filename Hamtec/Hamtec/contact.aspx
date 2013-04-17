<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Hamtec.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br /> <br /> 
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
    <table id="centertable">
    <tr>
        <th colspan=2><h1>Contactform</h1></th>    
    </tr>
    <tr>
        <td>  Your name:</td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="YourName" ValidationGroup="save" /><asp:TextBox ID="YourName" runat="server" Width="250px" /></td>
    </tr>
    <tr>
        <td>Your E-mail adress:</td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="YourEmail" ValidationGroup="save" /><asp:TextBox ID="YourEmail" runat="server" Width="250px" /><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23"
            SetFocusOnError="true" Text="Voorbeeld: gebruikersnaam@email.nl" ControlToValidate="YourEmail"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
            ValidationGroup="save" /></td>
    </tr>
    <tr>
        <td>Subject:</td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="YourSubject" ValidationGroup="save" /><asp:TextBox ID="YourSubject" runat="server" Width="400px" /></td>
    </tr>
    <tr>
        <td>Your question/bug report:</td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
            ControlToValidate="Comments" ValidationGroup="save" /><asp:TextBox ID="Comments" runat="server" 
                TextMode="MultiLine" Rows="10" Width="400px" /></td>
    </tr>
    <tr>
        <td></td>
        <td><asp:Button ID="btnSubmit" runat="server" Text="Send" OnClick="Button1_Click" ValidationGroup="save" /></td>
    </tr>
        
    
    </table>
</asp:Panel>
<p>
    <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
</p>  
<br /> <br />

</asp:Content>
