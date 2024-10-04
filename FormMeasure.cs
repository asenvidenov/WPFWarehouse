using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace AMBC
{
    public partial class FormMeasure : Form
    {
        GoodsDataContext dataContext = new GoodsDataContext(DataGlobals.CnnString);
        SqlCommand cmd = new SqlCommand();
        public FormMeasure()
        {
            InitializeComponent();
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.CommandType = System.Data.CommandType.Text;
        }

        private void FormMeasure_Load(object sender, EventArgs e)
        {
            Populate();
            //dgMeasure.RowsAdded += RowAdd;
            dgMeasure.CellValueChanged += ValueChanged;
            dgMeasure.RowValidating += RowValidating;

        }

        private void ValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            if(e.ColumnIndex == 2)
            { dgMeasure.Rows[e.RowIndex].Cells[3].Value = dgMeasure.Rows[e.RowIndex].Cells[2].Value; }
            
            if(e.ColumnIndex==100)
            {

            }
        }

        private void Populate()
        {
            IQueryable<Measure> res;
            res = from m in dataContext.Measures orderby m.MeasureName select m;
            int n = 0;
            DataGridViewComboBoxColumn comboBox = new DataGridViewComboBoxColumn();
            comboBox.DisplayMember = "MeasureName";
            comboBox.ValueMember = "MeasureID";
            comboBox.DataSource = res;
            comboBox.DataPropertyName = "PackID";
            comboBox.HeaderText = "СЪДЪРЖА";
            comboBox.ValueType = typeof(int);
            comboBox.DefaultCellStyle.NullValue = null;
            foreach (Measure m in res)
            {
                dgMeasure.Rows.Add(m.MeasureID, m.MeasureName, m.PackID, m.PackQty);
            }
            //dgMeasure.Columns.Remove(PackID);
            dgMeasure.Columns.Insert(2, comboBox);
            foreach (Measure m in res)
            {
                dgMeasure.Rows[n].Cells[2].Value = m.PackID;
                n++;
            }
        }

        private void RowValidating(Object sender, DataGridViewCellCancelEventArgs data)
        {
            if (dgMeasure[0, data.RowIndex].Value==null)
            {
                IQueryable<Measure> res;
                res = from m in dataContext.Measures where m.MeasureName == dgMeasure[1, data.RowIndex].Value.ToString().Trim() select m;
                int n = 0;
                try
                {
                    n = res.Count();
                }
                catch { }
                if (n!=0)
                {
                    MessageBox.Show("МЯРКАТА СЪЩЕСТВУВА!", "ГРЕШКА!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    dgMeasure[data.ColumnIndex, data.RowIndex].Value = string.Empty;
                    return;
                }
                if (dgMeasure.Rows[data.RowIndex].Cells[1].Value != null && dgMeasure.Rows[data.RowIndex].Cells[3].Value != null && dgMeasure.Rows[data.RowIndex].Cells[4].Value != null)
                {
                    cmd.CommandText= "INSERT INTO Measure (MeasureName, PackId, PackQty) VALUES(" + "N'"+dgMeasure.Rows[data.RowIndex].Cells[1].Value.ToString().Trim() + "'"+", "
                    + dgMeasure.Rows[data.RowIndex].Cells[3].Value.ToString()
                    + ", " + dgMeasure.Rows[data.RowIndex].Cells[4].Value.ToString() + ")";
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    if (dgMeasure.Rows[data.RowIndex].Cells[1].Value != null)
                    {
                        cmd.CommandText =
                            "INSERT INTO Measure (MeasureName) VALUES(" + "N'" + dgMeasure.Rows[data.RowIndex].Cells[1].Value.ToString().Trim() + "'" + ")";
                        cmd.ExecuteNonQuery();
                    }
                } 
                //dgMeasure.Update();
            }
            else
            {
                if (dgMeasure.Rows[data.RowIndex].Cells[1].Value != null && dgMeasure.Rows[data.RowIndex].Cells[3].Value != null && dgMeasure.Rows[data.RowIndex].Cells[4].Value != null)
                {
                    cmd.CommandText = "UPDATE Measure SET MeasureName= "+ "N'" + dgMeasure.Rows[data.RowIndex].Cells[1].Value.ToString().Trim() + "'" + ", " +
                    " PackId = " + dgMeasure.Rows[data.RowIndex].Cells[3].Value.ToString() + ", " +
                    " PackQty = " + dgMeasure.Rows[data.RowIndex].Cells[4].Value.ToString() + 
                    " WHERE MeasureID = " + dgMeasure.Rows[data.RowIndex].Cells[0].Value.ToString();
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    if (dgMeasure.Rows[data.RowIndex].Cells[1].Value != null)
                    {
                        cmd.CommandText =
                            "UPDATE Measure SET MeasureName =" + "N'" + dgMeasure.Rows[data.RowIndex].Cells[1].Value.ToString().Trim() + "'" +
                            " WHERE MeasureID = " + dgMeasure.Rows[data.RowIndex].Cells[0].Value.ToString(); 
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            
        }

        private void RowAdd(object sender, DataGridViewRowsAddedEventArgs e)
        {

        }
    }
}
