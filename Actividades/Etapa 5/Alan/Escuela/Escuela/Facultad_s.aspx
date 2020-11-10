<%@ Page Title="" Language="C#" MasterPageFile="~/VistaGlobaEscuela.Master" AutoEventWireup="true" CodeBehind="Facultad_s.aspx.cs" Inherits="Escuela.Facultades.Facultad_s" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/AdminLTE.css" type="text/css"/>
    <!--Llamda a la hoja de stilos-->
    <link rel="stylesheet" href="css/VistaGlobal.css"/>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <div class="row">
            <div class="col col-md-12">
                <div class="box box-success" >
                    <div class="box box-header">
                        <h1 style="text-align:center; position: static; z-index: auto;" class="box box-title">Registros de Facultades</h1>
                    </div>
                    <div class="box box-body">
                       <div id="colorhead">
                           <asp:GridView ID="grd_facultades" AutoGenerateColumns="false" runat="server" OnRowCommand="grd_facultades_RowCommand" Height="196px" Width="1082px">
                               <AlternatingRowStyle BorderStyle="Double" />
                            <Columns>
                                <asp:BoundField HeaderText="ID" DataField="Id_Facultad" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Codigo" DataField="Codigo"   HeaderStyle-BackColor="#ffcc00" >
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Nombres" DataField="Nombre" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Fecha de Creación" DataField="FechaCreacion" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Universidad" DataField="NombreUniversidad" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Ciudad" DataField="NombreCiudad" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:TemplateField HeaderStyle-BackColor="#ffcc00">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="~/Imagenes/lapiz.png" Height="30px" Width="30px" CommandName="Editar" CommandArgument='<%# Eval("Id_Facultad") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#ffcc00">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEliminar" runat="server" ImageUrl="~/Imagenes/basura.png" Height="30px" Width="30px" CommandName="Eliminar" CommandArgument='<%# Eval("Id_Facultad") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                               <EmptyDataRowStyle HorizontalAlign="Center" />
                               <FooterStyle HorizontalAlign="Center" />
                               <HeaderStyle HorizontalAlign="Center" />
                    </asp:GridView>
                       </div>
                  </div>
                </div>
            </div>
        </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "GET",
                url: "/ServicioWCFfacultad.svc/ConsultaFacultadJSON",
                success: function (data) {
                    console.log("¡LLamada mediante Ajax Exitosa!");
                    console.log(data);
                },
                error: function (e) {
                    console.log("¡LLamada mediante Ajax Incorrecta!");
                    console.log(e);
                }
            });
        });
    </script>
</asp:Content>
