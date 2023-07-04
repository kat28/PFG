<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="Citas.aspx.cs" Inherits="Citas" %>



<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--SEC-1--%>
    <div class="container mx-auto">
        <%--C1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Registro de citas</h3>
            </div>
        </div>
        <div class="col-lg-12">
            <%--C1.5--%>
            <hr />
            <%-- <h4 class="text-left text-success font-weight-bold">Ver Inventario</h4>--%>

            <asp:HyperLink ID="HyperLink3" runat="server" class="btn btn-warning bg-warning btn-sm text-dark" NavigateUrl="AsignarCita.aspx" Text="Asignar Citas"></asp:HyperLink>
            <%--<asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-info btn-sm text-dark" NavigateUrl="HistorialCita.aspx" Text="Historial Citas"></asp:HyperLink>--%>
        </div>

        <br />
        <%--C2--%>
        <div class="col-lg-12 form-group" runat="server">
            <div class="col-lg-12">
                <h4 class="text-left text-success font-weight-bold">Citas del día</h4>
                <hr />
            </div>

            <div class="table-responsive text-wrap" runat="server">
 <%--DATAGRIDVIEW--%>
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center"
                    AllowPaging="True" CssClass="table table-hover table-bordered table-sm"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceCitas"
                    EmptyDataText="No se encuentran citas agendadas..."
                    OnPreRender="GridView1_PreRender" OnRowEditing="GridView1_RowEditing" PageSize="4"
                    OnRowUpdating="GridView1_Updating" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="IdCitaMedica">
                    <Columns>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEditar" runat="server" Text="Cancelar Cita" CommandName="Edit" ControlStyle-CssClass="btn btn-danger bg-danger btn-xs" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="Redirect1" runat="server" CommandName="Redirect" Text="Sí" OnClick="Redirect1_Click" class="btn btn-danger bg-danger text-dark btn-xs" />
                                <asp:Button ID="btnCancel" runat="server" Text="No" CommandName="Cancel" class="btn btn-info bg-info text-dark btn-xs" />
                            </EditItemTemplate>
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

                        <asp:BoundField DataField="Nombre" HeaderStyle-Width="250px" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" HeaderStyle-CssClass="text-center bg-info" />
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
                                <asp:Label ID="txtHoraCita" ReadOnly="True" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 145px" Text='<%#Eval("HoraCita")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="txtHoraCita" ReadOnly="True" Visible="false" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 145px" Text='<%#Eval("HoraCita")%>'></asp:Label>
                                <asp:ListBox ID="ListBoxHoras" runat="server" DataSourceID="SqlDataSourceHoras" DataTextField="Descripcion" DataValueField="Descripcion" Font-Bold="True" Font-Names="Arial Black" Font-Size="Small" ForeColor="#000066" Rows="7" Width="100px" Height="60px"></asp:ListBox>
                                <asp:SqlDataSource ID="SqlDataSourceHoras" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerHoras" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:TemplateField>



                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderStyle-Width="200px" ItemStyle-CssClass="text-center" HeaderText="Servicio" SortExpression="CodServicio">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddl_CodServicio1" ReadOnly="True" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 200px" Text='<%#Eval("CodServicio")%>' DataSourceID="SqlDataSourceServicio" DataTextField="NomServicio" DataValueField="CodServicio" Enabled="false"></asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_CodServicio" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 200px" Text='<%#Eval("CodServicio")%>' DataSourceID="SqlDataSourceServicio" DataTextField="NomServicio" DataValueField="CodServicio"></asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderStyle-Width="250px" ItemStyle-CssClass="text-center" HeaderText="Doctor(a)" SortExpression="CodMedico">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddl_CodMedico1" ReadOnly="True" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 250px" Text='<%#Eval("CodMedico")%>' DataSourceID="SqlDataSourceMedico" DataTextField="Nombre" DataValueField="IdEmpleado" Enabled="false"></asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_CodMedico" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 250px" Text='<%#Eval("CodMedico")%>' DataSourceID="SqlDataSourceMedico" DataTextField="Nombre" DataValueField="IdEmpleado"></asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="NombreConvenio" HeaderText="Convenio" ReadOnly="True" SortExpression="NombreConvenio" HeaderStyle-CssClass="text-center bg-info"/>
                        <asp:BoundField DataField="Descripcion" HeaderStyle-Width="200px" HeaderText="Estado" ReadOnly="True" SortExpression="Descripcion" HeaderStyle-CssClass="text-center bg-info" />
                        <%--<asp:BoundField DataField="CodConvenio" HeaderText="CodConvenio" SortExpression="CodConvenio" />--%>
                        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_Edit" class="btn btn-info bg-info btn-xs" runat="server" Text="Modificar" CommandName="Edit" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btn_Update" runat="server" Visible="false" Text="Actualizar" CommandName="Update" class="btn btn-warning bg-warning btn-xs" />
                                <asp:Button ID="btn_Cancel" runat="server" Text="Salir" CommandName="Cancel" class="btn btn-info bg-info btn-xs" />
                                <asp:Button ID="Button1" runat="server" OnClick="disponibilidad_Click" Text="Ver Disponibilidad" class="btn btn-success bg-success btn-xs" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceCitas" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerCitas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceMedico" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerCodMedico" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceServicio" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerServicios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:Label ID="mjsPagina" runat="server"></asp:Label>
            </div>
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
