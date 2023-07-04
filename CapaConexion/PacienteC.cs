using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace CapaConexion
{
    public class PacienteC : Conexion
    {

        public PacienteC() : base() { }

        public new void Dispose()
        {
            base.Dispose();
        }

        public DataSet ObtenerPersonaExpedienteID(string idP)
        {
            DataSet ds = new DataSet();
            string Tabla = "Persona";
            try
            {
                base.SQL = "[sp_ObtenerPersonaExpediente]";
                base.InicializarComando();
                base.AgregarParametro("@ID_Persona", idP.ToString());
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public bool ModificarPaciente(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_ModificarPaciente";
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
                base.AgregarParametro("@CodConvenio", ds.Tables[0].Rows[0]["CodConvenio"].ToString());
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

        public DataSet obtenerPacienteR()
        {
            DataSet ds = new DataSet();
            string Tabla = "Persona";
            try
            {
                base.SQL = "sp_ObtenerPacienteFecha";
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public DataSet obtenerPacienteG()
        {
            DataSet ds = new DataSet();
            string Tabla = "Persona";
            try
            {
                base.SQL = "sp_ObtenerPacienteG";
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public DataSet obtenerPacienteC()
        {
            DataSet ds = new DataSet();
            string Tabla = "Persona";
            try
            {
                base.SQL = "sp_ObtenerPacienteConvenio";
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }


        public DataSet ObtenerPacienteMod(string idP)
        {
            DataSet ds = new DataSet();
            string Tabla = "Persona";
            try
            {
                base.SQL = "[sp_ObtenerPacientMod]";
                base.InicializarComando();
                base.AgregarParametro("@id", idP.ToString());
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public bool ModificarHistoriaClinica(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "sp_ModificarHistoriaClinica";
                base.InicializarComando();
                base.AgregarParametro("@ID_Persona", ds.Tables[0].Rows[0]["IdPersona"].ToString());
                base.AgregarParametro("@CodServicio", ds.Tables[0].Rows[0]["CodServicio"].ToString());
                valorRetorno = base.EjecutarProcedimiento();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }

            return valorRetorno;
        }



        public DataSet ObtenerHistoriaClinicaID(string idP)
        {
            DataSet ds = new DataSet();
            string Tabla = "EMHistoriaClinica";
            try
            {
                base.SQL = "[sp_ObtenerHistoriaClinicaID]";
                base.InicializarComando();
                base.AgregarParametro("@ID_Persona", idP.ToString());
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public DataSet ObtenerDetalleClinico(string idP, string idH)
        {
            DataSet ds = new DataSet();
            string Tabla = "EMDetalleClinico";
            try
            {
                base.SQL = "sp_ObtenerDetalleClínico";
                base.InicializarComando();
                base.AgregarParametro("@ID_HistoriaClinica", idH.ToString());
                base.AgregarParametro("@ID_Persona", idP.ToString());
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public DataSet ObtenerAntecedentesPersonales(string idP)
        {
            DataSet ds = new DataSet();
            string Tabla = "EMPaciente";
            try
            {
                base.SQL = "sp_ObtenerAntecedentesPersonales";
                base.InicializarComando();
                base.AgregarParametro("@ID_Persona", idP.ToString());
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public long AgregarPaciente(DataSet ds)
        {
            long valorRetorno = 0;
            try
            {
                base.SQL = "sp_AgregarPaciente";
                base.InicializarComando();
                base.AgregarParametro("@ID_Tipo_Cedula", ds.Tables[0].Rows[0]["CodTipoCedula"].ToString());
                base.AgregarParametro("@Cedula", ds.Tables[0].Rows[0]["NumCedula"].ToString());
                base.AgregarParametro("@ID_Genero", ds.Tables[0].Rows[0]["CodGenero"].ToString());
                base.AgregarParametro("@Nombre", ds.Tables[0].Rows[0]["NomPersona"].ToString());
                base.AgregarParametro("@Apellido1", ds.Tables[0].Rows[0]["PrimerApellido"].ToString());
                base.AgregarParametro("@Apellido2", ds.Tables[0].Rows[0]["SegundoApellido"].ToString());
                base.AgregarParametro("@Fecha", Convert.ToDateTime(ds.Tables[0].Rows[0]["FecNacimiento"].ToString()));
                base.AgregarParametro("@ID_EstadoCivil", ds.Tables[0].Rows[0]["CodEstadoCivil"].ToString());

                base.AgregarParametro("@CodConvenio", ds.Tables[0].Rows[0]["CodConvenio"].ToString());

                base.AgregarParametro("@ID_Provincia", ds.Tables[0].Rows[0]["CodProvincia"].ToString());
                base.AgregarParametro("@ID_Canton", ds.Tables[0].Rows[0]["CodCanton"].ToString());
                base.AgregarParametro("@ID_Distrito", ds.Tables[0].Rows[0]["CodDistrito"].ToString());
                base.AgregarParametro("@DireccionExacta", ds.Tables[0].Rows[0]["DireccionExacta"].ToString());

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

        public long AgregarHistoriaClinica(DataSet ds)
        {
            long valorRetorno = 0;
            try
            {
                base.SQL = "sp_AgregarHistoriaClinica";
                base.InicializarComando();
                base.AgregarParametro("@ID_Paciente", ds.Tables[0].Rows[0]["IdPaciente"].ToString());
                base.AgregarParametro("@Fecha", Convert.ToDateTime( ds.Tables[0].Rows[0]["FecConsulta"].ToString()));
                base.AgregarParametro("@ID_Empleado", ds.Tables[0].Rows[0]["IdEmpleado"].ToString());
                base.AgregarParametro("@CodServicio", ds.Tables[0].Rows[0]["CodServicio"].ToString());
                base.AgregarParametro("@ID_Cita", ds.Tables[0].Rows[0]["IdCitaMedica"].ToString());
                valorRetorno = base.EjecutarEscalar();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public long AgregarSignosVitales(DataSet ds)
        {
            long valorRetorno = 0;
            try
            {
                base.SQL = "sp_AgregarSignosVitales";
                base.InicializarComando();
                base.AgregarParametro("@ID_Paciente", ds.Tables[0].Rows[0]["IdPaciente"].ToString());
                base.AgregarParametro("@ID_Historia", ds.Tables[0].Rows[0]["IdHistoriaClinica"].ToString());
                base.AgregarParametro("@Peso", Double.Parse( ds.Tables[0].Rows[0]["Peso"].ToString()));
                base.AgregarParametro("@Talla", ds.Tables[0].Rows[0]["Talla"].ToString());
                base.AgregarParametro("@Temp",Double.Parse(ds.Tables[0].Rows[0]["Temperatura"].ToString()));
                base.AgregarParametro("@PA", ds.Tables[0].Rows[0]["PresionArterial"].ToString());
                base.AgregarParametro("@SO", ds.Tables[0].Rows[0]["SaturacionOxigeno"].ToString());
                base.AgregarParametro("@FC", ds.Tables[0].Rows[0]["FrecuenciaCardiaca"].ToString());
                base.AgregarParametro("@FR", ds.Tables[0].Rows[0]["FrecuenciaRespiratoria"].ToString());

                valorRetorno = base.EjecutarEscalar();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public long AgregarDetalleClinico(DataSet ds)
        {
            long valorRetorno = 0;
            try
            {
                base.SQL = "sp_AgregarDetalleClinico";
                base.InicializarComando();
                base.AgregarParametro("@ID_Paciente", ds.Tables[0].Rows[0]["IdPaciente"].ToString());
                base.AgregarParametro("@ID_Historia", ds.Tables[0].Rows[0]["IdHistoriaClinica"].ToString());
                base.AgregarParametro("@Motivo", ds.Tables[0].Rows[0]["MotivoConsulta"].ToString());
                base.AgregarParametro("@Examen", ds.Tables[0].Rows[0]["ExamenFisico"].ToString());
                base.AgregarParametro("@Analisis", ds.Tables[0].Rows[0]["Analisis"].ToString());
                base.AgregarParametro("@Diagnos", ds.Tables[0].Rows[0]["Diagnostico"].ToString());
                base.AgregarParametro("@Trata", ds.Tables[0].Rows[0]["Tratamiento"].ToString());
                base.AgregarParametro("@Segui", ds.Tables[0].Rows[0]["Seguimiento"].ToString());

                valorRetorno = base.EjecutarEscalar();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }


        public long AgregarAntecedentes(DataSet ds)
        {
            long valorRetorno = 0;
            try
            {
                base.SQL = "sp_AgregarAntecedentes";
                base.InicializarComando();
                base.AgregarParametro("@ID_Persona", ds.Tables[0].Rows[0]["IdPersona"].ToString());
                base.AgregarParametro("@APato", ds.Tables[0].Rows[0]["AntPatologicos"].ToString());
                base.AgregarParametro("@ANPato", ds.Tables[0].Rows[0]["AntNoPatologicos"].ToString());
                base.AgregarParametro("@Alergias", ds.Tables[0].Rows[0]["Alergias"].ToString());
                base.AgregarParametro("@Toxico", ds.Tables[0].Rows[0]["Toxicomanias"].ToString());
                base.AgregarParametro("@AQuir", ds.Tables[0].Rows[0]["AntQuirurgicos"].ToString());
                base.AgregarParametro("@ATrau", ds.Tables[0].Rows[0]["AntTraumaticos"].ToString());
                base.AgregarParametro("@AGine", ds.Tables[0].Rows[0]["AntGinecoObstetricos"].ToString());
                base.AgregarParametro("@Obser", ds.Tables[0].Rows[0]["Observaciones"].ToString());

                valorRetorno = base.EjecutarEscalar();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }




    }
}
