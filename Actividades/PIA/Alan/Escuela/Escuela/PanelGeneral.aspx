<%@ Page Title="" Language="C#" MasterPageFile="~/VistaGlobaCdisMart.Master" AutoEventWireup="true" CodeBehind="PanelGeneral.aspx.cs" Inherits="CdisMart.Web.PanelGeneral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!--CAROUSEL DEL INDICACIONES-->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!--MOVIEMINETOS DEL CAROUSEL  Y LLAMADOS A IMAGENES-->
            <!--CLASE CONTENEDORA-->
            <div class="carousel-inner">
                <!--SUB CLASES-->
                <!--IMAGEN 1-->
                <div class="item active">
                    <img src="Imagenes/subasta.jpg" alt="Subastas" />
                </div>
                <!--IMAGEN 2-->
                <div class="item">
                    <img src="Imagenes/subasta1.jpg" alt="Subastas"/>
                </div>
                <!--IMAGEN 3-->
                <div class="item">
                    <img src="Imagenes/subasta2.jpg" alt="Subastas"/>
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
