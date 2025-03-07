<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebQLDaoTao.DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="text-left " style="width: 65%;">
        <h2 class="alert alert-danger text-danger">Đăng Nhập</h2>
        <br />
        <div class="form-group ">
            <label class="" style="width: 100%;">Tên đăng nhập:</label>
            <asp:TextBox class=" form-control" ID="txtUsername" runat="server"></asp:TextBox>
        </div>
        <div class="form-group ">
            <label style="width: 100%;">Mật khẩu:</label>
            <asp:TextBox class=" form-control" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Button ID="btnLogin" runat="server" Text=" Đăng nhập" OnClick="btnLogin_Click" CssClass="btn btn-success" />
        </div>
        <br />
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Label ID="lbThongbao" CssClass="text-danger" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>


