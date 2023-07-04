using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CapaConexion
{
    public class PlanillaC : Conexion
    {
        public PlanillaC()
            :base()
        {

        }

        public new void Dispose()
        {
            base.Dispose();
        }

        public bool ModificarPlanilla(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "[sp_ActualizarPlanilla]";
                base.InicializarComando();
                base.AgregarParametro("@IdPagoPlanilla", ds.Tables[0].Rows[0]["IdPagoPlanilla"].ToString());
                base.AgregarParametro("@IdEmpleado", ds.Tables[0].Rows[0]["IdEmpleado"].ToString());
                base.AgregarParametro("@Nombre_Completo", ds.Tables[0].Rows[0]["NombreCompleto"].ToString());
                base.AgregarParametro("@Salario_Bruto", Double.Parse( ds.Tables[0].Rows[0]["SalarioBruto"].ToString()));
                base.AgregarParametro("@Horas_Extra", Double.Parse(ds.Tables[0].Rows[0]["HorasExtra"].ToString()));
                base.AgregarParametro("@Incentivos", Double.Parse(ds.Tables[0].Rows[0]["Incentivos"].ToString()));
                base.AgregarParametro("@Adelanto", Double.Parse(ds.Tables[0].Rows[0]["Adelanto"].ToString()));
                base.AgregarParametro("@Renta", Double.Parse(ds.Tables[0].Rows[0]["Renta"].ToString()));
                base.AgregarParametro("@Seguro_Social", Double.Parse(ds.Tables[0].Rows[0]["SeguroSocial"].ToString()));
                base.AgregarParametro("@Embargo", Double.Parse(ds.Tables[0].Rows[0]["Embargo"].ToString()));
                base.AgregarParametro("@Salario_Neto", Double.Parse(ds.Tables[0].Rows[0]["SalarioNeto"].ToString()));
                valorRetorno = base.EjecutarProcedimiento();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public DataSet obtenerPlanilla()
        {
            DataSet ds = new DataSet();
            string Tabla = "PLPagoPlanilla";
            try
            {
                base.SQL = "sp_ObtenerPlanilla";
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public DataSet GenerarPlanilla()
        {
            DataSet ds = new DataSet();
            string Tabla = "PLPagoPlanilla";
            try
            {
                base.SQL = "sp_agregarPlanilla";
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }



    }
}
