using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLDiem :CBDTPage
    {
        MonHocDAO mhDao = new MonHocDAO();
        KetQuaDAO kqDAO = new KetQuaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                ddlMonHoc.DataSource = mhDao.getAll();
                ddlMonHoc.DataTextField = "tenmh";
                ddlMonHoc.DataValueField = "mamh";
                ddlMonHoc.DataBind();
                ddlMonHoc.Items.Insert(0, new ListItem("--Chọn môn học-", ""));
            }
        }

        protected void gvKetQua_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mamh = ddlMonHoc.SelectedValue;
            gvKetQua.DataSource = kqDAO.findByMaMH(mamh);
            gvKetQua.DataBind();
        }

        protected void btLuu_Click(object sender, EventArgs e)
        {
            int count = gvKetQua.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
                float diem = float.Parse(((TextBox)gvKetQua.Rows[i].FindControl("txtDiem")).Text);
                kqDAO.Update(id, diem);
            }
        }

        protected void ddlMonHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mamh = ddlMonHoc.SelectedValue;
            gvKetQua.DataSource = kqDAO.findByMaMH(mamh);
            gvKetQua.DataBind();
        }

        protected void gvKetQua_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        private int Count()
        {
            int count = gvKetQua.Rows.Count;
            return count;
        }
        protected void btnXoa_Click(object sender, EventArgs e)
        {
            int count = 0;
            for (int i = 0; i < Count(); i++)
            {
                bool check  =((CheckBox)gvKetQua.Rows[i].FindControl("chkChon")).Checked;
                if (check)
                {
                    int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
                    kqDAO.Delete(id);
                    count++;
                } 
            }
            gvKetQua.DataSource = odsKetQua.Select();
            gvKetQua.DataBind();
        }


        protected void chkALL_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        protected void chkAll_CheckedChanged1(object sender, EventArgs e)
        {
            bool check = ((CheckBox)gvKetQua.FooterRow.FindControl("chkAll")).Checked;
            for (int i = 0; i < Count(); i++)
            {
                ((CheckBox)gvKetQua.Rows[i].FindControl("chkChon")).Checked = check;
               
            }
        }
    }
}