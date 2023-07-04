<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="DetalleExpediente.aspx.cs" Inherits="DetalleExpediente" %>


<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--SEC-1--%>
    <div class="container mx-auto ">
        <%--C1--%>
        <div class="col-lg-12">
            <h3 class="text-center">Historia Clínica</h3>
            <hr />

        </div>
        <%--C1--%>
        <div class="row" runat="server">
            <div class="col-lg-3 well">
                <%--Paciente--%>
                <ul class="list-group ">
                    <li class="list-group-item text-center text-center bg-danger text-white">Paciente</li>
                    <li class="list-group-item">
                        <img src="images/icons/220-users.png" class="img-circle" height="65" width="65" alt="Avatar">
                        <p id="txtNombre" runat="server"></p>
                        <p id="txtCedula" runat="server"></p>
                        <p id="txtGenero" runat="server"></p>
                        <p id="txtEdad" runat="server"></p>
                        <p id="txtConv" runat="server"></p>
                    </li>
                </ul>

                <%--signos--%>
                <ul class="list-group" runat="server">
                    <li class="list-group-item text-center text-white bg-success">Signos Vitales </li>
                    <li class="list-group-item">Temperatura:
                        <asp:TextBox ID="txtTemp" runat="server" Style="width: 50px" />
                        °C</li>
                    <li class="list-group-item">Frec. Respiratoria:
                        <asp:TextBox ID="txtFR" runat="server" Style="width: 50px" />
                        rpm</li>
                    <li class="list-group-item">Saturación Oxígeno:
                        <asp:TextBox ID="txtSO" runat="server" Style="width: 50px" />
                        %</li>
                    <li class="list-group-item">Frec. Cardíaca:
                        <asp:TextBox ID="txtFC" runat="server" Style="width: 50px" />
                        lpm</li>
                    <li class="list-group-item">Presión Arterial:
                        <asp:TextBox ID="txtPresion" runat="server" Style="width: 60px" />
                        mmHg</li>
                    <li class="list-group-item">Peso:
                        <asp:TextBox ID="txtPeso" runat="server" Style="width: 50px" />
                        kg</li>
                    <li class="list-group-item">Talla:
                        <asp:TextBox ID="txtTalla" runat="server" Style="width: 50px" />
                        cm</li>
                </ul>

                <asp:Button runat="server" ID="agregarSignos" Text="Guardar Cambios" class="btn btn-success bg-success btn-xs mx-auto" OnClick="AgregarSignos_Click" />

            </div>
            <%--fin 1C--%>

            <%--centro--%>
            <div class="col-lg-6 text-center">
                <div class="row">
                    <div class="col-sm-11 mx-auto">
                        <asp:Button runat="server" ID="Button4" Text="Finalizar Consulta" class="btn btn-danger bg-danger btn-xs mx-auto" OnClick="Finalizar_Click" />
                        <br />
                        <br />
                    </div>
                    <div class="col-sm-11 mx-auto">
                        <asp:Button runat="server" ID="Button2" Text="Guardar" class="btn btn-warning bg-warning btn-xs mx-auto" OnClick="AgregarDetalle_Click" />
                        <br />
                        <br />
                    </div>

                </div>
                <div class="row">
                    <br />
                    <div class="col-sm-11 mx-auto">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <label runat="server" for="title">Motivo de consulta</label>
                                <textarea class="form-control text-justify" runat="server" rows="5" id="txtMotivo" maxlength="1000"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-11 mx-auto">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <label for="title">Examen físico</label>
                                <textarea class="form-control" runat="server" rows="5" id="txtExamen"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-11 mx-auto">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <label for="title">Análisis</label>
                                <textarea class="form-control" runat="server" rows="5" id="txtAnalisis"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-11 mx-auto">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <label for="title">Diagnóstico</label>
                                <textarea class="form-control" runat="server" rows="5" id="txtDiag"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-11 mx-auto">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <label for="title">Tratamiento</label>
                                <textarea class="form-control" runat="server" rows="5" id="txtTrata"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-11 mx-auto">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <label for="title">Seguimiento</label>
                                <textarea class="form-control" runat="server" rows="5" id="txtSeg"></textarea>
                            </div>
                        </div>
                    </div>
                    <asp:Button runat="server" ID="Button3" Text="Guardar Todos los Cambios" class="btn btn-warning bg-warning btn-sm mx-auto" OnClick="AgregarTotal_Click" />
                    <br />
                </div>


            </div>

            <%--Antecedentes--%>
            <div class="col-lg-3 well">
                <ul class="list-group">
                    <li class="list-group-item text-center text-white bg-info">Antecedentes</li>
                    <li class="list-group-item">
                        <label runat="server" for="title">Patológicos</label>
                        <textarea id="txtAP" class="form-control text-justify" runat="server" rows="3" maxlength="500"></textarea>
                    </li>
                    <li class="list-group-item">
                        <label runat="server" for="title">No Patológicos</label>
                        <textarea id="txtANP" class="form-control text-justify" runat="server" rows="3" maxlength="500"></textarea>
                    </li>
                    <li class="list-group-item">
                        <label runat="server" for="title">Alergias</label>
                        <textarea id="txtAlergia" class="form-control text-justify" runat="server" rows="3" maxlength="500"></textarea>
                    </li>
                    <li class="list-group-item">
                        <label runat="server" for="title">Toxicomanias</label>
                        <textarea id="txtToxico" class="form-control text-justify" runat="server" rows="3" maxlength="500"></textarea>
                    </li>
                    <li class="list-group-item">
                        <label runat="server" for="title">Quirúrgicos</label>
                        <textarea id="txtAQ" class="form-control text-justify" runat="server" rows="3" maxlength="500"></textarea>
                    </li>
                    <li class="list-group-item">
                        <label runat="server" for="title">Traumáticos</label>
                        <textarea id="txtAT" class="form-control text-justify" runat="server" rows="3" maxlength="500"></textarea>
                    </li>
                    <li class="list-group-item">
                        <label runat="server" for="title">Gineco-Obstétricos</label>
                        <textarea id="txtAG" class="form-control text-justify" runat="server" rows="3" maxlength="500"></textarea>
                    </li>
                    <li class="list-group-item">
                        <label runat="server" for="title">Observaciones</label>
                        <textarea id="txtObs" class="form-control text-justify" runat="server" rows="3" maxlength="500"></textarea>
                    </li>
                </ul>
                <asp:Button runat="server" ID="Button1" Text="Guardar Cambios" class="btn btn-info bg-info btn-xs mx-auto" OnClick="AgregarAntece_Click" />

            </div>
        </div>
    </div>
    <%--</div>--%>

    <br />
    <br />

    <script type="text/javascript" src="bootstrap/js/bootstrap.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../js/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/jquery-1.9.1.js" charset="UTF-8"></script>
</asp:Content>

