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
    public partial class FormContragents : FormGlobal
    {
        private long? _parentID = null;
        private long _prevID;
        private long _currID;
        private TreeNode _currNode;
        private TreeNode _parentNode;

        ContrDataContext dataContext = new ContrDataContext(DataGlobals.CnnString);
        public FormContragents()
        {
            InitializeComponent();
            tvContr.NodeMouseClick += tvContr_NodeMouseClick;
            tvContr.BeforeExpand += CheckForChildren;

        }

        private void FormContragents_Load(object sender, System.EventArgs e)
        {
            IQueryable<Contragent> res;
            res = from cntr in dataContext.Contragents orderby cntr.ContrName where cntr.Parent == 0 select cntr;
            TreeNode node = null;
            tvContr.BeginUpdate();
            tvContr.Nodes.Clear();
            int n = 0;
            foreach (var contr in res)
            {
                node = new TreeNode();
                node.Tag = contr;
                node.Name = contr.ContrID.ToString();
                node.Text = contr.ContrName;
                if (contr.IsGroup)
                {
                    node.ImageIndex = 0;
                    node.SelectedImageIndex = 0;

                }
                else
                {
                    node.ImageIndex = 1;
                    node.SelectedImageIndex = 1;
                }
                tvContr.Nodes.Add(node);
                foreach (var child in GetChildContr(contr.ContrID))
                {
                    tvContr.Nodes[n].Nodes.Add(child);
                }
                n++;
            }
            tvContr.EndUpdate();
        }

        private List<TreeNode> GetChildContr(long id)
        {
            IQueryable<Contragent> res;
            dataContext.Refresh(RefreshMode.OverwriteCurrentValues);
            res = from contr in dataContext.Contragents where contr.Parent == id select contr;
            TreeNode node = null;
            List<TreeNode> nodes = new List<TreeNode>();
            foreach (var contr in res)
            {
                node = new TreeNode();
                node.Tag = contr;
                node.Name = contr.ContrID.ToString();
                node.Text = contr.ContrName;
                if (contr.IsGroup)
                {
                    node.ImageIndex = 0;
                    node.SelectedImageIndex = 0;

                }
                else
                {
                    node.ImageIndex = 1;
                    node.SelectedImageIndex = 1;
                }
                nodes.Add(node);
            }
            return nodes;
        }

        private TreeNode GetContr(long id)
        {
            dataContext.Refresh(RefreshMode.OverwriteCurrentValues);
            var res = from cntr in dataContext.Contragents where cntr.ContrID == id select cntr;
            Contragent contr = res.First();
            TreeNode node = new TreeNode();
            node.Tag = contr;
            node.Text = contr.ContrName;
            node.Name = contr.ContrID.ToString();
            if (contr.IsGroup)
            {
                node.ImageIndex = 0;
                node.SelectedImageIndex = 0;

            }
            else
            {
                node.ImageIndex = 1;
                node.SelectedImageIndex = 1;
            }
            return node;
        }

        private void AddToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            if (tvContr.SelectedNode == null) return;
            var currG = (Contragent)tvContr.SelectedNode.Tag;
            if (!currG.IsGroup)
            {
                MessageBox.Show("Избраното не е група", "ГРЕШКА!", MessageBoxButtons.OK);
                return;
            }
            AddElement();
        }


        private void DeleteToolStripMenuItem_Click(object sender, System.EventArgs e)
        {
            if (GetChildContr(int.Parse(tvContr.SelectedNode.Name)).Count != 0)
            {
                if (MessageBox.Show("Групата не е празна! Ще бъде изтрита цялата структура под избрания елемент.", "ВНИМАНИЕ!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    var cmd = new SqlCommand();
                    cmd.Connection = DataGlobals.SQLCnn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "amb_ContrDeleteRecursive";
                    cmd.Parameters.AddWithValue("@cid", int.Parse(tvContr.SelectedNode.Name));
                    Boolean res = (bool)cmd.ExecuteScalar();
                    if (res) tvContr.Nodes.Remove(tvContr.SelectedNode); else MessageBox.Show("ГРЕШКА!");
                };
            }
        }

        private void tvContr_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            if (e.Button.Equals(MouseButtons.Right))
            {
                _currNode = tvContr.Nodes.Find(e.Node.Name, true).First();
                tvContr.SelectedNode = _currNode;
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
            EditElement(_currID);
        }


        private void AddElement()
        {
            _prevID = _currID;
            _parentNode = _currNode;
            SqlCommand cmd = new SqlCommand("amb_ContrAddEmpty");
            cmd.Connection = DataGlobals.Cnn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pid", _currID);
            cmd.Parameters.Add(new SqlParameter("@cid", 0));
            cmd.Parameters[1].Direction = System.Data.ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            _currID = (long)cmd.Parameters[1].Value;
            tvContr.BeginUpdate();
            _parentNode.Nodes.Add(GetContr(_currID));
            tvContr.EndUpdate();
            _currNode = tvContr.Nodes.Find(_currID.ToString(), true).First();
            tvContr.SelectedNode = _currNode;
            this.splitContainer1.Panel2.BackColor = Color.Pink;
            EditElement(_currID);
        }

        private void EditElement(long id)
        {
            SqlConnection conn = new SqlConnection();
            DataGlobals.Init(conn);
            if (conn.State == System.Data.ConnectionState.Open)
            {
                SqlCommand cmd = new SqlCommand("SELECT [Code], [ContrName], [ContrAddress], [ContrBulstat], [ContrMOL], [INDS], [ContrPhone], [Percent], (select ContrName from Contragents where ContrID=c.Parent) FROM Contragents c where ContrID=" + id.ToString());
                cmd.Connection = conn;
                var r = cmd.ExecuteReader();
                if (r.HasRows)
                {
                    r.Read();
                    this.tbCode.TextChanged -= TBCodeTextChanged;
                    this.tbCode.Text = r[0].ToString();
                    this.tbCode.TextChanged += TBCodeTextChanged;
                    this.tbContrName.TextChanged -= TBNameTextChanged;
                    this.tbContrName.Text = r[1].ToString();
                    this.tbContrName.TextChanged += TBNameTextChanged;
                    this.tbAddress.TextChanged -= TBAddressTextChanged;
                    this.tbAddress.Text = r[2].ToString();
                    this.tbAddress.TextChanged += TBAddressTextChanged;
                    this.tbEIK.TextChanged -= TBEIKTextChanged;
                    this.tbEIK.Text = r[3].ToString();
                    this.tbEIK.TextChanged += TBEIKTextChanged;
                    this.tbMOL.TextChanged -= TBMOLTextChanged;
                    this.tbMOL.Text = r[4].ToString();
                    this.tbMOL.TextChanged += TBMOLTextChanged;
                    this.tbINDS.TextChanged -= TBINDSTextChanged;
                    this.tbINDS.Text = r[5].ToString();
                    this.tbINDS.TextChanged += TBINDSTextChanged;
                    this.tbPhone.TextChanged -= TBPhoneTextChanged;
                    this.tbPhone.Text = r[6].ToString();
                    this.tbPhone.TextChanged += TBPhoneTextChanged;
                    this.tbPercent.TextChanged -= TBPercentTextChanged;
                    this.tbPercent.Text = r[7].ToString();
                    this.tbPercent.TextChanged += TBPercentTextChanged;
                }
                r.Close();
            }
            conn.Close();
        }

        private void CheckForChildren(object sender, TreeViewCancelEventArgs e)
        {
            foreach (TreeNode n in tvContr.SelectedNode.Nodes)
            {
                n.Nodes.Clear();
                foreach (var child in GetChildContr(long.Parse(n.Name)))
                {
                    n.Nodes.Add(child);
                }
                if (n.Nodes.Count == 0 && ((Contragent)n.Tag).IsGroup) n.ForeColor = Color.Gray; else n.ForeColor = Color.Black;
            }
        }
        #region ControlsChanged Events
        private void TBCodeTextChanged(object sender, System.EventArgs e)
        {
            string newText = tbCode.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Contragents SET Code=N'" + newText + "' WHERE ContrID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }

        private void TBNameTextChanged(object sender, System.EventArgs e)
        {
            string newText = tbContrName.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Contragents SET [ContrName]=N'" + newText + "' WHERE ContrID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
            Contragent contr = new Contragent();
            contr = (Contragent)_currNode.Tag;
            contr.ContrName = newText;
            _currNode.Tag = contr;
            _currNode.Text = newText;
        }

        private void TBAddressTextChanged(object sender, System.EventArgs e)
        {
            string newText = tbAddress.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Contragents SET [ContrAddress]=N'" + newText + "' WHERE ContrID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }
        private void TBEIKTextChanged(object sender, System.EventArgs e)
        {
            string newText = tbEIK.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Contragents SET [ContrBulstat]=N'" + newText + "' WHERE ContrID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
            Contragent contr = new Contragent();
            contr = (Contragent)_currNode.Tag;
            contr.ContrBulstat = newText;
            _currNode.Tag = contr;
        }
        private void TBMOLTextChanged(object sender, System.EventArgs e)
        {
            string newText = tbMOL.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Contragents SET [ContrMOL]=N'" + newText + "' WHERE ContrID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }

        private void TBINDSTextChanged(object sender, System.EventArgs e)
        {
            string newText = tbINDS.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Contragents SET [INDS]=N'" + newText + "' WHERE ContrID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }
        private void TBPhoneTextChanged(object sender, System.EventArgs e)
        {
            string newText = tbPhone.Text.Trim();
            newText = newText.Replace("'", "''");

            SqlCommand cmd = new SqlCommand("UPDATE Contragents SET [ContrPhone]=N'" + newText + "' WHERE ContrID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }

        private void TBPercentTextChanged(object sender, System.EventArgs e)
        {
            string newText = tbPercent.Text.Trim();
            if (!int.TryParse(newText, out int val))
            {
                MessageBox.Show("Невалидна стойност!", "ГРЕШКА!");
                return;
            }

            SqlCommand cmd = new SqlCommand("UPDATE Contragents SET [Percent]=N'" + newText + "' WHERE ContrID=" + _currID.ToString());
            cmd.Connection = DataGlobals.SQLCnn;
            cmd.ExecuteNonQuery();
        }

        #endregion

        private void button1_Click(object sender, EventArgs e)
        {
            VarGlobals.cFormName = this.Name;
            new FormContragentsSearch().Show();
        }

        public void NodeFocusOnKey(string key)
        {
            string[] parents = NodeRoute(key).Split(',');
            foreach (string p in parents)
            {
                try
                {
                    TreeNode node = tvContr.Nodes.Find(p, true).First();
                    node?.EnsureVisible();
                    tvContr.SelectedNode = node;
                    _currNode = node;
                    _currID = int.Parse(node.Name);
                    tvContr.Focus();
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

        private void добавиОсновенЕлементToolStripMenuItemToolStripMenuItem_Click(object sender, EventArgs e)
        {
            _prevID = _currID;
            _parentNode = null;
            SqlCommand cmd = new SqlCommand("amb_ContrAddEmpty");
            cmd.Connection = DataGlobals.Cnn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pid", 0);
            cmd.Parameters.Add(new SqlParameter("@cid", 0));
            cmd.Parameters[1].Direction = System.Data.ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            _currID = (long)cmd.Parameters[1].Value;
            tvContr.BeginUpdate();
            tvContr.Nodes.Add(GetContr(_currID));
            tvContr.EndUpdate();
            _currNode = tvContr.Nodes.Find(_currID.ToString(), true).First();
            tvContr.SelectedNode = _currNode;
            this.splitContainer1.Panel2.BackColor = Color.Pink;
            EditElement(_currID);
        }

        override public void ReceiveID(long id)
        { 
            NodeFocusOnKey(id.ToString());
        }
    }


}
