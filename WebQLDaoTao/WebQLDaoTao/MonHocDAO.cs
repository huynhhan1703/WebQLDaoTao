using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebQLDaoTao.Models
{
    public class MonHocDAO
    {
        public List<MonHoc> getAll()
        {
            List<MonHoc> dsMonHoc = new List<MonHoc>();
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("select * from Monhoc", conn);
            //3.thuc thi ket qua;
            SqlDataReader dr = cmd.ExecuteReader();
            //4.xu ly ket qua tra ve
            while (dr.Read())
            {
                //tao doi tuong mon hoc
                MonHoc mh = new MonHoc
                {
                    MaMH = dr["MaMH"].ToString(),
                    TenMH = dr["TenMH"].ToString(),
                    SoTiet = int.Parse(dr["SoTiet"].ToString())
                };

                //add vao dsMonHoc
                dsMonHoc.Add(mh);
            }
            return dsMonHoc;
        }
    }
}