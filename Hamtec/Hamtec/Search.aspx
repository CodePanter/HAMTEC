<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Hamtec.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br class="style1" /><span class="style1">Search. </span>
    <br />
    Topic name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    Part of question:&nbsp;
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    Category:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="categorie" 
        DataValueField="categorie">
    </asp:DropDownList>
    <br />
    One tag:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        SelectCommand="SELECT DISTINCT [categorie] FROM [categorieen]">
    </asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Text="Search" />
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
        <ItemTemplate>
            subject:
            <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' />
            <br />
            message:
            <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
            <br />
            categorie:
            <asp:Label ID="categorieLabel" runat="server" Text='<%# Eval("categorie") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        
        
        SelectCommand="SELECT [subject], [message], [categorie]
FROM [topics] 
WHERE (([categorie] = @categorie) OR([subject] LIKE '%' + @subject + '%') OR([message] LIKE '%' + @message + '%') OR ([tags] LIKE '%' + @tags + '%'))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="categorie" 
                PropertyName="SelectedValue" Type="String" DefaultValue="None" />
            <asp:ControlParameter ControlID="TextBox1" Name="subject" PropertyName="Text" 
                Type="String" DefaultValue="Optional subject." />
            <asp:ControlParameter ControlID="TextBox2" DefaultValue="Optional question." 
                Name="message" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox3" DefaultValue="Optional tag." 
                Name="tags" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <p>
    </p><br /><br /><br /><br /><br />
</asp:Content>
