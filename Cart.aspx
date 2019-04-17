<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Project5.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" ReadOnly="True" />
            <asp:ImageField DataImageUrlField="ProductImage" DataImageUrlFormatString="~\{0}" HeaderText="Image" ReadOnly="True">
            </asp:ImageField>
            <asp:BoundField DataField="ProductPrice" HeaderText="Price" ReadOnly="True" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:TemplateField HeaderText="Total">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<% String.Format("{0:c}", ((Convert.ToInt16(<%# Eval("Quantity") %>) * Convert.ToInt16(<%# Eval("price") %>) ))  %>'></asp:Label>
                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
<asp:Label ID="lblgtotal" runat="server" Visible="False"></asp:Label>
<br />
</asp:Content>
