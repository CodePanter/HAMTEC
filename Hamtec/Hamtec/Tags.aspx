<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tags.aspx.cs" Inherits="Hamtec.Tags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <br />
            <B>Most searched Tags.</B>
            <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
        <b><a href='/Tagstopics.aspx?Tags=<%# Server.UrlEncode(Eval("Tags").ToString()) %>'><asp:Label ID="Label1" runat="server" Text='<%# Eval("Tags")%>' /></a></b>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        SelectCommand="SELECT * FROM [tags] ORDER BY [Count] DESC, [Tags]">
    </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
