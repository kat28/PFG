using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reportes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reporte2.aspx");
    }

    protected void btn2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reporte3.aspx");
    }

    protected void btn3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reportes.aspx");
    }

}