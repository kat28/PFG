<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%--        <div style="width: 1304px">
        </div>--%>

        <br />
        Año:
        <asp:TextBox ID="txtAño" runat="server" Width="174px" MaxLength="4"></asp:TextBox>


        &nbsp;&nbsp; 
        Mes:
        <asp:DropDownList ID="txtMes" runat="server">
            <asp:ListItem Value="1">Enero</asp:ListItem>
            <asp:ListItem Value="2">Febrero</asp:ListItem>
            <asp:ListItem Value="3" Selected="True">Marzo</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="Show" />
        <br />
        <br />
        <br />

        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <rsweb:ReportViewer ID="rptViewer" runat="server" Width="90%">

                

            </rsweb:ReportViewer>

        </div>
    </form>
</body>
</html>
