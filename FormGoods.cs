using System.Linq;
using System.Windows.Forms;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.Linq;
using System.Drawing;
using System;
using System.Data;

namespace AMBC
{
    public partial class FormGoods : FormGlobal
    {
        private long? _parentID = null;
        private long _prevID;
        private long _currID;
        private TreeNode _currNode;
        private TreeNode _parentNode;

        GoodsDataContext dataContext = new GoodsDataContext(DataGlobals.CnnString);
        public FormGoods()
        {
            InitializeComponent();
            tvGoods.BeforeExpand += CheckForChildren;
            tabArticle.Selected += PopulateList;
            button1.Click += button1_Click;
        }

        private void FormGoods_Load(object sender, System.EventArgs e)
        {
            IQueryable<Good> res;
            if (DataGlobals.OpLevel >= 100)
            {
                res = from goods in dataContext.Goods orderby goods.Code where goods.Parent == 0 select goods;
            }
            else
            {
                res = from goods in dataContext.Goods orderby goods.Code where goods.Parent == 0 && !goods.ISDeleted select goods;
            }
            TreeNode node = null;
            tvGoods.BeginUpdate();
            tvGoods.Nodes.Clear();
            int n=0;
            foreach (var good in res)
            {
                node = new TreeNode();
                node.Tag = good;    
                node.Name=good.GoodsId.ToString();
                node.Text=good.Description;
                if (good.Group)
                {
                    node.ImageIndex = 0;
                    node.SelectedImageIndex = 0;
                }
                else
                {
                    node.ImageIndex = 1;
                    node.SelectedImageIndex = 1;
                }
                if (good.ByReceipt)
                {
                    node.ImageIndex= 2;
                    node.SelectedImageIndex= 2;
                }
                if(good.ISDeleted) node.ForeColor = Color.DeepPink;
                tvGoods.Nodes.Add(node);
                
                foreach(var child in GetChildGoods(good.GoodsId))
                {
                    tvGoods.Nodes[n].Nodes.Add(child);
                }
                
                n++;
            }
            tvGoods.EndUpdate();
        }

        private List<TreeNode> GetChildGoods(long id)
        {
            IQueryable<Good> res;
            dataContext.Refresh(RefreshMode.OverwriteCurrentValues);
            if (DataGlobals.OpLevel >= 100)
            {
                res = from goods in dataContext.Goods orderby goods.Code where goods.Parent == id select goods;
            }
            else
            {
                res = from goods in dataContext.Goods orderby goods.Code where goods.Parent == id && !goods.ISDeleted select goods;
            }
            TreeNode node = null;
            List<TreeNode> nodes = new List<TreeNode>();
            foreach (var good in res)
            { 
                node = new TreeNode();
                node.Tag = good;
                node.Name = good.GoodsId.ToString();
                node.Text=good.Description;
                if (good.Group)
                {
                    node.ImageIndex = 0;
                    node.SelectedImageIndex = 0;
                }
                else
                {
                    node.ImageIndex = 1;
                    node.SelectedImageIndex = 1;
                }
                if (good.ByReceipt)
                {
                    node.ImageIndex = 2;
                    node.SelectedImageIndex = 2;
                }
                if (good.ISDeleted) node.ForeColor = Color.DeepPink;
                nodes.Add(node);
            }
            return nodes;
        }

        private TreeNode GetGood(long id)
        {
            dataContext.Refresh(RefreshMode.OverwriteCurrentValues);
            var res = from goods in dataContext.Goods where goods.GoodsId == id select goods;
            Good good = res.First();
            TreeNode node = new TreeNode();
            node.Tag = good;
            node.Text = good.Description;
            node.Name= good.GoodsId.ToString();
            if (good.Group)
            {
                node.ImageIndex = 0;
                node.SelectedImageIndex = 0;
            }
            else
            {
                node.ImageIndex = 1;
                node.SelectedImageIndex = 1;
            }
            if (good.ByReceipt)
            {
                node.ImageIndex = 2;
                node.SelectedImageIndex = 2;
            }
            if (good.ISDeleted) node.ForeColor = Color.DeepPink;
            return node;
        }
        private void TVGoods_AfterSelect(object sender, TreeViewEventArgs e)
        {
            
            /*
            _prevID = _currID;
            try
            {
                _parentID = int.Parse(e.Node.Parent.Name);
            }
            catch 
            {
                _parentID = null;
            }
            _currID =int.Parse(e.Node.Name);
            _currNode = e.Node;
            EditElement(_currID);
            */
        }

        private void AddToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            if(tvGoods.SelectedNode == null) return;
            var currG = (Good)tvGoods.SelectedNode.Tag;
            if (!currG.Group) {
                MessageBox.Show("Избраното не е група", "ГРЕШКА!", MessageBoxButtons.OK);
                return; }
            AddElement();
        }


        private void DeleteToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            if (GetChildGoods(int.Parse(tvGoods.SelectedNode.Name)).Count != 0)
            {
                if (MessageBox.Show("Групата не е празна! Ще бъде изтрита цялата структура под избрания елемент.", "ВНИМАНИЕ!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    var cmd = new SqlCommand();
                    cmd.Connection = DataGlobals.SQLCnn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "amb_GoodDeleteRecursive";
                    cmd.Parameters.AddWithValue("@gid",int.Parse(tvGoods.SelectedNode.Name));
                    cmd.ExecuteNonQuery();
                    tvGoods.Nodes.Remove(tvGoods.SelectedNode);
                };
            }
        }

        private void TVGoods_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            if (e.Button.Equals(MouseButtons.Right))
            {
                _currNode = tvGoods.Nodes.Find(e.Node.Name, true).First();
                tvGoods.SelectedNode = _currNode;
                contextMenuNode.Show(MousePosition);
            }
            _prevID = _currID;
            try
            {
                _parentID = int.Parse(e.Node.Parent.Name);
            }
            catch
            {
                _parentID = null;
            }
            _currID = int.Parse(e.Node.Name);
            _currNode = e.Node;
            switch(tabArticle.SelectedIndex)
            {
                case 0:
                    EditElement(_currID);   
                    break;
                case 2:
                    PopulateList();
                    break;
            }
            if (Application.OpenForms["FormGoodsList"] != null)
            {
                GoodsListForm();
            }

        }


        private void AddRootElementToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            _prevID = _currID;
            _parentNode = null;
            SqlCommand cmd = new SqlCommand("amb_GoodAddEmpty");
            cmd.Connection = DataGlobals.Cnn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pid", 0);
            cmd.Parameters.Add(new SqlParameter("@gid", 0));
            cmd.Parameters[1].Direction = System.Data.ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            _currID = (long)cmd.Parameters[1].Value;
            tvGoods.BeginUpdate();
            tvGoods.Nodes.Add(GetGood(_currID));
            tvGoods.EndUpdate();
            _currNode = tvGoods.Nodes.Find(_currID.ToString(), true).First();
            tvGoods.SelectedNode = _currNode;
            this.splitContainer1.Panel2.BackColor = Color.Pink;
            EditElement(_currID);
        }

        private void AddElement()
        {
            _prevID = _currID;
            _parentNode = _currNode;
            SqlCommand cmd = new SqlCommand("amb_GoodAddEmpty");
            cmd.Connection = DataGlobals.Cnn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pid",_currID);
            cmd.Parameters.Add(new SqlParameter("@gid", 0));
            cmd.Parameters[1].Direction = System.Data.ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            _currID=(long)cmd.Parameters[1].Value;  
            tvGoods.BeginUpdate();
            _parentNode.Nodes.Add(GetGood(_currID));
            tvGoods.EndUpdate();
            _currNode = tvGoods.Nodes.Find(_currID.ToString(), true).First();
            tvGoods.SelectedNode = _currNode;
            this.splitContainer1.Panel2.BackColor=Color.Pink;
            EditElement(_currID);
        }

        private void EditElement(long id)
        {
            SqlConnection conn = new SqlConnection();
            DataGlobals.Init(conn);
            if (conn.State == System.Data.ConnectionState.Open)
            {
                SqlCommand cmd = new SqlCommand("SELECT [Code], [Description], [Measure], [ByReceipt], [Group], (select description from goods where goodsid = g.[Parent]), [CashCode], [CashName], [CashPrice], [ExpDate],[ISDeleted] FROM Goods g where Goodsid=" + id.ToString());
                cmd.Connection = conn;
                var r = cmd.ExecuteReader();
                if (r.HasRows) 
                {
                    r.Read();
                    this.tbCode.TextChanged-=TBCodeTextChanged;
                    this.tbCode.Text = r[0].ToString();
                    this.tbCode.TextChanged += TBCodeTextChanged;
                    this.tbDescription.TextChanged -= TBDescrTextChanged;
                    this.tbDescription.Text = r[1].ToString();
                    this.tbDescription.TextChanged += TBDescrTextChanged;
                    this.cbMeasure.SelectedValue = r[2].ToString();
                    this.rbReceipt.CheckedChanged -= RBChecked;
                    this.rbGroup.CheckedChanged -= RBChecked;
                    this.rbElement.CheckedChanged -= RBChecked;
                    this.rbReceipt.Checked = (bool)r[3];
                    this.rbGroup.Checked = (bool)r[4];
                    this.rbReceipt.CheckedChanged += RBChecked;
                    this.rbGroup.CheckedChanged += RBChecked;
                    this.rbElement.CheckedChanged += RBChecked;
                    this.tbParent.Text = r[5].ToString();
                    this.tbSaleCode.TextChanged -= TBSaleCodeChanged;
                    this.tbSaleCode.Text = r[6].ToString();
                    this.tbSaleCode.TextChanged += TBSaleCodeChanged;
                    this.tbSaleName.TextChanged -= TBSaleNameChanged;
                    this.tbSaleName.Text = r[7].ToString();
                    this.tbSaleName.TextChanged += TBSaleNameChanged;
                    this.tbSalePrice.TextChanged -= TBSalePriceChanged;
                    this.tbSalePrice.Text = r[8].ToString();
                    this.tbSalePrice.TextChanged += TBSalePriceChanged;
                    this.tbExpiration.TextChanged -= TBExpDateChanged;
                    this.tbExpiration.Text = r[9].ToString();
                    this.tbExpiration.TextChanged += TBExpDateChanged;
                    if (DataGlobals.OpLevel >= 100)
                    {
                        this.cbISDeleted.CheckedChanged -= CBISDeletedChanged;
                        this.cbISDeleted.Checked = (bool)r[10];
                        this.cbISDeleted.CheckedChanged += CBISDeletedChanged;
                        this.cbISDeleted.Visible = true;
                    }
                    else this.cbISDeleted.Visible = false;

                }
                r.Close();
            }
            conn.Close();
        }

        private void CheckForChildren(object sender, TreeViewCancelEventArgs e)
        {
            foreach (TreeNode n in tvGoods.SelectedNode.Nodes)
            {
                n.Nodes.Clear();
                foreach (var child in GetChildGoods(long.Parse(n.Name)))
                {
                    n.Nodes.Add(child);
                }
                if(n.Nodes.Count==0 && ((Good)n.Tag).Group) n.ForeColor = Color.Gray; else n.ForeColor = Color.Black;
            }
        }
#region ControlsChanged Events
        private void TBCodeTextChanged(object sender, System.EventArgs e)
        {
            string newText= tbCode.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Goods SET Code=N'"+newText+"' WHERE GoodsID=" +_currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
            Good good = new Good();
            good = (Good)_currNode.Tag;
            good.Code = newText;
            _currNode.Tag = good;
        }

        private void TBDescrTextChanged(object sender, System.EventArgs e)
        {
            string newText = tbDescription.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Goods SET [Description]=N'" + newText + "' WHERE GoodsID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
            Good good = new Good();
            good = (Good)_currNode.Tag;
            good.Description = newText;
            _currNode.Tag = good;
            _currNode.Text = newText;
        }

        private void TBSaleCodeChanged(object sender, System.EventArgs e)
        {
            string newText = tbSaleCode.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Goods SET [CashCode]=N'" + newText + "' WHERE GoodsID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }

        private void TBSaleNameChanged(object sender, System.EventArgs e)
        {
            string newText = tbSaleName.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Goods SET [CashName]=N'" + newText + "' WHERE GoodsID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }

        private void TBSalePriceChanged(object sender, System.EventArgs e)
        {
            errorProvider1.SetError(tbSalePrice, String.Empty);
            string newText = tbSalePrice.Text.Trim();
            if (!float.TryParse(newText, out float n)) { errorProvider1.SetError(tbSalePrice, "НЕВАЛИДНА СТОЙНОСТ ЗА ТОВА ПОЛЕ!"); return; }

            SqlCommand cmd = new SqlCommand("UPDATE Goods SET [CashPrice]=" + newText + " WHERE GoodsID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }

        private void TBExpDateChanged(object sender, System.EventArgs e)
        {
            errorProvider1.SetError(tbExpiration, String.Empty);
            string newText = tbExpiration.Text.Trim();
            if (newText.Length > 0)
            {
                if (!int.TryParse(newText, out int n)) { errorProvider1.SetError(tbExpiration, "НЕВАЛИДНА СТОЙНОСТ ЗА ТОВА ПОЛЕ!"); return; }
            }
            else newText = "NULL";
            SqlCommand cmd = new SqlCommand("UPDATE Goods SET [ExpDate]=" + newText + " WHERE GoodsID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }
        private void CBISDeletedChanged(object sender, System.EventArgs e)
        {
            string newText = cbISDeleted.Checked ? "1" : "0";
            SqlCommand cmd = new SqlCommand("UPDATE Goods SET [ISDeleted]=" + newText + " WHERE GoodsID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }

        private void RBChecked(object sender, System.EventArgs e)
        {
            if (!((RadioButton)sender).Checked) return;
            string cmdText="";
            if (((RadioButton)sender)== rbElement){ cmdText = "UPDATE Goods SET [ByReceipt]=0, [Group]=0 WHERE GoodsID=" + _currID.ToString(); _currNode.ImageIndex = 1; _currNode.SelectedImageIndex = _currNode.ImageIndex; }
            if (((RadioButton)sender) == rbGroup) { cmdText = "UPDATE Goods SET [ByReceipt]=0, [Group]=1 WHERE GoodsID=" + _currID.ToString(); _currNode.ImageIndex = 0; _currNode.SelectedImageIndex = _currNode.ImageIndex; }
            if (((RadioButton)sender) == rbReceipt) { cmdText = "UPDATE Goods SET [ByReceipt]=1, [Group]=0 WHERE GoodsID=" + _currID.ToString(); _currNode.ImageIndex = 2; _currNode.SelectedImageIndex = _currNode.ImageIndex; }
            SqlCommand cmd = new SqlCommand(cmdText);
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery ();
        }

        #endregion

        private void button1_Click(object sender, EventArgs e)
        {
            VarGlobals.cFormName = this.Name;
            new FormGoodsSearch().Show();
        }

        public void NodeFocusOnKey(string key)
        {
            string [] parents = NodeRoute(key).Split(',');
            foreach(string p in parents)
            {
                try
                {
                    TreeNode node = tvGoods.Nodes.Find(p, true).First();
                    node?.EnsureVisible();
                    tvGoods.SelectedNode = node;
                    _currNode = node;
                    _currID = int.Parse(node.Name);
                    tvGoods.Focus();
                    EditElement(_currID);
                }
                catch { }
            }
        }

        private string NodeRoute(string key)
        {
            if (int.TryParse(key, out int id))
            {
                using (SqlConnection conn = new SqlConnection(DataGlobals.CnnString))
                {
                    conn.Open();
                    if (conn.State != ConnectionState.Open) return null;
                    SqlCommand cmd = new SqlCommand("amb_GoodIDPath", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@gid", id);
                    SqlParameter path = new SqlParameter();
                    path.ParameterName = "@path";
                    path.DbType = DbType.String;
                    path.Value = key;
                    path.Direction = ParameterDirection.InputOutput;
                    path.Size = 2000;
                    cmd.Parameters.Add(path);
                    cmd.ExecuteNonQuery();
                    return path.Value.ToString();
                }
            }
            else return null;
            
        }

        private void ShowListToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormGoodsList frm;
            if (Application.OpenForms["FormGoodsList"] != null)
            {
                frm = (FormGoodsList)Application.OpenForms["FormGoodsList"];
            }
            else
            {
                frm = new FormGoodsList();
                frm.Location = new Point(this.Location.X, this.Location.Y + this.Height);
                frm.Show();
            }
            frm.PopulateList(_currID);
        }

        private void GoodsListForm()
        {
            FormGoodsList frm;
            if (Application.OpenForms["FormGoodsList"] != null)
            {
                frm = (FormGoodsList)Application.OpenForms["FormGoodsList"];
                frm.PopulateList(_currID);
            }
            
        }

        public void PopulateList(Object sender, TabControlEventArgs e)
        {
            if (e.TabPage != tabPage3) return;
            PopulateList();
        }

        public void PopulateList()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = DataGlobals.CnnString;
            DataGlobals.Init(conn);
            if (conn.State != ConnectionState.Open) { return; }
            dgvGoodList.Rows.Clear();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "amb_GoodList";
            cmd.Parameters.AddWithValue("@pid", _currID);
            if (DataGlobals.OpLevel >= 100)
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
                    if (bool.Parse(rdr[3].ToString()))
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

        public override void ReceiveID(long id)
        {
            NodeFocusOnKey(id.ToString());
        }
    }


}
