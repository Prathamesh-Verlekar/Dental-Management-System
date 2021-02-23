using System;
using System.Data;
using System.Data.SqlClient;

namespace DMDD_WebApplication.DBConnection
{
    public class DatabaseConnection
    {

        private String _constring = "Data Source=MRCRICKET;Initial Catalog=DentistDB;Integrated Security=True";
        private SqlConnection _conobj;
        private SqlCommand _comobj;
        private Int32 _commandtimeout;

        public String Constring
        {
            get { return _constring; }
            set { _constring = value; }
        }

        public SqlConnection conobj
        {
            get { return _conobj; }
            set { _conobj = value; }
        }
        public SqlCommand comobj
        {
            get { return _comobj; }
            set { _comobj = value; }
        }
        public Int32 commandtimeout
        {
            get { return _commandtimeout; }
            set { _commandtimeout = value; }
        }

        //create defualt constructor which initialize parameter
        public DatabaseConnection()
        {
            conobj = new SqlConnection();
            conobj.ConnectionString = _constring;
            comobj = new SqlCommand();
            comobj.Connection = conobj;
        }

        public void open()
        {
            if (conobj.State != ConnectionState.Open)
            {
                conobj.Open();
            }

        }
        public void close()
        {
            if (conobj.State != ConnectionState.Closed)
            {
                conobj.Close();
            }

        }
        public void dispose()
        {
            GC.SuppressFinalize(this);
            this.close();
            this.comobj = null;
            this.conobj = null;

        }

        //create methods
        public Object Executescaler(String sqlstatement, Boolean isprocedure)
        {
            comobj.CommandText = sqlstatement;
            comobj.CommandTimeout = _commandtimeout;
            if (isprocedure)
            {
                comobj.CommandType = CommandType.StoredProcedure;
            }
            else
            {
                comobj.CommandType = CommandType.Text;
            }
            return comobj.ExecuteScalar();
        }

        public Int32 Executenonquery(String sqlstatement, Boolean isprocedure)
        {
            comobj.CommandText = sqlstatement;
            comobj.CommandTimeout = _commandtimeout;
            if (isprocedure)
            {
                comobj.CommandType = CommandType.StoredProcedure;
            }
            else
            {
                comobj.CommandType = CommandType.Text;
            }
            return comobj.ExecuteNonQuery();
        }

        public SqlDataReader Getdatareader(String sqlstatement, Boolean isprocedure)
        {
            SqlDataReader drobj;
            drobj = null;
            comobj.CommandText = sqlstatement;
            comobj.CommandTimeout = _commandtimeout;
            if (isprocedure)
            {
                comobj.CommandType = CommandType.StoredProcedure;
            }
            else
            {
                comobj.CommandType = CommandType.Text;
            }
            drobj = comobj.ExecuteReader();
            return drobj;
        }

        public DataSet Getdataset(String sqlstatement, Boolean isprocedure)
        {
            DataSet dsobj = new DataSet();
            comobj.CommandText = sqlstatement;
            comobj.CommandTimeout = _commandtimeout;
            if (isprocedure)
            {
                comobj.CommandType = CommandType.StoredProcedure;
            }
            else
            {
                comobj.CommandType = CommandType.Text;
            }
            SqlDataAdapter daobj = new SqlDataAdapter();
            daobj.SelectCommand = comobj;
            daobj.Fill(dsobj);
            return dsobj;
        }


        public void addparameter(String paramname, object paramtypenew, Int32 paramsize, object paramvalue, ParameterDirection paramdirection)
        {
            DbType paramtype = DbType.String;
            SqlDbType sqlparamtype = SqlDbType.VarChar;
            int i = 0;
            if (paramtypenew.GetType() == paramtype.GetType())
            { paramtype = (DbType)paramtypenew; i = 1; }
            else
            { sqlparamtype = (SqlDbType)paramtypenew; i = 2; }

            SqlParameter param = new SqlParameter();
            if (paramtype == DbType.String || sqlparamtype == SqlDbType.VarChar)
            {
                param.Size = paramsize;
            }
            param.ParameterName = paramname;
            if (i == 1)
                param.DbType = paramtype;
            if (i == 2)
                param.SqlDbType = sqlparamtype;
            param.Value = paramvalue;
            param.Direction = paramdirection;
            comobj.Parameters.Add(param);
        }

        public Object getparameter(String paramname)
        {
            return comobj.Parameters[paramname].Value;
        }
    }
}