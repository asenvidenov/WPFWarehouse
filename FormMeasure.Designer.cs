namespace AMBC
{
    partial class FormMeasure
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
            this.dgMeasure = new System.Windows.Forms.DataGridView();
            this.mBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.MeasureID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MeasureName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PackID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PackQty = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgMeasure)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dgMeasure
            // 
            this.dgMeasure.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgMeasure.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MeasureID,
            this.MeasureName,
            this.PackID,
            this.PackQty});
            this.dgMeasure.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgMeasure.Location = new System.Drawing.Point(0, 0);
            this.dgMeasure.Name = "dgMeasure";
            this.dgMeasure.Size = new System.Drawing.Size(564, 452);
            this.dgMeasure.TabIndex = 0;
            // 
            // MeasureID
            // 
            this.MeasureID.HeaderText = "MeasureID";
            this.MeasureID.Name = "MeasureID";
            this.MeasureID.Visible = false;
            // 
            // MeasureName
            // 
            this.MeasureName.HeaderText = "ИМЕ";
            this.MeasureName.Name = "MeasureName";
            // 
            // PackID
            // 
            this.PackID.HeaderText = "СЪДЪРЖА";
            this.PackID.Name = "PackID";
            this.PackID.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.PackID.Visible = false;
            // 
            // PackQty
            // 
            this.PackQty.HeaderText = "КОЛИЧЕСТВО";
            this.PackQty.Name = "PackQty";
            // 
            // FormMeasure
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(564, 452);
            this.Controls.Add(this.dgMeasure);
            this.Name = "FormMeasure";
            this.Text = "FormMeasure";
            this.Load += new System.EventHandler(this.FormMeasure_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgMeasure)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgMeasure;
        private System.Windows.Forms.BindingSource mBindingSource;
        private System.Windows.Forms.DataGridViewTextBoxColumn MeasureID;
        private System.Windows.Forms.DataGridViewTextBoxColumn MeasureName;
        private System.Windows.Forms.DataGridViewTextBoxColumn PackID;
        private System.Windows.Forms.DataGridViewTextBoxColumn PackQty;
    }
}