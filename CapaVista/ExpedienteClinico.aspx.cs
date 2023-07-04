using System;
using CapaNegocio;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExpedienteClinico : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0)
        {
            //Grid is empty
            mjsPagina.Text = "Mostrando Página 0 de 0";
        }
        else
        {
            mjsPagina.Text = "Mostrando Página " + (GridView1.PageIndex + 1).ToString()
            + " de " + GridView1.PageCount.ToString();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.DataBind();
    }

    protected void GridView1_Updating(object sender, GridViewUpdateEventArgs e)
    {

        Label doctor = GridView1.Rows[e.RowIndex].FindControl("txtCodMedico1") as Label;
        DropDownList servicio = GridView1.Rows[e.RowIndex].FindControl("ddl_CodServicio") as DropDownList;
        Label idCita = GridView1.Rows[e.RowIndex].FindControl("lbl_IdCitaMedica") as Label;
        Label idPaciente = GridView1.Rows[e.RowIndex].FindControl("lbl_IdPaciente") as Label;
        Label horaElegida = GridView1.Rows[e.RowIndex].FindControl("txtHoraCita") as Label;

        CitaN objCita = new CitaN();
        DataSet ds = objCita.NuevaCitaDS();
        DataRow dr = ds.Tables[0].NewRow();

        dr["IdCitaMedica"] = idCita.Text;
        dr["IdPaciente"] = idPaciente.Text;
        dr["HoraCita"] = TimeSpan.Parse(horaElegida.Text); ;
        dr["CodMedico"] = Int32.Parse(doctor.Text);
        dr["CodServicio"] = Int32.Parse(((ListItem)servicio.SelectedItem).Value);

        ds.Tables[0].Rows.Add(dr);
        objCita.ModificarCitar(ds);

        GridView1.EditIndex = -1;
        GridView1.DataBind();

        Response.Redirect(Request.RawUrl);
    }


    
}