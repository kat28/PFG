using System;
using CapaNegocio;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inventario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //Toma la fecha actual.
        Comparevalidator1.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");
    }

    protected void Agregar_Click(object sender, EventArgs e)
    {
        try
        {
            if (IsValid)
            {
            InventarioN objInventario = new InventarioN();
            DataSet ds = objInventario.NuevoInventarioDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["NomActivo"] = txtNombre.Text;
            dr["Familia"] = Familia.SelectedValue;
            dr["Marca"] = txtMarca.Text;
            dr["FecAdquisicion"] = Convert.ToDateTime(FechaCompra.Value);
            dr["ValorOriginal"] = txtCosto.Text;
            dr["Cantidad"] = txtCant.Text;


            ds.Tables[0].Rows.Add(dr);
            objInventario.AgregarInventario(ds);

            Response.Redirect("Inventario.aspx");
            }
            else
            {
                Response.Write("<script> alert('Debe ingresar todos los campos ')</script>");
            }




        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void Modificar_Click(object sender, EventArgs e)
    {

    }

    protected void Actualizar_Click(object sender, EventArgs e)
    {

    }
}