using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using System.Data;

public partial class DetalleExpediente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string EID = Request.QueryString["id"]; //idHistClin
            string EIP = Request.QueryString["ide"]; //idpac
            string IdCita = Request.QueryString["i"]; //id cita

            cargarPersonaID(EIP);
            CargarDetalleClinico(EIP, EID);
            CargarAntecedentesPersonales(EIP);
        }
    }

    protected void cargarPersonaID(string EID)
    {
        PacienteN objPaciente = new PacienteN();
        DataSet ds = objPaciente.Obtener_PersonaExpediente_ID(EID);
        DataRow dr = ds.Tables[0].Rows[0];

        txtNombre.InnerText = dr["NomPersona"].ToString() + " " + dr["PrimerApellido"].ToString() + " " + dr["SegundoApellido"].ToString();

        txtCedula.InnerText = dr["NumCedula"].ToString();

        string genero = dr["CodGenero"].ToString();

        if (genero == "1")
        {
            txtGenero.InnerText = "Femenino";
        }
        else if (genero == "2")
        {
            txtGenero.InnerText = "Masculino";
        }

        DateTime fecha = DateTime.Parse(dr["FecNacimiento"].ToString());

        txtEdad.InnerText = obtenerAños(fecha);

        txtConv.InnerText = "Convenio: " + dr["NombreConvenio"].ToString();

    }


    protected string obtenerAños(DateTime date)
    {
        int años = 1;
        string edad;

        años = DateTime.Today.AddTicks(-date.Ticks).Year - 1;
        edad = años + " años ";

        return edad;
    }

    protected void CargarDetalleClinico(string EIP, string EID)
    {
        PacienteN objPaciente = new PacienteN();
        DataSet ds = objPaciente.Obtener_DetalleClinico_ID(EIP, EID);
        DataRow dr = ds.Tables[0].Rows[0];

        txtMotivo.InnerText = dr["MotivoConsulta"].ToString();
        txtExamen.InnerText = dr["ExamenFisico"].ToString();
        txtAnalisis.InnerText = dr["Analisis"].ToString();
        txtDiag.InnerText = dr["Diagnostico"].ToString();
        txtTrata.InnerText = dr["Tratamiento"].ToString();
        txtSeg.InnerText = dr["Seguimiento"].ToString();
        txtTemp.Text = dr["Temperatura"].ToString();
        txtFR.Text = dr["FrecuenciaRespiratoria"].ToString();
        txtSO.Text = dr["SaturacionOxigeno"].ToString();
        txtFC.Text = dr["FrecuenciaCardiaca"].ToString();
        txtPresion.Text = dr["PresionArterial"].ToString();
        txtPeso.Text = dr["Peso"].ToString();
        txtTalla.Text = dr["Talla"].ToString();
    }

    protected void CargarAntecedentesPersonales(string EIP)
    {
        PacienteN objPaciente = new PacienteN();
        DataSet ds = objPaciente.Obtener_AntecedentesPersonales_ID(EIP);
        DataRow dr = ds.Tables[0].Rows[0];

        txtAP.InnerText = dr["AntPatologicos"].ToString();
        txtANP.InnerText = dr["AntNoPatologicos"].ToString();
        txtAlergia.InnerText = dr["Alergias"].ToString();
        txtToxico.InnerText = dr["Toxicomanias"].ToString();
        txtAQ.InnerText = dr["AntQuirurgicos"].ToString();
        txtAT.InnerText = dr["AntTraumaticos"].ToString();
        txtAG.InnerText = dr["AntGinecoObstetricos"].ToString();
        txtObs.InnerText = dr["Observaciones"].ToString();
    }

    protected void AgregarSignos_Click(object sender, EventArgs e)
    {
        string EID = Request.QueryString["id"];

        string EIP = Request.QueryString["ide"];

        string IdCita = Request.QueryString["i"];

        try
        {
            PacienteN objPaciente = new PacienteN();
            DataSet ds = objPaciente.NuevoSignosVitalesDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["IdPaciente"] = EIP;
            dr["IdHistoriaClinica"] = EID;

            dr["Peso"] = Decimal.Parse(txtPeso.Text);
            dr["Temperatura"] = Decimal.Parse(txtTemp.Text);
            dr["Talla"] = Int32.Parse(txtTalla.Text);
            dr["FrecuenciaRespiratoria"] = Int32.Parse(txtFR.Text);
            dr["SaturacionOxigeno"] = Int32.Parse(txtSO.Text);
            dr["FrecuenciaCardiaca"] = Int32.Parse(txtFC.Text);
            dr["PresionArterial"] = txtPresion.Text;


            ds.Tables[0].Rows.Add(dr);
            objPaciente.AgregarSignosVitales(ds);

            string url = "DetalleExpediente.aspx?id=" + EID + "&ide=" + EIP + "&i=" + IdCita;

            Response.Redirect(url);

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void AgregarAntece_Click(object sender, EventArgs e)
    {
        string EID = Request.QueryString["id"];

        string EIP = Request.QueryString["ide"];

        string IdCita = Request.QueryString["i"];

        try
        {
            PacienteN objPaciente = new PacienteN();
            DataSet ds = objPaciente.NuevoAntecedentesDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["IdPersona"] = EIP;
            dr["AntPatologicos"] = txtAP.InnerText;
            dr["AntNoPatologicos"] = txtANP.InnerText;
            dr["Alergias"] = txtAlergia.InnerText;
            dr["Toxicomanias"] = txtToxico.InnerText;
            dr["AntQuirurgicos"] = txtAQ.InnerText;
            dr["AntTraumaticos"] = txtAT.InnerText;
            dr["AntGinecoObstetricos"] = txtAG.InnerText;
            dr["Observaciones"] = txtObs.InnerText;


            ds.Tables[0].Rows.Add(dr);
            objPaciente.AgregarAntecedentes(ds);

            string url = "DetalleExpediente.aspx?id=" + EID + "&ide=" + EIP + "&i=" + IdCita;

            Response.Redirect(url);



        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void AgregarDetalle_Click(object sender, EventArgs e)
    {
        string EID = Request.QueryString["id"];

        string EIP = Request.QueryString["ide"];

        string IdCita = Request.QueryString["i"];

        try
        {
            PacienteN objPaciente = new PacienteN();
            DataSet ds = objPaciente.NuevoDetalleClinicoDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["IdPaciente"] = EIP;
            dr["IdHistoriaClinica"] = EID;
            dr["MotivoConsulta"] = txtMotivo.InnerText;
            dr["ExamenFisico"] = txtExamen.InnerText;
            dr["Analisis"] = txtAnalisis.InnerText;
            dr["Diagnostico"] = txtDiag.InnerText;
            dr["Tratamiento"] = txtTrata.InnerText;
            dr["Seguimiento"] = txtSeg.InnerText;


            ds.Tables[0].Rows.Add(dr);
            objPaciente.AgregarDetalleClinico(ds);

            string url = "DetalleExpediente.aspx?id=" + EID + "&ide=" + EIP + "&i=" + IdCita;

            Response.Redirect(url);



        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void AgregarTotal_Click(object sender, EventArgs e)
    {
        string EID = Request.QueryString["id"];

        string EIP = Request.QueryString["ide"];

        string IdCita = Request.QueryString["i"];

        try
        {
            PacienteN objPaciente = new PacienteN();
            DataSet ds = objPaciente.NuevoDetalleClinicoDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["IdPaciente"] = EIP;
            dr["IdHistoriaClinica"] = EID;
            dr["MotivoConsulta"] = txtMotivo.InnerText;
            dr["ExamenFisico"] = txtExamen.InnerText;
            dr["Analisis"] = txtAnalisis.InnerText;
            dr["Diagnostico"] = txtDiag.InnerText;
            dr["Tratamiento"] = txtTrata.InnerText;
            dr["Seguimiento"] = txtSeg.InnerText;


            ds.Tables[0].Rows.Add(dr);
            objPaciente.AgregarDetalleClinico(ds);

            PacienteN objPaciente2 = new PacienteN();
            DataSet dm = objPaciente2.NuevoAntecedentesDS();
            DataRow drr = dm.Tables[0].NewRow();

            drr["IdPersona"] = EIP;
            drr["AntPatologicos"] = txtAP.InnerText;
            drr["AntNoPatologicos"] = txtANP.InnerText;
            drr["Alergias"] = txtAlergia.InnerText;
            drr["Toxicomanias"] = txtToxico.InnerText;
            drr["AntQuirurgicos"] = txtAQ.InnerText;
            drr["AntTraumaticos"] = txtAT.InnerText;
            drr["AntGinecoObstetricos"] = txtAG.InnerText;
            drr["Observaciones"] = txtObs.InnerText;


            dm.Tables[0].Rows.Add(drr);
            objPaciente2.AgregarAntecedentes(dm);

            PacienteN objPaciente3 = new PacienteN();
            DataSet df = objPaciente3.NuevoSignosVitalesDS();
            DataRow de = df.Tables[0].NewRow();

            de["IdPaciente"] = EIP;
            de["IdHistoriaClinica"] = EID;
            de["Peso"] = Decimal.Parse(txtPeso.Text);
            de["Talla"] = Int32.Parse(txtTalla.Text);
            de["Temperatura"] = Decimal.Parse(txtTemp.Text);
            de["FrecuenciaRespiratoria"] = Int32.Parse(txtFR.Text);
            de["SaturacionOxigeno"] = Int32.Parse(txtSO.Text);
            de["FrecuenciaCardiaca"] = Int32.Parse(txtFC.Text);
            de["PresionArterial"] = txtPresion.Text;


            df.Tables[0].Rows.Add(de);
            objPaciente3.AgregarSignosVitales(df);

            string url = "DetalleExpediente.aspx?id=" + EID + "&ide=" + EIP + "&i=" + IdCita;

            Response.Redirect(url);
        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void Finalizar_Click(object sender, EventArgs e)
    {
        string EIP = Request.QueryString["ide"];

        string IdCita = Request.QueryString["i"];

        string Usuario = Session["username"].ToString();

        try
        {
            FacturaN objFactura = new FacturaN();
            DataSet ds = objFactura.NuevaFacturaDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["IdPaciente"] = Int32.Parse(EIP);
            dr["Fecha"] = DateTime.Now;
            dr["CodEstadoFactura"] = Int32.Parse("23");
            dr["IDCitaMedica"] = Int32.Parse(IdCita);
            dr["IDEmpleado"] = 2;

            ds.Tables[0].Rows.Add(dr);
            objFactura.AgregarFactura(ds);

            Response.Redirect("ExpedienteClinico.aspx");
        }
        catch
        {
            throw;
        }

    }

}