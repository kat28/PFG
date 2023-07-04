using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class Reportes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnShow_Click(object sender, EventArgs e)
    {


        ShowReport();


    }

    private void ShowReport()
    {
        int año = int.Parse(txtAño.Text);
        int mes = int.Parse(txtMes.SelectedValue.ToString());

        //Reset
        rptViewer.Reset();

        //DataSource
        DataTable dt = GetData(año, mes);
        ReportDataSource rds = new ReportDataSource("DataSetPlanilla", dt);

        rptViewer.LocalReport.DataSources.Add(rds);

        //Path
        rptViewer.LocalReport.ReportPath = "Report2.rdlc";

        //Parameters
        ReportParameter[] rptParams = new ReportParameter[]
        {
            new ReportParameter("Año",año.ToString()),
            new ReportParameter("Mes",mes.ToString())
        };

        rptViewer.LocalReport.SetParameters(rptParams);

        //Refresh
        rptViewer.LocalReport.Refresh();

    }

    private DataTable GetData(int año, int mes)
    {
        DataTable dt = new DataTable();
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["proyConnectionString"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("sp_ObtenerPlanillaPorFecha", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Año", SqlDbType.Int).Value = año;
            cmd.Parameters.Add("@Mes", SqlDbType.Int).Value = mes;

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);

        }

        return dt;

    }

}