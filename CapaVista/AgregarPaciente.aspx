<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="AgregarPaciente.aspx.cs" Inherits="AgregarPaciente" %>


<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--SEC-1--%>
    <div class="probootstrap-appointment mx-4 pl-4">
    <div class="col-lg-12">
        <h3 class="text-center">Registro de pacientes</h3>
        <hr />
    </div>
    <div class="container-fluid mx-auto row ">

        <%--C1--%>
        <div class="col-lg-5">
            <div class="col-lg-12">
                <h4 class="text-center text-success font-weight-bold">Información Personal</h4>
                <br />
            </div>

            <%--F1--%>
            <div class="row">
                <div class="col-lg-4">
                    <h4 class="text-info">Nombre</h4>
                    <asp:textbox runat="server" id="txtNombre" cssclass="form-control"></asp:textbox>
                    <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtNombre" errormessage="El campo es obligatorio" />
                </div>
                <div class="col-lg-4">
                    <h4 class="text-info">Primer Apellido</h4>
                    <asp:textbox runat="server" id="txtApellido1" cssclass="form-control"></asp:textbox>
                    <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtApellido1" errormessage="El campo es obligatorio" />
                </div>
                <div class="col-lg-4">
                    <h4 class="text-info">Segundo Apellido</h4>
                    <asp:textbox runat="server" id="txtApellido2" cssclass="form-control"></asp:textbox>
                    <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator4" controltovalidate="txtApellido2" errormessage="El campo es obligatorio" />
                </div>
            </div>
            <br />

            <%--F2--%>
            <div class="row">
                <div class="col-lg-4">
                    <h4 class="text-info">Tipo de Cédula</h4>
                    <asp:dropdownlist id="cmbTipoCedula" runat="server" cssclass="form-control dropdown" style="height: 34px" datasourceid="SqlDataSourceTipoCedula" datatextfield="Descripcion" datavaluefield="CodTipo"></asp:dropdownlist>
                    <asp:sqldatasource id="SqlDataSourceTipoCedula" runat="server" connectionstring="<%$ ConnectionStrings:proyConnectionString %>" selectcommand="sp_ObtenerTipoCedula" selectcommandtype="StoredProcedure"></asp:sqldatasource>
                </div>

                <div class="col-lg-4">
                    <h4 class="text-info">Número Cédula:</h4>
                    <asp:textbox runat="server" id="txtNumCedula" cssclass="form-control"></asp:textbox>
                    <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtNumCedula" errormessage="El campo es obligatorio" />
                </div>

                <div class="col-lg-4">
                    <h4 class="text-info">Convenio</h4>
                    <asp:dropdownlist id="Convenio" runat="server" cssclass="form-control" style="height: 34px" datasourceid="SqlDataSourceConvenio" datatextfield="NombreConvenio" datavaluefield="CodConvenio">
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:sqldatasource id="SqlDataSourceConvenio" runat="server" connectionstring="<%$ ConnectionStrings:proyConnectionString %>" selectcommand="sp_ObtenerConvenios" selectcommandtype="StoredProcedure"></asp:sqldatasource>
                </div>
            </div>
            <br />

            <%--F3--%>
            <div class="row">
                <br />

                <div class="col-lg-4">
                    <h4 class="text-info">Genero</h4>
                    <asp:dropdownlist id="Genero" runat="server" cssclass="form-control" style="height: 35px" datasourceid="SqlDataSourceObtenerGenero" datatextfield="Descripcion" datavaluefield="CodTipo">
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:sqldatasource id="SqlDataSourceObtenerGenero" runat="server" connectionstring="<%$ ConnectionStrings:proyConnectionString %>" selectcommand="sp_ObtenerGenero" selectcommandtype="StoredProcedure"></asp:sqldatasource>
                </div>
                <div class="col-lg-4">
                    <h4 class="text-info">Estado civil</h4>
                    <asp:dropdownlist id="EstadoCivil" runat="server" cssclass="form-control" style="height: 35px" datasourceid="SqlDataSourceEstadoCivil" datatextfield="Descripcion" datavaluefield="CodTipo">
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:sqldatasource id="SqlDataSourceEstadoCivil" runat="server" connectionstring="<%$ ConnectionStrings:proyConnectionString %>" selectcommand="sp_ObtenerEstadoCivil" selectcommandtype="StoredProcedure"></asp:sqldatasource>
                </div>

                <div class="col-lg-4">
                    <h4 class="text-info">Fecha de nacimiento</h4>
                    <div class="input-group">
                        <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                            <input runat="server" id="fecNacimiento" style="height: 34px; width: 150px" format="yyyy-mm-dd" class="form-control" autopostback="true" size="16" type="date" readonly />
                            <span class="input-group-addon" style="color:white" ><i class="glyphicon glyphicon-calendar" style="color:white"></i></span>
                        </div>
                        <input type="hidden" id="dtp_input2" value="" />
                    </div>

                    <asp:comparevalidator id="Comparevalidator1" runat="server" errormessage="Debe ingresar una fecha válida"
                        operator="LessthanEqual" controltovalidate="fecNacimiento" type="string" display="Dynamic" />

                    <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator7" controltovalidate="fecNacimiento" errormessage="El campo es obligatorio" />
                
                
                </div>

            </div>
        </div>


        <%--C2--%>
        <div class="col-lg-3">

            <div class="col-lg-12 ">
                <h4 class="text-right text-success font-weight-bold">Dirección de domicilio actual</h4>
                <br />
            </div>

            <%--F4--%>
            <div class="row">
                <br />
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <h4 class="text-info">Provincia</h4>
                    <asp:dropdownlist id="Provincia" runat="server" autopostback="true" cssclass="form-control dropdown" style="height: 35px; top: 0px; left: 0px;" datasourceid="SqlDataSourceProvincia" datatextfield="NomProvincia" datavaluefield="CodProvincia" onselectedindexchanged="PListDropDown_Change" appenddatabounditems="True">
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:sqldatasource id="SqlDataSourceProvincia" runat="server" connectionstring="<%$ ConnectionStrings:proyConnectionString %>" selectcommand="sp_ObtenerProvincia" selectcommandtype="StoredProcedure"></asp:sqldatasource>
                </div>
            </div>

            <%--F5--%>
            <div class="row">
                <br />
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <h4 class="text-info">Cantón</h4>
                    <asp:dropdownlist id="Canton" cssclass="form-control" style="height: 35px" autopostback="True" onselectedindexchanged="CListDropDown_Change" runat="server" appenddatabounditems="True">
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:dropdownlist>

                    <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator8" controltovalidate="canton" errormessage="El campo es obligatorio" />
                

                </div>
            </div>

            <%--F6--%>
            <div class="row">
                <br />
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <h4 class="text-info">Distrito:</h4>
                    <asp:dropdownlist id="Distrito" runat="server" cssclass="form-control" style="height: 35px" appenddatabounditems="True">
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:dropdownlist>
                </div>

            </div>

            <%--F7--%>
            <div class="row">
                <br />
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <h4 class="text-info">Dirección Exacta:</h4>
                    <asp:textbox runat="server" id="txtDireccionExacta" cssclass="form-control" maxlength="150"></asp:textbox>
                    <br />
                </div>
            </div>
        </div>


        <%--C3--%>
        <div class="col-lg-4">
            <div class="col-lg-12">
                <h4 class="text-center text-success font-weight-bold">Información de contacto</h4>
                <br />
            </div>

            <%--F4--%>
            <div class="row">
                <br />
                <div class="col-sm-1"></div>
                <div class="col-lg-4">
                    <h4 class="text-info">Tipo </h4>
                    <asp:dropdownlist id="TipoTelefono" runat="server" cssclass="form-control" style="height: 35px" datasourceid="SqlDataSourceTelefono" datatextfield="Descripcion" datavaluefield="CodTipo">
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:sqldatasource id="SqlDataSourceTelefono" runat="server" connectionstring="<%$ ConnectionStrings:proyConnectionString %>" selectcommand="sp_ObtenerTipoTelefono" selectcommandtype="StoredProcedure"></asp:sqldatasource>
                </div>
                <div class="col-lg-7">
                    <h4 class="text-info">Número Teléfono</h4>
                    <input type="tel" runat="server" id="txtNumTelefono" class="form-control" maxlength="15" />
                    <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator5" controltovalidate="txtNumTelefono" errormessage="El campo es obligatorio" />
                </div>
            </div>
            <br />
            <%--F5--%>
            <div class="row">
                <br />
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                    <h4 class="text-info">Tipo </h4>
                    <asp:dropdownlist id="TipoCorreo" runat="server" cssclass="form-control" style="height: 35px" datasourceid="SqlDataSourceCorreo" datatextfield="Descripcion" datavaluefield="CodTipo">
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:sqldatasource id="SqlDataSourceCorreo" runat="server" connectionstring="<%$ ConnectionStrings:proyConnectionString %>" selectcommand="sp_ObtenerTipoCorreo" selectcommandtype="StoredProcedure"></asp:sqldatasource>
                </div>
                <div class="col-sm-7">
                    <h4 class="text-info">Correo Electrónico</h4>
                    <input type="email" runat="server" id="txtCorreo" class="form-control" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtCorreo" runat="server" ErrorMessage="Debe ingresar un correo valido" ValidationExpression="^(?(&quot;)(&quot;.+?(?<!\\)&quot;@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`{}|~\w])*)(?<=[0-9a-z])@))(?([)([(\d{1,3}.){3}\d{1,3}])|(([0-9a-z][-0-9a-z]*[0-9a-z]*.)+[a-z0-9][-a-z0-9]{0,22}[a-z0-9]))$"></asp:RegularExpressionValidator>
               
                    <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator6" controltovalidate="txtCorreo" errormessage="El campo es obligatorio" />
                    
                    
                </div>
            </div>

        </div>
    </div>

    <%--BOTONES--%>
    <div class="container mx-auto row ">
        <div class="col-sm-4"></div>
        <div class="col-lg-2 mx-auto">
            <br />
            <br />
            <asp:button runat="server" id="Button1" onclick="Agregar_Click" text="Agregar" class="btn btn-info bg-info btn-sm" />
        </div>
        <div class="col-lg-6">
            <br />
            <br />
            <asp:hyperlink id="HyperLink2" runat="server" class="btn btn-danger btn-sm" navigateurl="~/Pacientes.aspx" text="Cancelar"></asp:hyperlink>
        </div>

    </div>
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
            autoclose: 1,
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

