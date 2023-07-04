using System;
using System.Collections.Generic;
using System.Text;
using CapaConexion;
using System.Data.SqlClient;
using System.Data;

namespace CapaNegocio
{
    public class CitaN
    {
        public CitaC objCita;
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
                objCita.Dispose();
                objCita = null;
            }
        }

        public CitaN()
        {
            objCita = new CitaC();
        }

        public DataSet Validar_Horas(string idC, DateTime idP)
        {
            try
            {
                return objCita.ValidarHoras(idC, idP);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public static bool AutenticarCitas(int IdMedico, DateTime FecCita, TimeSpan HoraCita )
        {
            bool bResult = true;

            try
            {
                using (SqlConnection con = Conexion.cn())
                {
                    SqlCommand comd = new SqlCommand("SELECT * FROM CitaMedica where CodMedico=@id and FecCita=@fecha and HoraCita=@hora", con);
                    comd.Parameters.AddWithValue("@id", IdMedico); 
                    comd.Parameters.AddWithValue("@fecha", FecCita);
                    comd.Parameters.AddWithValue("@hora", HoraCita);
                    con.Open();

                    SqlDataReader rd = comd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        //bResult = true;
                        bResult = true;
                    }
                    else
                    {
                        //bResult = false;
                        bResult = false;
                    }
                    rd.Close();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return bResult;
        }

        public bool AgregarCita(DataSet ds)
        {
            try
            {
                return objCita.AgregarCita(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public bool ModificarCitar(DataSet ds)
        {
            try
            {
                return objCita.ModificarCita(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public bool CancelarCita(DataSet ds)
        {
            try
            {
                return objCita.CancelarCita(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet NuevaCitaDS()
        {
            DataSet dsCita = new DataSet();

            try
            {
                //Crear Datatable
                DataTable objDataTable = dsCita.Tables.Add("CitaMedica");

                //Crear DataColumn
                DataColumn objDataColumn;

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdCitaMedica");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("FecCita");
                objDataColumn.DataType = System.Type.GetType("System.DateTime");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("HoraCita");
                objDataColumn.DataType = System.Type.GetType("System.TimeSpan");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodMedico");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

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
            return dsCita;
        }


    }
}
