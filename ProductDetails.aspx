<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Project5.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            width: 117px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlproduct" runat="server" RepeatColumns="1">
        <ItemTemplate>
            <table class="auto-style8">
                <tr>
                    <td class="auto-style9">
                        <asp:Image ID="Image1" runat="server" Height="119px" ImageUrl='<%# string.Format("~/{0}",Eval("ProductImage"))%>' />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">Name</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Price</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Description</td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnaddtocart" runat="server" Text="Add to Cart" OnClick="btnaddtocart_Click" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
