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
            <table class="style1">
                <tr>
                    <td>
                        Userid</td>
                    <td>
                        <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Username</td>
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Password</td>
                    <td>
                        <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Voornaam</td>
                    <td>
                        <asp:Label ID="voornaamLabel" runat="server" Text='<%# Eval("voornaam") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Achternaam</td>
                    <td>
                        <asp:Label ID="achternaamLabel" runat="server" 
                            Text='<%# Eval("achternaam") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Moderator</td>
                    <td>
                        <asp:Label ID="moderatorLabel" runat="server" Text='<%# Eval("moderator") %>' />
                    </td>
                </tr>
            </table>
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
