namespace AMBC
{
    partial class AMBConfig
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
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.txtServer = new System.Windows.Forms.TextBox();
            this.txtInstance = new System.Windows.Forms.TextBox();
            this.txtPort = new System.Windows.Forms.TextBox();
            this.cmbProtocol = new System.Windows.Forms.ComboBox();
            this.cmbTrusted = new System.Windows.Forms.ComboBox();
            this.txtUser = new System.Windows.Forms.TextBox();
            this.txtPass = new System.Windows.Forms.TextBox();
            this.cmbEncrypt = new System.Windows.Forms.ComboBox();
            this.btnConfirm = new System.Windows.Forms.Button();
            this.txtDBase = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.cmbTrustCnn = new System.Windows.Forms.ComboBox();
            this.label10 = new System.Windows.Forms.Label();
            this.errorPort = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.errorPort)).BeginInit();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 24);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(51, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "СЪРВЪР";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 52);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "ИНСТАНЦИЯ";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 80);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(37, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "ПОРТ";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(24, 164);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(142, 13);
            this.label4.TabIndex = 5;
            this.label4.Text = "WINDOWS ОТОРИЗАЦИЯ";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(24, 227);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(81, 13);
            this.label5.TabIndex = 6;
            this.label5.Text = "ПОТРЕБИТЕЛ";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(24, 108);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(68, 13);
            this.label7.TabIndex = 8;
            this.label7.Text = "ПРОТОКОЛ";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(24, 283);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(81, 13);
            this.label8.TabIndex = 9;
            this.label8.Text = "КРИПТИРАНЕ";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(24, 255);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(52, 13);
            this.label6.TabIndex = 7;
            this.label6.Text = "ПАРОЛА";
            // 
            // txtServer
            // 
            this.txtServer.HideSelection = false;
            this.txtServer.Location = new System.Drawing.Point(181, 17);
            this.txtServer.Name = "txtServer";
            this.txtServer.Size = new System.Drawing.Size(159, 20);
            this.txtServer.TabIndex = 0;
            this.txtServer.TextChanged += new System.EventHandler(this.TxtServer_TextChanged);
            this.txtServer.Validating += new System.ComponentModel.CancelEventHandler(this.TxtServer_Validating);
            // 
            // txtInstance
            // 
            this.txtInstance.Location = new System.Drawing.Point(181, 45);
            this.txtInstance.Name = "txtInstance";
            this.txtInstance.Size = new System.Drawing.Size(159, 20);
            this.txtInstance.TabIndex = 1;
            // 
            // txtPort
            // 
            this.txtPort.Location = new System.Drawing.Point(181, 73);
            this.txtPort.MaxLength = 5;
            this.txtPort.Name = "txtPort";
            this.txtPort.Size = new System.Drawing.Size(68, 20);
            this.txtPort.TabIndex = 2;
            this.txtPort.Validating += new System.ComponentModel.CancelEventHandler(this.TxtPort_Validating);
            // 
            // cmbProtocol
            // 
            this.cmbProtocol.Enabled = false;
            this.cmbProtocol.FormattingEnabled = true;
            this.cmbProtocol.Items.AddRange(new object[] {
            "TCP/IP",
            "Named Pipes"});
            this.cmbProtocol.Location = new System.Drawing.Point(181, 101);
            this.cmbProtocol.Name = "cmbProtocol";
            this.cmbProtocol.Size = new System.Drawing.Size(68, 21);
            this.cmbProtocol.TabIndex = 3;
            // 
            // cmbTrusted
            // 
            this.cmbTrusted.FormattingEnabled = true;
            this.cmbTrusted.Items.AddRange(new object[] {
            "ДА",
            "НЕ"});
            this.cmbTrusted.Location = new System.Drawing.Point(181, 158);
            this.cmbTrusted.Name = "cmbTrusted";
            this.cmbTrusted.Size = new System.Drawing.Size(68, 21);
            this.cmbTrusted.TabIndex = 5;
            this.cmbTrusted.SelectedIndexChanged += new System.EventHandler(this.CmbTrusted_SelectedIndexChanged);
            // 
            // txtUser
            // 
            this.txtUser.Location = new System.Drawing.Point(181, 222);
            this.txtUser.Name = "txtUser";
            this.txtUser.Size = new System.Drawing.Size(159, 20);
            this.txtUser.TabIndex = 7;
            // 
            // txtPass
            // 
            this.txtPass.Location = new System.Drawing.Point(181, 250);
            this.txtPass.Name = "txtPass";
            this.txtPass.PasswordChar = '*';
            this.txtPass.Size = new System.Drawing.Size(159, 20);
            this.txtPass.TabIndex = 8;
            // 
            // cmbEncrypt
            // 
            this.cmbEncrypt.Enabled = false;
            this.cmbEncrypt.FormattingEnabled = true;
            this.cmbEncrypt.Items.AddRange(new object[] {
            "ДА",
            "НЕ"});
            this.cmbEncrypt.Location = new System.Drawing.Point(181, 278);
            this.cmbEncrypt.Name = "cmbEncrypt";
            this.cmbEncrypt.Size = new System.Drawing.Size(68, 21);
            this.cmbEncrypt.TabIndex = 9;
            // 
            // btnConfirm
            // 
            this.btnConfirm.Location = new System.Drawing.Point(181, 324);
            this.btnConfirm.Name = "btnConfirm";
            this.btnConfirm.Size = new System.Drawing.Size(121, 23);
            this.btnConfirm.TabIndex = 10;
            this.btnConfirm.Text = "ПОТВЪРДИ";
            this.btnConfirm.UseVisualStyleBackColor = true;
            this.btnConfirm.Click += new System.EventHandler(this.BtnConfirm_Click);
            // 
            // txtDBase
            // 
            this.txtDBase.Location = new System.Drawing.Point(181, 130);
            this.txtDBase.Name = "txtDBase";
            this.txtDBase.Size = new System.Drawing.Size(159, 20);
            this.txtDBase.TabIndex = 4;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(24, 136);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(78, 13);
            this.label9.TabIndex = 19;
            this.label9.Text = "БАЗА ДАННИ";
            // 
            // cmbTrustCnn
            // 
            this.cmbTrustCnn.Enabled = false;
            this.cmbTrustCnn.FormattingEnabled = true;
            this.cmbTrustCnn.Items.AddRange(new object[] {
            "Kerberos",
            "NTLM"});
            this.cmbTrustCnn.Location = new System.Drawing.Point(181, 188);
            this.cmbTrustCnn.Name = "cmbTrustCnn";
            this.cmbTrustCnn.Size = new System.Drawing.Size(68, 21);
            this.cmbTrustCnn.TabIndex = 6;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(24, 194);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(30, 13);
            this.label10.TabIndex = 21;
            this.label10.Text = "ТИП";
            // 
            // errorPort
            // 
            this.errorPort.ContainerControl = this;
            // 
            // AMBConfig
            // 
            this.AcceptButton = this.btnConfirm;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(366, 372);
            this.Controls.Add(this.cmbTrustCnn);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.txtDBase);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.btnConfirm);
            this.Controls.Add(this.cmbEncrypt);
            this.Controls.Add(this.txtPass);
            this.Controls.Add(this.txtUser);
            this.Controls.Add(this.cmbTrusted);
            this.Controls.Add(this.cmbProtocol);
            this.Controls.Add(this.txtPort);
            this.Controls.Add(this.txtInstance);
            this.Controls.Add(this.txtServer);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label2);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AMBConfig";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "AMBConfig";
            this.TopMost = true;
            this.Load += new System.EventHandler(this.AMBConfig_Load);
            ((System.ComponentModel.ISupportInitialize)(this.errorPort)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtServer;
        private System.Windows.Forms.TextBox txtInstance;
        private System.Windows.Forms.TextBox txtPort;
        private System.Windows.Forms.ComboBox cmbProtocol;
        private System.Windows.Forms.ComboBox cmbTrusted;
        private System.Windows.Forms.TextBox txtUser;
        private System.Windows.Forms.TextBox txtPass;
        private System.Windows.Forms.ComboBox cmbEncrypt;
        private System.Windows.Forms.Button btnConfirm;
        private System.Windows.Forms.TextBox txtDBase;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.ComboBox cmbTrustCnn;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.ErrorProvider errorPort;
    }
}