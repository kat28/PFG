using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaNegocio;
using System.Data;


public partial class GenerarPlanilla : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    private void limpiar(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        int index = gvRow.RowIndex;

        //GridView1.SelectedIndex = ((GridViewRow)((Button)sender).Parent.Parent).DataItemIndex;
        TextBox salarioBruto = GridView1.Rows[index].FindControl("txt_SalarioBruto") as TextBox;
        TextBox Incentivos = GridView1.Rows[index].FindControl("txt_Incentivos") as TextBox;
        TextBox HorasExtra = GridView1.Rows[index].FindControl("txt_HorasExtra") as TextBox;
        TextBox Embargo = GridView1.Rows[index].FindControl("txt_Embargo") as TextBox;
        Label renta = GridView1.Rows[index].FindControl("txt_Renta") as Label;
        Label SeguroSocial = GridView1.Rows[index].FindControl("txt_SeguroSocial") as Label;
        Label SalarioNeto = GridView1.Rows[index].FindControl("txt_SalarioNeto") as Label;

        salarioBruto.Text = "0";
        Incentivos.Text = "0";
        HorasExtra.Text = "0";
        Embargo.Text = "0";
        renta.Text = "0";
        SeguroSocial.Text = "0";
        SalarioNeto.Text = "0";


    }




    //Calcular planilla
    protected void Redirect1_Click(object sender, EventArgs e)
    {
        double a, j, k,b;
        double g = 0;

        

        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        int index = gvRow.RowIndex;

        //GridView1.SelectedIndex = ((GridViewRow)((Button)sender).Parent.Parent).DataItemIndex;
        
        TextBox salarioBruto =  GridView1.Rows[index].FindControl("txt_SalarioBruto") as TextBox;
        TextBox Incentivos = GridView1.Rows[index].FindControl("txt_Incentivos") as TextBox;
        TextBox HorasExtra = GridView1.Rows[index].FindControl("txt_HorasExtra") as TextBox;
        TextBox Embargo = GridView1.Rows[index].FindControl("txt_Embargo") as TextBox;
        DropDownList adelanto = GridView1.Rows[index].FindControl("ddl_Adelanto") as DropDownList;
        Label renta = GridView1.Rows[index].FindControl("txt_Renta") as Label;
        Label SeguroSocial = GridView1.Rows[index].FindControl("txt_SeguroSocial") as Label;
        Label SalarioNeto = GridView1.Rows[index].FindControl("txt_SalarioNeto") as Label;
        Label IdPlanilla = GridView1.Rows[index].FindControl("lbl_IdPagoPlanilla") as Label;
        Label Empleado = GridView1.Rows[index].FindControl("lbl_IdEmpleado") as Label;
        Label NombreCompleto = GridView1.Rows[index].FindControl("lbl_NombreCompleto") as Label;


        string adelantoString = adelanto.SelectedItem.Value;

        if (adelantoString.Equals("0.4"))
        {
            Double salBruto = Double.Parse(salarioBruto.Text);
            Double sal40 = (Double.Parse(salarioBruto.Text) * 0.4);
            salarioBruto.Text = sal40.ToString();

            //salario total
            a = salBruto - sal40;
            SalarioNeto.Text = a.ToString();

            b = 40;
        }
        else
        {
            Double horasEx = Double.Parse(HorasExtra.Text);
            Double Incen =  Double.Parse(Incentivos.Text);
            Double rent =  Double.Parse(renta.Text);
            Double salBruto = Double.Parse(salarioBruto.Text);
            Double emb = Double.Parse(Embargo.Text);
            Double totalRenta = 0;

            //Salario 60%
            Double sal60 = (salBruto * 0.6);

            //calcular horas extra
            //tiempo extraordinario
            if (Int64.Parse(horasEx.ToString()) == 0)
            {
                HorasExtra.Text = "0";
                k = (sal60 + 0 + Incen);
            }
            else {

                double n = (salBruto / 30);
                double m = (horasEx * 1.5);

                g = n / m;
                HorasExtra.Text = Math.Round(g, 2).ToString();

                k = (sal60 + Math.Round(g, 2) + Incen);
            }

            //seguro
            Double por = 0.1034;
            j = (salBruto * por);
            SeguroSocial.Text = j.ToString();

            //renta
            if (Int64.Parse(salBruto.ToString()) <= 817000)
            {
                renta.Text = "0";
            }
            else if(Int64.Parse(salBruto.ToString()) > 817000 && Int64.Parse(salarioBruto.Text) <= 1226000)
            {
                //renta
                double porcRenta = 10;

                totalRenta = (salBruto - 817000) * (porcRenta / 100);
                renta.Text = totalRenta.ToString();
            }
            else
            {
                //renta
                double porc15 = 15;

                totalRenta = 40900 + (salBruto - 1226000) * (porc15 / 100) ;
                renta.Text = totalRenta.ToString();
     
                    


            }

            //salario total
            a = k-j-emb- totalRenta;
            SalarioNeto.Text = a.ToString();

            b = 60;
        }            
            
            //AgregarBD
            PlanillaN objPlanilla = new PlanillaN();
            DataSet ds = objPlanilla.NuevaPlanillaDS();
            DataRow dr = ds.Tables[0].NewRow();

            dr["IdPagoPlanilla"] = Convert.ToInt32(IdPlanilla.Text);
            dr["IdEmpleado"] = Convert.ToInt32(Empleado.Text);
            dr["SalarioBruto"] = Convert.ToDouble(salarioBruto.Text);
            dr["SalarioNeto"] = Convert.ToDouble(SalarioNeto.Text);
            dr["HorasExtra"] = Convert.ToDouble(Math.Round(g, 2).ToString());
            dr["Incentivos"] = Convert.ToDouble(Incentivos.Text);
            dr["Renta"] = Convert.ToDouble(renta.Text);
            dr["SeguroSocial"] = Convert.ToDouble(SeguroSocial.Text);
            dr["Adelanto"] = Convert.ToDouble(Math.Round(b, 2).ToString());
            dr["Embargo"] = Convert.ToDouble(Embargo.Text);
            dr["NombreCompleto"] = NombreCompleto.Text;

            ds.Tables[0].Rows.Add(dr);
            objPlanilla.ModificarConvenio(ds);

            limpiar(sender, e);

            GridView1.EditIndex = -1;
            GridView1.DataBind();

        Response.Redirect("GenerarPlanilla.aspx");
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
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //GridView1.EditIndex = -1;
        //GridView1.DataBind();


        Response.Redirect("GenerarPlanilla.aspx");


    }

    protected void Agregar_Click(object sender, EventArgs e)
    {
        PlanillaN objPlanilla = new PlanillaN();
        DataSet ds = objPlanilla.GenerarPlanilla();
        //DataRow dr = ds.Tables[0].NewRow();

        GridView1.DataBind();

        btnGenerarPlanilla.Enabled = false;
    }

}