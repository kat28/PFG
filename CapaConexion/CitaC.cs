using System;
using System.Data;
using System.Collections.Generic;
using System.Text;

namespace CapaConexion
{
    public class CitaC : Conexion
    {
        public CitaC()
            :base()
        {

        }

        public new void Dispose()
        {
            base.Dispose();
        }

        public DataSet ValidarHoras(string idC, DateTime idP)
        {
            DataSet ds = new DataSet();
            string Tabla = "CitaMedica";
            try
            {
                base.SQL = "sp_ValidarHorasCitas";
                base.InicializarComando();
                base.AgregarParametro("@CodMedica", idC);
                base.AgregarParametro("@Fecha", idP);
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public bool AgregarCita(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_AgregarCita";
                base.InicializarComando();
                base.AgregarParametro("@FecCita", Convert.ToDateTime( ds.Tables[0].Rows[0]["FecCita"].ToString()));
                base.AgregarParametro("@HoraCita",  ds.Tables[0].Rows[0]["HoraCita"].ToString());
                base.AgregarParametro("@CodMedico", ds.Tables[0].Rows[0]["CodMedico"].ToString());
                base.AgregarParametro("@IdPaciente", ds.Tables[0].Rows[0]["IdPaciente"].ToString());
                base.AgregarParametro("@CodServicio", ds.Tables[0].Rows[0]["CodServicio"].ToString());
                valorRetorno = base.EjecutarProcedimiento();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public bool ModificarCita(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_ModificarCitas";
                base.InicializarComando();
                base.AgregarParametro("@IdCita", ds.Tables[0].Rows[0]["IdCitaMedica"].ToString());
                base.AgregarParametro("@hora", ds.Tables[0].Rows[0]["HoraCita"].ToString());
                base.AgregarParametro("@idMedico", ds.Tables[0].Rows[0]["CodMedico"].ToString());
                base.AgregarParametro("@IdPaciente", ds.Tables[0].Rows[0]["IdPaciente"].ToString());
                base.AgregarParametro("@servicio", ds.Tables[0].Rows[0]["CodServicio"].ToString());
                valorRetorno = base.EjecutarProcedimiento();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public bool CancelarCita(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_CancelarCitas";
                base.InicializarComando();
                base.AgregarParametro("@IdCita", ds.Tables[0].Rows[0]["IdCitaMedica"].ToString());
                base.AgregarParametro("@IdPaciente", ds.Tables[0].Rows[0]["IdPaciente"].ToString());
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
