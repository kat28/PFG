using System;
using System.Collections.Generic;
using System.Text;
using CapaConexion;
using System.Data;

namespace CapaNegocio
{
    public class ConvenioN
    {

        public ConvenioC objConvenio;
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
                objConvenio.Dispose();
                objConvenio = null;
            }
        }

        public ConvenioN()
        {
            objConvenio = new ConvenioC();
        }

        public bool AgregarConvenio(DataSet ds)
        {
            try
            {
                return objConvenio.AgregarConvenio(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet NuevoConvenioDS()
        {
            DataSet dsConvenio = new DataSet();

            try
            {
                //Crear Datatable
                DataTable objDataTable = dsConvenio.Tables.Add("Convenio");
                
                //Crear DataColumn
                DataColumn objDataColumn;

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodConvenio");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("NombreConvenio");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("FecInicio");
                objDataColumn.DataType = System.Type.GetType("System.DateTime");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("FecVence");
                objDataColumn.DataType = System.Type.GetType("System.DateTime");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Observaciones");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Porcentaje");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodEstado");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

            }
            catch (Exception ExceptionErr)
            {
                throw new System.Exception(ExceptionErr.Message, ExceptionErr.InnerException);
            }
            return dsConvenio;
        }

        public DataSet Obtener_Convenio_ID(string idC)
        {
            try
            {
                return objConvenio.ObtenerConvenioID(idC);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public bool ModificarConvenio(DataSet ds)
        {
            try
            {
                return objConvenio.ModificarConvenio(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

    }
}
