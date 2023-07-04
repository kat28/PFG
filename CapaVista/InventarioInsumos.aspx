<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="InventarioInsumos.aspx.cs" Inherits="InventarioInsumos" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--SEC-1--%>
    <div class="container mx-auto">
        <%--C1--%>
        <div class="col-lg-12">
            <div class="col-lg-12">
                <h3 class="text-center">Inventario insumos</h3>

            </div>

            <div>
                <%--C1--%>
                <hr />
                <h4 class="text-left text-success font-weight-bold">Ver Inventario</h4>
                <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-success btn-sm text-dark" NavigateUrl="Inventario.aspx" Text="Agregar"></asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-warning bg-warning  btn-sm text-dark" NavigateUrl="InventarioEquipos.aspx" Text="Equipos"></asp:HyperLink>
            </div>
        </div>


        <br />


        <%--C2--%>
        <div class="col-lg-12 form-group" runat="server">
            <div class="col-lg-12">
                <h4 class="text-left text-success font-weight-bold">Lista materiales</h4>
                <hr />
            </div>

            <div class="table-responsive text-wrap" runat="server">
                <%--DATAGRIDVIEW--%>
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" 
                    AllowPaging="True" CssClass="table table-hover table-bordered table-sm" 
                    AutoGenerateColumns="False" DataKeyNames="IdActivo" DataSourceID="SqlDataSourceInsumos" 
                    OnPreRender="GridView1_PreRender" OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_Updating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                    <Columns>
                        <asp:BoundField DataField="IdActivo" HeaderText="IdActivo" ReadOnly="True" SortExpression="IdActivo" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Descripción" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_NomActivo" runat="server" Text='<%#Eval("NomActivo")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_NomActivo" runat="server" Text='<%#Eval("NomActivo")%>'></asp:TextBox>
                                <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator3" controltovalidate="txt_NomActivo" errormessage="El campo es obligatorio" />
                            
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Grupo" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Descripcion" runat="server" Text='<%#Eval("Descripcion")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_Familia" runat="server" DataSourceID="SqlDataSourceFamilia" DataTextField="Descripcion" DataValueField="CodTipo"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Marca" HeaderText="Marca" ReadOnly="True" SortExpression="Marca" HeaderStyle-CssClass="text-center bg-info">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="FecAdquisicion" HeaderText="Fecha Compra" ReadOnly="True" SortExpression="FecAdquisicion" HeaderStyle-CssClass="text-center bg-info" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false">
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                        </asp:BoundField>
                        
                        <asp:TemplateField HeaderText="Unidades" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Cantidad" runat="server" Text='<%#Eval("Cantidad") + " unidades"%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Cantidad" runat="server" Text='<%#Eval("Cantidad")%>' type="number"></asp:TextBox>
                                <asp:requiredfieldvalidator runat="server" id="RequiredFieldValidator9" controltovalidate="txt_Cantidad" errormessage="El campo es obligatorio" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" ItemStyle-CssClass="text-center" HeaderText="Costo" SortExpression="ValorOriginal">
                            <ItemTemplate>
                                <asp:Label ID="ValorOriginal" CssClass="text-nowrap" runat="server" Text='<%#"₡ " + Eval("ValorOriginal")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ValorOriginal" CssClass="text-nowrap" runat="server" Text='<%#Eval("ValorOriginal")%>'></asp:Label>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle><ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" ItemStyle-CssClass="text-center" HeaderText="Costo Total" SortExpression="Cantidad">
                            <ItemTemplate>
                                <asp:Label ID="Cantidad" CssClass="text-nowrap" runat="server" Text='<%#"₡ " +  ((Convert.ToInt32(Eval("Cantidad")))*(Convert.ToDouble(Eval("ValorOriginal"))))%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" ItemStyle-CssClass="text-center" HeaderText="Estado" SortExpression="CodEstado">
                            <ItemTemplate>
                                <asp:Label ID="lbl_EstadoDescripcion" CssClass="text-nowrap" runat="server" Text='<%#Eval("descrEstado")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_Estado" runat="server" Text='<%#Eval("CodEstado")%>' DataSourceID="SqlDataSourceEstado" DataTextField="Descripcion" DataValueField="CodTipo"></asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle><ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:TemplateField>
                        
                        <asp:TemplateField ControlStyle-CssClass="btn btn-info btn-xs">
                            <ItemTemplate>
                                <asp:Button ID="btn_Edit" runat="server" Text="Editar" CommandName="Edit"/>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btn_Update" runat="server" Text="Actualizar" CommandName="Update" />
                                <asp:Button ID="btn_Cancel" runat="server" Text="Cancelar" CommandName="Cancel" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                            
                        <%--<asp:CommandField ButtonType="Button" ShowEditButton="True" ShowCancelButton="true" ControlStyle-CssClass="btn btn-info btn-xs" />--%>
                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceInsumos" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerInventarioInsumos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceEstado"  runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerEstadoPersona"     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceFamilia" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerFamilia" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
