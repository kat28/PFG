using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaNegocio;
using System.Data;

public partial class Convenios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Agregar_Click(object sender, EventArgs e)
    {
        try
        {

    
                ConvenioN objConvenio = new ConvenioN();
                DataSet ds = objConvenio.NuevoConvenioDS();
                DataRow dr = ds.Tables[0].NewRow();

                dr["NombreConvenio"] = txtNombre.Text;
                dr["FecInicio"] = startDate.Value;
                dr["FecVence"] = endDate.Value;
                dr["Observaciones"] = txtObs.Text;
                dr["Porcentaje"] = txtP.Text;

                ds.Tables[0].Rows.Add(dr);
                objConvenio.AgregarConvenio(ds);

                Response.Redirect("Convenios.aspx");

            }
            catch (Exception)
            {

                throw;
            }
    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        mjsPagina.Text = "Mostrando Página " + (GridView1.PageIndex + 1).ToString()
            + " de " + GridView1.PageCount.ToString();
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        GridView1.Rows[0].Visible = false;
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void Modificar_Click(object sender, EventArgs e)
    {

    }

    protected void Actualizar_Click(object sender, EventArgs e)
    {

    }

}