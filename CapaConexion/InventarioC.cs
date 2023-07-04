using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CapaConexion
{
    public class InventarioC : Conexion
    {
        public InventarioC()
            : base()
        {

        }

        public new void Dispose()
        {
            base.Dispose();
        }

        public bool AgregarInventario(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_AgregarInventario";
                base.InicializarComando();
                base.AgregarParametro("@Nombre", ds.Tables[0].Rows[0]["NomActivo"].ToString());
                base.AgregarParametro("@Familia", Convert.ToInt16( ds.Tables[0].Rows[0]["Familia"].ToString()));
                base.AgregarParametro("@Marca", ds.Tables[0].Rows[0]["Marca"].ToString());
                base.AgregarParametro("@FecAdqui", Convert.ToDateTime(ds.Tables[0].Rows[0]["FecAdquisicion"].ToString()));
                base.AgregarParametro("@Valor", Convert.ToDouble( ds.Tables[0].Rows[0]["ValorOriginal"].ToString()));
                base.AgregarParametro("@Cant", Convert.ToInt64(ds.Tables[0].Rows[0]["Cantidad"].ToString()));
                valorRetorno = base.EjecutarProcedimiento();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public bool ModificarInventario(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_ModificarInventario";
                base.InicializarComando();
                base.AgregarParametro("@ID_Activo", ds.Tables[0].Rows[0]["IdActivo"].ToString());
                base.AgregarParametro("@Nombre", ds.Tables[0].Rows[0]["NomActivo"].ToString());
                base.AgregarParametro("@Cant", ds.Tables[0].Rows[0]["Cantidad"].ToString());
                base.AgregarParametro("@Familia", ds.Tables[0].Rows[0]["Familia"].ToString());
                base.AgregarParametro("@Marca", ds.Tables[0].Rows[0]["Marca"].ToString());
                base.AgregarParametro("@Valor", ds.Tables[0].Rows[0]["ValorOriginal"].ToString());
                base.AgregarParametro("@Estado", ds.Tables[0].Rows[0]["CodEstado"].ToString());
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
