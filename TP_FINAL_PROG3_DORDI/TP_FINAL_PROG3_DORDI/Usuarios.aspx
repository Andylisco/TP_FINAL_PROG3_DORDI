<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Usuarios" %>

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
            width: 60%
        }
    </style>

    <h2><%: Title %>.</h2>
    <div class="CentrarTitulos">
        <h3>LISTADO USUARIOS</h3>
    </div>

    <hr />

    <div class="btn-group flex" role="group" aria-label="Button group with nested dropdown">


        <%if (NivelUsuario == 0)

            { %>
         <a href="/FormUsuario" class="btn btn-primary">NUEVO USUARIO</a>      
        <a href="/Usuarios?F=&T=LTDA" class="btn btn-primary">ACTIVOS</a>        
        <a href="/Usuarios?F=&T=LTDE" class="btn btn-primary">ELIMINADOS</a>

        <% }   %>

        <div class="TamañoDelLadoBuscador">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">
                <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z" />
            </svg>
            <asp:TextBox ID="txt_Buscador" ClientIDMode="Static" runat="server" Style="width: inherit;" />
            <asp:Button Text="BUSCAR" runat="server" OnClick="BUSCAR_Click" class="btn btn-primary" />
        </div>

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
                <th scope="col">USUARIO</th>
                <th scope="col">CLAVE</th>
                <th scope="col">EMAIL</th>

            </tr>
        </thead>
        <tbody>


            <%foreach (var Usua in ListaUsuarios)
                {  %>
            <tr>
                <th scope="row"><%: Usua.Nombre %></th>
                <td><%: Usua.Clave %></td>
                <td><%: Usua.EMail %></td>


                <td><a href="FormUsuario.aspx?U=<%: Usua.Nombre %>&Mod=M" class="btn btn-primary">MODIFICAR</a> </td>

                <%if (T == "LTDE")
                    { %>
                <td><a href="FormUsuario.aspx?U=<%: Usua.Nombre %>&Mod=HA" class="btn btn-success">HABILITAR</a> </td>

                <%}%>
                <%else
                    {%>
                <td><a href="FormUsuario.aspx?U=<%: Usua.Nombre %>&Mod=E" class="btn btn-danger">ELIMINAR</a> </td>
                <%}
              }%>
            </tr>

        </tbody>
    </table>

</asp:Content>
