<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2 class="alert alert-info">TRANG QUẢN TRỊ KHOA </h2>
    <hr />

    <div>
        <button type="button" class="btn btn-info btn-lg" style="margin-bottom: 5px;" data-toggle="modal" data-target="#modalOpenAddButton">Thêm mới</button>
        <!-- Modal -->
        <div class="modal fade" id="modalOpenAddButton" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">THÊM MỚI MÔN HỌC</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Mã khoa</label>
                            <asp:TextBox ID="txtMaKH" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Tên khoa</label>
                            <asp:TextBox ID="txtTenKH" CssClass="form-control" runat="server" ControlToValidate="txtTenKH"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnThem" class="btn btn-success" OnClick="btnThem_Click" runat="server" Text="Thêm" />
                        </div>
                    </div>
                    <asp:ValidationSummary ID="vsKq" runat="server" ForeColor="#FF3300" Font-Size="Medium" />
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Huỷ</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvkhoa" runat="server" AutoGenerateColumns="False" DataSourceID="ods_khoa" CssClass="table table-bordered table-hover "  AllowPaging="True" PageSize="5" DataKeyNames="MaKH">
                <Columns>
                    <asp:BoundField DataField="MaKH" HeaderText="Mã khoa" SortExpression="MaKH" />
                    <asp:BoundField DataField="TenKH" HeaderText="Tên khoa" SortExpression="TenKH" />
                    <asp:TemplateField HeaderText="Chọn tác vụ">
                        <HeaderStyle CssClass="text-center" />
                        <ItemStyle CssClass="text-center" />
                        <ItemTemplate>
                            <asp:Button ID="btnSua" runat="server" Text="Sửa" CommandName="Edit" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="btnXoa" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa môn học này ra khỏi danh sách?')"
                                runat="server" CommandName="Delete" CssClass="btn btn-danger">
                            <i class="bi bi-trash"></i>Xóa
                        </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CssClass="btn btn-success" CommandName="Update" />
                            <asp:Button ID="btnCancel" runat="server" Text="Hủy" CssClass="btn btn-warning" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#0066cc" ForeColor="#ffffff" />
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:ObjectDataSource ID="ods_khoa" runat="server"
        DeleteMethod="Delete"
        InsertMethod="Insert"
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.KhoaDAO"
        UpdateMethod="Update" DataObjectTypeName="WebQLDaoTao.Models.Khoa">
        <UpdateParameters>
            <asp:Parameter Name="makh" Type="String" />
            <asp:Parameter Name="tenkh" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
