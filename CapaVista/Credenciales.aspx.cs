using System;
using CapaNegocio;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Credenciales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        mjsPagina.Text = "Mostrando Página " + (GridView1.PageIndex + 1).ToString()
            + " de " + GridView1.PageCount.ToString();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.DataBind();
    }

    protected void GridView1_Updating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox clave = GridView1.Rows[e.RowIndex].FindControl("txt_Clave") as TextBox;
        DropDownList rol = GridView1.Rows[e.RowIndex].FindControl("ddl_IdRol") as DropDownList;
        Label idLogin = GridView1.Rows[e.RowIndex].FindControl("lbl_IdLogin1") as Label;
        Label idPersona = GridView1.Rows[e.RowIndex].FindControl("lbl_IdPersona1") as Label;

        LoginNeg objLogin = new LoginNeg();
        DataSet ds = objLogin.NuevoLoginDS();
        DataRow dr = ds.Tables[0].NewRow();

        dr["IdLogin"] = idLogin.Text;
        dr["IdPersona"] = idPersona.Text;
        dr["Clave"] = clave.Text;
        dr["IdRol"] = Int32.Parse(((ListItem)rol.SelectedItem).Value);

        ds.Tables[0].Rows.Add(dr);
        objLogin.ModificarCredenciales(ds);

        GridView1.EditIndex = -1;
        GridView1.DataBind();

        Response.Redirect(Request.RawUrl);
    }

}