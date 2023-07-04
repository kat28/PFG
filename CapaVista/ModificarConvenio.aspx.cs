using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using System.Data;

public partial class ModificarConvenio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string EID = Request.QueryString["id"];

            cargarLoc(EID);

        }
    }

    protected void cargarLoc(string EID)
    {
        var fechaI = DateTime.Now;
        string FI = "";

        var fechaV = DateTime.Now;
        string FV = "";

        ConvenioN objconvenioN = new ConvenioN();
        DataSet ds = objconvenioN.Obtener_Convenio_ID(EID);
        DataRow dr = ds.Tables[0].Rows[0];

        txtNombre.Text =  dr["NombreConvenio"].ToString();

        fechaI = DateTime.Parse(dr["FecInicio"].ToString());
        FI = fechaI.Date.ToString("yyyy-MM-dd");
        startDate.Value = FI;
        dtp_input1.Value = FI;

        fechaV = DateTime.Parse(dr["FecVence"].ToString());
        FV = fechaV.Date.ToString("yyyy-MM-dd");
        endDate.Value = FV;
        dtp_input2.Value = FV;

        txtObs.Text = dr["Observaciones"].ToString();

        txtP.Text = dr["Porcentaje"].ToString()  ;
    }



    protected void Modificar_Click(object sender, EventArgs e)
    {
        try
        {

                string EIP = Request.QueryString["id"];

                ConvenioN objConvenio = new ConvenioN();
                DataSet ds = objConvenio.NuevoConvenioDS();
                DataRow dr = ds.Tables[0].NewRow();

                dr["CodConvenio"] = EIP;
                dr["NombreConvenio"] = txtNombre.Text;
                dr["FecInicio"] = startDate.Value;
                dr["FecVence"] = endDate.Value;
                dr["Observaciones"] = txtObs.Text;
                dr["Porcentaje"] = txtP.Text;

                ds.Tables[0].Rows.Add(dr);
                objConvenio.ModificarConvenio(ds);

                Response.Redirect("Convenios.aspx");

        }
        catch (Exception)
        {

            throw;
        }

    }
}