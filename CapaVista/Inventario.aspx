<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="Inventario.aspx.cs" Inherits="Inventario" %>


<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <%--CSS dependencies--%>
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--SEC-1--%>
    <div class="container mx-auto">
        <%--<p>Content here. <a class="show-alert" href="#">Alert!</a></p>--%>


        <%--C1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Registro de inventario</h3>

            </div>
            <%--BT--%>
            <div>

                <hr />
                <h4 class="text-left text-success font-weight-bold">Ver Inventario</h4>

                <asp:HyperLink ID="HyperLink3" runat="server" class="btn btn-warning bg-warning btn-sm text-dark" NavigateUrl="InventarioEquipos.aspx" Text="Equipos"></asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-info btn-sm text-dark" NavigateUrl="InventarioInsumos.aspx" Text="Insumos"></asp:HyperLink>
            </div>


            <div>
                <%--F1--%>
                <hr />
                <h4 class="text-left text-success font-weight-bold">Agregar</h4>

                <div class="row">
                    <br />
                    <div class="col">
                        <h4 class="text-info">Nombre</h4>
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtNombre" ErrorMessage="El campo es obligatorio" />
                    </div>
                    <div class="col">
                        <h4 class="text-info">Marca</h4>
                        <asp:TextBox runat="server" ID="txtMarca" CssClass="form-control"></asp:TextBox>
                        <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtMarca" errormessage="El campo es obligatorio" />
                    </div>

                    <div class="col">
                        <h4 class="text-info">Familia</h4>
                        <asp:DropDownList ID="Familia" runat="server" CssClass="form-control dropdown" Style="height: 35px; top: 0px; left: 0px;" DataSourceID="SqlDataSourceFamiliaInventario" DataTextField="Descripcion" DataValueField="CodTipo" AppendDataBoundItems="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceFamiliaInventario" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerFamilia" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <br />
                    </div>
                </div>

                <%--F2--%>
                <div class="row">
                    <div class="col">
                        <h4 class="text-info">Fecha de compra</h4>
                        <div>
                            <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
                                <input runat="server" id="FechaCompra" format="yyyy-mm-dd" class="form-control" size="16" type="date" readonly />
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar" style="color: white"></i></span>
                            </div>
                            <input type="hidden" id="dtp_input1" value="" />
                        </div>

                                  <asp:comparevalidator id="Comparevalidator1" runat="server" errormessage="Debe ingresar una fecha válida"
                        operator="LessthanEqual" controltovalidate="FechaCompra" type="string" display="Dynamic" />
                        
                        <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator4" controltovalidate="FechaCompra" errormessage="El campo es obligatorio" />
                
                    </div>

                    <div class="col">
                        <h4 class="text-info">Unidades</h4>
                        <asp:TextBox runat="server" ID="txtCant" type="number" CssClass="form-control"></asp:TextBox>
                        
                        <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtCant" errormessage="El campo es obligatorio" />

                    </div>
                    <div class="col">
                        <h4 class="text-info">Precio unitario</h4>
                        <asp:TextBox runat="server" ID="txtCosto" type="number" CssClass="form-control"></asp:TextBox>
                        
                        <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtCosto" errormessage="El campo es obligatorio" />
                        <%--<asp:RegularExpressionValidator ID="Regex1" runat="server" ControlToValidate="txtCosto" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                            ErrorMessage="Please enter valid integer or decimal number with 2 decimal places." />--%>
                    </div>

                </div>

                <div class="">
                    <br />
                    <asp:Button runat="server" ID="agregarEmpleado" OnClick="Agregar_Click" Text="Agregar" class="btn btn-success bg-success btn-sm" />
                    <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-danger btn-sm" NavigateUrl="Empleado.aspx" Text="Regresar"></asp:HyperLink>



                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <%--END CONTAINER--%>

    <%--JS dependencies--%>
    <script type="text/javascript" src="./jquery/jquery-1.9.1.js" charset="UTF-8"></script>

    <%--bootstrap dependencies--%>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../js/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>

    <!-- bootbox code -->
    <script type="text/javascript" src="../bootbox/bootbox.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../bootbox/bootbox.locales.min.js" charset="UTF-8"></script>

    <script>
        $(document).on("click", ".show-alert", function (e) {
            bootbox.alert({
                message: "This is the small alert!",
                size: 'smal'
            });
            //    "Hello world!", function() {
            //    console.log("Alert Callback");
            //});
        });
    </script>


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
