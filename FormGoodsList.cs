using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

namespace AMBC
{
    public partial class FormGoodsList : Form
    {
        SqlConnection conn;
        public FormGoodsList()
        {
            InitializeComponent();
            conn = new SqlConnection();
            conn.ConnectionString = DataGlobals.CnnString;
            DataGlobals.Init(conn);
            
        }

        public void PopulateList(long pid)
        {
            if (conn.State != ConnectionState.Open) { return; }
            dgvGoodList.Rows.Clear();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "amb_GoodList";
            cmd.Parameters.AddWithValue("@pid", pid);
            if(DataGlobals.OpLevel >= 100)
            {
                cmd.Parameters.AddWithValue("@isd", 1);
            }
            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                int ri;
                while (rdr.Read())
                {
                    ri = dgvGoodList.Rows.Add(rdr[0].ToString(), rdr.GetString(1), rdr.GetString(5));
                    if (bool.Parse(rdr[2].ToString()))
                    {
                        dgvGoodList.Rows[ri].DefaultCellStyle.BackColor = Color.Yellow;
                    }
                    if(bool.Parse(rdr[3].ToString()))
                    {
                        dgvGoodList.Rows[ri].DefaultCellStyle.BackColor = Color.LightCyan;
                    }
                    if (bool.Parse(rdr[4].ToString()))
                    {
                        dgvGoodList.Rows[ri].DefaultCellStyle.BackColor = Color.LightPink;
                    }
                }
            }
        }
    }
}
