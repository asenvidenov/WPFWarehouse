namespace AMBC
{
    partial class FormContragentsSearch
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
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.btnSearch = new System.Windows.Forms.Button();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvSearchResult = new System.Windows.Forms.DataGridView();
            this.GoodsID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ContrName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ContrBulstat = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSearchResult)).BeginInit();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.btnSearch);
            this.splitContainer1.Panel1.Controls.Add(this.txtSearch);
            this.splitContainer1.Panel1.Controls.Add(this.label1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.dgvSearchResult);
            this.splitContainer1.Size = new System.Drawing.Size(413, 657);
            this.splitContainer1.SplitterDistance = 27;
            this.splitContainer1.TabIndex = 0;
            // 
            // btnSearch
            // 
            this.btnSearch.BackgroundImage = global::AMBC.Properties.Resources.filter;
            this.btnSearch.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btnSearch.Location = new System.Drawing.Point(383, 6);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(22, 20);
            this.btnSearch.TabIndex = 2;
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.BtnSearch_Click);
            // 
            // txtSearch
            // 
            this.txtSearch.Location = new System.Drawing.Point(126, 6);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(251, 20);
            this.txtSearch.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(117, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Търси в име или ЕИК";
            // 
            // dgvSearchResult
            // 
            this.dgvSearchResult.AllowUserToAddRows = false;
            this.dgvSearchResult.AllowUserToDeleteRows = false;
            this.dgvSearchResult.AllowUserToOrderColumns = true;
            this.dgvSearchResult.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSearchResult.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.GoodsID,
            this.ContrName,
            this.ContrBulstat});
            this.dgvSearchResult.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvSearchResult.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dgvSearchResult.Location = new System.Drawing.Point(0, 0);
            this.dgvSearchResult.MultiSelect = false;
            this.dgvSearchResult.Name = "dgvSearchResult";
            this.dgvSearchResult.ReadOnly = true;
            this.dgvSearchResult.Size = new System.Drawing.Size(413, 626);
            this.dgvSearchResult.TabIndex = 0;
            // 
            // GoodsID
            // 
            this.GoodsID.HeaderText = "GoodsID";
            this.GoodsID.Name = "GoodsID";
            this.GoodsID.ReadOnly = true;
            this.GoodsID.Visible = false;
            // 
            // ContrName
            // 
            this.ContrName.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCellsExceptHeader;
            this.ContrName.HeaderText = "ИМЕ";
            this.ContrName.MinimumWidth = 100;
            this.ContrName.Name = "ContrName";
            this.ContrName.ReadOnly = true;
            // 
            // ContrBulstat
            // 
            this.ContrBulstat.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCellsExceptHeader;
            this.ContrBulstat.HeaderText = "ЕИК";
            this.ContrBulstat.MinimumWidth = 100;
            this.ContrBulstat.Name = "ContrBulstat";
            this.ContrBulstat.ReadOnly = true;
            // 
            // FormContragentsSearch
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(413, 657);
            this.Controls.Add(this.splitContainer1);
            this.Name = "FormContragentsSearch";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.PerformLayout();
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSearchResult)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgvSearchResult;
        private System.Windows.Forms.DataGridViewTextBoxColumn GoodsID;
        private System.Windows.Forms.DataGridViewTextBoxColumn ContrName;
        private System.Windows.Forms.DataGridViewTextBoxColumn ContrBulstat;
    }
}