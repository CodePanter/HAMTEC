<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Hamtec._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   <div class="homelogo"> </div>
	<div class="recentanswered"> 
		<p id="title">Recent opgelost</p>
		<div class="recenttitle"> bam</div>
		<div class="recenttitle"> bam</div>
		<div class="recenttitle"> bam</div>
		<div class="recenttitle"> bam</div>
		<div class="recenttitle"> bam</div>
	</div>
	<div class="recentactivity"> <p id="title">Recent beantwoord</p> </div>
	<div class="topiclist">
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
		<div class="topicwrapper"> 
			<p id="subject">Hier komt de subject van een vraag op de website</p>
			<div id="tagscontainer">
				06-02-2013 13:37  
				<a id="tags" href="tags">tags</a>
				<a id="tags" href="tags">tags</a>
				<a id="tags" href="tags">tags</a>				
			</div>
			<div id="answers">Answers:  <div id="count">0</div></div>
			<div id="solved">Solved:<img src="vinkje.png" height="40px"></div>
		</div>
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
	</div>
	<div class="homeright"></div>
</asp:Content>
