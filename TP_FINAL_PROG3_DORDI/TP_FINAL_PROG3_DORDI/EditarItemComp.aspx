﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarItemComp.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.EditarItemComp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <hr />
    <hr />

    <div class="container">
        <div class="col-3"></div>

        <div class="row">

            <div class="CentrarTitulos padearControles">
                <asp:Label ID="lbl_TituloModificar" Text="MODIFICAR PRODUCTO" runat="server" CssClass="h3" />
                <asp:Label ID="lbl_TituloAgregar" Text="AGREGAR PRODUCTO" runat="server" CssClass="h3" />
                <!--<h3>ACTUALIZA PRODUCTO</h3>-->
            </div>
        <div class="CentrarFormularios">

            <div  class="padearControles Separador">
                <asp:Label ID="lbl_Rubro" runat="server" for="txt_Rubro" CssClass="form-label" Font-Bold="true" Text="Rubro" />
                <asp:DropDownList ID="cbx_Rubro" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns">
                </asp:DropDownList>
            </div>

            <div  class="padearControles Separador">
                <asp:Label ID="lbl_Marca" runat="server" for="cbx_Marca" CssClass="form-label" Font-Bold="true" Text="Marca" />
                <asp:DropDownList ID="cbx_Marca" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns">
                </asp:DropDownList>
            </div>

            <div  class="padearControles Separador">
                <asp:Label ID="lbl_Producto" runat="server" for="cbx_Producto" CssClass="form-label" Font-Bold="true" Text="Producto" />
                <asp:DropDownList ID="cbx_Producto" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns">
                </asp:DropDownList>
            </div>

            <div  class="Separador">
                <asp:Label ID="lbl_Cantidad" runat="server" for="txt_Cantidad" CssClass="form-label" Font-Bold="true" Text="Cantidad"></asp:Label>
                <asp:TextBox ID="txt_Cantidad" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
            </div>

            <div  class="Separador">
                <asp:Label ID="lbl_Precio" runat="server" for="txt_Precio" CssClass="form-label" Font-Bold="true" Text="Precio"></asp:Label>
                <asp:TextBox ID="txt_Precio" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
            </div>

            <div>
                <asp:Button Text="Agregar" OnClick="Agregar_Click" runat="server" />
            </div>
        </div>
        </div>

        <div class="col-3"></div>
    </div>
</asp:Content>
