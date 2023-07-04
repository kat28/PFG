<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.master" AutoEventWireup="true" CodeFile="Credenciales.aspx.cs" Inherits="Credenciales" %>


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
                <h3 class="text-center">Registro de credenciales</h3>

            </div>
        </div>


        <br />


        <%--C2--%>
        <div class="col-lg-12 form-group" runat="server">
            <div class="col-lg-12">
                <h4 class="text-left text-success font-weight-bold">Usuarios del sistema</h4>
                <hr />
            </div>

            <div class="table-responsive text-wrap" runat="server">
                <%--DATAGRIDVIEW--%>
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center"
                    AllowPaging="True" CssClass="table table-hover table-bordered table-sm"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSourceLogin"
                    OnPreRender="GridView1_PreRender" OnRowEditing="GridView1_RowEditing" PageSize="5"
                    OnRowUpdating="GridView1_Updating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                    <Columns>

                        <asp:TemplateField HeaderText="IdLogin" Visible="false" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_IdLogin" runat="server"  Text='<%#Eval("IdLogin")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_IdLogin1" runat="server" Text='<%#Eval("IdLogin")%>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="IdPersona" Visible="false"  HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_IdPersona" runat="server" Text='<%#Eval("IdPersona")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_IdPersona1" runat="server" Text='<%#Eval("IdPersona")%>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Nombre" HeaderStyle-Width="250px" ReadOnly="True" HeaderText="Nombre" SortExpression="Nombre" HeaderStyle-CssClass="text-center bg-info"></asp:BoundField>
                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderStyle-Width="145px" ItemStyle-CssClass="text-center" HeaderText="Puesto" SortExpression="CodPuesto">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddl_CodPuesto1" ReadOnly="True" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 135px" Text='<%#Eval("CodPuesto")%>' DataSourceID="SqlDataSourcePuesto" DataTextField="Descripcion" DataValueField="CodTipo" Enabled="false"></asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_CodPuesto" runat="server" ReadOnly="True" CssClass="form-control text-dark" Style="height: 30px; width: 135px" Text='<%#Eval("CodPuesto")%>' DataSourceID="SqlDataSourcePuesto" DataTextField="Descripcion" DataValueField="CodTipo"></asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="true" SortExpression="Usuario" HeaderStyle-CssClass="text-center bg-info"></asp:BoundField>

                        <asp:TemplateField HeaderText="Clave" HeaderStyle-CssClass="text-center bg-info">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Clave" runat="server" Text='<%#Eval("Clave")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Clave" runat="server" CssClass="form-control text-dark" Text='<%#Eval("Clave")%>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="text-center bg-info" HeaderStyle-Width="145px" ItemStyle-CssClass="text-center" HeaderText="Rol" SortExpression="IdRol">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddl_IdRol1" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 115px" Text='<%#Eval("IdRol")%>' DataSourceID="SqlDataSourceRol" DataTextField="Descripcion" DataValueField="IdRol" Enabled="false"></asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_IdRol" runat="server" CssClass="form-control text-dark" Style="height: 30px; width: 115px" Text='<%#Eval("IdRol")%>' DataSourceID="SqlDataSourceRol" DataTextField="Descripcion" DataValueField="IdRol"></asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="text-center bg-info"></HeaderStyle>
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField ControlStyle-CssClass="btn btn-info btn-xs">
                            <ItemTemplate>
                                <asp:Button ID="btn_Edit" runat="server" Text="Modificar" CommandName="Edit" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btn_Update" runat="server" Text="Guardar" CssClass="btn-success" CommandName="Update" />
                                <asp:Button ID="btn_Cancel" runat="server" Text="Cancelar" CommandName="Cancel" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceLogin" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerLogin" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceRol" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerRol" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcePuesto" runat="server" ConnectionString="<%$ ConnectionStrings:proyConnectionString %>" SelectCommand="sp_ObtenerPuesto" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                <asp:Label ID="mjsPagina" runat="server"></asp:Label>
            </div>
        </div>
    </div>
        <%--BOTONES--%>
    <div class="container mx-auto row ">
        <div class="col-lg-6">
            <br />
            <asp:hyperlink id="HyperLink2" runat="server" class="btn btn-danger btn-sm" navigateurl="~/Empleado.aspx" text="Regresar"></asp:hyperlink>
        </div>

    </div>
    <br />
    <br />
    <%--END CONTAINER--%>

    <script type="text/javascript" src="./jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../js/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>
</asp:Content>
