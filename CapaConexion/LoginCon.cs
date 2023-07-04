using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace CapaConexion
{
    public class LoginCon : Conexion
    {
        public LoginCon()
            : base()
        { }

        public new void Dispose()
        {
            base.Dispose();
        }

        public DataSet obtenerlogin()
        {
            DataSet ds = new DataSet();
            string Tabla = "GLogin";
            try
            {
                base.SQL = "sp_select_Login";
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public DataSet obtenerRol()
        {
            DataSet ds = new DataSet();
            string Tabla = "Persona";
            try
            {
                base.SQL = "sp_validar_rol";
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public long AgregarCredenciales(DataSet ds)
        {
            long valorRetorno = 0;
            try
            {
                base.SQL = "sp_Agregar_Credenciales";
                base.InicializarComando();
                base.AgregarParametro("@Usuario", ds.Tables[0].Rows[0]["Usuario"].ToString());
                base.AgregarParametro("@Con", ds.Tables[0].Rows[0]["Clave"].ToString());
                valorRetorno = base.EjecutarEscalar();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public bool ModificarLogin(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_ModificarLogin";
                base.InicializarComando();
                base.AgregarParametro("@IdLogin", ds.Tables[0].Rows[0]["IdLogin"].ToString());
                base.AgregarParametro("@IdPersona", ds.Tables[0].Rows[0]["IdPersona"].ToString());
                base.AgregarParametro("@Clave", ds.Tables[0].Rows[0]["Clave"].ToString());
                base.AgregarParametro("@Rol", ds.Tables[0].Rows[0]["IdRol"].ToString());


                valorRetorno = base.EjecutarProcedimiento();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }


    }
}