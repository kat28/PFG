<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="ModificarLocalizacion.aspx.cs" Inherits="ModificarLocalizacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <html>
        <head>
        <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    </head>

    <body> 
<%--SEC-1--%> 

    <div class="container mx-auto my-auto">
        
        <div class="col-md-11 py-2 ">
            <asp:label runat="server" id="txtTitulo" class="h3 text-center">Modificar dirección de domicilio</asp:label>
        </div>
        <br /><hr/>

        <%--DIRECCION--%>

        <div class="form-group row"> 
            <%--F4--%>
            <div class="col-md-6">
                   <h4>Provincia:</h4>
                    <asp:DropDownList ID="Provincia" runat="server" AutoPostBack="true" CssClass="form-control dropdown" style="height:35px; top: 0px; left: 0px;" DataSourceID="SqlDataSourceProvincia" DataTextField="NomProvincia" DataValueField="CodProvincia" OnSelectedIndexChanged="PListDropDown_Change" AppendDataBoundItems="True" >
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceProvincia" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerProvincia" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
        
                   <h4>Distrito:</h4>
                    <asp:DropDownList ID="Distrito" runat="server" CssClass="form-control" style="height:35px" AppendDataBoundItems="True">
                      <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:DropDownList>
             </div>

                  <%--F4--%>
            <div class="col-md-6">
    
                <h4>Cantón</h4>
                <asp:DropDownList ID="Canton" CssClass="form-control" style="height:35px" AutoPostBack="True" OnSelectedIndexChanged="Selection_Change" runat="server" AppendDataBoundItems="True"> 
                    <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                </asp:DropDownList><br />

                <h4>Dirección Exacta:</h4>
                <asp:TextBox runat="server" id="txtDireccionExacta" CssClass="form-control" MaxLength="150"></asp:TextBox> <br />
            </div>
        </div>

        <%--Boton--%>
        <div class="container mx-auto row">
            <div class="col-lg-3">
                <br />
                <br />
                <asp:Button runat="server" ID="btnGuardarCambios" OnClick="Modificar_Click" Text="Guardar Cambios" class="btn btn-success btn-sm" />
            </div>
            <div class="col-lg-6">
                <br />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-danger btn-sm" NavigateUrl="javascript:history.back()" Text="Cancelar"></asp:HyperLink>
            </div>
        </div>

    </div>
<br /><br /><br /><br /> <br /><br /> <br /><br /><br /><br /><%--END CONTAINER--%> 
    </body>
    </html>





</asp:Content>

