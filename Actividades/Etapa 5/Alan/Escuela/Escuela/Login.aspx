<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Escuela.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Acceso al Sistema-CDIS</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesone/4.1.0/css/font-awesone.min.css" rel="stylesheet" type="text/css"/>
    <link href="//code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="css/Fondo.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="App_Themes/Tema1/Admin.css" rel="stylesheet" />
</head>
<body class="fondoLogin">
    <div>
       <br />
            <h1 style="text-align:center;"><b>¡¡BIENVENIDO!!</b></h1>
            <div class="col col-md-6" style="text-align:right;" >
               <br />
                <br>
            <a href="img">
              &nbsp;</a><img alt="cdis" src="Imagenes/LoginCdis.jpg"/>
        </div>
        <div class="col col-md-6" style="text-align:left; top: 9px; left: 11px;">
           <div class="form-box" id="Login">
            <div class="header bg-black" style="text-align:center;" >
                <h2><b>Login</b></h2>
            </div>
               <form id="form1" runat="server">
                   <div class="body bg-black">
                       <asp:Login ID="LoginUser" runat="server" EnableViewState="false" Width="100%">
                           <LayoutTemplate>
                              <div class="form-group">
                                 <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Iniciar Sesión"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="Ingresar un Usuario Correcto" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                  <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                              </div>
                              <div class="form-group">
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="Ingresar un Contraseña Correcta" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                  <asp:Button ID="btnSesion" runat="server" CommandName="Login" CssClass="btn bg-aqua-gradient btn-block" Height="38px" OnClick="btnSesion_Click" Text="Iniciar Sesión" />
                             </div>
                               <div style="height: 1px">
                               </div>         
                         </LayoutTemplate>
                      </asp:Login>
                   </div>
                </form>
            </div>
        </div>
        </div>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
