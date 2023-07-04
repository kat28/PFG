using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace CapaConexion
{
   public class EmpleadoC : Conexion
    {
        public EmpleadoC()         
            :base()
        {
        }
        public new void Dispose()
        {
            base.Dispose();
        }


        public long AgregarEmpleado(DataSet ds)
        {
            long valorRetorno = 0;
            try
            {
                base.SQL = "sp_AgregarEmpleado";
                base.InicializarComando();
                base.AgregarParametro("@ID_Tipo_Cedula", ds.Tables[0].Rows[0]["CodTipoCedula"].ToString());
                base.AgregarParametro("@Cedula", ds.Tables[0].Rows[0]["NumCedula"].ToString());
                base.AgregarParametro("@ID_Genero", ds.Tables[0].Rows[0]["CodGenero"].ToString());
                base.AgregarParametro("@Nombre", ds.Tables[0].Rows[0]["NomPersona"].ToString());
                base.AgregarParametro("@Apellido1", ds.Tables[0].Rows[0]["PrimerApellido"].ToString());
                base.AgregarParametro("@Apellido2", ds.Tables[0].Rows[0]["SegundoApellido"].ToString());
                base.AgregarParametro("@Fecha", Convert.ToDateTime( ds.Tables[0].Rows[0]["FecNacimiento"].ToString()));
                base.AgregarParametro("@ID_EstadoCivil", ds.Tables[0].Rows[0]["CodEstadoCivil"].ToString());
                base.AgregarParametro("@ID_Puesto", ds.Tables[0].Rows[0]["CodPuesto"].ToString());
                base.AgregarParametro("@CodMedico", ds.Tables[0].Rows[0]["CodMedico"].ToString());
                base.AgregarParametro("@ID_Provincia", ds.Tables[0].Rows[0]["CodProvincia"].ToString());
                base.AgregarParametro("@ID_Canton", ds.Tables[0].Rows[0]["CodCanton"].ToString());
                base.AgregarParametro("@ID_Distrito", ds.Tables[0].Rows[0]["CodDistrito"].ToString());
                base.AgregarParametro("@DireccionExacta", ds.Tables[0].Rows[0]["DireccionExacta"].ToString());
                base.AgregarParametro("@Rol", ds.Tables[0].Rows[0]["IdRol"].ToString());
                base.AgregarParametro("@TipoTel", ds.Tables[0].Rows[0]["CodTelefono"].ToString());
                base.AgregarParametro("@NumTelefono", ds.Tables[0].Rows[0]["NumTelefono"].ToString());

                base.AgregarParametro("@TipoCorreo", ds.Tables[0].Rows[0]["CodCorreo"].ToString());
                base.AgregarParametro("@Correo", ds.Tables[0].Rows[0]["CorreoElectronico"].ToString());
                valorRetorno = base.EjecutarEscalar();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

            public DataSet obtenerEmpleado()
            {
                DataSet ds = new DataSet();
                string Tabla = "Persona";
                try
                {
                    base.SQL = "sp_ObtenerEmpleado";
                    base.PoblarDataset(ref ds, Tabla);
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message, e.InnerException);
                }
                return ds;
            }

        public DataSet ObtenerEmpleadoID(string cWhere)
        {
            DataSet ds = new DataSet();
            string Tabla = "Persona";
            try
            {
                base.SQL = "sp_ObtenerEmpleadoID";
                base.InicializarComando();
                base.AgregarParametro("@Where", cWhere.ToString());
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public DataSet ObtenerModEmpleadoID(string pWhere, string cWhere)
        {
            DataSet ds = new DataSet();
            string Tabla = "Persona";
            try
            {
                base.SQL = "sp_ObtenerModEmpleadoID";
                base.InicializarComando();
                base.AgregarParametro("@IdPersona", pWhere);
                base.AgregarParametro("@IdDireccion", cWhere);
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }



        public bool ModificarEmpleado(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_ModificarEmpleado";
                base.InicializarComando();
                base.AgregarParametro("@ID_Persona", ds.Tables[0].Rows[0]["IdPersona"].ToString());
                base.AgregarParametro("@ID_Tipo_Cedula", ds.Tables[0].Rows[0]["CodTipoCedula"].ToString());
                base.AgregarParametro("@Cedula", ds.Tables[0].Rows[0]["NumCedula"].ToString());
                base.AgregarParametro("@ID_Genero", ds.Tables[0].Rows[0]["CodGenero"].ToString());
                base.AgregarParametro("@Nombre", ds.Tables[0].Rows[0]["NomPersona"].ToString());
                base.AgregarParametro("@Apellido1", ds.Tables[0].Rows[0]["PrimerApellido"].ToString());
                base.AgregarParametro("@Apellido2", ds.Tables[0].Rows[0]["SegundoApellido"].ToString());
                base.AgregarParametro("@Fecha", Convert.ToDateTime(ds.Tables[0].Rows[0]["FecNacimiento"].ToString()));
                base.AgregarParametro("@ID_EstadoCivil", ds.Tables[0].Rows[0]["CodEstadoCivil"].ToString());
                base.AgregarParametro("@ID_Puesto", ds.Tables[0].Rows[0]["CodPuesto"].ToString());
                base.AgregarParametro("@CodMedico", ds.Tables[0].Rows[0]["CodMedico"].ToString());
                base.AgregarParametro("@TipoTel", ds.Tables[0].Rows[0]["CodTelefono"].ToString());
                base.AgregarParametro("@NumTelefono", ds.Tables[0].Rows[0]["NumTelefono"].ToString());

                base.AgregarParametro("@TipoCorreo", ds.Tables[0].Rows[0]["CodCorreo"].ToString());
                base.AgregarParametro("@Correo", ds.Tables[0].Rows[0]["CorreoElectronico"].ToString());
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
