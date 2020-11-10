<%@ Page Title="" Language="C#" MasterPageFile="~/VistaGlobaCdisMart.Master" AutoEventWireup="true" CodeBehind="Subasta.aspx.cs" Inherits="Escuela.Subasta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        h1{
        font-family: 'Source Sans Pro', sans-serif;
        color: black;
        }
        .auto-style2 {
            width: 156px;
        }
    </style>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script>
        $(function () {
            $.datepicker.setDefaults($.datepicker.regional["es"]);
            $("#ContentPlaceHolder1_txtNuevoFechaInicio").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "dd/mm/yy",
            });
        });
        </script>
    <script>
        $(function () {
            $.datepicker.setDefaults($.datepicker.regional["es"]);
            $("#ContentPlaceHolder1_txtNuevoFechaFin").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "dd/mm/yy",
            });
        });
    </script>
    <div class="row">
        <div class="col col-md-6">
            <div class="box box-primary">
             <div class="box box-header">
                  <h1 style="text-align:center;" class="box box-title">Subasta Anterior</h1>
              </div>
            <table class="box box-body table table-responsive">
                <tr>
                    <td class="auto-style2">#</td>
                    <td>
                        <asp:TextBox ID="txtIdSubasta" runat="server" Width="235px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Nombre del Producto</td>
                    <td>
                        <asp:TextBox ID="txtNombreProducto" runat="server" Width="235px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Descripción del producto</td>
                    <td>
                        <asp:TextBox ID="txtDescripcionProducto" runat="server" Width="235px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Fecha de Inicio</td>
                    <td>
                        <asp:TextBox ID="txtFechaInicio" runat="server" Width="235px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Fecha Fin</td>
                    <td>
                        <asp:TextBox ID="txtFechaFin" runat="server" Width="235px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Oferta Actual Mas Alta</td>
                    <td>
                        <asp:TextBox ID="txtOfertaMasAlta" runat="server" Width="235px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
            </table>  
           </div>
        </div>
        <div class="col col-md-6">
            <div class="box box-warning">
             <div class="box box-header">
                  <h1 style="text-align:center;" class="box box-title">Nueva Subasta</h1>
              </div>
            <table class="box box-body table table-responsive">
                <tr>
                    <td>Nombre del Producto</td>
                    <td>
                        <asp:TextBox ID="txtNuevoNombreProducto" runat="server" Width="235px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="Rfv_NombreProducto" runat="server" Display="Dynamic"
                         ErrorMessage="El campo Nombre del Producto es obligatorio" ControlToValidate="txtNombreProducto" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Descripción del producto</td>
                    <td>
                        <asp:TextBox ID="txtNuevoDescripcionProducto" runat="server" Width="235px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="Rfv_DescripcionProducto" runat="server" Display="Dynamic"
                         ErrorMessage="El campo Descripción del Producto es obligatorio" ControlToValidate="txtNuevoDescripcionProducto" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Fecha de Inicio</td>
                    <td>
                        <asp:TextBox ID="txtNuevoFechaInicio" runat="server" Width="235px"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="Rfv_FechaInicio" runat="server" Display="Dynamic"
                           ErrorMessage="La Fecha de Inicio es obligatoria" ControlToValidate="txtNuevoFechaInicio" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                           <asp:CompareValidator ID="cv_FechaInicio" runat="server" ControlToValidate="txtNuevoFechaInicio" Type="Date" Operator="DataTypeCheck" ValidationGroup="vlg1"
                          ErrorMessage="El Formato de Fecha de Inicio es incorrecto (Dia/Mes/Año)"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>Fecha Fin</td>
                    <td>
                        <asp:TextBox ID="txtNuevoFechaFin" runat="server" Width="235px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="Rfv_FechaFin" runat="server" Display="Dynamic"
                           ErrorMessage="La Fecha de Inicio es obligatoria" ControlToValidate="txtNuevoFechaFin" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                           <asp:CompareValidator ID="cv_FechaFin" runat="server" ControlToValidate="txtNuevoFechaFin" Type="Date" Operator="DataTypeCheck" ValidationGroup="vlg1"
                          ErrorMessage="El Formato de Fecha Fin es incorrecto (Dia/Mes/Año)"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>Oferta Actual Mas Alta</td>
                    <td>
                        <asp:TextBox ID="txtNuevoOfertaAlta" runat="server" Width="235px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="Rfv_OfertaActualAlta" runat="server" Display="Dynamic"
                         ErrorMessage="El campo Oferta es obligatorio" ControlToValidate="txtNuevoOfertaAlta" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table> 
             <div class="box box-footer" style="text-align:center;">
                 <asp:Button ID="btnEditar" CssClass="btn btn-success" runat="server" Text="Editar" Width="159px" ValidationGroup="vlg1" OnClick="btnEditar_Click"/>
              </div>
        </div>
    </div>
  </div>
</asp:Content>
