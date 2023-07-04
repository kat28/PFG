<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="HistoriaClinica.aspx.cs" Inherits="HistoriaClinica" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--SEC-1--%>
    <div class="container mx-auto">
        <div class="col-lg-12">
            <h3 class="text-center">Expediente Clínico</h3>
            <hr />
        </div>
        <%--C1--%>
        <div class="col-lg-5">
            <br />
            <div class="well">
                <p class="h4">Paciente</p>
                <br />
                <p id="txtNombre" runat="server"></p>
                <p id="txtCedula" runat="server"></p>
                <p id="txtGenero" runat="server"></p>
                <p id="txtEdad" runat="server"></p>
                <p id="txtConv" runat="server"></p>
                <asp:TextBox ID="txtIdPer" runat="server" Visible="false"></asp:TextBox>
            </div>
        </div>

        <%--C2--%>
        <div class="col-lg-5">

            <div class="col-lg-12 ">
                <h4 class="text-center text-success font-weight-bold">Crear nueva consulta</h4>
                <br />
            </div>

            <%--F6--%>
            <div class="row">
                <br />
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <h4 class="text-info">Tipo Consulta</h4>
                    <asp:DropDownList ID="Servicio" runat="server" Enabled="false" CssClass="form-control" Style="height: 30px" AppendDataBoundItems="True" DataSourceID="SqlDataSourceObtenerServicio" DataTextField="NomServicio" DataValueField="CodServicio">
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceObtenerServicio" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerServicios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </div>
            </div>

            <%--F4--%>
            <div class="row">
                <br />
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <h4 class="text-info">Médico</h4>
                    <asp:DropDownList CssClass="form-control  text-dark" Enabled="false" Style="height: 30px" ID="Medico" runat="server" DataSourceID="SqlDataSourceCodMedico" DataTextField="Nombre" DataValueField="IdEmpleado">
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCodMedico" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerCodMedico" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </div>
            </div>

            <%--BOTONES--%>
            <div class="col-sm-2"></div>
            <div class="col-lg-4 ">
                <br />
                <br />
                <asp:Button runat="server" ID="Button2" OnClick="Agregar_Click" Text="Iniciar consulta" class="btn btn-info bg-info btn-sm" />
                <%--<asp:HyperLink ID="btnSubmit" runat="server" class="btn btn-info bg-info btn-sm" NavigateUrl="ModificarLocalizacion.aspx" Text="Modificar"></asp:HyperLink>--%>
            </div>
            <div class="col-lg-4 col-sm-offset-2">
                <br />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-danger btn-sm" NavigateUrl="~/ExpedienteClinico.aspx" Text="Regresar"></asp:HyperLink>
            </div>

        </div>
    </div>
    <br />

    <%--C2--%>
    <div class="container mx-auto" runat="server">
        <div class="col-lg-12">
            <br />
            <h3 class="text-center">Historial Consultas</h3>
            <hr />
            <asp:TextBox runat="server" ID="txtIdCita" Visible="false"></asp:TextBox>
        </div>
        <div class="table-responsive text-wrap" runat="server">
            <%--DATAGRIDVIEW--%>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceHistoricoConsultas" HorizontalAlign="Center" AllowPaging="True"
                CssClass="table table-hover table-bordered table-sm" DataKeyNames="IdHistoriaClinica" AutoGenerateColumns="False" PageSize="5" OnRowUpdating="GridView1_RowUpdating"
                OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                <Columns>

                    <asp:TemplateField HeaderStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Button ID="btn_Edit" runat="server" Text="Mostrar" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button runat="server" type="button" Text="Detalle" class="btn btn-warning btn-xs" OnClick="Red_Click" />
                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancelar" CommandName="Cancel" class="btn btn-info bg-info btn-xs" />
                        </EditItemTemplate>
                        <HeaderStyle Width="150px"></HeaderStyle>
                    </asp:TemplateField>

                    <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" ReadOnly="true" ItemStyle-HorizontalAlign="Center" DataField="FecConsulta" HeaderText="Fecha Consulta" SortExpression="FecConsulta" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false">
                        <HeaderStyle CssClass="text-center bg-warning"></HeaderStyle>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Médico" SortExpression="IdEmpleado">
                        <ItemTemplate>
                            <asp:DropDownList CssClass="form-control text-dark" Style="height: 30px" ID="Medico" runat="server" Text='<%# Bind("IdEmpleado") %>' DataSourceID="SqlDataSourceCodMedico" DataTextField="Nombre" DataValueField="IdEmpleado" Enabled="false"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCodMedico" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerCodMedico" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center bg-warning" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Tipo Consulta" SortExpression="CodServicio">
                        <ItemTemplate>
                            <asp:DropDownList CssClass="form-control text-dark" Style="height: 30px" ID="Servicio" runat="server" Text='<%# Bind("CodServicio") %>' DataSourceID="SqlDataSourceObtenerServicio" DataTextField="NomServicio" DataValueField="CodServicio" Enabled="false"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceObtenerServicio" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerServicios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </ItemTemplate>

                        <HeaderStyle CssClass="text-center bg-warning"></HeaderStyle>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblPaciente1" Text='<%# Bind("IdPaciente") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label runat="server" ID="lblPaciente" Text='<%# Bind("IdPaciente") %>' Visible="false"></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblHistoria1" Text='<%# Bind("IdHistoriaClinica") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label runat="server" ID="lblHistoria" Text='<%# Bind("IdHistoriaClinica") %>' Visible="false"></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceHistoricoConsultas" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerHistoriaClinicaID" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtIdPer" Name="ID_Persona" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="mjsPagina" runat="server"></asp:Label>

        </div>

        <asp:SqlDataSource ID="SqlDataSourceCitasID" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerCitaID" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtIdCita" Name="Cita" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>



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
