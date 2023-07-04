using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CapaConexion
{
    public class Conexion : IDisposable 
    {
        public string SQL;
        public SqlConnection conexion;
        public SqlCommand comando;
        public SqlDataAdapter adaptador;
        private bool disposed = false;

        //IDisposable
        private void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    if (adaptador != null)
                    {
                        adaptador.Dispose();
                        adaptador = null;
                    }
                    if (comando != null)
                    {
                        comando.Dispose();
                        comando = null;
                    }
                    if (conexion != null)
                    {
                        conexion.Dispose();
                        conexion = null;
                    }
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        //constructor de conexion
        public Conexion()
        {
            //asignar conexion
            conexion = new SqlConnection("Data Source=DESKTOP\\SQLEXPRESS01; Initial Catalog=proy; Integrated Security=True");
        }
        public static SqlConnection cn()
        {
            SqlConnection conec = new SqlConnection("Data Source=DESKTOP\\SQLEXPRESS01; Initial Catalog=proy; Integrated Security=True");
            return conec;
        }
        //abrir conexion
        public void AbrirConexion()
        {
            try
            {
                conexion.Open();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        //cerrar conexion
        public void CerrarConecion()
        {
            try
            {
                conexion.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public void InicializarComando()
        {
            try
            {
                if (comando == null)
                {
                    comando = new SqlCommand(SQL, conexion);
                    if (!SQL.ToUpper().StartsWith("SELECT") &
                       !SQL.ToUpper().StartsWith("INSERT") &
                       !SQL.ToUpper().StartsWith("UPDATE") &
                       !SQL.ToUpper().StartsWith("DELETE") &
                       !SQL.ToUpper().StartsWith("CREATE") &
                       !SQL.ToUpper().StartsWith("ALTER"))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public void AgregarParametro(string Name, object Value)
        {
            try
            {
                comando.Parameters.AddWithValue(Name, Value);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }

        }
        public long EjecutarEscalar()
        {
            long ValorRetorno = 0;
            try
            {
                AbrirConexion();
                ValorRetorno = Convert.ToInt64(comando.ExecuteScalar());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
            finally
            {
                CerrarConecion();
            }
            return ValorRetorno;
        }

        public void InicializarAdaptador()
        {
            try
            {
                adaptador = new SqlDataAdapter();
                adaptador.SelectCommand = comando;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
        public void PoblarDataset(ref DataSet oDataSet, string Nombre)
        {
            try
            {
                InicializarComando();
                InicializarAdaptador();
                adaptador.Fill(oDataSet, Nombre);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
            finally
            {
                comando.Dispose();
                comando = null;
                adaptador.Dispose();
                adaptador = null;
            }
        }
        public bool EjecutarProcedimiento()
        {
            bool ValorRetorno;
            try
            {
                AbrirConexion();
                ValorRetorno = Convert.ToBoolean(comando.ExecuteNonQuery());

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
            finally
            {
                CerrarConecion();
            }
            return ValorRetorno;
        }
    }
}