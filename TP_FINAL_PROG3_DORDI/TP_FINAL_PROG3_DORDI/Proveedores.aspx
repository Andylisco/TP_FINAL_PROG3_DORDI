<%@ Page Title="Gestion de Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>ListadoProveedores</h3>

    <hr />

    <div>
        <asp:GridView ID="dgvProveedores" runat="server" style="table-layout:inherit"></asp:GridView>
    </div>

    <hr />

    <div>
        <a href="/FormProveedor">AGREGAR PROVEEDOR</a> 
    </div>
   
   <!-- <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address> -->
      
</asp:Content>
