using System;
using System.Configuration;
using System.Net;
using System.Windows.Forms;

namespace AMBC
{
    public partial class AMBConfig : Form
    {
        private string _SQLcnn;
        public AMBConfig()
        {
            InitializeComponent();
            cmbTrusted.SelectedIndex = 0;
        }

        private void AMBConfig_Load(object sender, EventArgs e)
        {
            foreach (string w in Properties.Settings.Default.ambcConnectionString.Split(';'))
            {
                ReadSetting(w.Split('='));
            }
        }
        private void ReadSetting(string[] w)
        {
            if (w[0].ToLower().Contains("data source") || w[0].ToLower().Contains("server"))
            {
                if (w[1].Contains(","))
                {
                    ReadPort(w[1].Split(','));
                }
                else
                {
                    if (w[1].Contains("\\"))
                    {
                        ReadServer(w[1].Split('\\'));
                    }
                    else
                    {
                        txtServer.Text = w[1];
                    }
                }
            }
            if (w[0].ToLower().Contains("database") || w[0].ToLower().Contains("initial catalog"))
            {
                txtDBase.Text = w[1].Trim();
            }

            if (w[0].ToLower().Contains("integrated security"))
            {
                if (w[1].ToLower() == "true")
                {
                    cmbTrusted.SelectedIndex = 0;
                    txtUser.Text = null;
                    txtUser.Enabled = false;
                    txtPass.Text = null;
                    txtPass.Enabled = false;
                }
                else
                { 
                    cmbTrusted.SelectedIndex = 1;     
                }
            }
            if (w[0].ToLower().Contains("user"))
            {
                if(cmbTrusted.SelectedIndex == 0) txtUser.Text = w[1].Trim();
            }
            if (w[0].ToLower().Contains("password"))
            {
                if (cmbTrusted.SelectedIndex == 0) txtPass.Text = w[1].Trim();
            }
            if (w[0].ToLower().Contains("encryption"))
            {
                if (w[1].ToLower() == "enabled") cmbEncrypt.SelectedIndex = 0; else cmbEncrypt.SelectedIndex = 1;
            }
        }

        private void ReadPort(string[] w)
        {
            txtPort.Text = w[1].Trim();
            if (w[0].Contains("\\"))
            {
                ReadServer(w[0].Split('\\'));
            }
        }

        private void ReadServer(string[] w)
        {
            txtServer.Text = w[0].Trim();
            IPAddress ip = null;
            if (!IPAddress.TryParse(w[0], out ip)) txtInstance.Text = w[1].Trim();
            
        }

        private void BtnConfirm_Click(object sender, EventArgs e)
        {
            if(errorPort.GetError(txtServer).Length!=0 || errorPort.GetError(txtPort).Length!=0) { return; }
            IPAddress ip = null;
            string cnnString;
            if (IPAddress.TryParse(txtServer.Text, out ip))
            {
                txtInstance.Text = null;
                txtInstance.Enabled = false;
            }
            if (ip != null) cnnString = "Server = " + txtServer.Text; else cnnString = "Data Source = " + txtServer.Text;
            if (!string.IsNullOrEmpty(txtInstance.Text)) cnnString += "\\" + txtInstance.Text;
            if (!string.IsNullOrEmpty(txtPort.Text)) cnnString += "," + txtPort.Text;
            cnnString += ";";
            if (ip != null && cmbProtocol.SelectedIndex >= 0) cnnString += "Network Library = " + cmbProtocol.Text + ";";
            if (!string.IsNullOrEmpty(txtDBase.Text)) cnnString+= "Initial Catalog = " + txtDBase.Text +";";
            if (cmbTrusted.SelectedIndex == 0)
            {
                cnnString += "Integrated Security = true;";
                if (cmbTrustCnn.SelectedIndex == 0) cnnString += "Trusted Connection = true;"; else cnnString += "Trusted Connection = NTLM;";
            }
            else
            {
                if (!string.IsNullOrEmpty(txtUser.Text)) cnnString += "User Id = " + txtUser.Text + ";";
                if (!string.IsNullOrEmpty(txtPass.Text)) cnnString += "Password = " + txtPass.Text + ";";
            }

            DataGlobals.CnnString = cnnString;
            this.Close();
        }

        private void TxtServer_TextChanged(object sender, EventArgs e)
        {
            IPAddress ip = null;
            if(IPAddress.TryParse(txtServer.Text,out ip)){
                txtInstance.Text = null;
                txtInstance.Enabled = false;
            }
        }

        private void CmbTrusted_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTrusted.SelectedIndex == 0)
            {
                txtPass.Text = null;
                txtUser.Text = null;
                txtPass.Enabled = false;
                txtUser.Enabled = false;
                cmbTrustCnn.Enabled = true;
            }
            else
                { txtPass.Enabled = true; txtUser.Enabled = true; cmbTrustCnn.SelectedIndex = -1; cmbTrustCnn.Enabled=false; }
        }

        private void TxtServer_Validating(object sender, System.ComponentModel.CancelEventArgs e)
            {
            if (!string.IsNullOrEmpty(txtServer.Text))
                {
                    errorPort.SetError(txtServer, "");
                    return;
                }
                else
                {
                {
                    errorPort.SetError(txtServer, "ПОЛЕТО СЪРВЪР НЕ МОЖЕ ДА Е ПРАЗНО!");
                    return;
                }
            }
            }
        private void TxtPort_Validating(object sender, System.ComponentModel.CancelEventArgs e) {
            if(string.IsNullOrEmpty(txtPort.Text)){
                errorPort.SetError(txtPort, "");
                return;}
            int port;
            if (int.TryParse(txtPort.Text, out port)) {
                if (port <= 0 || port > 65535) { 
                    e.Cancel = true;
                    errorPort.SetError(txtPort, "ГРЕШНА СТОЙНОСТ ЗА ПОРТ!"); }
                else errorPort.SetError(txtPort, "");
            }
            else
            {
                e.Cancel = true;
                errorPort.SetError(txtPort, "ГРЕШНА СТОЙНОСТ ЗА ПОРТ!");
            }
        }
    }
}
