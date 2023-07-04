<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="Convenios.aspx.cs" Inherits="Convenios" %>


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
                <h3 class="text-center">Registro de convenios</h3>
                <hr />
                <h4 class="text-center text-success font-weight-bold">Información</h4>
                <br />
            </div>

            <div>
                <%--F1--%>
                <div class="row">
                    <br />
                    <div class="col">
                        <h4 class="text-info">Institución</h4>
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtNombre" ErrorMessage="El campo no puede estar vacio" />
                    </div>
                    <div class="col">
                        <h4 class="text-info">Porcentaje descuento</h4>
                        <asp:TextBox runat="server" type="number" ID="txtP" CssClass="form-control" required="true"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtP" ErrorMessage="El campo no puede estar vacio" Display="Dynamic" />
                    <br />
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Porcentaje debe ser menor a 35%" ValidationGroup="vg" ControlToValidate="txtP" Type="Integer" MaximumValue="35" MinimumValue="0" Display="Dynamic"></asp:RangeValidator>
                     </div>
                    <div class="col">
                        <h4 class="text-info">Observaciones</h4>
                        <asp:TextBox runat="server" ID="txtObs" CssClass="form-control" placeholder="opcional"></asp:TextBox>
                    </div>

                </div>

                <%--F2--%>
                <div class="row">
                    <div class="col">
                        <h4 class="text-info">Fecha de inicio</h4>
                        <div>
                            <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
                                <input runat="server" id="startDate" format="yyyy-mm-dd" class="form-control" size="16" type="date" readonly />
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                            <input type="hidden" id="dtp_input1" value="" />
                        </div>
                        <br />

                        <asp:CompareValidator ID="cvtxtStartDate" runat="server" class="alert alert-danger fade in py-1 text-dark"
                            ControlToCompare="startDate" CultureInvariantValues="true" Display="Dynamic" EnableClientScript="true"
                            ControlToValidate="endDate" ErrorMessage="Alerta! La fecha de inicio debe ser menor a la de vencimiento" Type="Date"
                            Operator="GreaterThanEqual" Text="Alerta! La fecha de inicio debe ser menor a la de vencimiento.">
                        </asp:CompareValidator>

                           <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator8" controltovalidate="startDate" errormessage="El campo es obligatorio" />
                

                        <%-- validar fecha de convenio --%>
                    </div>

                    <div class="col">
                        <h4 class="text-info">Fecha de vencimiento</h4>
                        <div>
                            <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                <input runat="server" id="endDate" format="yyyy-mm-dd" class="form-control" size="16" type="date" readonly />
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                            <input type="hidden" id="dtp_input2" value="" />
                        </div>

                           <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator2" controltovalidate="endDate" errormessage="El campo es obligatorio" />
                
                        <br />
                    </div>
                </div>

                <div class="">
                    <br />
                    <asp:Button runat="server" ID="agregarEmpleado" OnClick="Agregar_Click" Text="Agregar" class="btn btn-info bg-info btn-sm" />
                    <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-danger btn-sm" NavigateUrl="Empleado.aspx" Text="Regresar"></asp:HyperLink>


                </div>
            </div>
        </div>
        <br />
        <%--C2--%>
        <div class="col-lg-12 form-group" runat="server">
            <div class="col-lg-12">
                <h3 class="text-center">Lista Convenios</h3>
                <hr />
            </div>

            <div class="table-responsive text-wrap" runat="server">
                <%--DATAGRIDVIEW--%>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceConvenios" HorizontalAlign="Center" AllowPaging="True"
                    CssClass="table table-hover table-bordered table-sm" AutoGenerateColumns="False" DataKeyNames="CodConvenio"
                    OnDataBound="GridView1_DataBound" OnPreRender="GridView1_PreRender">
                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" DataField="CodConvenio" HeaderText="Código" InsertVisible="False" SortExpression="CodConvenio" ReadOnly="True" Visible="False">
                            <HeaderStyle CssClass="text-center bg-warning"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" DataField="NombreConvenio" HeaderText="Institución" SortExpression="NombreConvenio">
                            <HeaderStyle CssClass="text-center bg-warning"></HeaderStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Inicio contrato" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="txtFechaI" runat="server" Text='<%# Eval("FecInicio","{0:dd/MM/yyyy}") %>' HtmlEncode="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Vencimiento contrato" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="txtFechaV" runat="server" Text='<%# Eval("FecVence","{0:dd/MM/yyyy}") %>' HtmlEncode="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Porcentaje Descuento" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="txtPorcentaje" runat="server" Text='<%# Eval("Porcentaje") + " %" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderStyle-CssClass="text-center bg-warning" DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones">
                            <HeaderStyle CssClass="text-center bg-warning"></HeaderStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-warning" HeaderText="Estado" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="txtEstado" runat="server" Text='<%# Eval("Descripcion")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <a id="popup" class="btn btn-info btn-xs" href='ModificarConvenio.aspx?id=<%# Eval("CodConvenio") %>'>Modificar</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="mjsPagina" runat="server"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSourceConvenios" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerConvenios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


                <asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Visible="False" />


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
    <script src="bootstrap/bootstrap-validate-1.0.11/dist/bootstrap-validate.js"></script>
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
