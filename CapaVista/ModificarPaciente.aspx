<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="ModificarPaciente.aspx.cs" Inherits="ModificarPaciente" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--SEC-1--%>
    <div class="container mx-auto">

        <div class="col-md-12">
            <h3 class="text-center">Actualizar datos del paciente</h3>
        </div>
        <hr />

        <div class="col-md-12">
            <h4 class="text-center text-success ">Información Personal </h4>
        </div>

        <div class="form-group row">

            <%--F1--%>
            <div class="col-md-4">
                <br />
                <h4>Nombre</h4>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtNombre" ErrorMessage="El campo no puede estar vacio" />

                <h4>Tipo de Cédula:</h4>
                <asp:DropDownList ID="cmbTipoCedula" runat="server" CssClass="form-control dropdown" Style="height: 35px" DataSourceID="SqlDataSourceTipoCedula" DataTextField="Descripcion" DataValueField="CodTipo"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceTipoCedula" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerTipoCedula" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />

                <h4>Genero:</h4>
                <asp:DropDownList ID="Genero" runat="server" CssClass="form-control" Style="height: 35px" DataSourceID="SqlDataSourceObtenerGenero" DataTextField="Descripcion" DataValueField="CodTipo"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceObtenerGenero" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerGenero" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />


            </div>

            <%--F2--%>
            <div class="col-md-4">
                <br />
                <h4 class="">Primer Apellido</h4>
                <asp:TextBox runat="server" ID="txtApellido1" CssClass="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtApellido1" ErrorMessage="El campo es obligatorio" />
                <br />

                <h4>Número Cédula:</h4>
                <asp:TextBox runat="server" ID="txtNumCedula" CssClass="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtNumCedula" ErrorMessage="El campo es obligatorio" />
                <br />

                <h4>Estado civil:</h4>
                <asp:DropDownList ID="EstadoCivil" runat="server" CssClass="form-control" Style="height: 35px" DataSourceID="SqlDataSourceEstadoCivil" DataTextField="Descripcion" DataValueField="CodTipo"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceEstadoCivil" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerEstadoCivil" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>

            <%--F3--%>
            <div class="col-md-4">
                <br />
                <h4>Segundo Apellido:</h4>
                <asp:TextBox runat="server" ID="txtApellido2" CssClass="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtApellido2" ErrorMessage="El campo es obligatorio" />
                <br />

                <h4>Fecha de nacimiento:</h4>
                <div class="input-group">
                    <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                        <input runat="server" id="fecNacimiento" format="yyyy-mm-dd" class="form-control" size="16" autopostback="true" type="date" readonly />
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar" style="color: white"></i></span>
                    </div>
                    <input type="hidden" runat="server" id="dtp_input2" value="" />
                </div>
                
                <asp:CompareValidator ID="Comparevalidator1" runat="server" ErrorMessage="Debe ingresar una fecha válida"
                    Operator="LessthanEqual" ControlToValidate="fecNacimiento" Type="string" Display="Dynamic" />

                <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator7" controltovalidate="fecNacimiento" errormessage="El campo es obligatorio" />
                

                <br />

                <h4>Convenio:</h4>
                <asp:DropDownList ID="Puesto" runat="server" CssClass="form-control" Style="height: 35px" DataSourceID="SqlDataSourceConvenio" DataTextField="NombreConvenio" DataValueField="CodConvenio"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceConvenio" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerConvenios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
            </div>
        </div>
        <%--CORREO TELEFONO--%>
        <hr />
        <div class="col-md-12">
            <h4 class="text-center text-success py-2">Información de contacto</h4>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <h4>Tipo </h4>
                <asp:DropDownList ID="TipoTelefono" runat="server" CssClass="form-control" Style="height: 35px" DataSourceID="SqlDataSourceTelefono" DataTextField="Descripcion" DataValueField="CodTipo">
                    <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceTelefono" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerTipoTelefono" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
                <h4>Tipo </h4>
                <asp:DropDownList ID="TipoCorreo" runat="server" CssClass="form-control" Style="height: 35px" DataSourceID="SqlDataSourceCorreo" DataTextField="Descripcion" DataValueField="CodTipo">
                    <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCorreo" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerTipoCorreo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>

            <div class="col-md-6">
                <h4>Número Teléfono</h4>
                <input type="tel" runat="server" id="txtNumTelefono" class="form-control" maxlength="15" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtNumTelefono" ErrorMessage="El campo es obligatorio" />
                <br />
                <h4>Correo Electrónico</h4>
                <input type="email" runat="server" id="txtCorreo" class="form-control" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtCorreo" ErrorMessage="El campo es obligatorio" />
            </div>
        </div>

        <%--F5-Botones--%>
        <div>
            <br />
            <asp:Button runat="server" ID="ModificarEmpleadm" OnClick="Modificar_Click" Text="Guardar Cambios" class="btn btn-success bg-success btn-sm" />
            <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-danger btn-sm" NavigateUrl="Pacientes.aspx" Text="Regresar"></asp:HyperLink>
        </div>
    </div>

    <br />
    <br />
    <%--END CONTAINER--%>


    <script type="text/javascript" src="./jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../js/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>
    <script type="text/javascript">

        //Date1 
        $('.form_date').datetimepicker({
            language: 'es',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 0,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            dateFormat: 'yyyy-mm-dd'
        });



        //Time1
        $('.form_time').datetimepicker({
            language: 'es',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 1,
            minView: 0,
            maxView: 1,
            forceParse: 0,
            dateFormat: 'yyyy-mm-dd'
        });
    </script>
</asp:Content>

