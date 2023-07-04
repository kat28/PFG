<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="Empleado.aspx.cs" Inherits="Empleado" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--SEC-1--%>
    <div class="container mx-auto">
        <%--Titulo--%>
        <div class="col-md-12">
            <h3 class="text-center">Registro Empleados</h3>
            <hr />
        </div>
        <%--END Titulo--%>

        <%--BT--%>
        <div>
            <%-- Acciones CRUD --%>
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-2 col-sm-offset-4">
                        <a href="AgregarEmpleado.aspx">
                            <img src="images/icons/198-add-user.png" class="img-responsive" style="width: 27%">
                            <p>Agregar Empleado</p>
                        </a>
                    </div>
                    <div class="col-sm-2 col-sm-offset-1">
                        <a id="popup" href='Credenciales.aspx'>
                            <img src="images/icons/217-user.png" class="img-responsive" style="width: 27%">
                            <p>Gestionar Usuarios</p>
                        </a>
                    </div>
                </div>
                <hr />
            </div>
            <%-- END Acciones-CRUD --%>
        </div>


        <%--DATAGRIDVIEW--%>
        <div class="table-responsive text-wrap" runat="server">
            <%--<h4 class="text-left text-success font-weight-bold">Ver Inventario</h4>--%>
            <br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceEmpleado" HorizontalAlign="Center" AllowPaging="True"
                EmptyDataText="No hay registros..." OnPreRender="GridView1_PreRender" PageSize="6"
                CssClass="table table-hover table-bordered table-sm" AutoGenerateColumns="False" DataKeyNames="IdPersona">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <a id="popup" class="btn btn-info btn-xs text-dark" href='ModificarEmpleado.aspx?id=<%# Eval("IdPersona") %>'>Modificar</a>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField HeaderStyle-CssClass="text-center bg-info" DataField="IdPersona" HeaderText="IdPersona" InsertVisible="False" ReadOnly="True" SortExpression="IdPersona" Visible="False" />
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-info" DataField="NumCedula" HeaderText="Número de Cédula" SortExpression="NumCedula" />
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblNombreC" Text='<%# Eval("NomPersona") +" "+ Eval("PrimerApellido") +" "+ Eval("SegundoApellido") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label runat="server" ID="lblNombre" HeaderStyle-CssClass="text-center bg-info" Text='<%# Eval("NomPersona") %>' />
                            <asp:Label runat="server" ID="lblAP1" HeaderStyle-CssClass="text-center bg-info" Text='<%# Eval("PrimerApellido") %>' />
                            <asp:Label runat="server" ID="lblAP2" HeaderStyle-CssClass="text-center bg-info" Text='<%# Eval("SegundoApellido") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-info" DataField="FecNacimiento" HeaderText="Fecha Nacimiento" SortExpression="FecNacimiento" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderText="Genero" SortExpression="CodGenero">
                        <ItemTemplate>
                            <asp:Label ID="lblGenero" runat="server" Text='<%# Bind("CodGenero") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderText="Estado Civil" SortExpression="CodEstadoCivil">
                        <ItemTemplate>
                            <asp:Label ID="lblEstadoCivil" runat="server" Text='<%# Bind("CodEstadoCivil") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-info" ItemStyle-CssClass="text-center" DataField="NumTelefono" HeaderText="Teléfono" SortExpression="NumTelefono"></asp:BoundField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-info" ItemStyle-CssClass="text-center" DataField="CorreoElectronico" HeaderText="Correo" SortExpression="CorreoElectronico"></asp:BoundField>
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderText="Puesto" SortExpression="CodPuesto">
                        <ItemTemplate>
                            <asp:Label ID="lblPuesto" runat="server" Text='<%# Bind("CodPuesto") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-info" DataField="CodMedico" HeaderText="Carné Médico" SortExpression="CodMedico" />
                    <asp:TemplateField HeaderText="Domicilio">
                        <ItemTemplate>
                            <a id="popup" class="btn btn-info btn-xs" href='MostrarLocalizacion.aspx?id=<%# Eval("IdPersona") %>'>Mostrar</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="mjsPagina" runat="server"></asp:Label>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceEmpleado" ConnectionString='<%$ ConnectionStrings:proyConnectionString %>' SelectCommand="sp_ObtenerEmpleado" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
        <%--END DATAGRIDVIEW--%>
    </div>
    <br />
    <br />
    <br />
    <br />
    <%--END SEC-1--%>


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js"></script>
    <link type="text/css" rel="Stylesheet" href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/themes/smoothness/jquery-ui.css">
</asp:Content>

