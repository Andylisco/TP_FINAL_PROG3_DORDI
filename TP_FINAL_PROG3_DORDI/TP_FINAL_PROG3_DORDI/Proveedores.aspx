<%@ Page Title="Gestion de Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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


    <div class="CentrarTitulos">
        <h3>LISTADO PROVEEDORES</h3>
    </div>

    <hr />

    <div class="btn-group flex" role="group" aria-label="Button group with nested dropdown">
        <%if (NivelUsuario == 0)
            { %>
        <a href="/FormProveedor" class="btn btn-primary">AGREGAR PROVEEDOR</a>
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
                <th scope="col">CUIT</th>
                <th scope="col">RAZON SOCIAL</th>
                <th scope="col">DIRECCION</th>
                <th scope="col">TELEFONO</th>
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
                <td><%: Prov.RazonSocial %></td>
                <td><%: Prov.Direccion %></td>
                <td><%: Prov.Telefono %></td>
                <td><%: Prov.Mail %></td>
                <td><%: Prov.Rubro.Descripcion %></td>
                <td><%: Prov.PersonaContacto %></td>

                <td><a href="FormProveedor.aspx?Cuit=<%: Prov.CUIT %>&Mod=V" class="btn btn-primary">VER PROV.</a> </td>
                <%if (NivelUsuario == 0)
                    { %>
                <td><a href="FormProveedor.aspx?Cuit=<%: Prov.CUIT %>&Mod=M" class="btn btn-primary">MODIFICAR</a> </td>
                <td><a href="FormProveedor.aspx?Cuit=<%: Prov.CUIT %>&Mod=E" class="btn btn-danger">ELIMINAR</a> </td>
                <%} %>
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
