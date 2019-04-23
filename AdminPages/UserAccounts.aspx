<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeFile="UserAccounts.aspx.cs" Inherits="Project5.AdminPages.UserAccounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 890px;
        }
        .auto-style9 {
            width: 718px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <h2 style="text-align: center">User Accounts Management&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h2>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ID
                        <asp:TextBox ID="tbid" runat="server" Width="78px"></asp:TextBox>
                    &nbsp; =&gt;&nbsp;
            <asp:Button ID="EditBtn" runat="server" Text="Edit" Width="119px" OnClick="EditBtn_Click"  />
                    &nbsp;&nbsp;&nbsp; <asp:Button ID="del_btn" runat="server" Text="Delete" Width="105px" OnClick="del_btn_Click" />
                    &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="refresh_btn" runat="server"  Text="Refresh" OnClick="refresh_btn_Click1" />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
       
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />

        <div class="row color-table">
            <asp:Button ID="add_btn" runat="server" Text="Add New" Width="125px" OnClick="add_btn_Click1" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMessage" runat="server"></asp:Label>

        </div>
&nbsp;&nbsp;
        <table class="auto-style9" style="border-collapse: collapse; ">
                <tr>
                    <td class="auto-style2">User Name:&nbsp;&nbsp; </td>
                    <td class="auto-style3"> <asp:TextBox ID="tbUsername" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbUsername" ErrorMessage="Can't be empty!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
        <p>
            Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
                    </td>
                    <td class="auto-style3">
            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbPassword" ErrorMessage="Can't be empty!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Confirm Password</td>
                    <td class="auto-style3"> 
                        <asp:TextBox ID="passConfirm" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbPassword" ControlToValidate="passConfirm" ErrorMessage="CompareValidator"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style3"> <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Full Name:&nbsp; </td>
                    <td class="auto-style3">
             <asp:TextBox ID="tbFullname" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbFullname" ErrorMessage="Can't be empty!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style3">
            <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Phone :&nbsp;&nbsp; </td>
                    <td class="auto-style3">
            <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Age:&nbsp; </td>
                    <td class="auto-style3">
            <asp:TextBox ID="tbAge" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbAge" ErrorMessage="Input your age"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="auto-style8" style="width: 250px">
        <tr>
            <td>
    <asp:Button ID="btnLogOut" runat="server" OnClick="btnLogOut_Click" Text="LogOut" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPages/UserAccounts.aspx">AccountManagement</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AdminPages/CreateProduct.aspx">Add New Products</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/AdminPages/EditProduct.aspx">Edit Products</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/AdminPages/AddCategory.aspx">CategoryManagement</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>