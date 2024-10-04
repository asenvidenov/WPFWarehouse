using System.Data.SqlClient;

namespace AMBC
{
    internal static class DataGlobals
    {
        private static SqlConnection _SQLCnn;
        private static string _cnnString;
        private static int _opID;
        private static string _opName;
        private static int _opLevel;
        private static string _srvName;
        private static string _srvInstance;
        private static string _srvPort;
        private static string _srvEnc;
        private static string _srvDbase;

        public static int OpID { get => _opID; }
        public static SqlConnection SQLCnn { get => _SQLCnn; }
        public static string OpName { get => _opName; }
        public static int OpLevel { get => _opLevel; }
        public static string CnnString { get => _cnnString;  set => _cnnString = value; }
        public static SqlConnection Cnn {  get => _SQLCnn; }

        public static SqlConnection Init(SqlConnection conn)
        {
            conn.ConnectionString = _cnnString;
            conn.Open();
            return conn;
        }
        public static bool Init()
        {
            if (_SQLCnn != null)
            {
                if (_SQLCnn.State != System.Data.ConnectionState.Closed) 
                    { return true; } 
                 else {
                    try
                    {
                        _SQLCnn.Open();
                        return true;
                    }
                    catch { return false; }
                }
            }
            else
            {
                if (string.IsNullOrEmpty(_cnnString)) { _cnnString += Properties.Settings.Default.ambcConnectionString; }
                _SQLCnn = new SqlConnection();
                _SQLCnn.ConnectionString = _cnnString;
                try
                {
                    _SQLCnn.Open();
                    return true;
                }
                catch { return false; }
            }
        }

        public static bool InitDefault(string pass, string srv="AS2000", string instance="", string port="1433", string dBase = "ambc", string usr = "ambc", string enc="False")
        {
            _srvName = srv;
            _srvDbase = dBase;
            _srvEnc = enc;
            _srvInstance = instance;
            _srvPort = port;
            if (_SQLCnn != null)
            {
                if(_SQLCnn.State != System.Data.ConnectionState.Closed) { return true; } else { return false; }
            }
            else
            {
                _cnnString = "Server=" + srv + ";Initial Catalog=" + dBase + ";User ID=" + usr + ";Password=" + pass + ";Encrypt=" + _srvEnc + ";";
                _SQLCnn = new SqlConnection();
                try
                {
                    _SQLCnn.Open();
                    return true;
                }
                catch { return false; }
            }
        }

        public static bool Login(string loginName, string loginPass)
        {
            if (Init())
            {
                SqlCommand cmd = new SqlCommand("amb_Login");
                cmd.Connection = _SQLCnn;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("opLogin",loginName);
                cmd.Parameters.AddWithValue("opPass", loginPass);
                SqlDataReader r = cmd.ExecuteReader();
                if (r.HasRows)
                {
                    r.Read();
                    _opID=(int)r.GetValue(0);
                    _opName=(string)r.GetValue(1);
                    _opLevel=(int)r.GetValue(2);
                }
                r.Close();
                return true;
            }
            else { return false; }
        }

    }
}
