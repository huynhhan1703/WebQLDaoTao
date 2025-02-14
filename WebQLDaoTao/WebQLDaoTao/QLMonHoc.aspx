<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLMonHoc.aspx.cs" Inherits="WebQLDaoTao.QLMonHoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>QUẢN LÝ MÔN HỌC</h2>
    <div class="col-md-8">
        <h4>DANH SÁCH MÔN HỌC</h4>
        <asp:GridView CssClass="table table-bordered"
            ID="gvMonhoc" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Mã môn học" DataField="MaMH" />
                <asp:BoundField HeaderText="Tên môn học" DataField="TenMH" />
                <asp:BoundField HeaderText="Số tiết" DataField="SoTiet" />               
            </Columns>          
        </asp:GridView>
    </div>

</asp:Content>
