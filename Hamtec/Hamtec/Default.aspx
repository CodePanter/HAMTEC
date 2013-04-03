<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Hamtec._Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   <div class="homelogo"> <br /><img src="http://www.horrorsociety.com/wp-content/uploads/2012/11/MeganEyeGore.jpg" alt="Hamtec." width="320" height="240"></div>	
    <div class="recentanswered"> 
		<p id="title">Recently solved</p>
        <% for (int i = 0; i < 5; i++)
           { %>
		<div class="recenttitle"> bam</div>
		<% } %>
	</div>
	<div class="recentactivity"> <p id="title">Recently answered</p> 
     <% for (int i = 0; i < 5; i++)
           { %>
		<div class="recenttitle"> bam</div>
		<% } %>
    
    </div>
	<div class="topiclist">
    <!--
    <% for (int i = 0; i < 9; i++)
       { %>
		<div class="topicwrapper"> 
			<p id="subject">Hier komt de subject van een vraag op de website</p>
			<div id="tagscontainer">
				06-02-2013 13:37  
				<a id="tags" href="tags">tags</a>
				<a id="tags" href="tags">tags</a>
				<a id="tags" href="tags">tags</a>				
			</div>
			<div id="answers">Answers:  <div id="count">0</div></div>
			<div id="solved">Solved:<img src="cross.png" height="40px"></div>
		</div>
        <% } %>	      -->
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
                &nbsp;&nbsp;&nbsp; Tags:<asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                &nbsp;&nbsp;&nbsp; Category:<asp:Label ID="categorie" runat="server" Text='<%# Eval("categorie") %>' />
                &nbsp;Solved:<asp:Label ID="solvedLabel" runat="server" Text='<%# Eval("solved") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
            
            
            SelectCommand="SELECT [topicid], [message], [subject], [solved], [time], [tags], [categorie] FROM [topics] ORDER BY [time] DESC ">
        </asp:SqlDataSource>
	</div>
</asp:Content>
