<%@ Page Title="Compras" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Compras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   
     <hr />
    <hr />


    <div class="CentrarTitulos">
     <h3>LISTADO COMPRAS</h3>
    </div>

    <hr />

    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
         <%if (NivelUsuario == 0)
             { %>
         <a href="/FormCompras?Nro=&Mod=N" class="btn btn-primary">NUEVA COMPRA</a> 
        <%} %>
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
      <th scope="col">PROVEEDOR</th>
      <th scope="col">FECHA</th>
      <th scope="col">TIPO FACT.</th>
      <th scope="col">MEDIO PAGO</th>
      <th scope="col">TOTAL COMPRA</th>
    </tr>
  </thead>
   <tbody>

    <%foreach (var Compra in ListaCompras)
      {  %>
        <tr>
          <th scope="row"><%: Compra.Nro %></th>
          <td> <%: Compra.Proveedor.CUIT + "-" + Compra.Proveedor.RazonSocial  %></td>
          <td> <%: Compra.Fecha.ToString("dd/MM/yyyy") %></td>
          <td> <%: Compra.TipoFactura %></td>
          <td> <%: Compra.Medio_Pago %></td>
          <td> <%: Compra.TotalImporte %></td>
          

          <td> <a href="FormCompras.aspx?Nro=<%: Compra.Nro %>&Mod=V" class="btn btn-primary">VER COMPRA</a> </td>
              <%if (NivelUsuario == 0) { %>
            <td> <a href="FormCompras.aspx?Nro=<%: Compra.Nro %>&Mod=M" class="btn btn-primary">MODIFICAR</a> </td>
            <td> <a href="FormCompras.aspx?Nro=<%: Compra.Nro %>&Mod=E" class="btn btn-danger">ELIMINAR</a> </td>
            <%} %>
               
        </tr>
   <% }   %>

  </tbody>
</table>

</asp:Content>
