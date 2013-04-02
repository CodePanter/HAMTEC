<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="newtopic.aspx.cs" Inherits="Hamtec.newtopic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <form method="POST" action="register.aspx" name="registerForm"><br />        
        <input id="subject" name="subject" type="Text" />Subject<br />
        <textarea id="question" name="question" /> </textarea>Question<br />
        <input id="tag"   name="tag" type="Text" />Tag<br />
        <asp:DropDownList ID="DropDownList1" runat="server" name="categorie"
      DataSourceID="SqlDataSource1" DataTextField="categorie" 
      DataValueField="categorie">
  </asp:DropDownList>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
      ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
      SelectCommand="SELECT [categorie] FROM [categorieen]"></asp:SqlDataSource>
  <br /><br />
        <input value="Save" type="Submit" /><br />
    </form>
    <asp:TextBox runat="server" id="TextInput" /> <br /><br /><br /><br />
</asp:Content>
