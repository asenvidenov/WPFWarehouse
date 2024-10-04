namespace AMBC
{
    partial class FormGoodsList
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
            this.dgvGoodList = new System.Windows.Forms.DataGridView();
            this.GoodsID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Description = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Path = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGoodList)).BeginInit();
            this.SuspendLayout();
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
            this.dgvGoodList.Size = new System.Drawing.Size(800, 206);
            this.dgvGoodList.TabIndex = 0;
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
            // FormGoodsList
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 206);
            this.Controls.Add(this.dgvGoodList);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow;
            this.Name = "FormGoodsList";
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "СПИСЪК С АРТИКУЛИ";
            ((System.ComponentModel.ISupportInitialize)(this.dgvGoodList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvGoodList;
        private System.Windows.Forms.DataGridViewTextBoxColumn GoodsID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Description;
        private System.Windows.Forms.DataGridViewTextBoxColumn Path;
    }
}