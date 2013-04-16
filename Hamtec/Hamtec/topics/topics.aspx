<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="topics.aspx.cs" Inherits="Hamtec.topics.topics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br />
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <% if (Convert.ToInt16(Session["moderator"]) > 0)
   { %> 
   <asp:Button  onclick="closeTopic" CommandArgument='<%=Request.QueryString["topicid"] %>' id="closebutton" text="Close topic" runat="server"/>
   <asp:Button  onclick="openTopic" CommandArgument='<%=Request.QueryString["topicid"] %>' id="openbutton" text="Open topic" runat="server"/>
   <% } %>
    
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
    
        BackColor="#CCCCCC" Width="750px" style="margin: 0 0 0 10px;">
        <ItemTemplate>
        <div style="float: left; border-right: 1px solid black; width: 11%; padding: 0px 0px 0px 5px;">
            <asp:Label ID="usernameLabel1" runat="server" Text='<%# Eval("username") %>' />
            <br />
            <asp:Label ID="ratingLabel1" runat="server" Text='<%# Eval("rating") + " points" %>' />
            <br />
           <img src='<%# "/profile/" + Eval("username") + ".png" %>'  style="max-width: 100px; max-height:100px;" />
        </div>
        <div style="float: right; width: 87%; padding: 0px 0px 0px 5px;" >
         <b><asp:Label ID="subjectLabel1" runat="server" Text='<%# Eval("subject") %>' /> - <asp:Label ID="timeLabel1" runat="server" Text='<%# Eval("time") %>' /></b>
         <br />
         <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
            <br />
        </div>

<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        
        SelectCommand="SELECT topics.message, users.username, users.rating, topics.time, topics.subject FROM topics CROSS JOIN users WHERE (topics.topicid = @topicid) AND users.userid = topics.userid">
        <SelectParameters>
            <asp:QueryStringParameter Name="topicid" QueryStringField="topicid" 
                Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />   
    
    <br /><br />
    <br />        
    <br />
    <asp:DataList ID="DataList2" runat="server" 
        DataSourceID="SqlDataSource2" BackColor="#999999" Width="750px" style="margin: 0 0 0 10px;">
        <AlternatingItemStyle BackColor="#CCCCCC" />
        <ItemTemplate>                 
        <div style="float: left; border-right: 1px solid black; width: 11%; padding: 0px 0px 0px 5px;">
            <asp:Label ID="usernameLabel1" runat="server" Text='<%# Eval("username") %>' />
            <br />
            <asp:Label ID="ratingLabel1" runat="server" Text='<%# Eval("rating") + " points" %>' />
            <br />            
            <img src='<%# "/profile/" + Eval("username") + ".png" %>' style="max-width: 100px; max-height:100px;"  />  
            <br />
            <div style="display:<%# ((Convert.ToInt16(Eval("tuser")) == Convert.ToInt16(Session["userid"])) && (Convert.ToInt16(Eval("Solved")) != 1)) ? "inline" : "none" %>" >
                <input type="hidden" name="userid" value="<%# Eval("userid") %>" />
                <input type="hidden" name="postid" value="<%# Eval("postid") %>" />
                <asp:Button type="submit" name="giverating" id="giverating"  onclick="GiveRating" CommandArgument='<%# String.Format("{0}, {1}", Eval("userid"), Eval("postid")) %>' text="Set as answer" runat="server"   />
            </div>
        </div>    
         <div style="float: right; width: 87%; padding: 0px 0px 0px 5px;"  >
            <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
            <br />
            <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
            <br />    
            
            </div>
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringDB %>" 
        SelectCommand="SELECT posts.message, users.username, users.rating, posts.time, users.userid, posts.postid, topics.solved, topics.userid AS tuser FROM posts CROSS JOIN users CROSS JOIN topics WHERE posts.userid = users.userid and (posts.topicid = @topicid) and topics.topicid = posts.topicid ORDER BY posts.answer desc ">
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
