<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="DetalleFactura.aspx.cs" Inherits="DetalleFactura" %>





<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        /*
Full screen Modal 
*/
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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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
                        <p>Cédula:</p><p id="txtCedula" runat="server"></p>
                        <p>Teléfono:</p><p id="txtTelefono" runat="server"></p>
                        <p>Correo:</p><p id="txtCorreo" runat="server"></p>
                        <p>Dirección:</p><p id="txtDireccion" runat="server"></p>
                        <p>Doctor(a):</p><p id="txtMedico" runat="server"></p>
                  
    			</div>
                <div class="col-xs-6 text-right">
                        <strong>Fecha emisión:</strong><p id="txtFecha" runat="server"></p>
    					<strong>Medio de pago:</strong><p id="txtPago" runat="server"></p>

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
        							<td><strong>Item</strong></td>
        							<td class="text-center"><strong>Price</strong></td>
        							<td class="text-center"><strong>Quantity</strong></td>
        							<td class="text-right"><strong>Totals</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>
    								<td>BS-200</td>
    								<td class="text-center">$10.99</td>
    								<td class="text-center">1</td>
    								<td class="text-right">$10.99</td>
    							</tr>
                                <tr>
        							<td>BS-400</td>
    								<td class="text-center">$20.00</td>
    								<td class="text-center">3</td>
    								<td class="text-right">$60.00</td>
    							</tr>
                                <tr>
            						<td>BS-1000</td>
    								<td class="text-center">$600.00</td>
    								<td class="text-center">1</td>
    								<td class="text-right">$600.00</td>
    							</tr>
    							<tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>Subtotal</strong></td>
    								<td class="thick-line text-right">$670.99</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Shipping</strong></td>
    								<td class="no-line text-right">$15</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Total</strong></td>
    								<td class="no-line text-right">$685.99</td>
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
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>



    <%--SEC-1--%>
    <div class="container mx-auto">
        <%--C1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Registro de Facturas</h3>
            </div>
        </div>
        <br />
        <%--C2--%>
        <div class="col-lg-12 form-group" runat="server">
            <div class="col-lg-12">
                <h4 class="text-left text-success font-weight-bold">Detalle Factura</h4>
                <asp:TextBox runat="server" ID="txtIdFactura" Visible="true"></asp:TextBox>
                <hr />
            </div>

            <div class="table-responsive text-wrap" runat="server">
                <%--DATAGRIDVIEW--%>
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center"
                    AllowPaging="True" CssClass="table table-hover table-bordered table-sm"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceDetalleFactura"
                    EmptyDataText="No se encuentran citas agendadas..."
                    OnPreRender="GridView1_PreRender" OnRowEditing="GridView1_RowEditing" PageSize="4"
                    OnRowUpdating="GridView1_Updating" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="IdDetalle">
                    <Columns>



                        <asp:BoundField DataField="IdDetalle" HeaderText="IdDetalle" Visible="false" ReadOnly="True" SortExpression="IdDetalle" HeaderStyle-CssClass="text-center bg-success" />
                        <asp:BoundField DataField="CodFactura" HeaderText="Factura N°" SortExpression="CodFactura" HeaderStyle-CssClass="text-center bg-success" />
                        <asp:BoundField DataField="Medico" HeaderText="Medico" Visible="false" SortExpression="Medico" HeaderStyle-CssClass="text-center bg-success" />
                        <asp:BoundField DataField="Nombre" HeaderText="Doctor(a) Tratante" SortExpression="Nombre" HeaderStyle-CssClass="text-center bg-success" ReadOnly="True" />
                        <asp:BoundField DataField="CodServicio" HeaderText="CodServicio" Visible="false" SortExpression="CodServicio" HeaderStyle-CssClass="text-center bg-success" />
                        <asp:BoundField DataField="NomServicio" HeaderText="Descripción Servicio" SortExpression="NomServicio" HeaderStyle-CssClass="text-center bg-success" />
                        <asp:BoundField DataField="MontoServicio" HeaderText="Precio Servicio" SortExpression="MontoServicio" HeaderStyle-CssClass="text-center bg-success" />
                        <asp:BoundField DataField="Descuento" HeaderText="Monto Descuento" SortExpression="Descuento" HeaderStyle-CssClass="text-center bg-success" />
                        <asp:BoundField DataField="EntidadDescuento" HeaderText="Origen Descuento" SortExpression="EntidadDescuento" HeaderStyle-CssClass="text-center bg-success" />
                        <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" SortExpression="SubTotal" HeaderStyle-CssClass="text-center bg-success" />

                        <asp:BoundField DataField="Total" HeaderText="Total Factura" SortExpression="Total" HeaderStyle-CssClass="text-center bg-success" />

                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <button type="button" class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#myModal">Mostrar</button>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceDetalleFactura" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerDetalleFactura" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtIdFactura" Name="IdFactura" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>
</asp:Content>

