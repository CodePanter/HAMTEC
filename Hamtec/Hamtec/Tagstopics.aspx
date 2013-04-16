<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tagstopics.aspx.cs" Inherits="Hamtec.Tagstopics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        BackColor="#999999" Width="750px">
        <ItemTemplate>
            subject:
            <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' />
            <br />
            message:
            <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
<br />
            tags:
            <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        
        SelectCommand="SELECT [subject], [message], [tags] FROM [topics] WHERE ([tags] like @Tags)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Tags" QueryStringField="Tags" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <p>
    </p>
</asp:Content>
