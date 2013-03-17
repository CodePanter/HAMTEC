﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="Hamtec.Account.myaccount" %>

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
            <table>
                <th colspan="2">Account</th>
                <tr>
                    <td>
                        userid:
                    </td>
                    <td>
                        <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        username:
                    </td>
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>                
                <tr>
                    <td>
                        Naam:
                    </td>
                    <td>
                        <asp:Label ID="naamLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        email:
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                </tr>
                
               <th colspan="2">Statistics</th>
               <tr>
               <td>
                    Rating:
               </td>
               <td>
                    <asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") %>' />
               </td>
               </tr>
               <tr>
               <td>
                    Badges:
               </td>
               <td>
                    
               </td>
               </tr>               
            </table>
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
    
    <form method="post" name="changepw" id="changepw">
            <table >
                   <th colspan="2">Password</th>
                   <tr>
                   <td>
                        Old password:
                   </td>
                   <td>
                         <input id="oldpassword" name="oldpassword" type="Password" />                         
                         <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" 
                             Visible="False"></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td>
                        New password:
                   </td>
                   <td>
                         <input id="password" name="password" type="Password" />
                         </td>
                   </tr>
                   <tr>
                   <td>
                        Retype password:
                   </td>
                   <td>
                        <input id="password2" name="password2" type="Password" />
                   </td>
                   </tr>
                    <tr>
                   <td>
                       
                   </td>
                   <td>
                        <input type="submit" id="savepw" name="savepw" value="Save" />
                         <asp:Label ID="Label2" runat="server" Text="Label" ForeColor="Black" 
                            Visible="False"></asp:Label>
                   </td>
                   </tr>
             </table>
      </form>    
   
    

    <br /><br /><br />
</asp:Content>
