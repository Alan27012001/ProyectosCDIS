<%@ Page Title="" Language="C#" MasterPageFile="~/VistaGlobaCdisMart.Master" AutoEventWireup="true" CodeBehind="ListarSubasta.aspx.cs" Inherits="Escuela.ListarSubasta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
            <div class="col col-md-12">
                <div class="box box-success" >
                    <div class="box box-header">
                        <h1 style="text-align:center; position: static; z-index: auto;" class="box box-title">Registros de Subastas</h1>
                    </div>
                    <div class="box box-body">
                       <div id="colorhead">
                           <asp:GridView ID="grd_Subastas" AutoGenerateColumns="false" runat="server" OnRowCommand="grd_Subastas_RowCommand" Height="98px" Width="1082px">
                               <AlternatingRowStyle BorderStyle="Double" />
                            <Columns>
                                <asp:BoundField HeaderText="#" DataField="AuctionId" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Nombre del Producto" DataField="ProductName" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <%-- <asp:HyperLinkField
                                    DataNavigateUrlFields="ProductName"
                                    DataNavigateUrlFormatString="~\Subasta.aspx?pSubastaId={0}"
                                    DataTextField="ProductName"
                                    HeaderText="Nombre del Productos" ControlStyle-ForeColor="Black" />--%>
                                <asp:BoundField HeaderText="Descripción" DataField="Description" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Fecha Inicio" DataField="StartDate" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Fecha Fin" DataField="EndDate" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Bono mas Alto" DataField="HighestBind" HeaderStyle-BackColor="#ffcc00">
                                </asp:BoundField>
                                <asp:TemplateField HeaderStyle-BackColor="#ffcc00">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnInformación" runat="server" ImageUrl="~/Imagenes/linkSubasta.jpg" Height="30px" Width="30px" CommandName="Informacion" CommandArgument='<%# Eval("AuctionId") %>'/>
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
</asp:Content>
