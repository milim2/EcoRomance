<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeFile="ProductManagement.aspx.cs" Inherits="Project5.AdminPages.ProductManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td class="auto-style8">Product CATEGORY</td>
            <td>                
               
                <asp:DropDownList ID="ddlcat" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID">
                    <asp:ListItem Value="1">Diffuser</asp:ListItem>
                    <asp:ListItem Value="2">Soap</asp:ListItem>
                    <asp:ListItem Value="3">Candle</asp:ListItem>
                    <asp:ListItem Value="4">Gift Set</asp:ListItem>
                    <asp:ListItem Value="5">Event</asp:ListItem>
                </asp:DropDownList>
               
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Product NAME</td>
            <td>
                <asp:TextBox ID="tbpname" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbpname" 
                    ErrorMessage="Please fill the name of product"   ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>       
        <tr>
            <td class="auto-style8">Product PRICE</td>
            <td>
                <asp:TextBox ID="tbprice" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" ForeColor="Red" runat="server" 
                    MinimumValue="1" ErrorMessage="Must enter a numeric value" ControlToValidate="tbprice" 
                    MaximumValue="999999" Type="Integer"></asp:RangeValidator>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" 
                    ErrorMessage="Must enter some price" ControlToValidate="tbprice"></asp:RequiredFieldValidator>
            </td>
        </tr>       
        <tr>
            <td class="auto-style8">Product Description</td>
            <td>
                <asp:TextBox ID="tbdesc" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Product IMAGE </td>
            <td>
                <asp:FileUpload ID="FileUpload1"  runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="FileUpload1" ErrorMessage="show image path" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
</table>
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="SAVE" />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShoppingMallConnectionString %>" 
        SelectCommand="SELECT * FROM [Category]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingMallConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([ProductID] = @ProductID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="pid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="auto-style8">
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
