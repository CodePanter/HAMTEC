<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="topics.aspx.cs" Inherits="Hamtec.topics.topics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br /><br />

    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
    <br /><br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        BackColor="#999999" Width="750px">
        <ItemTemplate>
            Question:<br />
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

    <br />
        
    <br />
    <asp:DataList ID="DataList2" runat="server" 
        DataSourceID="SqlDataSource2" BackColor="#999999" Width="750px">
        <AlternatingItemStyle BackColor="#CCCCCC" />
        <ItemTemplate>                 
            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
            <br />      
            Answer:
            <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
            <br />    
            Time:
            <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        SelectCommand="SELECT posts.message, users.username, posts.time FROM posts CROSS JOIN users WHERE posts.userid = users.userid and (posts.topicid = @topicid) ">
        <SelectParameters>
            <asp:QueryStringParameter Name="topicid" QueryStringField="topicid" 
                Type="Int64" />
        </SelectParameters>
        </asp:SqlDataSource>
        <br />
    <br />
    <% if (Session["username"] != null)
   { %>
        <asp:TextBox ID="TextBox1" runat="server" style="resize:none" Height="100px" Width="500px" 
        BorderColor="Black" Columns="1" TextMode="MultiLine">
        </asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Post" 
        onclick="Button1_Click" style="height: 26px" />
   <% }
   else
   { %>
    You are not logged in



 <% } %>

    
        
    <br /><br />
    <p>
    </p>
</asp:Content>
