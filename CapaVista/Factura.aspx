<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="Factura.aspx.cs" Inherits="Factura" %>




<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <%--    <style>
        @import url(http://fonts.googleapis.com/css?family=Bree+Serif);

        body, h1, h2, h3, h4, h5, h6 {
            font-family: 'Bree Serif', serif;
        }
    </style>--%>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        /*
Full screen Modal 

*/
        .ocultar {
            display: none;
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
                    <button type="button" class="close" onclick="window.location = 'Factura.aspx'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <%--Factura--%>
                    <div class="container">

                        <%--ENCABEZADO--%>
                        <div class="row">
                            <div class="col-xs-6">
                                <h1>SOLUMED
                                </h1>
                            </div>
                            <div class="col-xs-6 text-right">
                                <h1><small>Factura #</small><small runat="server" id="txtNumFactura"></small></h1>
                            </div>
                            <br />
                            <hr />
                        </div>

                        <%--Informacion Paciente--%>
                        <div class="row">

                            <div class="col-xs-4">
                                <hr />
                                <strong>Nombre:</strong><p id="txtNombre" runat="server"></p>
                                <strong>Cédula:</strong>
                                <p id="txtCedula" runat="server"></p>
                                <strong>Teléfono:</strong>
                                <p id="txtTelefono" runat="server"></p>
                                <strong>Correo:</strong>
                                <p id="txtCorreo" runat="server"></p>


                            </div>
                            <div class="col-xs-5 col-sm-offset-3 text-right">
                                <hr />
                                <strong>Fecha emisión:</strong><p id="txtFecha" runat="server"></p>
                                <strong>Modo de pago:</strong><p id="txtPago" runat="server"></p>
                                <strong>Convenio:</strong><p id="txtConvenio" visible="false" runat="server"></p>
                                <strong>Doctor(a):</strong><p id="txtMedico" runat="server"></p>
                            </div>
                        </div>
                        <%--FIN Informacion Paciente--%>
                    </div>
                    <%--FIN CONTAINER FACTURA--%>

                    <%--DETALLE FACTURA--%>
                    <hr />
                    <div class="row">
                        <div class="col-sm-12 mx-auto">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><strong>Detalle Factura</strong></h3>
                                </div>
                                <div class="panel-body">
                                    <%--<div class="">--%>
                                    <table class="table table-condensed table-responsive">
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
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td class="thick-line"></td>
                                                <td class="thick-line text-center"><strong>Subtotal Neto</strong></td>
                                                <td class="thick-line text-right" runat="server" id="txtSubTotal"></td>
                                            </tr>
                                            <tr>
                                                <td class="no-line"></td>
                                                <td class="no-line text-center"><strong>Descuento</strong></td>
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
                                <%-- </div>--%>
                            </div>
                        </div>
                    </div>

                </div>
                <%--FIN BODY MODAL--%>

                <div class="modal-footer">
                    <button type="button" class="btn btn-info text-dark" onclick="window.print()">Imprimir</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location = 'Factura.aspx'">Cerrar</button>
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
                <hr />
            </div>
                        <div>
                <%--C1--%>
                <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-success btn-sm text-dark" NavigateUrl="ReporteFacturas.aspx" Text="Generar Reporte"></asp:HyperLink>
           <br /><br />
                        <h4 class="text-left text-success font-weight-bold">Facturas</h4>    
                </div>

        </div>
        <%--C2--%>
        <div class="col-lg-12 form-group" runat="server">
            <div class="col-lg-12">
                
            </div>

            <div class="table-responsive text-wrap" runat="server">
                <%--DATAGRIDVIEW--%>
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" DataKeyNames="CodFactura"
                    AllowPaging="True" CssClass="table table-hover table-bordered table-sm"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceFactura"
                    EmptyDataText="No se encuentran facturas pendientes..." PageSize="10"
                    OnPreRender="GridView1_PreRender" OnRowEditing="GridView1_RowEditing"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_Updating">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <p class="text-primary text-left">Modo de pago</p>
                                <asp:DropDownList ID="ddlMo" runat="server" Style="height: 30px; width:98px;" CssClass="form-control" DataSourceID="SqlDataSourcePago" DataTextField="Descripcion" DataValueField="CodTipo"></asp:DropDownList>
                                <br />
                                <asp:Button runat="server" ID="btn_Pago" Text="Generar Pago" class="btn btn-danger bg-danger btn-xs " OnClick="Pagar_Click" />

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CodFactura" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderStyle-Width="200px" HeaderText="Factura N°" SortExpression="CodFactura"/>

                        <%--<asp:BoundField DataField="IdPaciente" HeaderText="IdPaciente" SortExpression="IdPaciente" HeaderStyle-CssClass="text-center bg-info" />--%>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" HeaderStyle-CssClass="text-center bg-info" ReadOnly="True" />
                        <asp:BoundField DataField="NumCedula" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="NumCedula" SortExpression="NumCedula" />

                        <asp:BoundField DataField="NumTelefono" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="NumTelefono" SortExpression="NumTelefono" />
                        <asp:BoundField DataField="CorreoElectronico" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="CorreoElectronico" SortExpression="CorreoElectronico" />
                        <%--6--%><asp:BoundField DataField="Fecha" ReadOnly="true" HeaderText="Fecha" SortExpression="Fecha" HeaderStyle-CssClass="text-center bg-info" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                        <%--<asp:BoundField DataField="IdEmpleado" HeaderText="IdEmpleado" SortExpression="IdEmpleado" HeaderStyle-CssClass="text-center bg-info" />--%>

                        <asp:BoundField DataField="ModoPago" ReadOnly="true" HeaderText="Modo Pago" SortExpression="ModoPago" HeaderStyle-CssClass="text-center bg-info" />
                        <asp:BoundField DataField="CodConvenio" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="CodConvenio" SortExpression="CodConvenio" />
                        <asp:BoundField DataField="NombreConvenio" ReadOnly="true" HeaderText="NombreConvenio" SortExpression="NombreConvenio" HeaderStyle-CssClass="text-center bg-info" />
                        <asp:BoundField DataField="Porcentaje" ReadOnly="true" HeaderText="Porcentaje" SortExpression="Porcentaje" HeaderStyle-CssClass="text-center bg-info" />
                        <asp:BoundField DataField="EstadoFactura" ReadOnly="true" HeaderText="Estado Factura" SortExpression="EstadoFactura" HeaderStyle-CssClass="text-center bg-info" />
                         
                        <%--Detalle Factura 12--%>
                        <asp:BoundField DataField="IdDetalle" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="IdDetalle" SortExpression="IdDetalle" />
                        <asp:BoundField DataField="CodFactura1" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="CodFactura1" SortExpression="CodFactura1" />
                        <asp:BoundField DataField="IdMedico" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="IdMedico" SortExpression="IdMedico" />
                        <asp:BoundField DataField="NombreMedico" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="NombreMedico" SortExpression="NombreMedico" />
                        <asp:BoundField DataField="CodServicio" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="CodServicio" SortExpression="CodServicio" />
                        <asp:BoundField DataField="NomServicio" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="NomServicio" SortExpression="NomServicio" />
                        <%--18--%><asp:BoundField DataField="MontoServicio" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="MontoServicio" SortExpression="MontoServicio" />
                        <asp:BoundField DataField="Descuento" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="Descuento" SortExpression="Descuento" />
                        <asp:BoundField DataField="EntidadDescuento" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="EntidadDescuento" SortExpression="EntidadDescuento" />
                        <asp:BoundField DataField="SubTotal" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="SubTotal" SortExpression="SubTotal" />
                        <asp:BoundField DataField="Total" ItemStyle-CssClass="ocultar" HeaderStyle-CssClass="ocultar" HeaderText="Total" SortExpression="Total" />


                        <%--boton modal--%>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_Edit" runat="server" class="btn btn-info bg-info btn-xs" Text="Detalle" CommandName="Edit" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <%--<asp:Button ID="btn_Update" runat="server" Text="Actualizar" CommandName="Update" class="btn btn-warning bg-warning btn-xs" />--%>
                                <asp:Button ID="btn_Modal" runat="server" type="button" Text="Mostrar" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal" /><br />
                                <asp:Button ID="btn_Cancel" runat="server" Text="Cancelar" CommandName="Cancel" class="btn btn-info bg-info btn-xs" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceFactura" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerFactura" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcePago" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerModoPago" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceEstadoF" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerEstadoFactura" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:Label ID="mjsPagina" runat="server"></asp:Label>
                <br />
                <br />
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

