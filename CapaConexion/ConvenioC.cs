using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CapaConexion
{
    public class ConvenioC : Conexion
    {
        public ConvenioC()
            : base()
        {

        }

        public new void Dispose()
        {
            base.Dispose();
        }

         public bool AgregarConvenio(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_AgregarConvenio";
                base.InicializarComando();
                base.AgregarParametro("@Nombre", ds.Tables[0].Rows[0]["NombreConvenio"].ToString());
                base.AgregarParametro("@FecIni", Convert.ToDateTime(ds.Tables[0].Rows[0]["FecInicio"].ToString()));
                base.AgregarParametro("@FecVen", Convert.ToDateTime(ds.Tables[0].Rows[0]["FecVence"].ToString()));
                base.AgregarParametro("@Obser", ds.Tables[0].Rows[0]["Observaciones"].ToString());
                base.AgregarParametro("@Porcentaje", ds.Tables[0].Rows[0]["Porcentaje"].ToString());
                valorRetorno = base.EjecutarProcedimiento();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public DataSet ObtenerConvenioID(string idC)
        {
            DataSet ds = new DataSet();
            string Tabla = "Convenio";
            try
            {
                base.SQL = "sp_ObtenerConvenioID";
                base.InicializarComando();
                base.AgregarParametro("@ID_Convenio", idC);
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public bool ModificarConvenio(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "[sp_ModificarConvenio]";
                base.InicializarComando();
                base.AgregarParametro("@ID_Convenio", ds.Tables[0].Rows[0]["CodConvenio"].ToString());
                base.AgregarParametro("@NombreConvenio", ds.Tables[0].Rows[0]["NombreConvenio"].ToString());
                base.AgregarParametro("@FecIni", Convert.ToDateTime( ds.Tables[0].Rows[0]["FecInicio"].ToString()));
                base.AgregarParametro("@FecVence", Convert.ToDateTime( ds.Tables[0].Rows[0]["FecVence"].ToString()));
                base.AgregarParametro("@Observaciones", ds.Tables[0].Rows[0]["Observaciones"].ToString());
                base.AgregarParametro("@Porcentaje", ds.Tables[0].Rows[0]["Porcentaje"].ToString());
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

