<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2 class="alert alert-info">QUẢN LÍ SINH VIÊN </h2>
    <hr />
    <button type="button" class="btn btn-info btn-lg" style="margin-bottom: 5px;" data-toggle="modal" data-target="#modalOpenAddButton">Thêm mới</button>
    <!-- Modal -->
    <div class="modal fade" id="modalOpenAddButton" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content" style="padding-left: 10px; padding-right: 10px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">THÊM MỚI SINH VIÊN</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label">Mã sinh viên</label>
                            <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control" Width="150px"></asp:TextBox>
                        </div>
                        <div class="form-inline">
                            <label class="control-label" style="margin-left: 0">Họ sinh viên</label>
                            <asp:TextBox ID="txtHoSv" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                            <label style="padding-left: 10px;">Tên sinh viên</label>
                            <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control" Width="100px"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label" style="margin-right: 10px">Giới tính</label>
                            <asp:RadioButton ID="rdNam" runat="server" Text="Nam" CssClass="radio-inline" Checked="true" GroupName="GT" />
                            <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" CssClass="radio-inline" GroupName="GT" />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Ngày sinh</label>
                            <asp:TextBox ID="txtNgaysinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Nơi sinh</label>
                            <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Địa chỉ</label>
                            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Chọn khoa</label>
                            <asp:DropDownList ID="ddlMaKhoa" runat="server" CssClass="form-control" DataSourceID="odsKhoa" DataTextField="tenkh" DataValueField="makh"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btThem" runat="server" Text="Thêm" OnClick="btThem_Click" CssClass="btn btn-success" />
                    </div>
                    <asp:ValidationSummary ID="vsKq" runat="server" ForeColor="#FF3300" Font-Size="Medium" />
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Huỷ</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="table-responsive text-center">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gvsinhvien" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" DataSourceID="ods_sinhvien" AllowPaging="True" PageSize="5" DataKeyNames="MaSV">
                    <Columns>
                        <asp:BoundField DataField="MaSV" HeaderText="Mã SV" SortExpression="MaSV" HeaderStyle-CssClass="text-center" ReadOnly="true">
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HoSV" HeaderText="Họ" SortExpression="HoSV" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="left" HeaderStyle-Width="120px"></asp:BoundField>
                        <asp:BoundField DataField="TenSV" HeaderText="Tên SV" SortExpression="TenSV" HeaderStyle-CssClass="text-center">
                            <ItemStyle Width="65px" />
                            <HeaderStyle Width="60px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Giới tính" HeaderStyle-CssClass="text-center" HeaderStyle-Width="65px">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("GioiTinh") %>'>
                                    <asp:ListItem Value="True">Nam</asp:ListItem>
                                    <asp:ListItem Value="False">Nữ</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbGioitinh" runat="server" Text='<%# (bool)Eval("gioiTinh") ? "Nam" : "Nữ" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" SortExpression="NgaySinh" HeaderStyle-CssClass="text-center"
                            DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                        <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" SortExpression="NoiSinh" HeaderStyle-CssClass="text-center" HeaderStyle-Width="80px"></asp:BoundField>
                        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" HeaderStyle-CssClass="text-center" />
                        <asp:TemplateField HeaderText="Chọn khoa" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:Label ID="lbMakh" runat="server" Text='<%# Eval("Makh") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlMaKhoa" runat="server" DataSourceID="odsKhoa" DataTextField="TenKH" DataValueField="MaKH" SelectedValue='<%# Bind("MaKH") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
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
                    <HeaderStyle BackColor="#0066cc" ForeColor="#ffffff" />
                    <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                </asp:GridView>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
    <asp:ObjectDataSource ID="ods_sinhvien" runat="server" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" DataObjectTypeName="WebQLDaoTao.Models.SinhVien"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsKhoa" runat="server" DataObjectTypeName="WebQLDaoTao.Models.Khoa" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.KhoaDAO" UpdateMethod="Delete"></asp:ObjectDataSource>
</asp:Content>
