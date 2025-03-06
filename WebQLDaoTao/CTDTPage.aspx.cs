using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class CTDTPage : System.Web.UI.Page
    {
        TaiKKhoanDAO tkDAO = new TaiKKhoanDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
              
                Response.Redirect("DangNhap.aspx");
            }
            else
            {
                string username = Session["username"].ToString();
                if(tkDAO.findByUsername(username).
            }
        }
    }
}