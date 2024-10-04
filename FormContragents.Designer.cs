namespace AMBC
{
    partial class FormContragents
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormContragents));
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.tvContr = new System.Windows.Forms.TreeView();
            this.ilContr = new System.Windows.Forms.ImageList(this.components);
            this.button1 = new System.Windows.Forms.Button();
            this.tbPercent = new System.Windows.Forms.TextBox();
            this.tbPhone = new System.Windows.Forms.TextBox();
            this.tbINDS = new System.Windows.Forms.TextBox();
            this.tbMOL = new System.Windows.Forms.TextBox();
            this.tbEIK = new System.Windows.Forms.TextBox();
            this.tbAddress = new System.Windows.Forms.TextBox();
            this.tbContrName = new System.Windows.Forms.TextBox();
            this.tbCode = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.contextMenuNode = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.добавиОсновенЕлементToolStripMenuItemToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.добавиToolStripMenuItemToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.изтрийToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.contextMenuNode.SuspendLayout();
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
            this.splitContainer1.Panel1.Controls.Add(this.tvContr);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.button1);
            this.splitContainer1.Panel2.Controls.Add(this.tbPercent);
            this.splitContainer1.Panel2.Controls.Add(this.tbPhone);
            this.splitContainer1.Panel2.Controls.Add(this.tbINDS);
            this.splitContainer1.Panel2.Controls.Add(this.tbMOL);
            this.splitContainer1.Panel2.Controls.Add(this.tbEIK);
            this.splitContainer1.Panel2.Controls.Add(this.tbAddress);
            this.splitContainer1.Panel2.Controls.Add(this.tbContrName);
            this.splitContainer1.Panel2.Controls.Add(this.tbCode);
            this.splitContainer1.Panel2.Controls.Add(this.label8);
            this.splitContainer1.Panel2.Controls.Add(this.label7);
            this.splitContainer1.Panel2.Controls.Add(this.label6);
            this.splitContainer1.Panel2.Controls.Add(this.label5);
            this.splitContainer1.Panel2.Controls.Add(this.label4);
            this.splitContainer1.Panel2.Controls.Add(this.label3);
            this.splitContainer1.Panel2.Controls.Add(this.label2);
            this.splitContainer1.Panel2.Controls.Add(this.label1);
            this.splitContainer1.Size = new System.Drawing.Size(800, 450);
            this.splitContainer1.SplitterDistance = 266;
            this.splitContainer1.TabIndex = 0;
            // 
            // tvContr
            // 
            this.tvContr.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tvContr.ImageIndex = 0;
            this.tvContr.ImageList = this.ilContr;
            this.tvContr.Location = new System.Drawing.Point(0, 0);
            this.tvContr.Name = "tvContr";
            this.tvContr.SelectedImageIndex = 0;
            this.tvContr.ShowPlusMinus = false;
            this.tvContr.ShowRootLines = false;
            this.tvContr.Size = new System.Drawing.Size(266, 450);
            this.tvContr.TabIndex = 0;
            // 
            // ilContr
            // 
            this.ilContr.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("ilContr.ImageStream")));
            this.ilContr.TransparentColor = System.Drawing.Color.Transparent;
            this.ilContr.Images.SetKeyName(0, "folder.png");
            this.ilContr.Images.SetKeyName(1, "client.png");
            // 
            // button1
            // 
            this.button1.BackgroundImage = global::AMBC.Properties.Resources.filter;
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button1.Location = new System.Drawing.Point(468, 388);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(50, 50);
            this.button1.TabIndex = 8;
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // tbPercent
            // 
            this.tbPercent.Location = new System.Drawing.Point(109, 214);
            this.tbPercent.MaxLength = 2;
            this.tbPercent.Name = "tbPercent";
            this.tbPercent.Size = new System.Drawing.Size(73, 20);
            this.tbPercent.TabIndex = 7;
            // 
            // tbPhone
            // 
            this.tbPhone.Location = new System.Drawing.Point(109, 186);
            this.tbPhone.Name = "tbPhone";
            this.tbPhone.Size = new System.Drawing.Size(167, 20);
            this.tbPhone.TabIndex = 6;
            // 
            // tbINDS
            // 
            this.tbINDS.Location = new System.Drawing.Point(109, 158);
            this.tbINDS.MaxLength = 11;
            this.tbINDS.Name = "tbINDS";
            this.tbINDS.Size = new System.Drawing.Size(167, 20);
            this.tbINDS.TabIndex = 5;
            // 
            // tbMOL
            // 
            this.tbMOL.Location = new System.Drawing.Point(109, 130);
            this.tbMOL.Name = "tbMOL";
            this.tbMOL.Size = new System.Drawing.Size(409, 20);
            this.tbMOL.TabIndex = 4;
            // 
            // tbEIK
            // 
            this.tbEIK.Location = new System.Drawing.Point(109, 102);
            this.tbEIK.MaxLength = 9;
            this.tbEIK.Name = "tbEIK";
            this.tbEIK.Size = new System.Drawing.Size(167, 20);
            this.tbEIK.TabIndex = 3;
            // 
            // tbAddress
            // 
            this.tbAddress.Location = new System.Drawing.Point(109, 74);
            this.tbAddress.Name = "tbAddress";
            this.tbAddress.Size = new System.Drawing.Size(409, 20);
            this.tbAddress.TabIndex = 2;
            // 
            // tbContrName
            // 
            this.tbContrName.Location = new System.Drawing.Point(109, 46);
            this.tbContrName.Name = "tbContrName";
            this.tbContrName.Size = new System.Drawing.Size(409, 20);
            this.tbContrName.TabIndex = 1;
            // 
            // tbCode
            // 
            this.tbCode.Location = new System.Drawing.Point(109, 18);
            this.tbCode.Name = "tbCode";
            this.tbCode.Size = new System.Drawing.Size(167, 20);
            this.tbCode.TabIndex = 0;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(3, 214);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(50, 13);
            this.label8.TabIndex = 7;
            this.label8.Text = "Процент";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(3, 186);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(52, 13);
            this.label7.TabIndex = 6;
            this.label7.Text = "Телефон";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(3, 158);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(48, 13);
            this.label6.TabIndex = 5;
            this.label6.Text = "ИНДДС";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(3, 130);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(32, 13);
            this.label5.TabIndex = 4;
            this.label5.Text = "МОЛ";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(3, 102);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "ЕИК";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(3, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(38, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Адрес";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(3, 46);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Име";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(26, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Код";
            // 
            // contextMenuNode
            // 
            this.contextMenuNode.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.добавиОсновенЕлементToolStripMenuItemToolStripMenuItem,
            this.добавиToolStripMenuItemToolStripMenuItem,
            this.изтрийToolStripMenuItem});
            this.contextMenuNode.Name = "contextMenuNode";
            this.contextMenuNode.Size = new System.Drawing.Size(214, 70);
            // 
            // добавиОсновенЕлементToolStripMenuItemToolStripMenuItem
            // 
            this.добавиОсновенЕлементToolStripMenuItemToolStripMenuItem.Name = "добавиОсновенЕлементToolStripMenuItemToolStripMenuItem";
            this.добавиОсновенЕлементToolStripMenuItemToolStripMenuItem.Size = new System.Drawing.Size(213, 22);
            this.добавиОсновенЕлементToolStripMenuItemToolStripMenuItem.Text = "Добави основен елемент";
            this.добавиОсновенЕлементToolStripMenuItemToolStripMenuItem.TextAlign = System.Drawing.ContentAlignment.TopLeft;
            this.добавиОсновенЕлементToolStripMenuItemToolStripMenuItem.Click += new System.EventHandler(this.добавиОсновенЕлементToolStripMenuItemToolStripMenuItem_Click);
            // 
            // добавиToolStripMenuItemToolStripMenuItem
            // 
            this.добавиToolStripMenuItemToolStripMenuItem.Name = "добавиToolStripMenuItemToolStripMenuItem";
            this.добавиToolStripMenuItemToolStripMenuItem.Size = new System.Drawing.Size(213, 22);
            this.добавиToolStripMenuItemToolStripMenuItem.Text = "Добави елемент";
            this.добавиToolStripMenuItemToolStripMenuItem.Click += new System.EventHandler(this.AddToolStripMenuItem_Click);
            // 
            // изтрийToolStripMenuItem
            // 
            this.изтрийToolStripMenuItem.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.изтрийToolStripMenuItem.Name = "изтрийToolStripMenuItem";
            this.изтрийToolStripMenuItem.Size = new System.Drawing.Size(213, 22);
            this.изтрийToolStripMenuItem.Text = "Изтрий(Деактивирай)";
            this.изтрийToolStripMenuItem.Click += new System.EventHandler(this.DeleteToolStripMenuItem_Click);
            // 
            // FormContragents
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.splitContainer1);
            this.Name = "FormContragents";
            this.Text = "FormContragents";
            this.Load += new System.EventHandler(this.FormContragents_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.contextMenuNode.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.TreeView tvContr;
        private System.Windows.Forms.ImageList ilContr;
        private System.Windows.Forms.ContextMenuStrip contextMenuNode;
        private System.Windows.Forms.ToolStripMenuItem добавиОсновенЕлементToolStripMenuItemToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem добавиToolStripMenuItemToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem изтрийToolStripMenuItem;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbEIK;
        private System.Windows.Forms.TextBox tbAddress;
        private System.Windows.Forms.TextBox tbContrName;
        private System.Windows.Forms.TextBox tbCode;
        private System.Windows.Forms.TextBox tbPhone;
        private System.Windows.Forms.TextBox tbINDS;
        private System.Windows.Forms.TextBox tbMOL;
        private System.Windows.Forms.TextBox tbPercent;
        private System.Windows.Forms.Button button1;
    }
}