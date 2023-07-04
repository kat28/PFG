using System;
using System.Collections.Generic;
using System.Text;
using CapaConexion;
using System.Data;

namespace CapaNegocio
{
    public class PacienteN
    {

        public PacienteC objPacienteC;
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
                objPacienteC.Dispose();
                objPacienteC = null;
            }
        }

        public PacienteN()
        {
            objPacienteC = new PacienteC();
        }

        public DataSet obtenerPacienteR()
        {
            try
            {
                return objPacienteC.obtenerPacienteR();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet obtenerPacienteG()
        {
            try
            {
                return objPacienteC.obtenerPacienteG();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet obtenerPacienteC()
        {
            try
            {
                return objPacienteC.obtenerPacienteC();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet Obtener_PersonaExpediente_ID(string idP)
        {
            try
            {
                return objPacienteC.ObtenerPersonaExpedienteID(idP);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet Obtener_HistoriaClinica_ID(string idP)
        {
            try
            {
                return objPacienteC.ObtenerHistoriaClinicaID(idP);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet Obtener_DetalleClinico_ID(string idP, string idH)
        {
            try
            {
                return objPacienteC.ObtenerDetalleClinico(idP, idH);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet Obtener_AntecedentesPersonales_ID(string idP)
        {
            try
            {
                return objPacienteC.ObtenerAntecedentesPersonales(idP);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }
        
        public DataSet Obtener_Paciente_Mod(string idP)
        {
            try
            {
                return objPacienteC.ObtenerPacienteMod(idP);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public long AgregarPaciente(DataSet ds)
        {
            try
            {
                return objPacienteC.AgregarPaciente(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public long AgregarHistoriaClinica(DataSet ds)
        {
            try
            {
                return objPacienteC.AgregarHistoriaClinica(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public long AgregarSignosVitales(DataSet ds)
        {
            try
            {
                return objPacienteC.AgregarSignosVitales(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public long AgregarDetalleClinico(DataSet ds)
        {
            try
            {
                return objPacienteC.AgregarDetalleClinico(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public long AgregarAntecedentes(DataSet ds)
        {
            try
            {
                return objPacienteC.AgregarAntecedentes(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public bool ModificarHistoria(DataSet ds)
        {
            try
            {
                return objPacienteC.ModificarHistoriaClinica(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public bool ModificarPaciente(DataSet ds)
        {
            try
            {
                return objPacienteC.ModificarPaciente(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }


        #region DataSet 

        public DataSet NuevoPacienteDS()
        {
            DataSet dsPaciente= new DataSet();
            try
            {
                //Crear Datatable
                DataTable objDataTable = dsPaciente.Tables.Add("Persona");

                //Crear DataColumn
                DataColumn objDataColumn;
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdPersona");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("NumCedula");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("NomPersona");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("PrimerApellido");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("SegundoApellido");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("FecNacimiento");
                objDataColumn.DataType = System.Type.GetType("System.DateTime");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodGenero");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodTipoCedula");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodEstadoCivil");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Tabla.Paciente
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodConvenio");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Tabla.Dirección
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodProvincia");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodCanton");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodDistrito");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("DireccionExacta");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Tabla.Correo
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodCorreo");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CorreoElectronico");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Tabla.Telefono
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodTelefono");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("NumTelefono");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

            }
            catch (Exception ExceptionErr)
            {
                throw new System.Exception(ExceptionErr.Message, ExceptionErr.InnerException);
            }
            return dsPaciente;
        }



        public DataSet NuevaHistoriaClinicaDS()
        {
            DataSet dsPaciente = new DataSet();
            try
            {
                //Crear Datatable
                DataTable objDataTable = dsPaciente.Tables.Add("EMHistoriaClinica");

                //Crear DataColumn
                DataColumn objDataColumn;
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdPaciente");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("FecConsulta");
                objDataColumn.DataType = System.Type.GetType("System.DateTime");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdEmpleado");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodServicio");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);
                
                                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdCitaMedica");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);
            }
            catch (Exception ExceptionErr)
            {
                throw new System.Exception(ExceptionErr.Message, ExceptionErr.InnerException);
            }
            return dsPaciente;
        }

        public DataSet NuevoSignosVitalesDS()
        {
            DataSet dsPaciente = new DataSet();
            try
            {
                //Crear Datatable
                DataTable objDataTable = dsPaciente.Tables.Add("EMDetalleClinico");

                //Crear DataColumn
                DataColumn objDataColumn;
                
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdPaciente");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdHistoriaClinica");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Peso");
                objDataColumn.DataType = System.Type.GetType("System.Decimal");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Talla");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Temperatura");
                objDataColumn.DataType = System.Type.GetType("System.Decimal");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("FrecuenciaRespiratoria");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("SaturacionOxigeno");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("FrecuenciaCardiaca");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("PresionArterial");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

            }
            catch (Exception ExceptionErr)
            {
                throw new System.Exception(ExceptionErr.Message, ExceptionErr.InnerException);
            }
            return dsPaciente;
        }

        public DataSet NuevoDetalleClinicoDS()
        {
            DataSet dsPaciente = new DataSet();
            try
            {
                //Crear Datatable
                DataTable objDataTable = dsPaciente.Tables.Add("EMDetalleClinico");

                //Crear DataColumn
                DataColumn objDataColumn;

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdPaciente");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdHistoriaClinica");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("MotivoConsulta");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("ExamenFisico");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Analisis");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Diagnostico");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Tratamiento");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Seguimiento");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

            }
            catch (Exception ExceptionErr)
            {
                throw new System.Exception(ExceptionErr.Message, ExceptionErr.InnerException);
            }
            return dsPaciente;
        }


        public DataSet NuevoAntecedentesDS()
        {
            DataSet dsPaciente = new DataSet();
            try
            {
                //Crear Datatable
                DataTable objDataTable = dsPaciente.Tables.Add("EMPersona");

                //Crear DataColumn
                DataColumn objDataColumn;

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdPersona");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("AntPatologicos");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("AntNoPatologicos");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Alergias");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Toxicomanias");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("AntQuirurgicos");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("AntTraumaticos");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("AntGinecoObstetricos");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Observaciones");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

            }
            catch (Exception ExceptionErr)
            {
                throw new System.Exception(ExceptionErr.Message, ExceptionErr.InnerException);
            }
            return dsPaciente;
        }

        public DataSet NuevoModificarHistoriaClinicaDS()
        {
            DataSet dsPaciente = new DataSet();
            try
            {
                //Crear Datatable
                DataTable objDataTable = dsPaciente.Tables.Add("EMHistoriaClinica");

                //Crear DataColumn
                DataColumn objDataColumn;
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdPaciente");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodServicio");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

            }
            catch (Exception ExceptionErr)
            {
                throw new System.Exception(ExceptionErr.Message, ExceptionErr.InnerException);
            }
            return dsPaciente;
        }

        #endregion

    }
}
