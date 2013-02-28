<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="HAMTEC_STACKOVERFLOW._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to ASP.NET!?
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="userid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" 
                    SortExpression="userid" />
                <asp:BoundField DataField="username" HeaderText="username" 
                    SortExpression="username" />
                <asp:BoundField DataField="password" HeaderText="password" 
                    SortExpression="password" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
            SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
    </h2>
    <p>
        To learn more about ASP.NET visit <a href="http://www.asp.net" title="ASP.NET Website">www.asp.net</a>.
    </p>
    <p>
        You can also find <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409"
            title="MSDN ASP.NET Docs">documentation on ASP.NET at MSDN</a>.
    </p>
</asp:Content>
