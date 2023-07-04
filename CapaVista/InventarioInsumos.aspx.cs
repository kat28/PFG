using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;
using System.Data;

public partial class InventarioInsumos : System.Web.UI.Page
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

    protected void GridView1_RowCancelingEdit (object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.DataBind();
    }

    protected void GridView1_Updating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox cantidad = GridView1.Rows[e.RowIndex].FindControl("txt_Cantidad") as TextBox;
        TextBox nombre = GridView1.Rows[e.RowIndex].FindControl("txt_NomActivo") as TextBox;
        Label costo = GridView1.Rows[e.RowIndex].FindControl("lbl_ValorOriginal") as Label;
        DropDownList familia = GridView1.Rows[e.RowIndex].FindControl("ddl_Familia") as DropDownList;
        DropDownList estado = GridView1.Rows[e.RowIndex].FindControl("ddl_Estado") as DropDownList;

        //if (estado.SelectedItem.Value == "29")
        //{
        //    cantidad.Text = "0";
        //}
        //else
        //{
        //    cantidad = GridView1.Rows[e.RowIndex].FindControl("txt_Cantidad") as TextBox;
        //}


        InventarioN objInventario = new InventarioN();
        DataSet ds = objInventario.NuevoInventarioDS();
        DataRow dr = ds.Tables[0].NewRow();

        dr["IdActivo"] = GridView1.Rows[e.RowIndex].Cells[0].Text;
        dr["NomActivo"] = nombre.Text;
        dr["Familia"] = Convert.ToInt32(familia.SelectedItem.Value);
        dr["Marca"] = GridView1.Rows[e.RowIndex].Cells[3].Text;
        dr["FecAdquisicion"] = GridView1.Rows[e.RowIndex].Cells[4].Text;
        dr["Cantidad"] = Convert.ToInt32(cantidad.Text);
        dr["ValorOriginal"] = Convert.ToDouble( costo.Text);
        dr["CodEstado"] = Convert.ToInt32(estado.SelectedItem.Value);



        ds.Tables[0].Rows.Add(dr);
        objInventario.ModificarInventario(ds);

        Response.Redirect("InventarioInsumos.aspx");
    }
}