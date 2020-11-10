<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Escuela.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CdisMart-Login</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesone/4.1.0/css/font-awesone.min.css" rel="stylesheet" type="text/css"/>
    <link href="//code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 41px;
        }
    </style>
</head>
<body>
     <div class="color-container">

        </div>
        <div class="login-box">
            <h2>Bienvenido devuelta a CdisMart</h2>
            <form id="form1" runat="server">
                   <div>
                       <asp:Login ID="LoginUser" runat="server" EnableViewState="false" Width="100%">
                           <LayoutTemplate>
                              <div class="form-group">
                                 <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Usuario"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="Ingresar un Usuario Correcto" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                  <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="Ingresar un Contraseña Correcta" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                  <br />
                                  <label>¿No tiene una cuenta?<a href="NuevoUsuario.aspx"> Cree una.</a></label>
                              </div>
                              <div class="form-group">
                                  <div style="height: 1px">
                                      <asp:Button ID="btnSesion" runat="server" CommandName="Login" CssClass="btn btn-block btn-primary" Height="38px" OnClick="btnSesion_Click" Text="Iniciar Sesión" />
                                  </div>
                             </div>
                         </LayoutTemplate>
                      </asp:Login>
                   </div>
                </form>
        </div>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
