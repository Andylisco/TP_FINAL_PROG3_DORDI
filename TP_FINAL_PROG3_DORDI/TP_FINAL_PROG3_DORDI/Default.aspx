<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .Menu 
    {
        display: flex;        
        align-items: center;
        justify-content: center;
        
    }
    
    </style>


    <hr />
    <hr />


    <div>

        <h1 class ="Menu">MENU PRINCIPAL</h1>
        
    </div>

    <div class="Menu">
        <div class= "btn-group-vertical" role="group" aria-label="Button group with nested dropdown">
            <asp:Button Text="Gestion Proveedores" OnClick="btn_Proveedor_Click" runat="server" class="btn btn-success" /> 
            <button type="button" class="btn btn-secondary">1</button>
             <button type="button" class="btn btn-secondary">2</button>

            <div class="btn-group" role="group">
                 <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Dropdown
                 </button>
                 <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a class="dropdown-item" href="#">Dropdown link</a>
                    <a class="dropdown-item" href="#">Dropdown link</a>
                 </div>
            </div>
        </div>

    </div>

</asp:Content>
