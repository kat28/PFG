using CapaConexion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace CapaNegocio
{
    public class PlanillaN
    {
        public PlanillaC objPlanilla;
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
                objPlanilla.Dispose();
                objPlanilla = null;
            }

        }

        public PlanillaN()
        {
            objPlanilla = new PlanillaC();
        }

        public bool ModificarConvenio(DataSet ds)
        {
            try
            {
                return objPlanilla.ModificarPlanilla(ds);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet obtenerPlanilla()
        {
            try
            {
                return objPlanilla.obtenerPlanilla();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet GenerarPlanilla()
        {
            try
            {
                return objPlanilla.GenerarPlanilla();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
        }

        public DataSet NuevaPlanillaDS()
        {
            DataSet dsConvenio = new DataSet();

            try
            {
                //Crear Datatable
                DataTable objDataTable = dsConvenio.Tables.Add("PLPagoPlanilla");

                //Crear DataColumn
                DataColumn objDataColumn;

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("IdPagoPlanilla");
                objDataColumn.DataType = System.Type.GetType("System.Int32");
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
                objDataColumn = new DataColumn("SalarioBruto");
                objDataColumn.DataType = System.Type.GetType("System.Double");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("SalarioNeto");
                objDataColumn.DataType = System.Type.GetType("System.Double");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("HorasExtra");
                objDataColumn.DataType = System.Type.GetType("System.Double");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Incentivos");
                objDataColumn.DataType = System.Type.GetType("System.Double");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Renta");
                objDataColumn.DataType = System.Type.GetType("System.Double");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("SeguroSocial");
                objDataColumn.DataType = System.Type.GetType("System.Double");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Adelanto");
                objDataColumn.DataType = System.Type.GetType("System.Double");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("Embargo");
                objDataColumn.DataType = System.Type.GetType("System.Double");
                objDataColumn.AllowDBNull = true;
                //Agregar columna a la tabla
                objDataTable.Columns.Add(objDataColumn);

                //Instanciar un nuevo DataColumn y asignar propiedades
                objDataColumn = new DataColumn("NombreCompleto");
                objDataColumn.DataType = System.Type.GetType("System.String");
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



    }
}
