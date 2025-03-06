using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;
namespace WebQLDaoTao
{
  
    public partial class DangNhap : System.Web.UI.Page
    {
        TaiKKhoanDAO tkDAO = new TaiKKhoanDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string passwork = txtPassword.Text;
            if (tkDAO.checkLogin(username, passwork))
            {
                Session["username"] = username;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lbThongbao.Text = "dang nhap that bai";
            }
        }

    }


  
}