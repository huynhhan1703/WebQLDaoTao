<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLDiem.aspx.cs" Inherits="WebQLDaoTao.QLDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2 class="alert alert-info">QUẢN LÍ ĐIỂM </h2>
    <hr />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form-horizontal" style="text-align: center;">
                <div class="form-group alert-info">
                    <label class="control-label col-sm-2">Chọn môn học</label>
                    <div class="col-md-2" style="width: 300px">
                        <asp:DropDownList ID="ddlMonHoc" AutoPostBack="true" runat="server" CssClass="form-control" DataSourceID="odsMonHoc" DataValueField="mamh" DataTextField="tenmh"
                             OnSelectedIndexChanged ="ddlMonHoc_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <hr />

            <asp:GridView ID="gvKetQua" ShowFooter="true" DataKeyNames="id" runat="server"
                AutoGenerateColumns="false" CssClass="table table-bordered " Width="100%" OnSelectedIndexChanged="gvKetQua_SelectedIndexChanged"  AllowPaging="True" PageSize="5" HeaderStyle-BackColor="#0099ff">
                <Columns>
                    <asp:BoundField DataField="masv" HeaderText="Mã sinh viên" ControlStyle-Width="200px" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="hotensv" HeaderText="Họ tên sinh viên" FooterStyle-Width="200px" HeaderStyle-CssClass="text-center" />
                    <asp:TemplateField HeaderText="Điểm" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("diem") %>' CssClass="form-control"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="text-align: center;">
                                <asp:Button ID="btLuu" OnClick="btLuu_Click" runat="server" Text="Lưu điểm" CssClass="btn btn-success" />
                            </div>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Chọn" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" FooterStyle-Width="300px">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkChon" runat="server" CssClass="radio-inline" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="text-align: center;">
                                <asp:LinkButton ID="btnXoa" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa điểm sinh viên này ra khỏi danh sách?')"
                                    runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="btnXoa_Click" Width="50px" Height="35px">Xóa</asp:LinkButton>
                                <asp:CheckBox ID="chkAll" runat="server" Text=" All" CssClass="btn btn-danger btn" Width="55px" Height="35px" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged1" />
                            </div>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <p class="alert alert-danger">Không có dữ liệu để hiển thị !</p>                   
                </EmptyDataTemplate>
                <HeaderStyle BackColor="#0066cc" ForeColor="#ffffff" />
            </asp:GridView>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="odsMonHoc" runat="server" DataObjectTypeName="WebQLDaoTao.Models.MonHoc" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.MonHocDAO" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="mamh" Type="String" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsKetQua" runat="server" SelectMethod="findByMaMH" TypeName="WebQLDaoTao.Models.KetQuaDAO" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMonHoc" Name="mamh" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="diem" Type="Single" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
