using System.Configuration;
using System.Windows.Forms;

namespace AMBC
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
        }

        private void btnOK_Click(object sender, System.EventArgs e)
        {
            if (txtLogin.TextLength != 0 && txtPass.TextLength != 0)
            {
                if (DataGlobals.Login(txtLogin.Text, txtPass.Text)) 
                {
                    //new FormContragents().Show();
                    new FormMeasure().Show();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("НЕАЛИДНИ ДАННИ", "ГРЕШКА!", MessageBoxButtons.OK);
                }
            }
        }

        private void btnConfig_Click(object sender, System.EventArgs e)
        {
            new AMBConfig().ShowDialog();
        }
    }
}
