using System;
using System.Collections.Generic;
using System.Text;
using CapaConexion;
using System.Data;
using System.Data.SqlClient;

namespace CapaNegocio
{
    public class EmpleadoN
    {
        public EmpleadoC objEmpleado;
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
                objEmpleado.Dispose();
                objEmpleado = null;
            }
        }

        public EmpleadoN()
        {
            objEmpleado = new EmpleadoC();
        }

        public long AgregarEmpleado(DataSet ds)
        {
            try
            {
                return objEmpleado.AgregarEmpleado(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet nuevoEmpleadoDS()
        {
            DataSet dsEmpleado = new DataSet();
            try
            {
                //Crear Datatable
                DataTable objDataTable = dsEmpleado.Tables.Add("Persona");

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

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodPuesto");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
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

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdRol");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
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
            return dsEmpleado;
        }


        public bool ModificarEmpleado(DataSet ds)
        {
            try
            {
                return objEmpleado.ModificarEmpleado(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet obtenerEmpleado()
        {
            try
            {
                return objEmpleado.obtenerEmpleado();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }


        public DataSet ObtenerMod_Empleado_ID(string pId, string dId)
        {
            try
            {
                return objEmpleado.ObtenerModEmpleadoID(pId, dId);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }


    }

}
