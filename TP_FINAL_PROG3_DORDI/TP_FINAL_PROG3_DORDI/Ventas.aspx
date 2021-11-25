<%@ Page Title="Ventas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <hr />
    <hr />


    <div class="CentrarTitulos">
        <h3>LISTADO VENTAS</h3>
    </div>

    <hr />

    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
        <a href="/FormVentas?Nro=&Mod=N" class="btn btn-primary">NUEVA VENTA</a>
        <button type="button" class="btn btn-secondary">2</button>

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
                <th scope="col">NRO.</th>
                <th scope="col">CLIENTE</th>
                <th scope="col">FECHA</th>
                <th scope="col">TIPO FACT.</th>
                <th scope="col">MEDIO PAGO</th>
                <th scope="col">TOTAL VENTA</th>
            </tr>
        </thead>
        <tbody>

            <%foreach (var Compra in ListaVentas)
                {  %>
            <tr>
                <th scope="row"><%: Compra.Nro %></th>
                <td><%: Compra.Cliente.DNI + "-" + Compra.Cliente.Apellido + " " + Compra.Cliente.Nombre  %></td>
                <td><%: Compra.Fecha.ToString("dd/MM/yyyy") %></td>
                <td><%: Compra.TipoFactura %></td>
                <td><%: Compra.MedioPago %></td>
                <td><%: Compra.TotalImporte %></td>


                <td><a href="FormVentas.aspx?Nro=<%: Compra.Nro %>&Mod=V" class="btn btn-primary">VER Venta</a> </td>
                <%if (NivelUsuario == 0)
                    { %>
                <td><a href="FormVentas.aspx?Nro=<%: Compra.Nro %>&Mod=M" class="btn btn-primary">MODIFICAR</a> </td>
                <td><a href="FormVentas.aspx?Nro=<%: Compra.Nro %>&Mod=E" class="btn btn-danger">ELIMINAR</a> </td>
                <%} %>
            </tr>
            <% }   %>
        </tbody>
    </table>


</asp:Content>
