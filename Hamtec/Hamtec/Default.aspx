﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Hamtec._Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   <div class="homelogo"> </div>
	<div class="recentanswered"> 
		<p id="title">Recent opgelost</p>
        <% for (int i = 0; i < 5; i++)
           { %>
		<div class="recenttitle"> bam</div>
		<% } %>
	</div>
	<div class="recentactivity"> <p id="title">Recent beantwoord</p> </div>
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
            BackColor="Red" Width="743px">
            <AlternatingItemStyle BackColor="#FF6600" />
            <ItemTemplate>
                <b><asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' /></b>
                <br />
                message:
                <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
                <br />
                <br />
                Time:
                <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
                &nbsp;&nbsp;&nbsp; Tags:<asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                &nbsp;Solved:<asp:Label ID="solvedLabel" runat="server" Text='<%# Eval("solved") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
            SelectCommand="SELECT [message], [subject], [solved], [time], [tags] FROM [topics]">
        </asp:SqlDataSource>
	</div>
</asp:Content>
