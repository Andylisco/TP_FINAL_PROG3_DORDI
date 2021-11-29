<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .Menu {
            display: flex;
            flex-direction: column;
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
        <div class="col Menu">

            <h1>MENU PRINCIPAL</h1>


            <div class="scaled">
                <div class="btn-group-vertical" role="group" aria-label="Button group with nested dropdown">
                    <asp:Button Text="GESTION PRODUCTOS" OnClick="btn_Producto_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button Text="GESTION CLIENTES" OnClick="btn_Cliente_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button Text="GESTION PROVEEDORES" OnClick="btn_Proveedor_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button Text="GESTIONAR USUARIOS" ID="btn_GestionarUsuarios" OnClick="btn_GestionarUsuarios_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button Text="GESTIONAR COMPRAS" ID="btn_Compras" OnClick="btn_Compras_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button Text="GESTIONAR VENTAS" ID="btn_Ventas" OnClick="btn_Ventas_Click" runat="server" CssClass="btn btn-primary" />

                    <%if (NivelUsuario == 0)
                        { %>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary">VARIOS</button>
                        <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" id="dropdownMenuReference" data-bs-toggle="dropdown" aria-expanded="false" data-bs-reference="parent">
                            <span class="visually-hidden">Toggle Dropdown</span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                            <li><a class="dropdown-item" href="#">RUBROS</a></li>
                            <li><a class="dropdown-item" href="#">MARCAS</a></li>
                            <li><a class="dropdown-item" href="#">MEDIOS DE PAGO</a></li>                            
                        </ul>
                    </div>

                    <%} %>
                </div>
            </div>
        </div>
    </div>
    <div class="col-3"></div>
    </div>


</asp:Content>
