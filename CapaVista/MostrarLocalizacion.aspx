<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="MostrarLocalizacion.aspx.cs" Inherits="MostrarLocalizacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <html>
        <head>
        <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    </head>

    <body> 
<%--SEC-1--%> 

    <div class="container mx-auto my-auto">
        
        <div class="col-md-11 py-2 ">
            <asp:label runat="server" id="txtTitulo" class="h3 text-center">Datos dirección de domicilio</asp:label>
        </div>
        <br /><hr/>

        <%--DIRECCION--%>

        <div class="form-group row"> 
            <%--F4--%>
            <div class="col-md-6">
                   <h4>Provincia:</h4>
                    <asp:DropDownList ID="Provincia" runat="server" Enabled="false" AutoPostBack="true" CssClass="form-control dropdown" style="height:35px; top: 0px; left: 0px;" DataSourceID="SqlDataSourceProvincia" DataTextField="NomProvincia" DataValueField="CodProvincia" AppendDataBoundItems="True" >
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceProvincia" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerProvincia" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
        
                   <h4>Distrito:</h4>
                    <asp:DropDownList ID="Distrito" runat="server" Enabled="false" CssClass="form-control" style="height:35px" AppendDataBoundItems="True">
                    </asp:DropDownList>
             </div>

                  <%--F4--%>
            <div class="col-md-6">
    
                <h4>Cantón</h4>
                <asp:DropDownList ID="Canton" CssClass="form-control" Enabled="false" style="height:35px" AutoPostBack="True" runat="server" AppendDataBoundItems="True"> 
                </asp:DropDownList><br />

                <h4>Dirección Exacta:</h4>
                <asp:TextBox runat="server" id="txtDireccionExacta" CssClass="form-control" MaxLength="150" ReadOnly="true"></asp:TextBox> <br />
            </div>
        </div>

        <%--Boton--%>
        <div class="container mx-auto row ">
            <div class="col-lg-3">
                <br />
                <asp:HyperLink ID="btnSubmit" runat="server" class="btn btn-info bg-info btn-sm" NavigateUrl="ModificarLocalizacion.aspx" Text="Modificar"></asp:HyperLink>
            </div>
            <div class="col-lg-6">
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-danger btn-sm" NavigateUrl="javascript:history.back()" Text="Regresar"></asp:HyperLink>
            </div>
        </div>
    </div>
<br /><br /><br /><br /> <br /><br /> <br /><br /><br /><br /><%--END CONTAINER--%> 
    </body>
</html>

</asp:Content>