using System;
using CapaNegocio;


public partial class IniciarSesion : System.Web.UI.Page
{

    public IniciarSesion()
    {

    }

    public static string pasaruser;
    public static string respuesta;
    public static string pasarRol;
    public static string pasarId;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Prueba_Click(object sender, EventArgs e)
    {
        
        respuesta = LoginNeg.AutenticarLogin(user.Value, pass.Value);

        if (respuesta.Equals("v"))
        {
            pasaruser = user.Value;

            Session["username"] = pasaruser;

            pasarRol = LoginNeg.autenRol(pasaruser);

            Session["userRol"] = pasarRol;

            txtHeaderMsj.InnerText = "Bienvenido!";
            txtBodyMsj.InnerText = pasaruser;

            txtContainerMsj.Attributes.Add("class", "alert alert-success text-dark");

            //System.Threading.Thread.Sleep(5000);


            //Response.Write("<script> alert('Bienvenido! ')</script>"+ pasaruser);
            Response.Redirect("Inicio.aspx");

        }
        else
        {
            txtHeaderMsj.InnerText = "Error!";
            txtBodyMsj.InnerText = "El usuario o contraseña son incorrectos";
            txtContainerMsj.Attributes.Add("class", "alert alert-danger text-dark");
        }
    }
}