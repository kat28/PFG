<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="ReporteFacturas.aspx.cs" Inherits="Reportes" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container mx-auto">
        <%--Titulo--%>
        <div class="col-lg-12">
            <h3 class="text-center">Reporte Factura</h3>
            <hr />
            <br />
        </div>

        <%--param--%>
        <div class="form-inline">
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtAño" ErrorMessage="El campo es obligatorio" />
            <div class="form-group mb-2">
                <h4 class=" text-primary">Año:</h4>
            </div>
            <div class="form-group mb-2">
                <asp:TextBox ID="txtAño" class="form-control" runat="server" Width="100px" Height="30px" MaxLength="4"></asp:TextBox>
            </div>
            <div class="form-group ml-4 mb-2">
                <h4 class=" text-primary">Mes:</h4>
            </div>
            <div class="form-group mb-2">
                <asp:DropDownList Height="30px" CssClass="form-control" ID="txtMes" runat="server">
                    <asp:ListItem Value="1">Enero</asp:ListItem>
                    <asp:ListItem Value="2">Febrero</asp:ListItem>
                    <asp:ListItem Value="3">Marzo</asp:ListItem>
                    <asp:ListItem Value="4" Selected="True">Abril</asp:ListItem>
                    <asp:ListItem Value="5">Mayo</asp:ListItem>
                    <asp:ListItem Value="6">Junio</asp:ListItem>
                    <asp:ListItem Value="7">Julio</asp:ListItem>
                    <asp:ListItem Value="8">Agosto</asp:ListItem>
                    <asp:ListItem Value="9">Septiembre</asp:ListItem>
                    <asp:ListItem Value="10">Octubre</asp:ListItem>
                    <asp:ListItem Value="11">Noviembre</asp:ListItem>
                    <asp:ListItem Value="12">Diciembre</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group ml-4">
                <asp:Button ID="btnShow" class="btn btn-primary btn-xs mb-2" runat="server" OnClick="btnShow_Click" Text="Generar Reporte" />
            </div>
            <div class="form-group ml-4">
                <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-warning bg-warning  btn-xs mb-2 text-dark" NavigateUrl="Factura.aspx" Text="Regresar"></asp:HyperLink>
            </div>

        </div>
        <br />
        <%--report--%>

        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <rsweb:ReportViewer ID="rptViewer" runat="server" Width="90%" Height="600px">
            </rsweb:ReportViewer>

        </div>





    </div>

    <br />
    <br />
    <br />

</asp:Content>

