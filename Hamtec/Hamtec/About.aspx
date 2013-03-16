<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="Hamtec.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <h2>
        Users
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="userid" DataSourceID="SqlDataSource1" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" 
                    SortExpression="userid" InsertVisible="False" />
                <asp:BoundField DataField="username" HeaderText="username" 
                    SortExpression="username" />
                <asp:BoundField DataField="voornaam" HeaderText="voornaam" 
                    SortExpression="voornaam" />
                <asp:BoundField DataField="achternaam" HeaderText="achternaam" 
                    SortExpression="achternaam" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
            
            SelectCommand="SELECT [userid], [username], [voornaam], [achternaam] FROM [users]"></asp:SqlDataSource>
    </h2>
    <p>
         <br /><br /><br /><br />	
    </p>
</asp:Content>
