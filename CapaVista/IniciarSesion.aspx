<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IniciarSesion.aspx.cs" Inherits="IniciarSesion" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <title>Iniciar Sesión</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->

</head>
<body>

    <form id="form1" runat="server" data-toggle="validator">

        <div class="limiter">
            <div class="container-login100" style="background: url(images/computer.jpg)">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="images/img-01.png" alt="IMG">
                        <%--imagenlogin--%>
                    </div>

                    <div class="login100-form">
                        <span class="login100-form-title">Iniciar Sesión </span>

                        <!--Usuario-->
                        <div class="wrap-input100 form-group">
                            <input runat="server" id="user" class="input100" type="text" name="user" placeholder="Usuario" required />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <!--Clave-->
                        <div class="wrap-input100 form-group">
                            <input runat="server" id="pass" class="input100" type="password" name="pass" placeholder="Contraseña" data-maxlength="8" required />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <asp:Button runat="server" ID="iniciarS" OnClick="Prueba_Click" Text="Ingresar" class="login100-form-btn" />
                        </div>
                        <br />
                        <div id="txtContainerMsj" runat="server" class="">
                            <strong id="txtHeaderMsj" runat="server"></strong>
                            <p id="txtBodyMsj" runat="server"></p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>



    <!--===============================================================================================-->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/tilt/tilt.jquery.min.js"></script>
    <script>
        $('.js-tilt').tilt({
            scale: 1.1
        })
    </script>
    <!--===============================================================================================-->
</body>
</html>
