using CapaConexion;
using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace CapaNegocio
{
    public class LoginNeg
    {
        public LoginCon objLogin;
        public bool disposed = false;

        public void Dispose() 
        {
            Disposed();
        }

        public void Disposed()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                objLogin.Dispose();
                objLogin = null;
            }
        }

        public LoginNeg()
        {
            objLogin = new LoginCon();
        }

        public long AgregarCredenciales(DataSet ds)
        {
            try
            {
                return objLogin.AgregarCredenciales(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public bool ModificarCredenciales(DataSet ds)
        {
            try
            {
                return objLogin.ModificarLogin(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }


        public DataSet obtenerlogin()
        {
            try
            {
                return objLogin.obtenerlogin();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet obtenerRol()
        {
            try
            {
                return objLogin.obtenerRol();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet NuevoLoginDS()
        {
            DataSet dsLogin = new DataSet();
            try
            {
                //Crear Datatable
                DataTable objDataTable = dsLogin.Tables.Add("GLogin");

                //Crear DataColumn
                DataColumn objDataColumn;
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdLogin");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdPersona");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                objDataColumn = new DataColumn("Clave");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                objDataColumn.MaxLength = 12;
                //agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                objDataColumn = new DataColumn("IdRol");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);
            }
            catch (Exception ExceptionErr)
            {
                throw new System.Exception(ExceptionErr.Message, ExceptionErr.InnerException);
            }
            return dsLogin;
        }

        public static string AutenticarLogin(string aUsuario, string aPass)
        {
            string bResult = "v";

            try
            {
                using (SqlConnection con = Conexion.cn())
                {
                    SqlCommand comd = new SqlCommand("SELECT * FROM GLogin where Usuario=@user and Clave=@con", con);
                    comd.Parameters.AddWithValue("@user", aUsuario); //
                    comd.Parameters.AddWithValue("@con", aPass);
                    con.Open();

                    SqlDataReader rd = comd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        //bResult = true;
                        bResult = "v";
                    }
                    else
                    {
                        //bResult = false;
                        bResult = "f";
                    }
                    rd.Close();
                    con.Close();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return bResult;
        }

        public static string autenRol(string rUsuario)
        {
            string resul;
            int rResult = 0;
            try
            {
                using (SqlConnection con = Conexion.cn())
                {
                    SqlCommand comd = new SqlCommand("select e.IdRol from PLEmpleado e inner join GLogin l on l.IdLogin = e.IdLogin where l.Usuario = @Usuario", con);
                    comd.Parameters.AddWithValue("@Usuario", rUsuario);
                    con.Open();

                    SqlDataReader rd = comd.ExecuteReader();
                    rd.Read();
                    rResult = rd.GetInt32(rd.GetOrdinal("IDRol"));
                    if (rResult == 1)
                    {
                        resul = "Admin";
                    }
                    else if (rResult == 2)
                    {
                        resul = "Médico";

                    }
                    else
                    {
                        resul = "Recepción";

                    }

                    rd.Close();
                    con.Close();

                }

            }

            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return resul;
        }
    }
}