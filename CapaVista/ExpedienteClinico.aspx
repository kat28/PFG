<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="ExpedienteClinico.aspx.cs" Inherits="ExpedienteClinico" %>


<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--SEC-1--%>
    <div class="container mx-auto">
        <%--C1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Expediente Clínico</h3>
                <hr />
                <h4 class="text-center text-success font-weight-bold">Lista Pacientes</h4>
                <br />
            </div>

        </div>
        <div class="table-responsive text-wrap" runat="server">
            <%--DATAGRIDVIEW--%>
            <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center"
                AllowPaging="True" CssClass="table table-hover table-bordered table-sm"
                AutoGenerateColumns="False" DataSourceID="SqlDataSourceCitas"
                EmptyDataText="No se encuentran citas agendadas..."
                OnPreRender="GridView1_PreRender" OnRowEditing="GridView1_RowEditing" PageSize="5"
                OnRowUpdating="GridView1_Updating" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="IdCitaMedica">
                <Columns>

                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <a id="popup" class="btn btn-warning bg-warning btn-xs text-dark" href='HistoriaClinica.aspx?id=<%# Eval("IdPersona")%>&m=<%#Eval("CodMedico")%>&d=<%#Eval("CodServicio")%>&i=<%#Eval("IdCitaMedica")%>'>Historia Clínica</a>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="IdLogin" Visible="false" HeaderStyle-CssClass="text-center bg-info">
                        <ItemTemplate>
                            <asp:Label ID="lbl_IdCitaMedica1" runat="server" Text='<%#Eval("IdCitaMedica")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lbl_IdCitaMedica" runat="server" Text='<%#Eval("IdCitaMedica")%>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="IdPaciente" Visible="false" HeaderStyle-CssClass="text-center bg-info">
                        <ItemTemplate>
                            <asp:Label ID="lbl_IdPaciente1" runat="server" Text='<%#Eval("IdPaciente")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lbl_IdPaciente" runat="server" Text='<%#Eval("IdPaciente")%>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Nombre" HeaderStyle-Width="550px" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" HeaderStyle-CssClass="text-center bg-info" />
                    <asp:BoundField DataField="FecCita" HeaderStyle-Width="150px" HeaderText="FecCita" ReadOnly="True" SortExpression="FecCita" HeaderStyle-CssClass="text-center bg-info" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />

                    <asp:TemplateField HeaderText="FecCita" Visible="false" HeaderStyle-CssClass="text-center bg-info">
                        <ItemTemplate>
                            <asp:Label ID="lbl_FecCita1" runat="server" ReadOnly="True" Text='<%#Eval("FecCita")%>' DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lbl_FecCita" runat="server" Text='<%#Eval("FecCita")%>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderStyle-Width="145px" ItemStyle-CssClass="text-center" HeaderText="Hora Cita" SortExpression="CodPuesto">
                        <ItemTemplate>
                            <asp:Label ID="txtHoraCita1" ReadOnly="True" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 145px" Text='<%#Eval("HoraCita")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="txtHoraCita" ReadOnly="True" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 145px" Text='<%#Eval("HoraCita")%>'></asp:Label>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderStyle-Width="200px" ItemStyle-CssClass="text-center" HeaderText="Tipo Consulta" SortExpression="CodPuesto">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddl_CodServicio1" ReadOnly="True" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 200px" Text='<%#Eval("CodServicio")%>' DataSourceID="SqlDataSourceServicio" DataTextField="NomServicio" DataValueField="CodServicio" Enabled="false"></asp:DropDownList>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_CodServicio" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 200px" Text='<%#Eval("CodServicio")%>' DataSourceID="SqlDataSourceServicio" DataTextField="NomServicio" DataValueField="CodServicio"></asp:DropDownList>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderStyle-Width="300px" ItemStyle-CssClass="text-center" HeaderText="Doctor(a)" SortExpression="CodMedico">
                        <ItemTemplate>
                            <asp:Label ID="txtCodMedico1" runat="server" Text='<%#Eval("NomDoctor")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="txtCodMedico" ReadOnly="True" runat="server" Style="height: 30px; width: 250px" CssClass="form-control text-dark" Text='<%#Eval("NomDoctor")%>'></asp:Label>
                            <asp:Label ID="txtCodMedico1" Visible="false" runat="server" Style="height: 30px; width: 250px" CssClass="form-control text-dark" Text='<%#Eval("CodMedico")%>'></asp:Label>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NombreConvenio" ReadOnly="True" HeaderText="Convenio" SortExpression="NombreConvenio" HeaderStyle-CssClass="text-center bg-info" />

                    <asp:BoundField DataField="Descripcion" HeaderStyle-Width="200px" HeaderText="Estado" ReadOnly="True" SortExpression="Descripcion" HeaderStyle-CssClass="text-center bg-info" />



                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_Edit" runat="server" class="btn btn-info bg-info btn-xs tex-dark" Text="Editar" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_Update" runat="server" Text="Actualizar" CommandName="Update" class="btn btn-warning bg-warning btn-xs" />
                            <asp:Button ID="btn_Cancel" runat="server" Text="Salir" CommandName="Cancel" class="btn btn-info bg-info btn-xs" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCitas" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerCitas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceMedico" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerCodMedico" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceServicio" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerServicios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:Label ID="mjsPagina" runat="server"></asp:Label>
        </div>

        <br />
    </div>
    <%--BOTONES--%>
    <div class="container mx-auto row ">
        <div class="col-lg-6">
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-danger btn-sm" NavigateUrl="~/Empleado.aspx" Text="Regresar"></asp:HyperLink>
        </div>

    </div>
    <br />
    <br />
    <br />
    <%--END SEC-1--%>



















    <%--SEC-2--%>
    <%--    <div class="container-fluid col-lg-12 form-group" runat="server">
        <br />
        <div class="col-lg-12">
            <h3 class="text-center">Expediente Clínico</h3>
            <hr />
        </div>

        <div class="well w-25">
            <h4>Buscar Paciente</h4>
            <label class="radio-inline"><input type="radio" name="optCedula" checked>Por cédula</label>

                <input id="txtBuscar" runat="server" style="height: 34px" class="form-control" type="text" placeholder="Buscar.." /><br />
                <asp:Button runat="server" ID="Button1" OnClick="Buscar_Click" Text="Buscar" class="btn btn-info bg-info btn-xm"/> 



            <%--            <p id="txtNombre" runat="server"></p>
            <p id="txtCedula" runat="server"></p>
            <p id="txtGenero" runat="server"></p>
            <p id="txtEdad" runat="server"></p>
            <p id="txtConv" runat="server"></p>
        </div>--%>

    <%--DATAGRIDVIEW 1
        <div class="table-responsive text-wrap" runat="server">
            
            <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AllowPaging="True"
                CssClass="table table-hover table-bordered table-sm" AutoGenerateColumns="False" DataKeyNames="IdPersona" PageSize="5">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <a id="popup" class="btn btn-info btn-xs text-dark" href='ModificarPaciente.aspx?id=<%# Eval("IdPersona") %>'>Modificar</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" ItemStyle-CssClass="text-center" DataField="IdPaciente" HeaderText="IdPaciente" Visible="False" InsertVisible="False" SortExpression="IdPaciente" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" DataField="FecConsulta" ItemStyle-CssClass="text-center"  HeaderText="Fecha Consulta" SortExpression="FecConsulta" />
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" ItemStyle-CssClass="text-center" DataField="IdEmpleado" HeaderText="Médico" SortExpression="IdEmpleado"></asp:BoundField>
                    <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" ItemStyle-CssClass="text-center" DataField="CodServicio" HeaderText="Tipo Consulta" SortExpression="CodServicio"></asp:BoundField>
                    <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Direccion">
                        <ItemTemplate>
                            <a id="popup" class="btn btn-info btn-xs text-dark" href='MostrarLocalizacion.aspx?id=<%# Eval("IdPaciente") %>'>Mostrar</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="mjsPagina" runat="server"></asp:Label>--%>
    <%--<asp:SqlDataSource ID="SqlDataSourcePacientes" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerPaciente" SelectCommandType="StoredProcedure"></asp:SqlDataSource>--%>

    <%--<asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Visible="False" />
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />--%>
    <%--END SEC-2--%>

    <script type="text/javascript" src="./jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../js/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>
</asp:Content>
