<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="Facturas.aspx.cs" Inherits="Facturas" %>




<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        /*
Full screen Modal 

*/
        .ocultar{
            display:none;
        }

        .fullscreen-modal .modal-dialog {
            /*margin: 0;*/
            margin-right: 100%;
            margin-left: 0;
            padding-right: 10px;
            width: 1000px;
        }

        .modal-dialog {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .modal-content {
            height: auto;
            min-height: 100%;
            border-radius: 0;
        }

        @media (min-width: 768px) {
            .fullscreen-modal .modal-dialog {
                width: 750px;
            }
        }

        @media (min-width: 992px) {
            .fullscreen-modal .modal-dialog {
                width: 970px;
            }
        }

        @media (min-width: 1200px) {
            .fullscreen-modal .modal-dialog {
                width: 1170px;
            }
        }
    </style>

    <!-- Modal -->
    <div class="modal fullscreen-modal fade" id="myModal" tabindex="-1" role="dialog" style="padding-right: 25%" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" onclick="window.location = 'Facturas.aspx'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="pull-right">Factura</h3>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="col-xs-12">
                                    <address>
                                        <strong>Encabezado:</strong>
                                    </address>
                                </div>
                                <hr />
                                <div class="row">

                                    <div class="col-xs-6 text-left">
                                        <strong>Nombre:</strong><p id="txtNombre" runat="server"></p>
                                        <strong>Cédula:</strong>
                                        <p id="txtCedula" runat="server"></p>
                                        <strong>Teléfono:</strong>
                                        <p id="txtTelefono" runat="server"></p>
                                        <strong>Correo:</strong>
                                        <p id="txtCorreo" runat="server"></p>
                                        <strong>Doctor(a):</strong>
                                        <p id="txtMedico" runat="server"></p>

                                    </div>
                                    <div class="col-xs-6 text-right">
                                        <strong>Fecha emisión:</strong><p id="txtFecha" runat="server"></p>
                                        <strong>Modo de pago:</strong><p id="txtPago" runat="server"></p>
                                        <strong>Convenio:</strong><p id="txtConvenio" visible="false" runat="server"></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><strong>Detalle Factura</strong></h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-condensed">
                                                <thead>
                                                    <tr>
                                                        <td class="text-left"><strong>Descripción Servicio</strong></td>
                                                        <td class="text-center"><strong>Precio</strong></td>
                                                        <td class="text-center"><strong>Descuento</strong></td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- foreach ($order->lineItems as $line) or some such thing here -->
                                                    <tr>
                                                        <td class="text-center" runat="server" id="txtServicio"></td>
                                                        <td class="text-center" runat="server" id="txtMonto"></td>
                                                        <td class="text-right" runat="server" id="txtDescuento"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="thick-line"></td>
                                                        <td class="thick-line text-center"><strong>Subtotal Neto</strong></td>
                                                        <td class="thick-line text-right" runat="server" id="txtSubTotal"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="no-line"></td>
                                                        <td class="no-line text-center"><strong>% Descuento</strong></td>
                                                        <td class="no-line text-right" runat="server" id="txtMontoDescuento"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="no-line"></td>
                                                        <td class="no-line text-center"><strong>Total Factura</strong></td>
                                                        <td class="no-line text-right" runat="server" id="txtTotalNeto"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location = 'Facturas.aspx'">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <%--Fin modal--%>

    <%--SEC-1--%>
    <div class="container mx-auto">
        <%--C1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Registro de Facturas</h3>
            </div>
        </div>
        <div class="col-lg-12">
            <%--C1.5--%>
            <hr />
            <asp:HyperLink ID="HyperLink3" runat="server" class="btn btn-warning bg-warning btn-sm text-dark" NavigateUrl="AsignarCita.aspx" Text="Asignar Citas"></asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-info btn-sm text-dark" NavigateUrl="HistorialCita.aspx" Text="Historial Citas"></asp:HyperLink>
        </div>

        <br />
        <%--C2--%>
        <div class="col-lg-12 form-group" runat="server">
            <div class="col-lg-12">
                <h4 class="text-left text-success font-weight-bold">Facturas</h4>
                <hr />
            </div>

            <div class="table-responsive text-wrap" runat="server">
                <%--DATAGRIDVIEW--%>
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center"
                    AllowPaging="True" CssClass="table table-hover table-bordered table-sm"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceFactura"
                    EmptyDataText="No se encuentran citas agendadas..."
                    OnPreRender="GridView1_PreRender" OnRowEditing="GridView1_RowEditing" PageSize="4"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" BorderColor="Yellow" >
                    <Columns >

                        <asp:BoundField DataField="CodFactura" HeaderStyle-Width="200px" HeaderText="CodFactura" SortExpression="CodFactura" HeaderStyle-CssClass="text-center bg-info" />

                        <asp:BoundField DataField="IdPaciente" HeaderText="IdPaciente" SortExpression="IdPaciente" HeaderStyle-CssClass="text-center bg-info" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" HeaderStyle-CssClass="text-center bg-info" ReadOnly="True" />
                        <asp:BoundField DataField="NumCedula" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="NumCedula" SortExpression="NumCedula"  />
                        
                                <asp:BoundField DataField="NumTelefono" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="NumTelefono" SortExpression="NumTelefono"/>
                                <asp:BoundField DataField="CorreoElectronico" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="CorreoElectronico" SortExpression="CorreoElectronico"/>
                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" HeaderStyle-CssClass="text-center bg-info" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                                <asp:BoundField DataField="IdEmpleado" HeaderText="IdEmpleado" SortExpression="IdEmpleado" HeaderStyle-CssClass="text-center bg-info" />
                                <asp:BoundField DataField="CodModoPago" HeaderText="CodModoPago" SortExpression="CodModoPago" HeaderStyle-CssClass="text-center bg-info" />
                                <asp:BoundField DataField="CodConvenio" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="CodConvenio" SortExpression="CodConvenio"/>
                                <asp:BoundField DataField="NombreConvenio" HeaderText="NombreConvenio" SortExpression="NombreConvenio" HeaderStyle-CssClass="text-center bg-info" />
                                <asp:BoundField DataField="Porcentaje" HeaderText="Porcentaje" SortExpression="Porcentaje" HeaderStyle-CssClass="text-center bg-info" />
                                <asp:BoundField DataField="CodEstadoFactura" HeaderText="CodEstadoFactura" SortExpression="CodEstadoFactura" HeaderStyle-CssClass="text-center bg-info" />


                                <%--Detalle Factura--%>
                                <asp:BoundField DataField="IdDetalle" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="IdDetalle" SortExpression="IdDetalle" />
                                <asp:BoundField DataField="CodFactura1" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="CodFactura1" SortExpression="CodFactura1" />
                                <asp:BoundField DataField="IdMedico" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="IdMedico" SortExpression="IdMedico" />
                                <asp:BoundField DataField="CodServicio" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="CodServicio" SortExpression="CodServicio" />
                                <asp:BoundField DataField="NomServicio" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="NomServicio" SortExpression="NomServicio" />
                                <asp:BoundField DataField="MontoServicio" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="MontoServicio" SortExpression="MontoServicio" />
                                <asp:BoundField DataField="Descuento" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="Descuento" SortExpression="Descuento" />
                                <asp:BoundField DataField="EntidadDescuento" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="EntidadDescuento" SortExpression="EntidadDescuento" />
                                <asp:BoundField DataField="SubTotal" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="SubTotal" SortExpression="SubTotal" />
                                <asp:BoundField DataField="Total" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  HeaderText="Total" SortExpression="Total" />


                                <%--boton modal--%>

                                <asp:TemplateField>
                                    <itemtemplate>
                                <asp:Button ID="btn_Edit" runat="server" Text="Modificar" CommandName="Edit" />
                            </itemtemplate>
                                    <edititemtemplate>
                                <%--<asp:Button ID="btn_Update" runat="server" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar"  Text="Actualizar" CommandName="Update" class="btn btn-warning bg-warning btn-xs" />
                                --%><asp:Button ID="btn_Cancel" runat="server" Text="Salir" CommandName="Cancel" class="btn btn-info bg-info btn-xs" />
                                <asp:Button runat="server" type="button" Text="Mostrar" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal" />
                            </edititemtemplate>
                                </asp:TemplateField>
                                </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceFactura" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerFactura" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                <%--<asp:SqlDataSource ID="SqlDataSourceMedico" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerCodMedico" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceServicio" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerServicios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                --%>
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

