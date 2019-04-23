<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="Project5.AddCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 251px;
        }
        .auto-style9 {
            width: 204px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td class="auto-style9">Category NAME</td>
            <td>
                <asp:TextBox ID="tbCatName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbCatName" 
                    ErrorMessage="Fill it Out."   ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>       
        </table>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="SAVE" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShoppingMallConnectionString %>" 
        SelectCommand="SELECT * FROM [Category]" DeleteCommand="DELETE FROM [Category] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [Category] ([CategoryName]) VALUES (@CategoryName)" UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName WHERE [CategoryID] = @CategoryID">
        <DeleteParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="auto-style8" style="width: 250px">
        <tr>
            <td>
    <asp:Button ID="btnLogOut" runat="server" Text="LogOut" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPages/UserAccounts.aspx">AccountManagement</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AdminPages/ProductManagement.aspx">Add New Products</asp:HyperLink>
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