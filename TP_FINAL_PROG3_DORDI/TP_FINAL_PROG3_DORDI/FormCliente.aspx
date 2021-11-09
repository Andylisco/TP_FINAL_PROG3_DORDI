<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormCliente.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  
        <hr />
        <hr />
    <div class="CentrarTitulos">
        <h3>ACTUALIZA CLIENTE</h3>
    </div>
    
    <div class="CentrarFormularios">

        <div>
            <asp:Label ID="lbl_DNI" runat="server" for="txt_DNI" class="form-label" Font-Bold="true" Text="DNI"/>
            <asp:TextBox ID="txt_DNI" runat="server" class="form-control" aria-describedby="lbl_ayudaDNI" OnTextChanged="txt_DNI_TextChanged" AutoPostBack="true"/>
            <asp:Label ID="lbl_ayudaDNI" runat="server" Text="Ingrese el Numero sin '-'" ForeColor="OrangeRed" Visible="false" />
        </div>

        <div>
             <asp:Label ID="lbl_Nombre" runat="server"  for="txt_Nombre" class="form-label" Font-Bold="true" Text="Nombre"></asp:Label>
             <asp:TextBox ID="txt_Nombre" runat="server" class="form-control"></asp:TextBox>
        </div>

        <div>
             <asp:Label ID="lbl_Apellido" runat="server"  for="txt_Apellido" class="form-label" Font-Bold="true" Text="Apellido"></asp:Label>
             <asp:TextBox ID="txt_Apellido" runat="server" class="form-control"></asp:TextBox>
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
              <asp:Label runat="server" for="txt_EMail" class="form-label" Font-Bold="true" Text="Direccion Email"></asp:Label>
              <asp:TextBox ID="txt_EMail" runat="server" type="email" class="form-control "   aria-describedby="emailHelp"></asp:TextBox>
        </div>
     
   
        <div>
            <asp:Button Text="Grabar Cliente" ID="btnGrabar" OnClick="btnGrabar_Click" runat="server" class="btn btn-primary MargenesX15px" />

            <asp:Button Text="Actualiza Cliente" ID="btnActualizar" OnClick="btnActualizar_Click" runat="server" class="btn btn-primary MargenesX15px" />
        </div>

    </div> 
     

</asp:Content>
