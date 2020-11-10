<%@ Page Title="" Language="C#" MasterPageFile="~/VistaGlobaEscuela.Master" AutoEventWireup="true" CodeBehind="PanelGeneral.aspx.cs" Inherits="Escuela.PanelGeneral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!--CAROUSEL DEL INDICACIONES-->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>
            <!--MOVIEMINETOS DEL CAROUSEL  Y LLAMADOS A IMAGENES-->
            <!--CLASE CONTENEDORA-->
            <div class="carousel-inner">
                <!--SUB CLASES-->
                <!--IMAGEN 1-->
                <div class="item active">
                    <img src="Imagenes/logo.jpg" alt="Facultades" />
                </div>
                <!--IMAGEN 2-->
                <div class="item">
                    <img src="Imagenes/facpya.jpg" alt="Facultades"/>
                </div>
                <!--IMAGEN 3-->
                <div class="item">
                    <img src="Imagenes/fisico.jpg" alt="Facultades"/>
                </div>
                <div class="item">
                    <img src="Imagenes/fime.jpg" alt="Facultades"/>
                </div>
                <div class="item">
                    <img src="Imagenes/quimicas.jpg" alt="Facultades"/>
                </div>
            </div>
                                            <!--CONTROLES DEL CAROUSEL-->
            <!--CONTROL HACIA LA IZQUIERDA-->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previus</span>
            </a>
            <!--CONTROL HACIA LA DERECHA-->
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</asp:Content>
