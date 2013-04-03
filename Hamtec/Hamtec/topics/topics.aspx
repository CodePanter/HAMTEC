﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="topics.aspx.cs" Inherits="Hamtec.topics.topics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br /><br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br /><br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            De vraag was:
            <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        SelectCommand="SELECT [message] FROM [topics] WHERE ([topicid] = @topicid)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="6" Name="topicid" 
                QueryStringField="topicid" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    
    
    
    <br /><br />

    <% if (Session["username"] != null)
   { %>
        <asp:TextBox ID="TextBox1" runat="server" style="resize:none" Height="100px" Width="500px" 
        BorderColor="Black" Columns="1" TextMode="MultiLine">
        </asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" 
        onclick="Button1_Click" style="height: 26px" />
   <% }
   else
   { %>
    je bent niet ingelogd



 <% } %>

    <br />
        
    <br />
    <asp:DataList ID="DataList2" runat="server" DataKeyField="userid" 
        DataSourceID="SqlDataSource2">
        <ItemTemplate>
            userid:
            <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        SelectCommand="SELECT [userid] FROM [users] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3">
        <ItemTemplate>
            message:
            <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        SelectCommand="SELECT [message] FROM [posts] WHERE ([topicid] = @topicid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="topicid" QueryStringField="topicid" 
                Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
        
    <br /><br />
    <p>
    </p>
</asp:Content>
