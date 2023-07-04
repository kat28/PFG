using System;
using CapaNegocio;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class ModificarPaciente : System.Web.UI.Page
{
    string CT = ConfigurationManager.ConnectionStrings["proyConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Toma la fecha actual.
        Comparevalidator1.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");

        if (!IsPostBack)
        {


            string EID = Request.QueryString["id"];
            var fecha = DateTime.Now;
            string FN = "";

            using (SqlConnection cn = new SqlConnection(CT))
            {
                string query = "select p.NumCedula, p.NomPersona, p.PrimerApellido, p.SegundoApellido, p.FecNacimiento, p.CodGenero, p.CodTipoCedula, p.CodEstadoCivil, e.CodConvenio, t.CodTelefono,t.NumTelefono,  c.CodCorreo, c.CorreoElectronico from Persona p inner join EMPaciente e on e.IdPersona = p.IdPersona inner join PLTelefono t on t.IdPersona = p.IdPersona inner join PLCorreo c on c.IdPersona = p.IdPersona where p.IdPersona ='" + EID + "'";
                using (SqlCommand cmd = new SqlCommand(query, cn))
                {
                    cn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        txtNumCedula.Text = dr["NumCedula"].ToString();
                        txtNombre.Text = dr["NomPersona"].ToString();
                        txtApellido1.Text = dr["PrimerApellido"].ToString();
                        txtApellido2.Text = dr["SegundoApellido"].ToString();
                        fecha = DateTime.Parse(dr["FecNacimiento"].ToString());
                        FN = fecha.Date.ToString("yyyy-MM-dd");
                        fecNacimiento.Value = FN;
                        dtp_input2.Value = FN;
                        Genero.SelectedValue = dr["CodGenero"].ToString();
                        cmbTipoCedula.SelectedValue = dr["CodTipoCedula"].ToString();
                        EstadoCivil.SelectedValue = dr["CodEstadoCivil"].ToString();

                        Puesto.SelectedValue = dr["CodConvenio"].ToString();

                        TipoTelefono.SelectedValue = dr["CodTelefono"].ToString();
                        txtNumTelefono.Value = dr["NumTelefono"].ToString();
                        TipoCorreo.SelectedValue = dr["CodCorreo"].ToString();
                        txtCorreo.Value = dr["CorreoElectronico"].ToString();
                    }
                    cn.Close();
                    cn.Dispose();

                }
            }
        }
    }

    //protected void cargarDatos(string EID)
    //{

    //    DateTime fecha;
    //    string FN = "";

    //    PacienteN objPaciente = new PacienteN();
    //    DataSet ds = objPaciente.Obtener_Paciente_Mod(EID);
    //    DataRow dr = ds.Tables[0].NewRow();

    //    txtNumCedula.Text = dr["NumCedula"].ToString();
    //    txtNombre.Text = dr["NomPersona"].ToString();
    //    txtApellido1.Text = dr["PrimerApellido"].ToString();
    //    txtApellido2.Text = dr["SegundoApellido"].ToString();
    //    fecha = DateTime.Parse(dr["FecNacimiento"].ToString());
    //    FN = fecha.Date.ToString("yyyy-MM-dd");
    //    fecNacimiento.Value = FN;
    //    dtp_input2.Value = FN;
    //    Genero.SelectedValue = dr["CodGenero"].ToString();
    //    cmbTipoCedula.SelectedValue = dr["CodTipoCedula"].ToString();
    //    EstadoCivil.SelectedValue = dr["CodEstadoCivil"].ToString();

    //    Puesto.SelectedValue = dr["CodConvenio"].ToString();

    //    TipoTelefono.SelectedValue = dr["CodTelefono"].ToString();
    //    txtNumTelefono.Value = dr["NumTelefono"].ToString();
    //    TipoCorreo.SelectedValue = dr["CodCorreo"].ToString();
    //    txtCorreo.Value = dr["CorreoElectronico"].ToString();

    //}

    protected void Modificar_Click(object sender, EventArgs e)
    {
        try
        {
            string EID = Request.QueryString["id"];

            PacienteN objPaciente = new PacienteN();
            DataSet ds = objPaciente.NuevoPacienteDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["IdPersona"] = EID;
            dr["NomPersona"] = txtNombre.Text;
            dr["PrimerApellido"] = txtApellido1.Text;
            dr["SegundoApellido"] = txtApellido2.Text;
            dr["NumCedula"] = txtNumCedula.Text;
            dr["FecNacimiento"] = DateTime.Parse(fecNacimiento.Value);
            dr["CodTipoCedula"] = Int32.Parse((cmbTipoCedula.SelectedItem).Value);
            dr["CodGenero"] = Int32.Parse(Genero.SelectedValue);
            dr["CodEstadoCivil"] = Int32.Parse((EstadoCivil.SelectedItem).Value);
            dr["CodConvenio"] = Int32.Parse((Puesto.SelectedItem).Value);
            dr["CodTelefono"] = Int32.Parse(TipoTelefono.SelectedValue);
            dr["NumTelefono"] = txtNumTelefono.Value;
            dr["CodCorreo"] = Int32.Parse(TipoCorreo.SelectedValue);
            dr["CorreoElectronico"] = txtCorreo.Value;

            ds.Tables[0].Rows.Add(dr);
            objPaciente.ModificarPaciente(ds);

            Response.Redirect("Pacientes.aspx");

        }
        catch (Exception)
        {

            throw;
        }
    }



}