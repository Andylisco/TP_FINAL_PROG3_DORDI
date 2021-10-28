<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .Menu 
    {
        display: flex;
        flex-direction: row;
        
    }
    </style>

    <div>
        <h1>MENU PRINCIPAL</h1>
        <div class="Menu">
            <asp:Button Text="Gestion Proveedores" OnClick="btn_Proveedor_Click" runat="server" />
        </div>
    </div>

</asp:Content>
