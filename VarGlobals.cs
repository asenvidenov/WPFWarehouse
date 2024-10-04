using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AMBC
{
    public static class VarGlobals
    {
        public static int pBox;
        public static string cFormName;
        public static long gID;
        public static long cID;
        public static long dID;
    }


    public class FormGlobal : Form
    {
        public virtual void ReceiveID(long id) { }
    }
}
