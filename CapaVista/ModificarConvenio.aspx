<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="ModificarConvenio.aspx.cs" Inherits="ModificarConvenio" %>


<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--SEC-1--%>
    <div class="container mx-auto ">
        <%--C1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Modificar convenios</h3>
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
                        <asp:TextBox runat="server" type="number" ID="txtP" CssClass="form-control"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtP" ErrorMessage="El campo no puede estar vacio" />
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
                                <input runat="server" id="startDate" format="yyyy-mm-dd" class="form-control" size="16" type="date" readonly/>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                            <input runat="server" type="hidden" id="dtp_input1" value="" />
                        </div>
                        <br />

                                        <asp:CompareValidator id="cvtxtStartDate" runat="server" class="alert alert-danger fade in py-1 text-dark" 
                     ControlToCompare="startDate" cultureinvariantvalues="true" display="Dynamic" enableclientscript="true"  
                     ControlToValidate="endDate"  ErrorMessage="Alerta! La fecha de inicio debe ser menor a la de vencimiento" type="date" 
                      Operator="GreaterThanEqual" text="Alerta! La fecha de inicio debe ser menor a la de vencimiento.">
                 </asp:CompareValidator>

                        <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator7" controltovalidate="startDate" errormessage="El campo es obligatorio" />
                

                    </div>

                    <div class="col">
                        <h4 class="text-info">Fecha de vencimiento</h4>
                        <div>
                            <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                <input runat="server" id="endDate" format="yyyy-mm-dd" class="form-control" size="16" type="date" readonly />
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                            <input runat="server" type="hidden" id="dtp_input2" value="" />
                        </div>
                        <br />
                        <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator2" controltovalidate="endDate" errormessage="El campo es obligatorio" />
                
                    </div>
                </div>
                <br />
                <div class="">
                    <br />
                    <asp:Button runat="server" ID="btnModificar" OnClick="Modificar_Click" Text="Guardar cambios" class="btn btn-success bg-success btn-sm" />
                    <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-danger btn-sm" NavigateUrl="Convenios.aspx" Text="Cancelar"></asp:HyperLink>


                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <%--END CONTAINER--%>
    <br />
    <br />
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
