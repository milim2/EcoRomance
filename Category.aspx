<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Project5.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlcategory" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="727px">
        <ItemTemplate>
            <table class="auto-style8">
                <tr>
                    <td>Name :
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# string.Format("~/{0}",Eval("ProductImage"))%>' Height="124px" Width="136px" />
                    </td>
                </tr>
                <tr>
                    <td>Price :
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "ProductDetails.aspx?ProductID="+Eval("ProductID") %>' Text='<%# "Detail" %>'></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
