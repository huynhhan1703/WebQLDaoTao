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
        public TaiKhoan findByUsername(string username)
        {
            TaiKhoan tk = null;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from  taikhoan where tendangnhap=@tendangnhap", conn);
            cmd.Parameters.AddWithValue("@tendangnhap", username);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
                tk = new TaiKhoan {
                    taikhoan = dr["tendangnhap"].ToString(),
                    matkhau=dr["matkhau"].ToString(),
                    vaitro=dr["vaitro"].ToString()
                };
                return tk;
            
           
        }
    }
}