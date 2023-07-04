using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;


public partial class DetalleFactura : System.Web.UI.Page

{
    public static bool respuesta;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string EID = Request.QueryString["id"];

            txtIdFactura.Text = EID;

        }
    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0)
        {
            //Gird is empty
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

        ListBox horas = GridView1.Rows[e.RowIndex].FindControl("ListBoxHoras") as ListBox;
        DropDownList doctor = GridView1.Rows[e.RowIndex].FindControl("ddl_CodMedico") as DropDownList;
        DropDownList servicio = GridView1.Rows[e.RowIndex].FindControl("ddl_CodServicio") as DropDownList;
        Label idCita = GridView1.Rows[e.RowIndex].FindControl("lbl_IdCitaMedica") as Label;
        Label idPaciente = GridView1.Rows[e.RowIndex].FindControl("lbl_IdPaciente") as Label;
        Label horaElegida = GridView1.Rows[e.RowIndex].FindControl("txtHoraCita") as Label;

        TimeSpan hora;

        if (horas.SelectedValue.Equals(""))
        {
            hora = TimeSpan.Parse(horaElegida.Text);
        }
        else
        {
            hora = TimeSpan.Parse(horas.SelectedValue.ToString());

        }

        CitaN objCita = new CitaN();
        DataSet ds = objCita.NuevaCitaDS();
        DataRow dr = ds.Tables[0].NewRow();

        dr["IdCitaMedica"] = idCita.Text;
        dr["IdPaciente"] = idPaciente.Text;
        dr["HoraCita"] = hora;
        dr["CodMedico"] = Int32.Parse(((ListItem)doctor.SelectedItem).Value);
        dr["CodServicio"] = Int32.Parse(((ListItem)servicio.SelectedItem).Value);

        ds.Tables[0].Rows.Add(dr);
        objCita.ModificarCitar(ds);

        GridView1.EditIndex = -1;
        GridView1.DataBind();

        Response.Redirect(Request.RawUrl);
    }


    protected void disponibilidad_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        int index = gvRow.RowIndex;

        //GridView1.SelectedIndex = ((GridViewRow)((Button)sender).Parent.Parent).DataItemIndex;
        Button update = GridView1.Rows[index].FindControl("btn_Update") as Button;
        ListBox horas = GridView1.Rows[index].FindControl("ListBoxHoras") as ListBox;
        DropDownList doctor = GridView1.Rows[index].FindControl("ddl_CodMedico") as DropDownList;
        DropDownList servicio = GridView1.Rows[index].FindControl("ddl_CodServicio") as DropDownList;
        Label fechas = GridView1.Rows[index].FindControl("lbl_FecCita") as Label;
        Label horaElegida = GridView1.Rows[index].FindControl("txtHoraCita") as Label;

        TimeSpan hora;

        int medico = Int32.Parse(((ListItem)doctor.SelectedItem).Value);
        int consulta = Int32.Parse(((ListItem)servicio.SelectedItem).Value);
        DateTime fecha = Convert.ToDateTime(fechas.Text);

        if (horas.SelectedValue.Equals(""))
        {
            hora = TimeSpan.Parse(horaElegida.Text);
        }
        else
        {
            hora = TimeSpan.Parse(horas.SelectedValue.ToString());

        }

        respuesta = CitaN.AutenticarCitas(medico, fecha, hora);

        if (respuesta.Equals(true))
        {
            Response.Write("<script> alert('Hora no disponible ')</script>");
            GridView1.Rows[index].FindControl("btn_Update").Visible = false;
        }
        else
        {

            GridView1.Rows[index].FindControl("btn_Update").Visible = true;
            Response.Write("<script> alert('Hora disponible, puede agendar ')</script>");

        }

    }

    protected void Redirect1_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        int index = gvRow.RowIndex;

        Label idCita = GridView1.Rows[index].FindControl("lbl_IdCitaMedica") as Label;
        Label idPaciente = GridView1.Rows[index].FindControl("lbl_IdPaciente") as Label;

        CitaN objCita = new CitaN();
        DataSet ds = objCita.NuevaCitaDS();
        DataRow dr = ds.Tables[0].NewRow();

        dr["IdCitaMedica"] = idCita.Text;
        dr["IdPaciente"] = idPaciente.Text;

        ds.Tables[0].Rows.Add(dr);
        objCita.CancelarCita(ds);

        GridView1.EditIndex = -1;
        GridView1.DataBind();

        Response.Redirect(Request.RawUrl);

    }

}