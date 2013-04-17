<%@ Page Title="Create new topic" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="newtopic.aspx.cs" Inherits="Hamtec.newtopic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <form method="POST" action="register.aspx" name="registerForm">
    <table id="centertable">   
    <tr>
    <th colspan=2><h1>New Topic</h1></th>
    </tr>
    <tr>
        <td>Subject</td>
        <td> <input id="subject" name="subject" type="Text" /></td>
    </tr>
    <tr>
        <td>Question</td>
        <td><textarea id="question" name="question" cols=40 rows=10/> </textarea></td>
    </tr>   
    <tr>
        <td>Tag</td>
        <td> <input id="tag"   name="tag" type="Text" /></td>
        <td><asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></td>
    </tr>
     <tr>
        <td>Category</td>
        <td><asp:DropDownList ID="DropDownList1" runat="server" name="categorie"
      DataSourceID="SqlDataSource1" DataTextField="categorie" 
      DataValueField="categorie">
  </asp:DropDownList></td>
     </tr>  
       <tr>
            <td></td>
            <td><input value="Save" type="Submit" /></td>
       </tr>
    </table>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
      ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
      SelectCommand="SELECT [categorie] FROM [categorieen]"></asp:SqlDataSource>
  <br /><br />
        <br />
    </form>
    <asp:TextBox runat="server" id="TextInput" visible="false"/> <br /><br /><br /><br />
</asp:Content>
