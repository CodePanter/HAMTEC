<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Hamtec.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table id="centertable">
    <tr>
        <th colspan=2><h1>Search</h1></th>
    </tr>
    <tr>
        <td>Topic name</td>
        <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Part of question</td>
        <td> <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Category</td>
        <td><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="categorie" DataValueField="categorie"></asp:DropDownList></td>
    </tr>
    <tr>
        <td>One tag</td>
        <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
    </tr>    
    <tr>
        <td></td>
        <td><asp:Button ID="Button1" runat="server" Text="Search" /></td>
    </tr>
  </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        SelectCommand="SELECT DISTINCT [categorie] FROM [categorieen]">
    </asp:SqlDataSource>
    
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" style="margin: auto;">
        <ItemTemplate>
            subject:
            <b><a href='/../topics/topics.aspx?topicid=<%# Eval("topicid") %>'><asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject")%>' /></a></b>
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
        
        
        SelectCommand="SELECT [subject], [message], [categorie], [topicid]
FROM [topics] 
WHERE (([categorie] = @categorie) OR([subject] LIKE '%' + @subject + '%') OR([message] LIKE '%' + @message + '%') OR ([tags] LIKE '%' + @tags + '%')) AND subject != 'vvvv' ">
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
