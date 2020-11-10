<%@ Page Title="" Language="C#" MasterPageFile="~/VistaGlobaEscuela.Master" AutoEventWireup="true" CodeBehind="Facultad_d.aspx.cs" Inherits="Escuela.Facultades.Facultad_d" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
            <div class=" col col-md-12">
                <div class="box box-warning">
                    <div class="box box-header">
                        <h1 style="text-align:center;" class="box box-title">Edición de Registro de Facultades</h1>
                    </div>
                    <div class="box box-body table table-responsive">
                        <table class="table table-bordered table-hover">
                               <tr>
                                   <td class="auto-style1">ID:</td>
                                   <td>
                                       <asp:Label ID="lblIdFacultad" runat="server" Text=""></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="auto-style1">Codigo:</td>
                                   <td>
                                       <asp:Label ID="lblCodigo" runat="server" Text=""></asp:Label>
                                   </td>
                               </tr>
                                <tr>
                                   <td class="auto-style1">Nombre:</td>
                                   <td>
                                       <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
                                   </td>
                               </tr>
                                <tr>
                                   <td class="auto-style1">Fecha de Creación:</td>
                                   <td>
                                       <asp:Label ID="lblFechaCreacion" runat="server" Text=""></asp:Label>
                                   </td>
                               </tr>
                                <tr>
                                   <td class="auto-style1">Universidad:</td>
                                   <td>
                                       <asp:DropDownList ID="ddlUniversidad" runat="server" Enabled="false" Height="20px" Width="279px"></asp:DropDownList>
                                   </td>
                               </tr>
                              <tr>
                                 <td>Pais:</td>
                                   <td>
                                       <asp:DropDownList ID="ddlPais" runat="server" Height="20px" Enabled="false" AutoPostBack="true" Width="279px" OnSelectedIndexChanged="ddlPais_SelectedIndexChanged"></asp:DropDownList>
                                   </td>
                               </tr>
                              <tr>
                                 <td>Estado:</td>
                                   <td>
                                       <asp:DropDownList ID="ddlEstado" runat="server" Height="20px" Enabled="false" AutoPostBack="true" Width="279px" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged"></asp:DropDownList>
                                   </td>
                               </tr>
                            <tr>
                                 <td>Ciudad:</td>
                                   <td>
                                       <asp:DropDownList ID="ddlCiudad" runat="server" Height="20px" Enabled="false" Width="279px"></asp:DropDownList>
                                   </td>
                               </tr>
                        </table>
                    </div>
                    <div class="box box-footer" style="text-align:center;">
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" Width="159px" Height="36px"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnRegresar" CssClass="btn btn-warning" runat="server" Text="Regresar" Height="36px" Width="159px" OnClick="btnRegresar_Click"/>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
