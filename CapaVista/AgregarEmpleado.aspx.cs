using System;
using CapaNegocio;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarEmpleado : System.Web.UI.Page
{

    
    protected void Page_Load(object sender, EventArgs e)
    {
        //Toma la fecha actual.
        Comparevalidator1.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");

        txtCodMedico.Visible = false;
        lblCodMedico.Visible = false;
    }

    protected void Puesto_Change(object sender, EventArgs e)
    {

        string id = Puesto.SelectedValue;

        if (id == "10")
        {
            txtCodMedico.Visible = true;
            lblCodMedico.Visible = true;
        }
        else
        {
            txtCodMedico.Visible = false;
            lblCodMedico.Visible = false;
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

    public void Selection_Change(Object sender, EventArgs e)
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

    protected void Agregar_Click(object sender, EventArgs e)
    {
        
            if (IsValid)
            {

                try
                {
                    EmpleadoN objEmpleado = new EmpleadoN();
                    DataSet ds = objEmpleado.nuevoEmpleadoDS();
                    DataRow dr = ds.Tables[0].NewRow();

                    dr["NomPersona"] = txtNombre.Text;
                    dr["PrimerApellido"] = txtApellido1.Text;
                    dr["SegundoApellido"] = txtApellido2.Text;
                    dr["NumCedula"] = txtNumCedula.Text;
                    dr["CodMedico"] = txtCodMedico.Text;
                    dr["FecNacimiento"] = DateTime.Parse(fecNacimiento.Value);
                    dr["CodTipoCedula"] = Int32.Parse(((ListItem)cmbTipoCedula.SelectedItem).Value);
                    dr["CodGenero"] = Int32.Parse(Genero.SelectedValue);
                    dr["CodEstadoCivil"] = Int32.Parse(((ListItem)EstadoCivil.SelectedItem).Value);
                    dr["CodPuesto"] = Int32.Parse(((ListItem)Puesto.SelectedItem).Value);
                    dr["CodProvincia"] = Int32.Parse(((ListItem)Provincia.SelectedItem).Value);
                    dr["CodCanton"] = Int32.Parse(((ListItem)Canton.SelectedItem).Value);
                    dr["CodDistrito"] = Int32.Parse(((ListItem)Distrito.SelectedItem).Value);
                    dr["DireccionExacta"] = txtDireccionExacta.Text;
                    dr["IdRol"] = Int32.Parse(((ListItem)Rol.SelectedItem).Value);

                    dr["CodCorreo"] = Int32.Parse(((ListItem)TipoCorreo.SelectedItem).Value);
                    dr["CorreoElectronico"] = txtCorreo.Value;

                    dr["CodTelefono"] = Int32.Parse(((ListItem)TipoTelefono.SelectedItem).Value);
                    dr["NumTelefono"] = txtNumTelefono.Value;

                    long id = 0;
                    ds.Tables[0].Rows.Add(dr);
                    id = objEmpleado.AgregarEmpleado(ds);
                    id = 0;

                    Response.Redirect("Empleado.aspx");

                }
                catch (Exception)
                {

                    throw;
                }
        }
    }


    public void LimpiarControl(ControlCollection controles)
    {
        foreach (Control control in controles)
        {
            if (control is TextBox)
                ((TextBox)control).Text = string.Empty;
            else if (control is DropDownList)
                ((DropDownList)control).ClearSelection();
            else if (control is RadioButtonList)
                ((RadioButtonList)control).ClearSelection();
            else if (control is CheckBoxList)
                ((CheckBoxList)control).ClearSelection();
            else if (control is RadioButton)
                ((RadioButton)control).Checked = false;
            else if (control is CheckBox)
                ((CheckBox)control).Checked = false;
            else if (control.HasControls())

                LimpiarControl(control.Controls);
        }
    }

    protected void BtLimpiar_Click(object sender, EventArgs e)
    {
        //Cuando se llama el método limpiar se pasa como parámetro 
        //la colección de controles de la página Web.
        LimpiarControl(this.Controls);
    }

}