<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormProveedor.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormProveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


     <script>

        function validar()
        {

            var CUIT = document.getElementById("txt_CUIT").value;
            console.log(CUIT);
            var RazonSocial = document.getElementById("txt_RazonSocial").value;
            console.log(RazonSocial);
            var Telefono = document.getElementById("txt_Telefono").value;
            console.log(Telefono);
            var Mail = document.getElementById("txt_Mail").value;
            console.log(Mail);
            var PersonaContacto = document.getElementById("txt_PersonaContacto").value;
            console.log(PersonaContacto);
           

            var Bloquear = true;

            if (CUIT == "") {
                
                document.getElementById("txt_CUIT").classList.remove("is-valid");
                document.getElementById("txt_CUIT").classList.add("is-invalid");
                Bloquear = false;
            }
            else
            {
                document.getElementById("txt_CUIT").classList.remove("is-invalid");
                document.getElementById("txt_CUIT").classList.add("is-valid");
            }

            if (RazonSocial == "") {
                document.getElementById("txt_RazonSocial").classList.remove("is-valid");
                document.getElementById("txt_RazonSocial").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_RazonSocial").classList.remove("is-invalid");
                document.getElementById("txt_RazonSocial").classList.add("is-valid");
            }

            if (Telefono == "") {
                document.getElementById("txt_Telefono").classList.remove("is-valid");
                document.getElementById("txt_Telefono").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Telefono").classList.remove("is-invalid");
                document.getElementById("txt_Telefono").classList.add("is-valid");
            }

            if (Mail == "") {
                document.getElementById("txt_Mail").classList.remove("is-valid");
                document.getElementById("txt_Mail").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Mail").classList.remove("is-invalid");
                document.getElementById("txt_Mail").classList.add("is-valid");
            }

            if (PersonaContacto == "") {
                document.getElementById("txt_PersonaContacto").classList.remove("is-valid");
                document.getElementById("txt_PersonaContacto").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_PersonaContacto").classList.remove("is-invalid");
                document.getElementById("txt_PersonaContacto").classList.add("is-valid");
            }

            return Bloquear;
        }
     </script>


    <hr />
    <hr />


    <div class="CentrarTitulos">
        <asp:Label ID="lbl_TituloActualiza" Text="ACTUALIZA PROVEEDOR" runat="server" CssClass="h3" />
        <asp:Label ID="lbl_TituloCargar" Text="CARGAR PROVEEDOR" runat="server" CssClass="h3" />

    </div>

    <div class="CentrarFormularios">

        <div>
            <asp:Label ID="lbl_CUIT" runat="server" for="txt_CUIT" cssclass="form-label" Font-Bold="true" Text="CUIT" />
            <asp:TextBox ID="txt_CUIT" runat="server" ClientIDMode="Static" cssclass="form-control" aria-describedby="lbl_ayudaCuit" OnTextChanged="txt_CUIT_TextChanged" AutoPostBack="true" />
            <asp:Label ID="lbl_ayudaCuit" runat="server" Text="Ingrese el Numero sin '-'" ForeColor="OrangeRed" Visible="false" />
        </div>

        <div>
            <asp:Label ID="lbl_RazonSocial" runat="server" for="txt_RazonSocial" class="form-label" Font-Bold="true" Text="Razon Social"></asp:Label>
            <asp:TextBox ID="txt_RazonSocial" runat="server" ClientIDMode="Static" cssclass="form-control"></asp:TextBox>
        </div>

        <div>

            <asp:Label ID="lbl_Direccion" runat="server" for="txt_Direccion" cssclass="form-label" Font-Bold="true" Text="Direccion"></asp:Label>
            <asp:TextBox ID="txt_Direccion" runat="server" ClientIDMode="Static" cssclass="form-control"></asp:TextBox>
        </div>

        <div>
            <asp:Label runat="server" for="txt_Telefono" cssclass="form-label" Font-Bold="true" Text="Telefono"></asp:Label>
            <asp:TextBox ID="txt_Telefono" runat="server" ClientIDMode="Static" cssclass="form-control"></asp:TextBox>
        </div>

        <div>
            <asp:Label runat="server" for="txt_Mail" cssclass="form-label" Font-Bold="true" Text="Direccion Email"></asp:Label>
            <asp:TextBox ID="txt_Mail" runat="server" type="email" ClientIDMode="Static" cssclass="form-control" aria-describedby="emailHelp"></asp:TextBox>
        </div>


        <div class="padearControles Separador">
            <asp:Label ID="lbl_Rubro" runat="server" for="cbx_Rubro" cssclass="form-label" Font-Bold="true" Text="Rubro"></asp:Label>
            <asp:DropDownList ID="cbx_Rubro" runat="server" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns"></asp:DropDownList>
        </div>

        <div>
            <asp:Label ID="lbl_PersonaContacto" runat="server" for="txt_PersonaContacto" cssclass="form-label" Font-Bold="true" Text="Persona de Contacto"></asp:Label>
            <asp:TextBox ID="txt_PersonaContacto" runat="server" ClientIDMode="Static" cssclass="form-control"></asp:TextBox>
        </div>

        <div>
            <asp:Button Text="Grabar Proveedor" ID="btnGrabar" OnClientClick="return validar();" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />

            <asp:Button Text="Actualiza Proveedor" ID="btnActualizar" OnClientClick="return validar();" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios"/>
        </div>
    </div>



</asp:Content>
