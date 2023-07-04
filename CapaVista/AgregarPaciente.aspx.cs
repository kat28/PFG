using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaNegocio;

public partial class AgregarPaciente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Toma la fecha actual.
        Comparevalidator1.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");
    }

    protected void Agregar_Click(object sender, EventArgs e)
    {

        if (IsValid)
        {
PacienteN objPaciente = new PacienteN();
            DataSet ds = objPaciente.NuevoPacienteDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["NomPersona"] = txtNombre.Text;
            dr["PrimerApellido"] = txtApellido1.Text;
            dr["SegundoApellido"] = txtApellido2.Text;
            dr["NumCedula"] = txtNumCedula.Text;
            dr["FecNacimiento"] = Convert.ToDateTime( fecNacimiento.Value);
            dr["CodTipoCedula"] = Int32.Parse(((ListItem)cmbTipoCedula.SelectedItem).Value);
            dr["CodGenero"] = Int32.Parse(Genero.SelectedValue);
            dr["CodEstadoCivil"] = Int32.Parse(((ListItem)EstadoCivil.SelectedItem).Value);

            dr["CodConvenio"] = Int32.Parse(((ListItem)Convenio.SelectedItem).Value);

            dr["CodProvincia"] = Int32.Parse(((ListItem)Provincia.SelectedItem).Value);
            dr["CodCanton"] = Int32.Parse(((ListItem)Canton.SelectedItem).Value);
            dr["CodDistrito"] = Int32.Parse(((ListItem)Distrito.SelectedItem).Value);
            dr["DireccionExacta"] = txtDireccionExacta.Text;

            dr["CodCorreo"] = Int32.Parse(((ListItem)TipoCorreo.SelectedItem).Value);
            dr["CorreoElectronico"] = txtCorreo.Value;

            dr["CodTelefono"] = Int32.Parse(((ListItem)TipoTelefono.SelectedItem).Value);
            dr["NumTelefono"] = txtNumTelefono.Value;

            long id = 0;
            ds.Tables[0].Rows.Add(dr);
            id = objPaciente.AgregarPaciente(ds);
            id = 0;

            Response.Redirect("Pacientes.aspx");
        }
        try
        {
            

        }
        catch (Exception)
        {

            throw;
        }
    }


    protected void PListDropDown_Change(object sender, EventArgs e)
    {

        try
        {
            String id = ((ListItem)Provincia.SelectedItem).Value;

            LocalizacionN objLocalizacion = new LocalizacionN();
            DataSet ds = objLocalizacion.Obtener_Canton_ID(id);

            Canton.DataSource = ds.Tables["GLCanton"];
            Canton.DataValueField = "CodCanton";
            Canton.DataTextField = "NomCanton";
            Canton.DataBind();

        }
        catch (Exception)
        {

            throw;
        }
    }

    public void CListDropDown_Change(Object sender, EventArgs e)
    {

        String idP = ((ListItem)Provincia.SelectedItem).Value;
        String idC = ((ListItem)Canton.SelectedItem).Value;


        LocalizacionN objLocalizacion = new LocalizacionN();
        DataSet ds = objLocalizacion.Obtener_Distrito_ID(idP, idC);

        Distrito.DataSource = ds.Tables["GLDistrito"];
        Distrito.DataValueField = "CodDistrito";
        Distrito.DataTextField = "NomDistrito";
        Distrito.DataBind();
    }
}