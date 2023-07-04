using System;
using System.Collections.Generic;
using System.Text;
using CapaConexion;
using System.Data;

namespace CapaNegocio
{
    public class InventarioN
    {
        public InventarioC objInventario;
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
                objInventario.Dispose();
                objInventario = null;
            }
        }

        public InventarioN()
        {
            objInventario = new InventarioC();
        }

        public bool AgregarInventario(DataSet ds)
        {
            try
            {
                return objInventario.AgregarInventario(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public bool ModificarInventario(DataSet ds)
        {
            try
            {
                return objInventario.ModificarInventario(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet NuevoInventarioDS()
        {
            DataSet dsInventario = new DataSet();

            try
            {
                //Crear Datatable
                DataTable objDataTable = dsInventario.Tables.Add("IAControlActivos");

                //Crear DataColumn
                DataColumn objDataColumn;

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdActivo");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("NomActivo");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Familia");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Marca");
                objDataColumn.DataType = System.Type.GetType("System.String");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("FecAdquisicion");
                objDataColumn.DataType = System.Type.GetType("System.DateTime");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("ValorOriginal");
                objDataColumn.DataType = System.Type.GetType("System.Double");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Cantidad");
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
            return dsInventario;
        }

    }
}
