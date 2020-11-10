<%@ Page Title="" Language="C#" MasterPageFile="~/VistaGlobaCdisMart.Master" AutoEventWireup="true" CodeBehind="NuevaSubasta.aspx.cs" Inherits="Escuela.NuevaSubasta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            left: 0px;
            top: 0px;
            height: 545px;
        }
    </style>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        $(function () {
            $.datepicker.setDefaults($.datepicker.regional["es"]);
            $("#ContentPlaceHolder1_txtFechaInicio").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "dd/mm/yy",
            });
        });
    </script>
    <script>
        $(function () {
            $.datepicker.setDefaults($.datepicker.regional["es"]);
            $("#ContentPlaceHolder1_txtFechaFin").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "dd/mm/yy",
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="auto-style2">
          <div class="box box-success" style="left: 0px; top: 0px; height: 400px" >
            <div class="box box-header">
                 <h1 style="text-align:center; position: static; z-index: auto;" class="box box-title">Nueva Subasta</h1>
               </div>
              <div class="box box-body" style="left: 0px; top: 0px; height: 433px">
            <div class="table table-responsive" style="height: 444px">
                    <table class="table table-bordered" style="width: 98%; height: 296px;">
                            <tr>
                                <td>Nombre de Producto:</td>
                                 <td>
                                        <asp:TextBox ID="txtNombreProducto" MaxLength="50" runat="server" Width="726px"></asp:TextBox>
                                        <br />
                                         <asp:RequiredFieldValidator ID="Rfv_NombreProducto" runat="server" Display="Dynamic"
                                        ErrorMessage="El campo Nombre de Usuario es obligatorio" ControlToValidate="txtNombreProducto" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>          
                                 </tr>
                                    <tr>
                                        <td>Descripción del Producto:</td>
                                           <td>
                                               <asp:TextBox ID="txtDescripcionProducto" MaxLength="100" runat="server" Width="730px"></asp:TextBox>
                                               <br />
                                               <asp:RequiredFieldValidator ID="Rfv_DescripcionProducto" runat="server" Display="Dynamic"
                                               ErrorMessage="El campo contraseña es obligatorio" ControlToValidate="txtDescripcionProducto" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                        <tr>
                                           <td>Fecha Inicio:</td>
                                           <td>
                                               <asp:TextBox ID="txtFechaInicio" MaxLength="100" runat="server" Width="733px"></asp:TextBox>
                                               <br />
                                               <asp:RequiredFieldValidator ID="Rfv_FechaInicio" runat="server" Display="Dynamic"
                                               ErrorMessage="La Fecha de Inicio es obligatoria" ControlToValidate="txtFechaInicio" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                               <asp:CompareValidator ID="cv_FechaInicio" runat="server" ControlToValidate="txtFechaInicio" Type="Date" Operator="DataTypeCheck" ValidationGroup="vlg1"
                                              ErrorMessage="El Formato de Fecha de Inicio es incorrecto (Dia/Mes/Año)"></asp:CompareValidator>
                                           </td>
                                       </tr>
                                    <tr>
                                         <td>Fecha Fin:</td>
                                    <td>
                                      <asp:TextBox ID="txtFechaFin" MaxLength="100" runat="server" Width="729px"></asp:TextBox>
                                      <br />
                                     <asp:RequiredFieldValidator ID="Rfv_FechaFin" runat="server" Display="Dynamic"
                                       ErrorMessage="La Fecha de Inicio es obligatoria" ControlToValidate="txtFechaFin" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                       <asp:CompareValidator ID="cv_fechafin" runat="server" ControlToValidate="txtFechaFin" Type="Date" Operator="DataTypeCheck" ValidationGroup="vlg1"
                                      ErrorMessage="El Formato de Fecha Fin es incorrecto (Dia/Mes/Año)"></asp:CompareValidator>
                               </td>
                          </tr>
                   </table>
                <div class="box box-footer" style="text-align:center; height: 57px; margin-top: 55px">
                    <asp:Button ID="btnAgregar" CssClass="btn btn-block btn-primary" runat="server" Text="Agregar Subasta" Width="159px" ValidationGroup="vlg1" OnClick="btnAgregar_Click"/>
                </div>
                </div>
              </div>
            </div>
        </div>
    </div>
</asp:Content>
