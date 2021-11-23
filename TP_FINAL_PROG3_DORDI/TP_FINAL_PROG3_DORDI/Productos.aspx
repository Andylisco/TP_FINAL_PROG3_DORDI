<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2><%: Title %>.</h2>
    <div class="CentrarTitulos">
        <h3>LISTADO PRODUCTOS</h3>
    </div>

    <hr />

    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
        <%if (NivelUsuario == 0)
            { %>
        <a href="/FormProducto" class="btn btn-primary">AGREGAR PRODUCTO</a>
        <a href="/Listado_MovVarios" class="btn btn-primary">MOVIMIENTOS VARIOS</a>        
        <% }   %>

        <!--<div class="btn-group" role="group">
             <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                Dropdown
             </button>
             <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                <a class="dropdown-item" href="#">Dropdown link</a>
                <a class="dropdown-item" href="#">Dropdown link</a>
             </div>
        </div>-->
    </div>


    <table class="table">
        <thead>
            <tr>
                <th scope="col">CODIGO</th>
                <th scope="col">DESCRIPCION</th>
                <th scope="col">RUBRO</th>
                <th scope="col">MARCA</th>
                <th scope="col">STOCK</th>
                <th scope="col">STOCK MINIMO</th>
                <th scope="col">% GANANCIA</th>
                <th scope="col">PRECIO U</th>
            </tr>
        </thead>
        <tbody>

            <%foreach (var Produc in ListadoProductos)
                {  %>
            <tr>
                <th scope="row"><%: Produc.Codigo %></th>
                <td><%: Produc.Descripcion %></td>
                <td><%: Produc.Rubro.Descripcion %></td>
                <td><%: Produc.Marca.Descripcion %></td>
                <td><%: Produc.Stock %></td>
                <td><%: Produc.StockMinimo %></td>
                <td><%: Produc.PorcentajeGanancia %></td>
                <td><%: Produc.Precio_U %></td>


                <td><a href="FormProducto.aspx?ID=<%: Produc.ID %>&Mod=V" class="btn btn-primary">VER PROD</a> </td>
                <%if (NivelUsuario == 0)
                    { %>
                <td><a href="FormProducto.aspx?ID=<%: Produc.ID %>&Mod=M" class="btn btn-primary">MODIFICAR</a> </td>

                <td><a href="FormProducto.aspx?ID=<%: Produc.ID %>&Mod=E" class="btn btn-danger">ELIMINAR</a> </td>
                <%} %>
            </tr>
            <% }   %>
        </tbody>
    </table>


</asp:Content>
