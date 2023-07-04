using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CapaConexion
{
    public class FacturaC : Conexion
    {
        public FacturaC()
            : base()
        {

        }

        public new void Dispose()
        {
            base.Dispose();
        }

        public bool AgregarFactura(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_AgregarFactura";
                base.InicializarComando();
                base.AgregarParametro("@IDPaciente", ds.Tables[0].Rows[0]["IdPaciente"].ToString());
                base.AgregarParametro("@Fecha", Convert.ToDateTime(ds.Tables[0].Rows[0]["Fecha"].ToString()));
                base.AgregarParametro("@EstadoFactura", ds.Tables[0].Rows[0]["CodEstadoFactura"].ToString());
                base.AgregarParametro("@IDCita", ds.Tables[0].Rows[0]["IdCitaMedica"].ToString());
                base.AgregarParametro("@IDEmpleado", ds.Tables[0].Rows[0]["IdEmpleado"].ToString());
                valorRetorno = base.EjecutarProcedimiento();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public bool ModificarModoPago(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_ModificarPagoFactura";
                base.InicializarComando();
                base.AgregarParametro("@idFactura", ds.Tables[0].Rows[0]["CodFactura"].ToString());
                base.AgregarParametro("@pago", ds.Tables[0].Rows[0]["CodModoPago"].ToString());
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
