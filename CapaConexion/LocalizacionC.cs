using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace CapaConexion
{
    public class LocalizacionC : Conexion
    {
        public LocalizacionC()
            :base()
        {

        }
        public new void Dispose()
        {
            base.Dispose();
        }

        public DataSet ObtenerCantonID(string cWhere)
        {
            DataSet ds = new DataSet();
            string Tabla = "GLCanton";
            try
            {
                base.SQL = "sp_ObtenerCanton";
                base.InicializarComando();
                base.AgregarParametro("@IdProvincia", cWhere);
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public DataSet ObtenerDistritoID(string pWhere, string cWhere)
        {
            DataSet ds = new DataSet();
            string Tabla = "GLDistrito";
            try
            {
                base.SQL = "sp_ObtenerDistrito";
                base.InicializarComando();
                base.AgregarParametro("@IdProvincia", pWhere);
                base.AgregarParametro("@IdCanton", cWhere);
                base.PoblarDataset(ref ds, Tabla);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return ds;
        }

        public bool ModificarLocalizacion(DataSet ds)
        {
            bool valorRetorno = false;
            try
            {
                base.SQL = "[sp_ModificarLocalizacion]";
                base.InicializarComando();
                base.AgregarParametro("@ID_Persona", ds.Tables[0].Rows[0]["IdPersona"].ToString());
                base.AgregarParametro("@ID_Provincia", ds.Tables[0].Rows[0]["CodProvincia"].ToString());
                base.AgregarParametro("@ID_Canton", ds.Tables[0].Rows[0]["CodCanton"].ToString());
                base.AgregarParametro("@ID_Distrito", ds.Tables[0].Rows[0]["CodDistrito"].ToString());
                base.AgregarParametro("@DireccionExacta", ds.Tables[0].Rows[0]["DireccionExacta"].ToString());
                valorRetorno = base.EjecutarProcedimiento();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e.InnerException);
            }
            return valorRetorno;
        }

        public DataSet ObtenerLocalizacion(string pWhere, string dWhere)
        {
            DataSet ds = new DataSet();
            string Tabla = "GLDireccion";
            try
            {
                base.SQL = "sp_ObtenerLocalizacion";
                base.InicializarComando();
                base.AgregarParametro("@ID_Persona", pWhere);
                base.AgregarParametro("@ID_Direccion", dWhere);
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
