<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoUsuario.aspx.cs" Inherits="Escuela.NuevoUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Nuevo Usuario</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 82px;
        }
        .auto-style2 {
            margin-left: 50%;
            margin-top: -5%;
            position: initial;
            width: 450px;
            padding: 40px;
            transform: translate(-50%, -50%);
            background: #192231;
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0,0,0,.6);
            border-radius: 10px;
            height: 562px;
        }
    </style>
</head>
<body>
        <div class="color-container">

               </div>
                <div class="auto-style2">
                        <h1 style="text-align:center;">Nuevo Usuario</h1>
                    <div class="table table-responsive" style="height: 444px">
                        <form id="form1" runat="server">
                                <table class="table table-bordered" style="width: 85%">
                                       <tr>
                                           <td>Nombre de Usuario:</td>
                                           <td>
                                               <asp:TextBox ID="txtNombreUsuario" MaxLength="10" runat="server" Width="235px"></asp:TextBox>
                                               <br />
                                               <asp:RequiredFieldValidator ID="Rfv_NombreUsuario" runat="server" Display="Dynamic"
                                               ErrorMessage="El campo Nombre de Usuario es obligatorio" ControlToValidate="txtNombreUsuario" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                        <tr>
                                           <td>Contraseña:</td>
                                           <td>
                                               <asp:TextBox ID="txtContrasena" MaxLength="10" runat="server" Width="237px"></asp:TextBox>
                                               <br />
                                               <asp:RequiredFieldValidator ID="Rfv_Nombre" runat="server" Display="Dynamic"
                                               ErrorMessage="El campo contraseña es obligatorio" ControlToValidate="txtContrasena" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                       <%--<tr>
                                           <td>Confirmar Contaseña:</td>
                                           <td>
                                               <asp:TextBox ID="txtConfirmarContasena" MaxLength="100" runat="server" Width="236px"></asp:TextBox>
                                               <br />
                                               <asp:RequiredFieldValidator ID="Rgv_ConfirmarContrasena" runat="server" Display="Dynamic"
                                               ErrorMessage="El campo Confirmar contraseña es obligatorio" ControlToValidate="txtConfirmarContasena" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>--%>
                                        <tr>
                                           <td>Nombre Completo:</td>
                                           <td>
                                               <asp:TextBox ID="txtNombreCompleto" MaxLength="50" runat="server" Width="237px"></asp:TextBox>
                                               <br />
                                               <asp:RequiredFieldValidator ID="Rgv_NombreCompleto" runat="server" Display="Dynamic"
                                               ErrorMessage="El campo Nombre Completo es obligatorio" ControlToValidate="txtNombreCompleto" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                         <tr>
                                           <td>Email:</td>
                                           <td>
                                               <asp:TextBox ID="txtEmail" MaxLength="100" runat="server" Width="234px"></asp:TextBox>
                                               <br />
                                               <asp:RequiredFieldValidator ID="Rgv_Email" runat="server" Display="Dynamic"
                                               ErrorMessage="El campo Email es obligatorio" ControlToValidate="txtEmail" ValidationGroup="vlg1" ForeColor="Red"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                    </table>
                        <div class="auto-style1" style="text-align:center;">
                            <asp:Button ID="btnAgregar" CssClass="btn btn-primary" runat="server" Text="Agregar" Width="159px" ValidationGroup="vlg1" OnClick="btnAgregar_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnRegresar" CssClass="btn btn-warning" runat="server" Text="Regresar" Height="36px" Width="159px" OnClick="btnRegresar_Click"/>
                        </div>
                    </form>
                 </div>
              </div>
</body>
</html>
