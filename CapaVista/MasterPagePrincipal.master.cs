using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPagePrincipal : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("IniciarSesion.aspx");
        }
        else
        {
            txtUser.InnerText = "Usuario: " + Session["username"].ToString();
        }

        if (Session["userRol"].Equals("Admin")==true)
        {
            txtRol.InnerText = "Rol: " + Session["userRol"].ToString();
        }
        else if (Session["userRol"].Equals("Médico") == true)
        {
            txtConvenio.Visible = false;
            txtFactura.Visible = false;
            txtPlanilla.Visible = false;
            txtInventario.Visible = false;
            txtEmpleado.Visible = false;
            txtReportes.Visible = false;
            txtCitas.Visible = false;

            txtRol.InnerText = "Rol: " + Session["userRol"].ToString();

        }
        else if (Session["userRol"].Equals("Recepción") == true)
        {
            txtEmpleado.Visible = false;
            txtPlanilla.Visible = false;
            txtInventario.Visible = false;
            txtReportes.Visible = false;

            txtRol.InnerText = "Rol: " + Session["userRol"].ToString();
        }
       
    }
}
