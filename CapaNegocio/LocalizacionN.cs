using System;
using System.Collections.Generic;
using System.Text;
using CapaConexion;
using System.Data;

namespace CapaNegocio
{
    public class LocalizacionN
    {
        public LocalizacionC objLocalizacion;
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
            objLocalizacion.Dispose();
            objLocalizacion = null;
        }

        public LocalizacionN()
        {
            objLocalizacion = new LocalizacionC();
        }

        public DataSet Obtener_Canton_ID(string nId)
        {
            try
            {
                return objLocalizacion.ObtenerCantonID(nId);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet Obtener_Distrito_ID(string pId, string cId)
        {
            try
            {
                return objLocalizacion.ObtenerDistritoID(pId, cId);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public bool ModificarLocalizacion(DataSet ds)
        {
            try
            {
                return objLocalizacion.ModificarLocalizacion(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet NuevaDireccionDS()
        {
            DataSet dsLocalizacion = new DataSet();
            try
            {
                //Crear Datatable
                DataTable objDataTable = dsLocalizacion.Tables.Add("GLDireccion");

                //Crear DataColumn
                DataColumn objDataColumn;
                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdPersona");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("CodDireccion");
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

            }
            catch (Exception ExceptionErr)
            {
                throw new System.Exception(ExceptionErr.Message, ExceptionErr.InnerException);
            }
            return dsLocalizacion;
        }

        public DataSet Obtener_Localizacion(string pId, string dId)
        {
            try
            {
                return objLocalizacion.ObtenerLocalizacion(pId, dId);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }


    }
}
