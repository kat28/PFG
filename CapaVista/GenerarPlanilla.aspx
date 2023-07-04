<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="GenerarPlanilla.aspx.cs" Inherits="GenerarPlanilla" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--SEC-1--%>
    <div class="container-fluid mx-auto">
        <%--C1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Planilla</h3>

            </div>

            <div>
                <%--C1--%>
                <hr />
                <asp:Button runat="server" ID="btnGenerarPlanilla" OnClick="Agregar_Click" Text="Generar Planilla" class="btn btn-warning bg-warning text-dark btn-sm" />
                <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-success btn-sm text-dark" NavigateUrl="ReportePlanilla.aspx" Text="Generar Reporte"></asp:HyperLink>
                <br />
                <br />
                <h4 class="text-left text-success font-weight-bold">General</h4>

            </div>
        </div>

        <%--C2--%>
        <div class="col-lg-12 form-group" runat="server">
            <div class="col-lg-12">
            </div>

            <div class="table-responsive text-wrap" runat="server">
                <%--DATAGRIDVIEW--%>

                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center"
                    AllowPaging="True" CssClass="table table-hover table-bordered table-sm table-condensed"
                    AutoGenerateColumns="False" DataKeyNames="IdPagoPlanilla" PageSize="7"
                    EmptyDataText="No hay planillas generadas" DataSourceID="SqlDataSourceObtener"
                    OnPreRender="GridView1_PreRender" OnRowEditing="GridView1_RowEditing"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_IdPagoPlanilla" runat="server" Visible="False" Text='<%# Eval("IdPagoPlanilla") %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="IdEmpleado" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_IdEmpleado" runat="server" Text='<%# Eval("IdEmpleado") %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre Completo" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_NombreCompleto" runat="server" Text='<%#Eval("NombreCompleto")%>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>


                        <asp:BoundField DataField="FechaIngreso" ReadOnly="true" HeaderText="Fecha Ingreso" SortExpression="FechaIngreso" HeaderStyle-CssClass="text-center bg-info" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Salario Bruto" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_SalarioBruto" runat="server" Text='<%#"₡ " + Eval("SalarioBruto")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_SalarioBruto" type="number" Style="width: 100px" runat="server" Text='<%#Eval("SalarioBruto")%>' />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="txt_SalarioBruto" ErrorMessage="El campo es obligatorio" />

                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>


                        <asp:BoundField DataField="FechaActual" ReadOnly="true" HeaderText="FechaActual" SortExpression="FechaActual" HeaderStyle-CssClass="text-center bg-info" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Horas Extra" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_HorasExtra" runat="server" Text='<%#"₡ " + Eval("HorasExtra")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_HorasExtra" type="number" Style="width: 100px" runat="server" Text='<%#Eval("HorasExtra")%>' />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="txt_HorasExtra" ErrorMessage="El campo es obligatorio" />

                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Incentivos" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Incentivos" runat="server" Text='<%#"₡ " + Eval("Incentivos")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Incentivos" type="number" Style="width: 100px" runat="server" Text='<%#Eval("Incentivos")%>' />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="txt_Incentivos" ErrorMessage="El campo es obligatorio" />

                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Adelanto" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="txt_Adelanto" Style="width: 100px" runat="server" Text='<%#Eval("Adelanto") + " %"%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList CssClass="form-control text-dark" Style="height: 30px" ID="ddl_Adelanto" runat="server">
                                    <asp:ListItem Selected="True" Value="0.4"></asp:ListItem>
                                    <asp:ListItem Value="0.6"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="ddl_Adelanto" ErrorMessage="El campo es obligatorio" />
                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Renta" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="txt_Renta" Style="width: 100px" runat="server" Text='<%#Eval("Renta")%>'></asp:Label>

                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="SeguroSocial" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="txt_SeguroSocial" Style="width: 100px" runat="server" Text='<%#Eval("SeguroSocial")%>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Embargo" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Embargo" runat="server" Text='<%#"₡ " + Eval("Embargo")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Embargo" type="number" Style="width: 100px" runat="server" Text='<%#Eval("Embargo")%>' />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator12" ControlToValidate="txt_Embargo" ErrorMessage="El campo es obligatorio" />

                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="SalarioNeto" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="txt_SalarioNeto" Style="width: 100px" runat="server" Text='<%#"₡ " + Eval("SalarioNeto")%>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_Edit" runat="server" Text="Editar" CommandName="Edit" ControlStyle-CssClass="btn btn-info btn-xs" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="Redirect1" runat="server" CommandName="Redirect" Text="Calcular" OnClick="Redirect1_Click" class="btn btn-warning bg-warning text-dark btn-xs" />
                                <asp:Button ID="btn_Cancel" runat="server" Text="Cancelar" CommandName="Cancel" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceObtener" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerPlanilla" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
