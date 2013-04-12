<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="Hamtec.Account.myaccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">  

    <form method="post" name="changepic" id="Form2">
        <table id="centertable">
            <tr>
                <th colspan=2><h2>Avatar</h2></th>
            </tr>
            <tr>
                <td colspan=2 align=center><img id="profileimg" name="profileimg" src="" runat="server" align="middle" style="margin: auto;"/></td>
            </tr>
            <tr>
                <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                <td><input type="submit" name="savepic" id="savepic" value="Save new avatar" /></td>
            </tr>           
        </table>
    
    
    <asp:DataList ID="DataList1" runat="server" DataKeyField="userid" 
        DataSourceID="SqlDataSource1" style="margin: auto;">        
        <ItemTemplate>
            <table id="centertable">
                <th colspan="2"><h2>Account</h2></th>
                <tr>
                    <td id="td120">Userid:</td>
                    <td id="td120"><asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' /></td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' /></td>                
                <tr>
                    <td>Name:</td>
                    <td><asp:Label ID="naamLabel" runat="server" Text='<%# Eval("name") %>' /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' /></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("city") %>' /></td>
                </tr>
                <tr>
                    <td>Adress:</td>
                    <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("adress") %>' /></td>
                </tr>                
                <th colspan="2"><h2>Statistics</h2></th>
                <tr>
                    <td>Rating:</td>
                    <td><asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") + "0" %>' /></td>
                </tr>
                <tr>
                    <td>Badges:</td>
                    <td>0</td>
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
    
   
            <table id="centertable" >
                   <th colspan="2"><h2>Change Password</h2></th>
                   <tr>
                        <td id="td120">Old password:</td>
                        <td ><input id="oldpassword" name="oldpassword" type="Password"  /></td>
                        <td><asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" Visible="False" ></asp:Label></td>
                   </tr>
                   <tr>
                        <td>New password</td>
                        <td><input id="password" name="password" type="Password" /></td>
                   </tr>
                   <tr>
                        <td>Retype password:</td>
                        <td><input id="password2" name="password2" type="Password" /></td>
                   </tr>
                   <tr>                   
                        <td><input type="submit" id="savepw" name="savepw" value="Save" /></td>
                        <td><asp:Label ID="Label2" runat="server" Text="Label" ForeColor="Black" Visible="False"></asp:Label></td>
                   </tr>
             </table>
      </form>    
    

    <br /><br /><br />
</asp:Content>
