using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class TaiKKhoanDAO
    {
        public bool checkLogin( string username,string passwork)
        {
            bool kq = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from  taikhoan where tendangnhap=@tendangnhap and matkhau=@matkhau", conn);
            cmd.Parameters.AddWithValue("@tendangnhap",username);
            cmd.Parameters.AddWithValue("@matkhau", passwork);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                kq = true;
            }
            return kq;
        }
    }
}