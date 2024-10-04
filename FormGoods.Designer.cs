using System.Windows.Forms;

namespace AMBC
{
    partial class FormGoods
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormGoods));
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.tvGoods = new System.Windows.Forms.TreeView();
            this.ilGoods = new System.Windows.Forms.ImageList(this.components);
            this.tabArticle = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.button1 = new System.Windows.Forms.Button();
            this.tbParent = new System.Windows.Forms.TextBox();
            this.cbISDeleted = new System.Windows.Forms.CheckBox();
            this.tbExpiration = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.tbSalePrice = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.tbSaleName = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.tbSaleCode = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rbElement = new System.Windows.Forms.RadioButton();
            this.rbGroup = new System.Windows.Forms.RadioButton();
            this.rbReceipt = new System.Windows.Forms.RadioButton();
            this.cbMeasure = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.tbCode = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.tbDescription = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.dgvGoodList = new System.Windows.Forms.DataGridView();
            this.GoodsID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Description = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Path = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.contextMenuNode = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.добавиОсновенЕлементToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.добавиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.изтрийToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ShowList = new System.Windows.Forms.ToolStripMenuItem();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.tabArticle.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.tabPage3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGoodList)).BeginInit();
            this.contextMenuNode.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.tvGoods);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.tabArticle);
            this.splitContainer1.Size = new System.Drawing.Size(800, 450);
            this.splitContainer1.SplitterDistance = 266;
            this.splitContainer1.TabIndex = 0;
            // 
            // tvGoods
            // 
            this.tvGoods.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tvGoods.ImageIndex = 0;
            this.tvGoods.ImageList = this.ilGoods;
            this.tvGoods.Location = new System.Drawing.Point(0, 0);
            this.tvGoods.Name = "tvGoods";
            this.tvGoods.SelectedImageIndex = 0;
            this.tvGoods.ShowPlusMinus = false;
            this.tvGoods.Size = new System.Drawing.Size(266, 450);
            this.tvGoods.TabIndex = 0;
            this.tvGoods.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.TVGoods_AfterSelect);
            this.tvGoods.NodeMouseClick += new System.Windows.Forms.TreeNodeMouseClickEventHandler(this.TVGoods_NodeMouseClick);
            // 
            // ilGoods
            // 
            this.ilGoods.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("ilGoods.ImageStream")));
            this.ilGoods.TransparentColor = System.Drawing.Color.Transparent;
            this.ilGoods.Images.SetKeyName(0, "folder.png");
            this.ilGoods.Images.SetKeyName(1, "comment.png");
            this.ilGoods.Images.SetKeyName(2, "to-do.png");
            // 
            // tabArticle
            // 
            this.tabArticle.Controls.Add(this.tabPage1);
            this.tabArticle.Controls.Add(this.tabPage2);
            this.tabArticle.Controls.Add(this.tabPage3);
            this.tabArticle.Location = new System.Drawing.Point(3, 3);
            this.tabArticle.Name = "tabArticle";
            this.tabArticle.SelectedIndex = 0;
            this.tabArticle.Size = new System.Drawing.Size(524, 444);
            this.tabArticle.TabIndex = 20;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.button1);
            this.tabPage1.Controls.Add(this.tbParent);
            this.tabPage1.Controls.Add(this.cbISDeleted);
            this.tabPage1.Controls.Add(this.tbExpiration);
            this.tabPage1.Controls.Add(this.label8);
            this.tabPage1.Controls.Add(this.tbSalePrice);
            this.tabPage1.Controls.Add(this.label7);
            this.tabPage1.Controls.Add(this.tbSaleName);
            this.tabPage1.Controls.Add(this.label6);
            this.tabPage1.Controls.Add(this.tbSaleCode);
            this.tabPage1.Controls.Add(this.label5);
            this.tabPage1.Controls.Add(this.groupBox1);
            this.tabPage1.Controls.Add(this.cbMeasure);
            this.tabPage1.Controls.Add(this.label4);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.tbCode);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Controls.Add(this.tbDescription);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(516, 418);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "ЕЛЕМЕНТ";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.BackgroundImage = global::AMBC.Properties.Resources.filter;
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button1.Cursor = System.Windows.Forms.Cursors.Default;
            this.button1.Location = new System.Drawing.Point(459, 370);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(42, 42);
            this.button1.TabIndex = 38;
            this.button1.UseVisualStyleBackColor = true;
            // 
            // tbParent
            // 
            this.tbParent.Enabled = false;
            this.tbParent.Location = new System.Drawing.Point(227, 25);
            this.tbParent.MaxLength = 10;
            this.tbParent.Name = "tbParent";
            this.tbParent.Size = new System.Drawing.Size(274, 20);
            this.tbParent.TabIndex = 37;
            // 
            // cbISDeleted
            // 
            this.cbISDeleted.AutoSize = true;
            this.cbISDeleted.Location = new System.Drawing.Point(27, 307);
            this.cbISDeleted.Name = "cbISDeleted";
            this.cbISDeleted.Size = new System.Drawing.Size(164, 17);
            this.cbISDeleted.TabIndex = 33;
            this.cbISDeleted.Text = "ДЕАКТИВИРАН ЕЛЕМЕНТ";
            this.cbISDeleted.UseVisualStyleBackColor = true;
            // 
            // tbExpiration
            // 
            this.tbExpiration.Location = new System.Drawing.Point(368, 275);
            this.tbExpiration.MaxLength = 10;
            this.tbExpiration.Name = "tbExpiration";
            this.tbExpiration.Size = new System.Drawing.Size(133, 20);
            this.tbExpiration.TabIndex = 32;
            this.tbExpiration.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(17, 275);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(134, 13);
            this.label8.TabIndex = 36;
            this.label8.Text = "Срок на годност (часове)";
            // 
            // tbSalePrice
            // 
            this.tbSalePrice.Location = new System.Drawing.Point(227, 249);
            this.tbSalePrice.MaxLength = 10;
            this.tbSalePrice.Name = "tbSalePrice";
            this.tbSalePrice.Size = new System.Drawing.Size(274, 20);
            this.tbSalePrice.TabIndex = 30;
            this.tbSalePrice.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(17, 249);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(86, 13);
            this.label7.TabIndex = 35;
            this.label7.Text = "Продажна цена";
            // 
            // tbSaleName
            // 
            this.tbSaleName.Location = new System.Drawing.Point(227, 223);
            this.tbSaleName.MaxLength = 50;
            this.tbSaleName.Name = "tbSaleName";
            this.tbSaleName.Size = new System.Drawing.Size(274, 20);
            this.tbSaleName.TabIndex = 29;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(17, 223);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(97, 13);
            this.label6.TabIndex = 34;
            this.label6.Text = "Име за продажба";
            // 
            // tbSaleCode
            // 
            this.tbSaleCode.Location = new System.Drawing.Point(227, 197);
            this.tbSaleCode.MaxLength = 50;
            this.tbSaleCode.Name = "tbSaleCode";
            this.tbSaleCode.Size = new System.Drawing.Size(274, 20);
            this.tbSaleCode.TabIndex = 27;
            this.tbSaleCode.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(17, 197);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(94, 13);
            this.label5.TabIndex = 31;
            this.label5.Text = "Код за продажба";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbElement);
            this.groupBox1.Controls.Add(this.rbGroup);
            this.groupBox1.Controls.Add(this.rbReceipt);
            this.groupBox1.Location = new System.Drawing.Point(20, 147);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(481, 44);
            this.groupBox1.TabIndex = 25;
            this.groupBox1.TabStop = false;
            // 
            // rbElement
            // 
            this.rbElement.AutoSize = true;
            this.rbElement.Checked = true;
            this.rbElement.Location = new System.Drawing.Point(412, 19);
            this.rbElement.Name = "rbElement";
            this.rbElement.Size = new System.Drawing.Size(66, 17);
            this.rbElement.TabIndex = 2;
            this.rbElement.TabStop = true;
            this.rbElement.Text = "Артикул";
            this.rbElement.UseVisualStyleBackColor = true;
            // 
            // rbGroup
            // 
            this.rbGroup.AutoSize = true;
            this.rbGroup.Location = new System.Drawing.Point(207, 19);
            this.rbGroup.Name = "rbGroup";
            this.rbGroup.Size = new System.Drawing.Size(103, 17);
            this.rbGroup.TabIndex = 1;
            this.rbGroup.TabStop = true;
            this.rbGroup.Text = "Група артикули";
            this.rbGroup.UseVisualStyleBackColor = true;
            // 
            // rbReceipt
            // 
            this.rbReceipt.AutoSize = true;
            this.rbReceipt.Location = new System.Drawing.Point(7, 20);
            this.rbReceipt.Name = "rbReceipt";
            this.rbReceipt.Size = new System.Drawing.Size(117, 17);
            this.rbReceipt.TabIndex = 0;
            this.rbReceipt.TabStop = true;
            this.rbReceipt.Text = "Съставен артикул";
            this.rbReceipt.UseVisualStyleBackColor = true;
            // 
            // cbMeasure
            // 
            this.cbMeasure.FormattingEnabled = true;
            this.cbMeasure.Location = new System.Drawing.Point(227, 120);
            this.cbMeasure.Name = "cbMeasure";
            this.cbMeasure.Size = new System.Drawing.Size(121, 21);
            this.cbMeasure.TabIndex = 24;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(17, 120);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(40, 13);
            this.label4.TabIndex = 28;
            this.label4.Text = "Мярка";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 25);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(88, 13);
            this.label3.TabIndex = 26;
            this.label3.Text = "Поделемент на ";
            // 
            // tbCode
            // 
            this.tbCode.Location = new System.Drawing.Point(227, 54);
            this.tbCode.MaxLength = 10;
            this.tbCode.Name = "tbCode";
            this.tbCode.Size = new System.Drawing.Size(274, 20);
            this.tbCode.TabIndex = 21;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 54);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(103, 13);
            this.label2.TabIndex = 23;
            this.label2.Text = "Инвентарен номер";
            // 
            // tbDescription
            // 
            this.tbDescription.Location = new System.Drawing.Point(227, 80);
            this.tbDescription.MaxLength = 50;
            this.tbDescription.Name = "tbDescription";
            this.tbDescription.Size = new System.Drawing.Size(274, 20);
            this.tbDescription.TabIndex = 22;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(17, 80);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(83, 13);
            this.label1.TabIndex = 20;
            this.label1.Text = "Наименование";
            // 
            // tabPage2
            // 
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Size = new System.Drawing.Size(516, 418);
            this.tabPage2.TabIndex = 3;
            this.tabPage2.Text = "КОМПОНЕНТИ";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.dgvGoodList);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Size = new System.Drawing.Size(516, 418);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "СПИСЪК";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // dgvGoodList
            // 
            this.dgvGoodList.AllowUserToAddRows = false;
            this.dgvGoodList.AllowUserToDeleteRows = false;
            this.dgvGoodList.AllowUserToOrderColumns = true;
            this.dgvGoodList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvGoodList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.GoodsID,
            this.Description,
            this.Path});
            this.dgvGoodList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvGoodList.Location = new System.Drawing.Point(0, 0);
            this.dgvGoodList.Name = "dgvGoodList";
            this.dgvGoodList.ReadOnly = true;
            this.dgvGoodList.Size = new System.Drawing.Size(516, 418);
            this.dgvGoodList.TabIndex = 1;
            // 
            // GoodsID
            // 
            this.GoodsID.HeaderText = "GoodsID";
            this.GoodsID.Name = "GoodsID";
            this.GoodsID.ReadOnly = true;
            this.GoodsID.Visible = false;
            // 
            // Description
            // 
            this.Description.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCellsExceptHeader;
            this.Description.HeaderText = "Наименование";
            this.Description.Name = "Description";
            this.Description.ReadOnly = true;
            this.Description.Width = 5;
            // 
            // Path
            // 
            this.Path.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCellsExceptHeader;
            this.Path.FillWeight = 500F;
            this.Path.HeaderText = "Йерархия";
            this.Path.Name = "Path";
            this.Path.ReadOnly = true;
            this.Path.Width = 5;
            // 
            // contextMenuNode
            // 
            this.contextMenuNode.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.добавиОсновенЕлементToolStripMenuItem,
            this.добавиToolStripMenuItem,
            this.изтрийToolStripMenuItem,
            this.ShowList});
            this.contextMenuNode.Name = "contextMenuTreeView";
            this.contextMenuNode.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.contextMenuNode.ShowImageMargin = false;
            this.contextMenuNode.Size = new System.Drawing.Size(234, 92);
            // 
            // добавиОсновенЕлементToolStripMenuItem
            // 
            this.добавиОсновенЕлементToolStripMenuItem.Name = "добавиОсновенЕлементToolStripMenuItem";
            this.добавиОсновенЕлементToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.добавиОсновенЕлементToolStripMenuItem.Text = "Добави основен елемент";
            this.добавиОсновенЕлементToolStripMenuItem.Click += new System.EventHandler(this.AddRootElementToolStripMenuItem_Click);
            // 
            // добавиToolStripMenuItem
            // 
            this.добавиToolStripMenuItem.Name = "добавиToolStripMenuItem";
            this.добавиToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.добавиToolStripMenuItem.Text = "Добави елемент";
            this.добавиToolStripMenuItem.Click += new System.EventHandler(this.AddToolStripMenuItem_Click);
            // 
            // изтрийToolStripMenuItem
            // 
            this.изтрийToolStripMenuItem.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.изтрийToolStripMenuItem.Name = "изтрийToolStripMenuItem";
            this.изтрийToolStripMenuItem.Size = new System.Drawing.Size(233, 22);
            this.изтрийToolStripMenuItem.Text = "Изтрий(Деактивирай)";
            this.изтрийToolStripMenuItem.Click += new System.EventHandler(this.DeleteToolStripMenuItem_Click);
            // 
            // ShowList
            // 
            this.ShowList.Name = "ShowList";
            this.ShowList.Size = new System.Drawing.Size(233, 22);
            this.ShowList.Text = "Покажи съдържание като списък";
            this.ShowList.Click += new System.EventHandler(this.ShowListToolStripMenuItem_Click);
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // FormGoods
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.splitContainer1);
            this.Name = "FormGoods";
            this.Text = "АРТИКУЛИ";
            this.Load += new System.EventHandler(this.FormGoods_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.tabArticle.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvGoodList)).EndInit();
            this.contextMenuNode.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.TreeView tvGoods;
        private System.Windows.Forms.ImageList ilGoods;
        private System.Windows.Forms.ContextMenuStrip contextMenuNode;
        private System.Windows.Forms.ToolStripMenuItem добавиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem изтрийToolStripMenuItem;
        private ToolStripMenuItem добавиОсновенЕлементToolStripMenuItem;
        private ErrorProvider errorProvider1;
        private ToolStripMenuItem ShowList;
        private TabControl tabArticle;
        private TabPage tabPage1;
        private Button button1;
        private TextBox tbParent;
        private CheckBox cbISDeleted;
        private TextBox tbExpiration;
        private Label label8;
        private TextBox tbSalePrice;
        private Label label7;
        private TextBox tbSaleName;
        private Label label6;
        private TextBox tbSaleCode;
        private Label label5;
        private GroupBox groupBox1;
        private RadioButton rbElement;
        private RadioButton rbGroup;
        private RadioButton rbReceipt;
        private ComboBox cbMeasure;
        private Label label4;
        private Label label3;
        private TextBox tbCode;
        private Label label2;
        private TextBox tbDescription;
        private Label label1;
        private TabPage tabPage3;
        private TabPage tabPage2;
        private DataGridView dgvGoodList;
        private DataGridViewTextBoxColumn GoodsID;
        private DataGridViewTextBoxColumn Description;
        private DataGridViewTextBoxColumn Path;
    }
}

