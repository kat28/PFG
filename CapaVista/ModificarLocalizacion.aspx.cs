using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using System.Data;
using System.Data.SqlClient;

public partial class ModificarLocalizacion : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string EID = Request.QueryString["id"];

            cargarLoc(EID);

        }
    }

    protected void Cancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Empleado.aspx");
    }

    protected void cargarLoc(string EID)
    {
        LocalizacionN objLocalizacion = new LocalizacionN();
        DataSet ds = objLocalizacion.Obtener_Localizacion(EID, EID);
        DataRow dr = ds.Tables[0].Rows[0];


        Provincia.SelectedValue = dr["CodProvincia"].ToString();

        LocCan(dr["CodProvincia"].ToString());

        Canton.SelectedValue = dr["CodCanton"].ToString();

        LocDis(dr["CodProvincia"].ToString(), Canton.SelectedValue = dr["CodCanton"].ToString());

        Distrito.SelectedValue = dr["CodDistrito"].ToString();

        txtDireccionExacta.Text = dr["DireccionExacta"].ToString();

    }


    protected void LocCan(string id)
    {
        try
        {
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

    protected void PListDropDown_Change(object sender, EventArgs e)
    {

        try
        {
            Canton.Items.Clear();

            String id = ((ListItem)Provincia.SelectedItem).Value;

            

            LocCan(id);

        }
        catch (Exception)
        {

            throw;
        }
    }


    protected void LocDis(string idP, string idC)
    {

        LocalizacionN objLocalizacion = new LocalizacionN();
        DataSet ds = objLocalizacion.Obtener_Distrito_ID(idP, idC);

        Distrito.DataSource = ds.Tables["GLDistrito"];
        Distrito.DataValueField = "CodDistrito";
        Distrito.DataTextField = "NomDistrito";
        Distrito.DataBind();
    }

    public void Selection_Change(Object sender, EventArgs e)
    {
        Distrito.Items.Clear();

        String idP = ((ListItem)Provincia.SelectedItem).Value;
        String idC = ((ListItem)Canton.SelectedItem).Value;

        LocDis(idP, idC);
    }

    protected void Modificar_Click(object sender, EventArgs e)
    {
        string EID = Request.QueryString["id"];
        try
        {
            string EIP = Request.QueryString["id"];

            LocalizacionN objLocal = new LocalizacionN();
            DataSet ds = objLocal.NuevaDireccionDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["IdPersona"] = EIP;
            dr["CodDireccion"] = EIP;
            dr["CodProvincia"] = Int32.Parse((Provincia.SelectedItem).Value);
            dr["CodCanton"] = Int32.Parse(Canton.SelectedValue);
            dr["CodDistrito"] = Int32.Parse((Distrito.SelectedItem).Value);
            dr["DireccionExacta"] = txtDireccionExacta.Text;


            ds.Tables[0].Rows.Add(dr);
            objLocal.ModificarLocalizacion(ds);

            string dir = "MostrarLocalizacion.aspx?id=" + EID;

            Response.Redirect(dir);
            //ResolveClientUrl(dir);

        }
        catch (Exception)
        {

            throw;
        }
    }
}