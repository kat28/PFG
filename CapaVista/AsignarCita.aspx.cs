using System;
using CapaNegocio;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AsignarCita : System.Web.UI.Page
{
    public static bool respuesta;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

        //cargarPersonaID("4");
        //DateTime MaxDate = DateTime.MaxValue;

        
        //MaxDate = MinDate.AddDays(7);
    }

    protected void PListDropDown_Change(object sender, EventArgs e)
    {

        try
        {
            String id = ((ListItem)Medico.SelectedItem).Value;

            txtCodMedico.Text = id.ToString();
        }
        catch (Exception)
        {

            throw;
        }
    }
    
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0)
        {
            //Gird is empty
            mjsPagina.Text = " ";
        }
        else
        {
            mjsPagina.Text = "Mostrando Página " + (GridView1.PageIndex + 1).ToString()
            + " de " + GridView1.PageCount.ToString();
        }
    }

    protected void agregar_Click(object sender, EventArgs e)
    {
        try
        {
            CitaN objCita = new CitaN();
            DataSet ds = objCita.NuevaCitaDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["FecCita"] = DateTime.Parse( txtCalendario.Text).ToShortDateString();
            dr["HoraCita"] = DateTime.Parse( txtHora.Text).ToShortTimeString();
            dr["CodMedico"] = Int32.Parse(txtCodMedico.Text);
            dr["IdPaciente"] = Int32.Parse(txtId.InnerText);
            dr["CodServicio"] = Int32.Parse(((ListItem)Servicio.SelectedItem).Value);

            ds.Tables[0].Rows.Add(dr);
            objCita.AgregarCita(ds);

            Response.Write("<script> alert('Cita agendada con exito')</script>");
            Response.Redirect("Citas.aspx");

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void CalendarioCita_SelectionChanged(object sender, EventArgs e)
    {
        txtCalendario.Text = CalendarioCita.SelectedDate.ToShortDateString();
    }

    protected void listahoras_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtHora.Text = ListBoxHoras.SelectedValue.ToString();
    }

    //Validar Hora Cita
    protected void disponibilidad_Click(object sender, EventArgs e)
    {
        DateTime fecha = Convert.ToDateTime(txtCalendario.Text);
        int cod = Convert.ToInt32( txtCodMedico.Text);
        TimeSpan hora = TimeSpan.Parse( txtHora.Text);

        
        //hora.ToString("hh:mm tt");
               
        respuesta = CitaN.AutenticarCitas(cod, fecha, hora);

        if (respuesta.Equals(true))
        {
            //Response.Write("<script> alert('Hora no disponible ')</script>");
            
            txtHeaderMsj.InnerText = "Alerta!";
            txtBodyMsj.InnerText = "Hora no disponible";
            txtContainerMsj.Attributes.Add("class", "alert alert-danger text-dark");
            agregarCita.Visible = false;
        }
        else
        {
            //Response.Write("<script> alert('Hora disponible, puede agendar ')</script>");
            txtHeaderMsj.InnerText = "Exito!";
            txtBodyMsj.InnerText = "Hora disponible, puede agendar la cita";

            txtContainerMsj.Attributes.Add("class", "alert alert-success text-dark");

            agregarCita.Visible = true;
        }

    }

        protected void buscar_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
       
    }



    protected void CalendarioCita_DayRender(object sender, DayRenderEventArgs e)
    {
        DateTime MinDate = DateTime.MinValue;
        MinDate = DateTime.Today;

        if (e.Day.Date < MinDate)
        { 
            //|| (e.Day.Date > MaxDate)
            e.Day.IsSelectable = false;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gr = GridView1.SelectedRow;

        txtId.InnerText = gr.Cells[1].Text;
    }
}