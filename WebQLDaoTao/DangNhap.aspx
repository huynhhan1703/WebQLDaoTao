<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebQLDaoTao.DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div>
        <h2>Đăng Nhập</h2>
        <Label>Tên đăng nhập:</Label>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <br />
        <Label>Mật khẩu:</Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <%--<asp:Label ID="lblRole" runat="server" Text="Vai trò:"></asp:Label>
        <asp:DropDownList ID="ddlRole" runat="server">
            <asp:ListItem Text="sv" Value="sv"></asp:ListItem>
            <asp:ListItem Text="sb" Value="cb"></asp:ListItem>
        </asp:DropDownList>
        <br />--%>
        <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />

        <div class="col-sm-offset-2 col-sm-10">
            <asp:Label ID="lbThongbao" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>


