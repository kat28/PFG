using System;
using CapaNegocio;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HistoriaClinica : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string EID = Request.QueryString["id"]; //idPaciente
            string med = Request.QueryString["m"];  //codMed
            string serv = Request.QueryString["d"]; //tipo consulta
            string idCita = Request.QueryString["i"]; //idCita

            txtIdCita.Text = idCita;

            cargarPersonaID(EID,med,serv);
        }
    }

    protected void cargarPersonaID(string EID, string med, string serv)
    {
        PacienteN objPaciente = new PacienteN();
        DataSet ds = objPaciente.Obtener_PersonaExpediente_ID(EID);
        DataRow dr = ds.Tables[0].Rows[0];

        txtIdPer.Text = dr["IdPersona"].ToString();

        txtNombre.InnerText = "Nombre: " + dr["NomPersona"].ToString() + " " + dr["PrimerApellido"].ToString() + " " + dr["SegundoApellido"].ToString();

        txtCedula.InnerText = "Cédula: " + dr["NumCedula"].ToString();

        string genero = dr["CodGenero"].ToString();

        if (genero == "1")
        {
            txtGenero.InnerText = "Femenina";
        }
        else if (genero == "2")
        {
            txtGenero.InnerText = "Masculino";
        }

        DateTime fecha = DateTime.Parse(dr["FecNacimiento"].ToString());

        txtEdad.InnerText = obtenerAños(fecha);

        txtConv.InnerText = "Convenio: " + dr["NombreConvenio"].ToString();

        Medico.SelectedValue = med.ToString();

        Servicio.SelectedValue = serv.ToString();
    }


    protected string obtenerAños(DateTime date)
    {
        int años = 1;
        string edad;

        años = DateTime.Today.AddTicks(-date.Ticks).Year - 1;
        edad = años + " años ";

        return edad;
    }

    protected void Agregar_Click(object sender, EventArgs e)
    {
        string EID = Request.QueryString["id"];
        string med = Request.QueryString["m"];
        string serv = Request.QueryString["d"];
        string idCita = Request.QueryString["i"];

        try
        {
            PacienteN objPaciente = new PacienteN();
            DataSet ds = objPaciente.NuevaHistoriaClinicaDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["IdPaciente"] = EID;
            dr["FecConsulta"] = DateTime.Now;
            dr["IdEmpleado"] = med.ToString();
            dr["CodServicio"] = serv.ToString();
            dr["IdCitaMedica"] = idCita.ToString();

            ds.Tables[0].Rows.Add(dr);
            objPaciente.AgregarHistoriaClinica(ds);

            Response.Redirect("HistoriaClinica.aspx?id="+ EID +"&m="+med+"&d="+serv + "&i=" + idCita);

        }
        catch (Exception)
        {
            throw;
        }
    }



    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string EID = Request.QueryString["id"];

        string idH = GridView1.Rows[0].ToString();
        string idF = GridView1.Rows[1].ToString();
        DropDownList downListServicio = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("Servicio");

        PacienteN objPaciente = new PacienteN();
        DataSet ds = objPaciente.NuevoModificarHistoriaClinicaDS();
        DataRow dr = ds.Tables[0].NewRow();

        dr["IdPaciente"] = EID;
        dr["CodServicio"] = downListServicio;

        ds.Tables[0].Rows.Add(dr);
        objPaciente.ModificarHistoria(ds);

        Response.Redirect("HistoriaClinica.aspx");
    }

    protected void mod_Click(object sender, EventArgs e)
    {
        Servicio.Enabled=true;
    }

    protected void Red_Click(object sender, EventArgs e)
    {


        GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;

        int index = row.RowIndex;

        Label idPa = GridView1.Rows[index].FindControl("lblPaciente") as Label;
        Label idHis = GridView1.Rows[index].FindControl("lblHistoria") as Label;

        string idHistoriaClinica = idHis.Text;
        string idPaciente = idPa.Text;
        string idCita = Request.QueryString["i"];

        string url = "DetalleExpediente.aspx?id=" + idHistoriaClinica + "&ide=" + idPaciente + "&i=" + idCita;

        Response.Redirect(url);
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;

        //GridView1.DataBind();
    }


    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.DataBind();
    }


}