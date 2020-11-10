<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarUsuarios.aspx.cs" Inherits="Escuela.ListarUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Listar Usuarios</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-left: 65px;
        }
        td {
        padding: 0;
        color: white;
         }
        th {
            text-align: center;
            color: black;
        }
        .auto-style1 {
            height: 49px;
            color: white;
            background-color: #192230;
            border-color: #192231;
        }
    </style>
</head>
<body>
     <div class="color-container">
                    <div>
                        <h1 style="text-align:center;">Usuarios Registrados</h1>
                        <div style="text-align:left;">
                              <button id="btnNuevoUsuario" class="auto-style1"><a href="NuevoUsuario.aspx">Nuevo Usuario</a></button>&nbsp;&nbsp&nbsp;&nbsp
                              <button id="btnRegresar" class="auto-style1"><a href="PanelGeneral.aspx">Regresar</a></button>
                        </div>
                        <br />
                    <div>
                       <div id="colorhead">
                           <form id="form1" runat="server">
                                <asp:GridView ID="grd_Usuarios" AutoGenerateColumns="false" runat="server" Height="100px" Width="1276px" CssClass="auto-style1">
                                   <AlternatingRowStyle BorderStyle="Double" />
                                <Columns>
                                    <asp:BoundField HeaderText="ID" DataField="UserId" HeaderStyle-BackColor="#ffcc00">
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Nombre Usuario" DataField="UserName" HeaderStyle-BackColor="#ffcc00" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Contraseña" DataField="Password" HeaderStyle-BackColor="#ffcc00">
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Nombre Completo" DataField="Name" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-BackColor="#ffcc00">
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Correo Electronico" DataField="Email" HeaderStyle-BackColor="#ffcc00">
                                    </asp:BoundField>
                                </Columns>
                                   <EmptyDataRowStyle HorizontalAlign="Center" />
                                   <FooterStyle HorizontalAlign="Center" />
                                   <HeaderStyle HorizontalAlign="Center" />
                             </asp:GridView>
                        </form>
                       </div>
                  </div>
         </div>
      </div>
</body>
</html>
