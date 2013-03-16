<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="Hamtec.Account.myaccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    

    <asp:DataList ID="DataList1" runat="server" DataKeyField="userid" 
        DataSourceID="SqlDataSource1">        
        <ItemTemplate>
            userid:
            <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
<br />
            username:
            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
            <br />
            password:
            <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
            <br />
            Naam:
            <asp:Label ID="naamLabel" runat="server" Text='<%# Eval("name") %>' />
            <br />
            
            moderator:
            <asp:Label ID="moderatorLabel" runat="server" Text='<%# Eval("moderator") %>' />
            <br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
            <br />
            rating:
            <asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        SelectCommand="SELECT * FROM [users] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="username" SessionField="username" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    

    <br /><br /><br />
</asp:Content>
