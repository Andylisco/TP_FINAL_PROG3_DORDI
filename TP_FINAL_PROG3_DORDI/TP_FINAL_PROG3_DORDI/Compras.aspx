<%@ Page Title="Compras" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Compras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

         <style>
        .flex {
            display: flex;
            justify-content: end;
        }

        .TamañoDelLadoBuscador {
            display: flex;
            align-items: flex-end;
            justify-content: end;
            width: 70%
        }    
                
    </style>
   
     <hr />
    <hr />


    <div class="CentrarTitulos">
     <h3>LISTADO COMPRAS</h3>
    </div>

    <hr />

    <div class="btn-group flex" role="group" aria-label="Button group with nested dropdown">
         <%if (NivelUsuario == 0)
             { %>
         <a href="/FormCompras?Nro=&Mod=N" class="btn btn-primary">NUEVA COMPRA</a> 
        <%} %>
        

      <div class="TamañoDelLadoBuscador">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">
                <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z" />
            </svg>
            <asp:TextBox ID="txt_Buscador" ClientIDMode="Static" runat="server" Style="width: inherit;" />
            <asp:Button Text="BUSCAR" runat="server" OnClick="BUSCAR_Click" class="btn btn-primary" />
        </div>
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
