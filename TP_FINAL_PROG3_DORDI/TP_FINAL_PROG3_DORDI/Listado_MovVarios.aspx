<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Listado_MovVarios.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Listado_MovVarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <h2><%: Title %>.</h2>
    <div class="CentrarTitulos">
        <h3>LISTADO MOVIMIENTOS VARIOS</h3>
    </div>

    <hr />

    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
        <%if (NivelUsuario == 0)
            { %>
        <a href="/MovVarios?ID=&Mod=C" class="btn btn-primary">AGREGAR MOVIMIENTO</a>
             
        <% }   %>

    </div>


    <table class="table">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">COD. PROD.</th>
                <th scope="col">DESC.</th>
                <th scope="col">CANTIDAD</th>
                <th scope="col">FECHA</th>
                <th scope="col">MOTIVO</th>                
            </tr>
        </thead>
        <tbody>

           <%  foreach (var Mov in ListadoMovs)
                {  %>
            <tr>
                <th scope="row"><%: Mov.ID_MovVario %></th>
                <td><%: Mov.Produc.ID %></td>                
                <td><%: Mov.Produc.Descripcion %></td>
                <td><%: Mov.Produc.Cantidad_Compra %></td>
                <td><%: Mov.Fecha.ToString("dd/MM/yyyy") %></td>
                <td><%: Mov.Motivo %></td>


                <td><a href="MovVarios.aspx?ID=<%: Mov.ID_MovVario %>&Mod=V" class="btn btn-primary">VER PROD</a> </td>
                <%if (NivelUsuario == 0)
                    { %>             
                <td><a href="MovVarios.aspx?ID=<%: Mov.ID_MovVario %>&Mod=E" class="btn btn-danger">ELIMINAR</a> </td>
                <%} %>
            </tr>
            <% }   %>
        </tbody>
    </table>

</asp:Content>
