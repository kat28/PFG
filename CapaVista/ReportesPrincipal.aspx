<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="ReportesPrincipal.aspx.cs" Inherits="Reportes" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container mx-auto">
        <%--C1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Reportes</h3>

                <asp:Button runat="server" ID="Button1" Text="Reporte 1" OnClick="btn1_Click" CssClass="btn btn-info text-dark"/>
                <hr />
                <br />
                <asp:Button runat="server" ID="Button2" Text="Reporte 2" OnClick="btn2_Click" CssClass="btn btn-info text-dark"/>
                <hr />
                <br />
                <asp:Button runat="server" ID="Button3" Text="Reporte 3" OnClick="btn3_Click" CssClass="btn btn-info text-dark"/>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>

