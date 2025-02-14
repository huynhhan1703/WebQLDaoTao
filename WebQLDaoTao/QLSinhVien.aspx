<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>QUẢN LÍ SINH VIÊN </h2>
    <hr />
    <asp:Panel ID="Panel1" runat="server" Style="overflow: auto;" CssClass="d-inline-block">
        <asp:GridView ID="gvsinhvien" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" runat="server" DataSourceID="ods_sinhvien">
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="Mã SV" SortExpression="MaSV" ReadOnly="true">
                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                    <HeaderStyle CssClass="text-center" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="HoSV" HeaderText="Họ" SortExpression="HoSV">
                    <ItemStyle Width="120px" />
                    <HeaderStyle Width="120px"  />
                </asp:BoundField>
                <asp:BoundField DataField="TenSV" HeaderText="Tên SV" SortExpression="TenSV">
                    <ItemStyle Width="65px" />
                    <HeaderStyle Width="60px" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="GioiTinh" HeaderText="Giới tính" SortExpression="GioiTinh" />
                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" SortExpression="NgaySinh"
                    DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" SortExpression="NoiSinh">
                    <ItemStyle Width="90px" HorizontalAlign="Center" />
                    <HeaderStyle Width="80px" CssClass="text-center" />
                </asp:BoundField>
                <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
                <asp:BoundField DataField="MaKH" HeaderText="Mã KH" SortExpression="MaKH">
                    <ItemStyle HorizontalAlign="Center" Width="65px" />
                    <HeaderStyle CssClass="text-center" Width="65px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Chọn tác vụ">
                    <HeaderStyle CssClass="text-center" />
                    <ItemStyle CssClass="text-center" />
                    <ItemTemplate>
                        <asp:Button ID="btnSua" runat="server" Text="Sửa" CommandName="Edit" CssClass="btn btn-primary btn-sm" />
                        <asp:LinkButton ID="btnXoa" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?')"
                            runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm">
                <i class="bi bi-trash"></i> Xóa
            </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CssClass="btn btn-success btn-sm" CommandName="Update" />
                        <asp:Button ID="btnCancel" runat="server" Text="Hủy" CssClass="btn btn-warning btn-sm" CommandName="Cancel" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
             <HeaderStyle  BackColor="#0066cc" ForeColor="#ffffff" />
        </asp:GridView>
    </asp:Panel>
    <asp:ObjectDataSource ID="ods_sinhvien" runat="server" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO"></asp:ObjectDataSource>
</asp:Content>
