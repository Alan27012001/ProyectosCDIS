<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alumno_s.aspx.cs" Inherits="Escuela.Alumnos.Alumno_s" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="grd_alumnos" AutoGenerateColumns="false" runat="server" OnRowCommand="grd_alumnos_RowCommand">
        <Columns>
            <asp:BoundField HeaderText="Matricula" DataField="Matricula"/>
            <asp:BoundField HeaderText="Nombres" DataField="Nombre"/>
            <asp:BoundField HeaderText="Fecha de Nacimiento" DataField="FechaNacimiento" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField HeaderText="Semestre" DataField="Semestre"/>
            <asp:BoundField HeaderText="Facultad" DataField="NombreFacultad"/>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="~/Imagenes/lapiz.jpg" Height="20px" Width="20px" CommandName="Editar" CommandArgument='<%# Eval("Matricula") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btnEliminar" runat="server" ImageUrl="~/Imagenes/basura.jpg" Height="20px" Width="20px" CommandName="Eliminar" CommandArgument='<%# Eval("Matricula") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
