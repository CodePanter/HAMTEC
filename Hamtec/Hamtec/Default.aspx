<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Hamtec._Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<br />

    <div style="width: 979px; margin-left: 5px;  background-color: #EEE">
    <h1>Hamtec</h1>
        Hamtec is build as project for the NHL. It can be used by the teachers ands studends of 
        the NHL. You can ask questions about different subjects, or you can try to answer questions other developers have asked.
        There is no registration needed to view the questions and answers. You will still need 
        an account to ask or answer questions, or rate the answers of other people.
        <br />
        Hamtec is completely free of charge.</div>

       
	<div class="topiclist">
   <h1>Top Questions</h1>
	    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
            BackColor="#999999" Width="979px" style="margin-left: 5px" >
            <AlternatingItemStyle BackColor="#CCCCCC" />
            <ItemTemplate>
                <b><a href='/topics/topics.aspx?topicid=<%# Eval("topicid") %>'><asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' /></a></b>
                <br />
                <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
                <br />
                <br />
                Time:
                <asp:Label ID="timeLabel" runat="server" DataFormatString="{0:dd/MM/yy h:mm tt}" HtmlEncode="false" Text='<%# Eval("time") %>' />
                &nbsp;&nbsp;&nbsp; Tags: <a href="/Tagstopics.aspx?Tags=<%# Server.UrlEncode(Eval("tags").ToString()) %>"/><%# Eval("tags") %></a>
                &nbsp;&nbsp;&nbsp; Category:<asp:Label ID="categorie" runat="server" Text='<%# Eval("categorie") %>' />
                &nbsp;Solved:<asp:Label ID="solvedLabel" runat="server" Text='<%# (Convert.ToInt16(Eval("solved")) != 1) ? "No" : "Yes" %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
            
            
            SelectCommand="SELECT TOP 50 [topicid], [message], [subject], [solved], [time], [tags], [categorie] FROM [topics] where closed = 1 ORDER BY [time] DESC ">
        </asp:SqlDataSource>
	</div>
</asp:Content>
