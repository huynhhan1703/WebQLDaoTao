using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
 
        public class KhoaDAO
        {
            public List<Khoa> getAll()
            {
                List<Khoa> dsKhoa = new List<Khoa>();            
                SqlConnection conn = new
                SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
                conn.Open();           
                SqlCommand cmd = new SqlCommand("select * from Khoa", conn);              
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {               
                    Khoa kh = new Khoa
                    {
                        MaKH = dr["MaKH"].ToString(),TenKH = dr["TenKH"].ToString()
                    };                
                    dsKhoa.Add(kh);
                }
                return dsKhoa;
            }           
            public int Update(Khoa kh)
            {
                SqlConnection conn = new
                SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("update khoa set tenkh=@tenkh where makh=@makh", conn);
                cmd.Parameters.AddWithValue("@tenkh", kh.TenKH);
                cmd.Parameters.AddWithValue("@makh", kh.MaKH);
                return cmd.ExecuteNonQuery();
            }
            public int Delete(Khoa kh)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete from Khoa where makh=@makh", conn);
                cmd.Parameters.AddWithValue("@makh", kh.MaKH);
                return cmd.ExecuteNonQuery();
            }
            public int Insert(Khoa kh)
            {
                SqlConnection conn = new
                SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into khoa (makh, tenkh) values (@makh,@tenkh)", conn);
                cmd.Parameters.AddWithValue("@makh", kh.MaKH);
                cmd.Parameters.AddWithValue("@tenkh", kh.TenKH);
                return cmd.ExecuteNonQuery();
            }
            public Khoa findById(string makh)
            {
                Khoa kq = null;
                SqlConnection conn = new
                SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Khoa where makh=@makh", conn);
                cmd.Parameters.AddWithValue("@makh", makh);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    kq = new Khoa
                    {
                        MaKH = dr["MaKH"].ToString(),
                        TenKH = dr["TenKH"].ToString()
                    };
                }
                return kq;
            }
        }
    }
