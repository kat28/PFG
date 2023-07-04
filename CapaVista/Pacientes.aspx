<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="Pacientes.aspx.cs" Inherits="Pacientes" %>


<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--SEC-1--%>
    <div class="container mx-auto">
        <%--Titulo--%>
        <div class="col-lg-12">
            <h3 class="text-center">Registro pacientes</h3>
            <hr />
        </div>
         <%--END Titulo--%>

        <%--BT--%>
        <div>
            <%-- Acciones CRUD --%>
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-2 col-sm-offset-4">
                        <a href="AgregarPaciente.aspx">
                            <img src="images/icons/198-add-user.png" class="img-responsive" style="width: 27%">
                            <p>Agregar Paciente</p>
                        </a>
                    </div>
<%--                    <div class="col-sm-2 col-sm-offset-1">
                        <a id="popup" href='Credenciales.aspx'>
                            <img src="images/icons/217-user.png" class="img-responsive" style="width: 27%">
                            <p>Administrar Usuarios</p>
                        </a>
                    </div>--%>
                </div>
                <hr />
            </div>
            <%-- END Acciones-CRUD --%>
        </div>

        <%--DATAGRIDVIEW--%>
        <div class="table-responsive text-wrap" runat="server">

            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourcePacientes" HorizontalAlign="Center" AllowPaging="True"
                EmptyDataText="No hay registros..." OnPreRender="GridView1_PreRender" PageSize="6"
                CssClass="table table-hover table-bordered table-sm" AutoGenerateColumns="False" DataKeyNames="IdPersona">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <a id="popup" class="btn btn-info btn-xs text-dark" href='ModificarPaciente.aspx?id=<%# Eval("IdPersona") %>'>Modificar</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" ItemStyle-CssClass="text-center" DataField="IdPersona" HeaderText="IdPersona" Visible="False" InsertVisible="False" SortExpression="IdPersona" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" ItemStyle-CssClass="text-center" DataField="NumCedula" HeaderText="Número Cédula" SortExpression="NumCedula"></asp:BoundField>
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblNombreC" Text='<%# Eval("NomPersona") +" "+ Eval("PrimerApellido") +" "+ Eval("SegundoApellido") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label runat="server" ID="lblNombre" HeaderStyle-CssClass="text-center bg-warning" Text='<%# Eval("NomPersona") %>' />
                            <asp:Label runat="server" ID="lblAP1" HeaderStyle-CssClass="text-center bg-warning" Text='<%# Eval("PrimerApellido") %>' />
                            <asp:Label runat="server" ID="lblAP2" HeaderStyle-CssClass="text-center bg-warning" Text='<%# Eval("SegundoApellido") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="FecNacimiento" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center bg-warning" HeaderText="Fecha Nacimiento" SortExpression="FecNacimiento" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Genero" SortExpression="CodGenero">
                        <ItemTemplate>
                            <asp:Label ID="lblGenero" runat="server" Text='<%# Bind("CodGenero") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Estado Civil" SortExpression="CodEstadoCivil">
                        <ItemTemplate>
                            <asp:Label ID="lblEstadoCivil" runat="server" Text='<%# Bind("CodEstadoCivil") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Convenio" SortExpression="NombreConvenio">
                        <ItemTemplate>
                            <asp:Label ID="lblConvenio" runat="server" Text='<%# Bind("NombreConvenio") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" ItemStyle-CssClass="text-center" DataField="NumTelefono" HeaderText="Teléfono" SortExpression="NumTelefono"></asp:BoundField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" ItemStyle-CssClass="text-center" DataField="CorreoElectronico" HeaderText="Correo" SortExpression="CorreoElectronico"></asp:BoundField>
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Domicilio">
                        <ItemTemplate>
                            <a id="popup" class="btn btn-info btn-xs text-dark" href='MostrarLocalizacion.aspx?id=<%# Eval("IdPersona") %>'>Mostrar</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="mjsPagina" runat="server"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSourcePacientes" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerPaciente" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <%--END SEC-2--%>

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
