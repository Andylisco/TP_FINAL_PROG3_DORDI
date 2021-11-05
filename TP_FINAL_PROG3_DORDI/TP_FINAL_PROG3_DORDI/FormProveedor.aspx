<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormProveedor.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormProveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <hr />
     <hr />
      
   
            <div>
                <asp:Label ID="lbl_CUIT" runat="server" for="txt_CUIT" class="form-label" Font-Bold="true" Text="CUIT"/>
                <asp:TextBox ID="txt_CUIT" runat="server" class="form-control" aria-describedby="lbl_ayudaCuit" OnTextChanged="txt_CUIT_TextChanged" AutoPostBack="true"/>
                <asp:Label ID="lbl_ayudaCuit" runat="server" Text="Ingrese el Numero sin '-'" ForeColor="OrangeRed" Visible="false" />
            </div>

    <div>
        <asp:Label ID="lbl_RazonSocial" runat="server"  for="txt_RazonSocial" class="form-label" Font-Bold="true" Text="Razon Social"></asp:Label>
        <asp:TextBox ID="txt_RazonSocial" runat="server" class="form-control"></asp:TextBox>
    </div>

    <div>

        <asp:Label ID="lbl_Direccion" runat="server" for="txt_Direccion" class="form-label" Font-Bold="true" Text="Direccion"></asp:Label>
        <asp:TextBox ID="txt_Direccion" runat="server" class="form-control"></asp:TextBox>
    </div>

     <div>
        <asp:Label  runat="server" for="txt_Telefono" class="form-label" Font-Bold="true" Text="Telefono"></asp:Label>
        <asp:TextBox ID="txt_Telefono" runat="server" class="form-control"></asp:TextBox> 
    </div>

    <div>
          <asp:Label runat="server" for="txt_Mail" class="form-label" Font-Bold="true" Text="Direccion Email"></asp:Label>
        <asp:TextBox ID="txt_Mail" runat="server" type="email" class="form-control"  aria-describedby="emailHelp"></asp:TextBox>
    </div>
    
    
    <div>
        <asp:Label ID="lbl_Rubro" runat="server" for="cbx_Rubro" class="form-label" Font-Bold="true" Text="Rubro"></asp:Label>
        <asp:DropDownList ID="cbx_Rubro" runat="server" class="form-control"></asp:DropDownList>
    </div>
    
     <div>
        <asp:Label ID="lbl_PersonaContacto" runat="server" for="txt_PersonaContacto" class="form-label" Font-Bold="true" Text="Persona de Contacto"></asp:Label>
        <asp:TextBox ID="txt_PersonaContacto" runat="server" class="form-control"></asp:TextBox>
    </div>

    <div>
        <asp:Button Text="Grabar Proveedor" ID="btnGrabar" OnClick="btnGrabar_Click" runat="server" />

        <asp:Button Text="Actualiza Proveedor" ID="btnActualizar" OnClick="btnActualizar_Click" runat="server" />
    </div>
 
    
    
</asp:Content>
