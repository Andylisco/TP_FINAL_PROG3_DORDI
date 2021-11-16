<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Clientes" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <hr />
    <hr />


    <div class="CentrarTitulos">
        <h3>LISTADO CLIENTES</h3>
    </div>

    <hr />

    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
  
        <a href="/FormCliente" class="btn btn-primary">AGREGAR CLIENTE</a>           
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
                <th scope="col">DNI</th>
                <th scope="col">NOMBRE</th>
                <th scope="col">APELLIDO</th>
                <th scope="col">E-MAIL</th>
                <th scope="col">TELEFONO</th>
                <th scope="col">DIRECCION</th>
                <th scope="col">ULT. COMPRA</th>
            </tr>
        </thead>
        <tbody>

            <%foreach (var Clien in ListaClientes)
                {  %>
            <tr>
                <th scope="row"><%: Clien.DNI %></th>
                <td><%: Clien.Nombre %></td>
                <td><%: Clien.Apellido %></td>
                <td><%: Clien.EMail %></td>
                <td><%: Clien.Telefono %></td>
                <td><%: Clien.Direccion %></td>
                <td><%: Clien.FechaUltCompra.ToString("dd/MM/yyyy") %></td>

                 <td> <a href="FormCliente.aspx?DNI=<%: Clien.DNI %>&Mod=V" class="btn btn-primary">VER CLIENTE</a> </td>
                <%if (NivelUsuario == 0)
                    { %>
                <td><a href="FormCliente.aspx?DNI=<%: Clien.DNI %>&Mod=M" class="btn btn-primary">MODIFICAR</a> </td>

                <td><a href="FormCliente.aspx?DNI=<%: Clien.DNI %>&Mod=E" class="btn btn-danger">ELIMINAR</a> </td>
                <%} %>
            </tr>
            <% }   %>
        </tbody>
    </table>

</asp:Content>
