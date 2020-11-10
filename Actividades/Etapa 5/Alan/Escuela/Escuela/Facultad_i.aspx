<%@ Page Title="" Language="C#" MasterPageFile="~/VistaGlobaEscuela.Master" AutoEventWireup="true" CodeBehind="Facultad_i.aspx.cs" Inherits="Escuela.Facultades.Facultad_i" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        $(function () {
            $.datepicker.setDefaults($.datepicker.regional["es"]);
            $("#ContentPlaceHolder1_txtFechaCreacion").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "1900:2010",
                dateFormat: "dd/mm/yy",
            });
        });
    </script>
  <div class="row">
            <div class=" col col-md-12">
                <div class="box box-warning">
                    <div class="box box-header">
                        <h1 style="text-align:center;" class="box box-title">Inserción de Registros de Facultades</h1>
                    </div>
                    <div class="box box-body table table-responsive">
                        <asp:ScriptManager ID="ScriptManger1" runat="Server" />
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                <table class="table table-bordered table-hover">
                                       <tr>
                                           <td>Codigo:</td>
                                           <td>
                                               <asp:TextBox ID="txtCodigo" MaxLength="10" runat="server" Width="370px"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="Rfv_Codigo" runat="server" Display="Dynamic"
                                               ErrorMessage="El campo codigo es obligatorio" ControlToValidate="txtCodigo" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                        <tr>
                                           <td>Nombre:</td>
                                           <td>
                                               <asp:TextBox ID="txtNombre" MaxLength="100" runat="server" Width="371px"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="Rfv_Nombre" runat="server" Display="Dynamic"
                                               ErrorMessage="El campo nombre es obligatorio" ControlToValidate="txtNombre" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                        <tr>
                                           <td>Fecha de Creación:</td>
                                           <td>
                                               <asp:TextBox ID="txtFechaCreacion" runat="server" Width="368px"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="Rfv_FechaCreacion" runat="server" Display="Dynamic"
                                               ErrorMessage="La Fecha de Creacion es obligatoria" ControlToValidate="txtFechaCreacion" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                               <asp:CompareValidator ID="cv_FechaCreacion" runat="server" ControlToValidate="txtFechaCreacion" Type="Date" Operator="DataTypeCheck" ValidationGroup="vlg1"
                                                   ErrorMessage="El Formato de fecha es incorrecto (Dia/Mes/Año)"></asp:CompareValidator>
                                           </td>
                                       </tr>
                                        <tr>
                                           <td>Universidad:</td>
                                           <td>
                                               <asp:DropDownList ID="ddlUniversidad" CssClass="lista" runat="server" Height="20px" Width="279px"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="Rfv_Universidad" runat="server" InitialValue="0" Display="Dynamic"
                                               ErrorMessage="La selección de una Universidad es obligatoria" ControlToValidate="ddlUniversidad" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                      <tr>
                                         <td>Pais:</td>
                                           <td>
                                               <asp:DropDownList ID="ddlPais" CssClass="lista" runat="server" Height="20px" AutoPostBack="true" Width="279px" OnSelectedIndexChanged="ddlPais_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="Rfv_Pais" runat="server" InitialValue="0" Display="Dynamic"
                                               ErrorMessage="La selección de un Pais es obligatorio" ControlToValidate="ddlPais" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                    <tr>
                                        <td>Estado:</td>
                                           <td>
                                               <asp:DropDownList ID="ddlEstado" CssClass="lista" runat="server" Height="20px" AutoPostBack="true" Width="279px" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="Rfv_Estado" runat="server" InitialValue="0" Display="Dynamic"
                                               ErrorMessage="La selección de un Estado es obligatorio" ControlToValidate="ddlEstado" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                      <tr>
                                         <td>Ciudad:</td>
                                           <td>
                                               <asp:DropDownList ID="ddlCiudad" CssClass="lista" runat="server"  Height="20px" Width="279px"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="Rfv_Ciudad" runat="server" InitialValue="0" Display="Dynamic"
                                               ErrorMessage="La selección de una Ciudad es obligatoria" ControlToValidate="ddlCiudad" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                        <tr>
                                            <td>Materias:</td>
                                            <td>
                                                <asp:ListBox ID="LstMaterias" SelectionMode="Multiple" CssClass="lista" Width="150px" runat="server"></asp:ListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                    <div class="box box-footer" style="text-align:center;">
                        <asp:Button ID="btnAgregar" CssClass="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAgregar_Click" Width="159px" ValidationGroup="vlg1"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnRegresar" CssClass="btn btn-warning" runat="server" Text="Regresar" Height="36px" Width="159px" OnClick="btnRegresar_Click"/>
                    </div>
              </div>
            </div>
        </div>
      </div>
    <asp:GridView ID="grdFacultad" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Fecha de Creación" DataField="FechaCreacion" />
        </Columns>
    </asp:GridView>
</asp:Content>
