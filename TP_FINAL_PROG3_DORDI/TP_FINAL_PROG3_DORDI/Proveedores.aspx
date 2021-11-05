<%@ Page Title="Gestion de Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>ListadoProveedores</h3>

    <hr />

    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
         <a href="/FormProveedor" class="btn btn-primary">AGREGAR PROVEEDOR</a> 
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
      <th scope="col">CUIT</th>
      <th scope="col">RAZON SOCIAL</th>
      <th scope="col">DIRECCION</th>
      <th scope="col">MAIL</th>
      <th scope="col">RUBRO</th>
      <th scope="col">PERSONA DE CONTACTO</th>
    </tr>
  </thead>
   <tbody>

    <%foreach (var Prov in ListaProv)
      {  %>
        <tr>
          <th scope="row"><%: Prov.CUIT %></th>
          <td> <%: Prov.RazonSocial %></td>
          <td> <%: Prov.Direccion %></td>
          <td> <%: Prov.Telefono %></td>
          <td> <%: Prov.Mail %></td>
          <td> <%: Prov.Rubro.Descripcion %></td>
          <td> <%: Prov.PersonaContacto %></td>

          <td> <a href="FormProveedor.aspx?Cuit=<%: Prov.CUIT %>" class="btn btn-primary">MODIFICAR</a> </td>
               
        </tr>
   <% }   %>

  </tbody>
</table>

    <!--<div>
        <asp:GridView ID="dgvProveedores" runat="server" style="table-layout:inherit"></asp:GridView>
    </div>

    <hr />

     -->
   
   <!-- <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address> -->
      
</asp:Content>
