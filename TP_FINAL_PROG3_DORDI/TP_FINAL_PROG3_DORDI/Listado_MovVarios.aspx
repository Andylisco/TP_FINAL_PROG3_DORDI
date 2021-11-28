<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Listado_MovVarios.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Listado_MovVarios" %>

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
            width: 70%;
            
            
        }    
                
    </style>



    <hr />

    <div class="CentrarTitulos">
        <h3>LISTADO MOVIMIENTOS VARIOS</h3>
    </div>

    <hr />

    <div class="btn-group flex" role="group" aria-label="Button group with nested dropdown">
        <%if (NivelUsuario == 0)
            { %>
        <a href="/MovVarios?ID=&Mod=C" class="btn btn-primary">AGREGAR MOVIMIENTO</a>
             
        <% }   %>

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
