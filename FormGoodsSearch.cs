using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace AMBC
{
    public partial class FormGoodsSearch : Form
    {
        SqlConnection conn;
        string callerFormName;
        public FormGoodsSearch()
        {
            InitializeComponent();
            conn = new SqlConnection();
            conn.ConnectionString = DataGlobals.CnnString;
            DataGlobals.Init(conn);
            dgvSearchResult.CellMouseDoubleClick += DgvSearchResult_CellMouseDoubleClick;
        }

        private void BtnSearch_Click(object sender, EventArgs e)
        {
            dgvSearchResult.Rows.Clear();
            if (txtSearch.Text.Length == 0) return;
            var newTxt=txtSearch.Text.Trim();
            newTxt.Replace("'", "''");
            newTxt="%"+newTxt+"%";
            if (conn.State != ConnectionState.Open) return;
            var cmd = new SqlCommand("amb_GoodSearch");
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@str",newTxt);
            if (DataGlobals.OpLevel >= 100)
            {
                cmd.Parameters.AddWithValue("@isd", 1);
            }
            var r = cmd.ExecuteReader();
            if (r.HasRows)
            {
                
                while (r.Read())
                {
                    dgvSearchResult.Rows.Add((int)r[0], r[1].ToString(), r[2].ToString());
                }
            }
            r.Close();

        }

        private void DgvSearchResult_CellMouseDoubleClick(Object sender, DataGridViewCellMouseEventArgs e)
        {
            VarGlobals.gID = long.Parse(dgvSearchResult.Rows[e.RowIndex].Cells[0].Value.ToString());
            if (!string.IsNullOrEmpty(callerFormName))
            {
                if (callerFormName == "FormGoods" && Application.OpenForms["FormGoods"] != null)
                {
                    FormGlobal frm = (FormGlobal)Application.OpenForms[callerFormName];
                    //frm.NodeFocusOnKey(dgvSearchResult.Rows[e.RowIndex].Cells[0].Value.ToString());
                    frm.ReceiveID(VarGlobals.gID);
                }
            }
        }

        private void FormGoodsSearch_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(VarGlobals.cFormName))
            {
                callerFormName = VarGlobals.cFormName;
                FormGlobal frm = (FormGlobal)Application.OpenForms[VarGlobals.cFormName];
                this.Location = new System.Drawing.Point(frm.Location.X+frm.Width, frm.Location.Y);
            }
        }
    }
}
