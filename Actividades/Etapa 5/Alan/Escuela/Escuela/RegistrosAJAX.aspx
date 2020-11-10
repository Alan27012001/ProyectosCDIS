<%@ Page Title="" Language="C#" MasterPageFile="~/VistaGlobaEscuela.Master" AutoEventWireup="true" CodeBehind="RegistrosAJAX.aspx.cs" Inherits="Escuela.RegistrosAJAX" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
          <div class="col col-xs-12">
              <div class="box box-warning">
                    <h3 style="text-align:center;">Listar Facultades</h3>
                  <div class="box box-body table-responsive">
                    
                      <asp:GridView ID="grilla" runat="server">
                      </asp:GridView>
                      <br />
                      <asp:Button ID="btnconsultar" runat="server" Height="45px" OnClick="btnconsultar_Click" Text="Consultar" Width="125px" />
                    
                  </div>
              </div>
          </div>
      </div>
</asp:Content>
