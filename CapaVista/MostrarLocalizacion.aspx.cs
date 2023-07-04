using System;
using CapaNegocio;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MostrarLocalizacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string EID = Request.QueryString["id"];

            cargarLoc(EID);

            // This will set up your Navigation URL as expected
            btnSubmit.NavigateUrl = String.Format("ModificarLocalizacion.aspx?id={0}", EID);

        }
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

    protected void LocDis(string idP, string idC)
    {

        LocalizacionN objLocalizacion = new LocalizacionN();
        DataSet ds = objLocalizacion.Obtener_Distrito_ID(idP, idC);

        Distrito.DataSource = ds.Tables["GLDistrito"];
        Distrito.DataValueField = "CodDistrito";
        Distrito.DataTextField = "NomDistrito";
        Distrito.DataBind();
    }

}