using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

public partial class Factura : System.Web.UI.Page
{
    public static bool respuesta;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0)
        {
            //Gird is empty
            mjsPagina.Text = "Mostrando Página 0 de 0";
        }
        else
        {
            mjsPagina.Text = "Mostrando Página " + (GridView1.PageIndex + 1).ToString()
            + " de " + GridView1.PageCount.ToString();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;

        //GridView1.DataBind();

        txtNumFactura.InnerText = GridView1.Rows[e.NewEditIndex].Cells[1].Text;
        txtNombre.InnerText = GridView1.Rows[e.NewEditIndex].Cells[2].Text;
        txtCedula.InnerText = GridView1.Rows[e.NewEditIndex].Cells[3].Text;
        txtTelefono.InnerText = GridView1.Rows[e.NewEditIndex].Cells[4].Text;
        txtCorreo.InnerText = GridView1.Rows[e.NewEditIndex].Cells[5].Text;
        txtFecha.InnerText = GridView1.Rows[e.NewEditIndex].Cells[6].Text;
        txtPago.InnerText = GridView1.Rows[e.NewEditIndex].Cells[7].Text;

        txtMedico.InnerText = GridView1.Rows[e.NewEditIndex].Cells[15].Text;
        txtConvenio.InnerHtml = GridView1.Rows[e.NewEditIndex].Cells[9].Text;

        txtServicio.InnerText = GridView1.Rows[e.NewEditIndex].Cells[17].Text;
        txtMonto.InnerText = GridView1.Rows[e.NewEditIndex].Cells[18].Text;
        txtSubTotal.InnerText = GridView1.Rows[e.NewEditIndex].Cells[18].Text;
        txtTotalNeto.InnerText = GridView1.Rows[e.NewEditIndex].Cells[18].Text;

        Double descuento = 0;
        Double Total = 0;

        string conv = txtConvenio.InnerText;

        if (conv.Equals("No Aplica")==true)
        {
            txtConvenio.InnerHtml = conv;
            txtDescuento.InnerText = "0";
            txtMontoDescuento.InnerText = "0";
            txtConvenio.Visible = true;
        }
        else
        {
            try
            {
                txtConvenio.InnerHtml = GridView1.Rows[e.NewEditIndex].Cells[9].Text;
                txtConvenio.Visible = true;

                txtDescuento.InnerText = GridView1.Rows[e.NewEditIndex].Cells[10].Text + " %";

                descuento = (Convert.ToDouble(GridView1.Rows[e.NewEditIndex].Cells[10].Text) / 100) * Double.Parse(txtMonto.InnerText);

                Total = Double.Parse(txtMonto.InnerText) - descuento;

                txtMontoDescuento.InnerText = descuento.ToString();

                txtTotalNeto.InnerText = Total.ToString();

            }
            catch (Exception ex)
            {

            }
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.DataBind();
    }

    protected void GridView1_Updating(object sender, GridViewUpdateEventArgs e)
    {

        ListBox horas = GridView1.Rows[e.RowIndex].FindControl("ListBoxHoras") as ListBox;
        DropDownList doctor = GridView1.Rows[e.RowIndex].FindControl("ddl_CodMedico") as DropDownList;
        DropDownList servicio = GridView1.Rows[e.RowIndex].FindControl("ddl_CodServicio") as DropDownList;
        Label idCita = GridView1.Rows[e.RowIndex].FindControl("lbl_IdCitaMedica") as Label;
        Label idPaciente = GridView1.Rows[e.RowIndex].FindControl("lbl_IdPaciente") as Label;
        Label horaElegida = GridView1.Rows[e.RowIndex].FindControl("txtHoraCita") as Label;

        TimeSpan hora;

        if (horas.SelectedValue.Equals(""))
        {
            hora = TimeSpan.Parse(horaElegida.Text);
        }
        else
        {
            hora = TimeSpan.Parse(horas.SelectedValue.ToString());

        }

        CitaN objCita = new CitaN();
        DataSet ds = objCita.NuevaCitaDS();
        DataRow dr = ds.Tables[0].NewRow();

        dr["IdCitaMedica"] = idCita.Text;
        dr["IdPaciente"] = idPaciente.Text;
        dr["HoraCita"] = hora;
        dr["CodMedico"] = Int32.Parse(((ListItem)doctor.SelectedItem).Value);
        dr["CodServicio"] = Int32.Parse(((ListItem)servicio.SelectedItem).Value);

        ds.Tables[0].Rows.Add(dr);
        objCita.ModificarCitar(ds);

        GridView1.EditIndex = -1;
        GridView1.DataBind();

        Response.Redirect(Request.RawUrl);
    }

    protected void Pagar_Click(object sender, EventArgs e)
    {
        try
        {

            GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
            int index = row.RowIndex;

            Int32 idFactura =  Convert.ToInt32(GridView1.DataKeys[index].Value);
            DropDownList dd = GridView1.Rows[index].FindControl("ddlMo") as DropDownList;

            FacturaN objFactura = new FacturaN();
            DataSet ds = objFactura.NuevoModoPagoDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["CodFactura"] = idFactura;
            dr["CodModoPago"] = Int32.Parse(((ListItem)dd.SelectedItem).Value);

            ds.Tables[0].Rows.Add(dr);
            objFactura.ModificarModoPago(ds);

            Response.Redirect(Request.RawUrl);

        }
        catch
        {
            throw;
        }

    }
}