<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .Menu {
            display: flex;
            flex-direction:column;
            align-items: center;
            justify-content: center;
          
        }

        .scaled {
            transform: scale(1.5);
            transform-origin: top;
        }
    </style>

    <br />
    <br />

    <hr />

    


    <div class="container">
        <div class="col-3"></div>
        <div class="col Menu" >

            <h1 >MENU PRINCIPAL</h1>
            

            <div class="scaled">
                <div class="btn-group-vertical" role="group" aria-label="Button group with nested dropdown">
                    <asp:Button Text="GESTION PRODUCTOS" OnClick="btn_Producto_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button Text="GESTION CLIENTES" OnClick="btn_Cliente_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button Text="GESTION PROVEEDORES" OnClick="btn_Proveedor_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button Text="GESTIONAR USUARIOS" ID="btn_GestionarUsuarios" runat="server" CssClass="btn btn-primary" />


                    <div class="btn-group dropend">
                        <a class="btn btn-primary " href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" data-bs-offset="0,-100" aria-expanded="false">VARIOS</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">RUBROS</a></li>
                            <li><a class="dropdown-item" href="#">MARCAS</a></li>
                            <li><a class="dropdown-item" href="#">MEDIOS DE PAGO</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-3"></div>
    </div>


</asp:Content>
