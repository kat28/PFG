<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="AsignarCita.aspx.cs" Inherits="AsignarCita" %>


<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--SEC-1--%>
    <div class="container mx-auto">
        <%--F1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Asignación de citas</h3>
                <hr />
            </div>

            <h4 class="text-left text-success font-weight-bold">Información del paciente</h4>
            <br />
            <%--Buscar--%>
            <div class="row">
                <br />
                <div class="col">
                    <div class="col-sm-5">
                        <asp:TextBox runat="server" class="form-control" ID="txtbuscar" placeholder="Ingrese el número de cédula" AutoPostBack="True" />
                         <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator4" controltovalidate="txtbuscar" errormessage="Debe ingresar un número de cédula" />
                
                    </div>
                    <div class="col-sm-3">
                        <asp:Button runat="server" class="btn btn-info btn-sm text-dark" ID="btn_Buscar" type="button" Text="Buscar Cédula" OnClick="buscar_Click" />
                    </div>
                </div>

            </div>
            <br />
            <%--DATAGRIDVIEW--%>
            <div class="table-responsive text-wrap" runat="server">

                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center"
                    AllowPaging="True" CssClass="table table-hover table-bordered table-sm"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceSearch" OnPreRender="GridView1_PreRender"
                    EmptyDataText="No se encontraron resultados." OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="IdPaciente" HeaderText="IdPaciente" SortExpression="IdPaciente" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="IdPersona" HeaderText="IdPersona" SortExpression="IdPersona" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NomPersona" HeaderText="NomPersona" SortExpression="NomPersona" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PrimerApellido" HeaderText="PrimerApellido" SortExpression="PrimerApellido" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="SegundoApellido" HeaderText="SegundoApellido" SortExpression="SegundoApellido" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NumCedula" HeaderText="NumCedula" SortExpression="NumCedula" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="CodGenero" HeaderText="CodGenero" SortExpression="CodGenero" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="FecNacimiento" HeaderText="FecNacimiento" SortExpression="FecNacimiento" HeaderStyle-CssClass="text-center bg-info" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NombreConvenio" HeaderText="NombreConvenio" SortExpression="NombreConvenio" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar Paciente" ControlStyle-CssClass="btn btn-warning bg-warning btn-xs text-dark" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceSearch" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_BuscarPacienteCed" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtbuscar" Name="cedula" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="mjsPagina" runat="server"></asp:Label>
                <p id="txtId" visible="true" runat="server"></p>
            </div>
            <hr />
        </div>

        <%--F2--%>
        <div class="col-lg-12">
            <div class="row">
                <%--MEDICO/SERVICIO--%>
                <div class="col-sm-3">

                    <h4 class="text-left text-success font-weight-bold">Información del profesional</h4>
                    <hr />
                    <p class="h4">Médico: </p>
                    <asp:DropDownList CssClass="form-control text-dark" AutoPostBack="true" Style="height: 30px" ID="Medico" runat="server"
                        DataSourceID="SqlDataSourceCodMedico" DataTextField="Nombre" DataValueField="IdEmpleado"
                        OnSelectedIndexChanged="PListDropDown_Change" AppendDataBoundItems="True">
                        <asp:ListItem>Seleccionar</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCodMedico" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerCodMedico" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <br />

                    <p class="h4">Servicio: </p>
                    <asp:DropDownList ID="Servicio" runat="server" CssClass="form-control" Style="height: 35px" AppendDataBoundItems="True" DataSourceID="SqlDataSourceObtenerServicio" DataTextField="NomServicio" DataValueField="CodServicio">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceObtenerServicio" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerServicios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </div>

                <%--CALENDARIO--%>

                <div class="col-sm-3 col-sm-offset-1">
                    <h4 class="text-right text-success font-weight-bold">Disponibilidad</h4>
                    <hr />
                    <p class="h4">Fecha: </p>
                    <asp:Calendar ID="CalendarioCita" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Arial Black" Font-Size="Small" ForeColor="#003399" Height="200px" Width="220px"
                        OnSelectionChanged="CalendarioCita_SelectionChanged" OnDayRender="CalendarioCita_DayRender" Font-Bold="True">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                    <%-- TEXTBOX --%>
                    <asp:TextBox runat="server" Visible="false" ID="txtCalendario"> </asp:TextBox>
                    <asp:TextBox runat="server" Visible="false" ID="txtCodMedico"> </asp:TextBox>
                    <asp:TextBox runat="server" Visible="false" ID="txtHora"> </asp:TextBox>
                </div>

                <%--HORAS--%>
                <div class="col-sm-3 col-sm-offset-1">
                    <h4 class="text-left text-success font-weight-bold">Horarios</h4>
                    <hr />

                    <p class="h4">Hora: </p>
                    <asp:ListBox ID="ListBoxHoras" CssClass=" form-control text-primary" AutoPostBack="true" runat="server" OnSelectedIndexChanged="listahoras_SelectedIndexChanged" DataSourceID="SqlDataSourceHoras" DataTextField="Descripcion" DataValueField="Descripcion" Font-Bold="True" Font-Names="Arial Black" Font-Size="Small" ForeColor="#000066" Rows="7" Width="100px"></asp:ListBox>

                    <asp:SqlDataSource ID="SqlDataSourceHoras" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerHoras" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:Button runat="server" ID="Button1" OnClick="disponibilidad_Click" Text="Ver Disponibilidad" class="btn btn-warning bg-warning btn-sm text-dark" />
                    <br />
                </div>
            </div>
            <br />
            <div id="txtContainerMsj" runat="server" class="">
                <strong id="txtHeaderMsj" runat="server"></strong>
                <p id="txtBodyMsj" runat="server"></p>
            </div>
        </div>
        <%--F5-Botones--%>
        <div>
            <br />
            <asp:Button runat="server" ID="agregarCita" Text="Agregar Cita" OnClick="agregar_Click" Visible="false" class="btn btn-success bg-success btn-sm" />
            <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-danger btn-sm" NavigateUrl="Citas.aspx" Text="Regresar"></asp:HyperLink>
        </div>
    </div>

    <br />
    <br />
    <br />
    <br />
    <%--END CONTAINER--%>

    <script type="text/javascript" src="./jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../js/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>
</asp:Content>

