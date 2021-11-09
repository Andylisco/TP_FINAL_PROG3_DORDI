<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormProducto.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .AlinearCbx {
            display: flex;
            align-items: center;
        }

        .padearControles{
            padding-inline:15px;
        }
    </style>

    <hr />
        <hr />
    <div class="CentrarTitulos">
        <h3>ACTUALIZA PRODUCTO</h3>
    </div>
    
    <div class="CentrarFormularios">

        <div>
            <asp:Label ID="lbl_Codigo" runat="server" for="txt_Codigo" class="form-label" Font-Bold="true" Text="Codigo"/>
            <asp:TextBox ID="txt_Codigo" runat="server" class="form-control" ></asp:TextBox>            
        </div>

        <div>
             <asp:Label ID="lbl_Descripcion" runat="server"  for="txt_Descripcion" class="form-label" Font-Bold="true" Text="Descripcion"></asp:Label>
             <asp:TextBox ID="txt_Descripcion" runat="server" class="form-control"></asp:TextBox>
        </div>

        <div class =" AlinearCbx">

         <div class="padearControles">
              <asp:Label ID="lbl_Rubro" runat="server" for="cbx_Rubro" class="form-label" Font-Bold="true" Text="Rubro"></asp:Label>
              <asp:DropDownList ID="cbx_Rubro" runat="server" class="form-control"></asp:DropDownList>
        </div>

         <div class="padearControles">
              <asp:Label ID="lbl_Marca" runat="server" for="cbx_Marca" class="form-label" Font-Bold="true" Text="Marca"></asp:Label>
              <asp:DropDownList ID="cbx_Marca" runat="server" class="form-control"></asp:DropDownList>
        </div>

        </div>


        <div>
             <asp:Label ID="lbl_StockMinimo" runat="server"  for="txt_StockMinimo" class="form-label" Font-Bold="true" Text="Stock Minimo"></asp:Label>
             <asp:TextBox ID="txt_StockMinimo" runat="server" class="form-control"></asp:TextBox>
        </div>

        <div>
             <asp:Label ID="lbl_PorcentajeGanancia" runat="server" for="txt_PorcentajeGanancia" class="form-label" Font-Bold="true" Text=" % Ganancia"></asp:Label>
             <asp:TextBox ID="txt_PorcentajeGanancia" runat="server" class="form-control"></asp:TextBox>
        </div>      
     
   
        <div>
            <asp:Button Text="GRABAR PRODUCTO" ID="btnGrabar" OnClick="btnGrabar_Click" runat="server" class="btn btn-primary CentrarFormularios" />

            <asp:Button Text="ACTUALIZA PRODUCTO" ID="btnActualizar" OnClick="btnActualizar_Click" runat="server" class="btn btn-primary CentrarFormularios"  />
        </div>

    </div>

</asp:Content>
