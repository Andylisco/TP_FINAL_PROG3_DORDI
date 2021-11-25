<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormCliente.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>

       //`` const log = document.getElementById('log');
       //
       // document.addEventListener('keypress', logKey);
       //
       // function ValidarKeypress() {
       //     document.onkeypress = logKey;
       //     var letras = /[A-z]/ig;
       //     if (letras.test(logKey)) {
       //         return false;
       //     } else {
       //         return true;
       //     }
       // }

      //  function logKey(e) {
      //      log.textContent += ` ${e.code}`;
      //  }
      //
        function validar() {

            var Dni = document.getElementById("txt_DNI").value;
            console.log(Dni)
            var Nombre = document.getElementById("txt_Nombre").value;
            console.log(Nombre)
            var Apellido = document.getElementById("txt_Apellido").value;
            console.log(Apellido)
            var Direccion = document.getElementById("txt_Direccion").value;
            console.log(Direccion)
            var Telefono = document.getElementById("txt_Telefono").value;
            console.log(Telefono)
            var Email = document.getElementById("txt_EMail").value;
            console.log(Email)


            var Bloquear = true;


            var sinGuion = /[\-]/ig;

            if (Dni == "" || sinGuion.test(Dni)) {

                document.getElementById("txt_DNI").classList.remove("is-valid");
                document.getElementById("txt_DNI").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_DNI").classList.remove("is-invalid");
                document.getElementById("txt_DNI").classList.add("is-valid");
            }

            if (Nombre == "") {
                document.getElementById("txt_Nombre").classList.remove("is-valid");
                document.getElementById("txt_Nombre").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Nombre").classList.remove("is-invalid");
                document.getElementById("txt_Nombre").classList.add("is-valid");
            }

            if (Apellido == "") {
                document.getElementById("txt_Apellido").classList.remove("is-valid");
                document.getElementById("txt_Apellido").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Apellido").classList.remove("is-invalid");
                document.getElementById("txt_Apellido").classList.add("is-valid");
            }

            if (Direccion == "") {
                document.getElementById("txt_Direccion").classList.remove("is-valid");
                document.getElementById("txt_Direccion").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Direccion").classList.remove("is-invalid");
                document.getElementById("txt_Direccion").classList.add("is-valid");
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



             var emailRegex = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            console.log(emailRegex)
            //Se muestra un texto a modo de ejemplo, luego va a ser un icono
            if (!emailRegex.test(Email)) {
                //invalido
                document.getElementById("txt_EMail").classList.remove("is-valid");
                document.getElementById("txt_EMail").classList.add("is-invalid");
                Bloquear = false;
            } else {
                //valido
                document.getElementById("txt_EMail").classList.remove("is-invalid");
                document.getElementById("txt_EMail").classList.add("is-valid");
            }



            return Bloquear;
        }
    </script>



    <hr />
    <hr />
    <div class="CentrarTitulos">
        <asp:Label ID="lbl_TituloActualiza" Text="ACTUALIZA CLIENTE" runat="server" CssClass="h3" />
        <asp:Label ID="lbl_TituloCargar" Text="CARGAR CLIENTE" runat="server" CssClass="h3" />
        <!-- <h3>ACTUALIZA CLIENTE</h3>-->
    </div>
    <div class="row CentrarFormularios">

        <div class=" col-md-4 offset-md-4 CentrarFormularios">

            <div class="Separador">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lbl_DNI" runat="server" for="txt_DNI" CssClass="form-label" Font-Bold="true" Text="DNI" />
                        <asp:TextBox ID="txt_DNI" runat="server" CssClass="form-control" ClientIDMode="Static" aria-describedby="lbl_ayudaDNI" OnTextChanged="txt_DNI_TextChanged" AutoPostBack="true" />
                        <asp:Label ID="lbl_ayudaDNI" runat="server" Text="Ingrese el Numero sin '-'" ForeColor="OrangeRed" Visible="false" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Nombre" runat="server" for="txt_Nombre" CssClass="form-label" Font-Bold="true" Text="Nombre"></asp:Label>
                <asp:TextBox ID="txt_Nombre" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                 <asp:Label ID="lbl_AyudaNombre" runat="server" Text="El Nombre no puede estar vacio." ForeColor="OrangeRed" Visible="false" />
            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Apellido" runat="server" for="txt_Apellido" CssClass="form-label" Font-Bold="true" Text="Apellido"></asp:Label>
                <asp:TextBox ID="txt_Apellido" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                <asp:Label ID="lbl_ayudaApellido" runat="server" Text="El Apellido no puede estar vacio." ForeColor="OrangeRed" Visible="false" />
            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Direccion" runat="server" for="txt_Direccion" CssClass="form-label" Font-Bold="true" Text="Direccion"></asp:Label>
                <asp:TextBox ID="txt_Direccion" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                 <asp:Label ID="lbl_AyudaDireccion" runat="server" Text="La direccion no puede estar vacio." ForeColor="OrangeRed" Visible="false" />
            </div>

            <div class="Separador w-100">
                <asp:Label runat="server" for="txt_Telefono" CssClass="form-label" Font-Bold="true" Text="Telefono"></asp:Label>
                <asp:TextBox ID="txt_Telefono" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                 <asp:Label ID="lbl_AyudaTelefono" runat="server" Text="El Nombre no puede estar vacio." ForeColor="OrangeRed" Visible="false" />
            </div>

            <div class="Separador w-100">
                <asp:Label runat="server" for="txt_EMail" CssClass="form-label" Font-Bold="true" Text="Direccion Email"></asp:Label>
                <asp:TextBox ID="txt_EMail" runat="server" type="email" ClientIDMode="Static" CssClass="form-control " aria-describedby="lbl_AyudaEmail"></asp:TextBox>
                <asp:Label ID="lbl_AyudaEmail" runat="server" Text="El Email no cumple con le formato correcto." ForeColor="OrangeRed" Visible="false" />
            </div>


            <div class="Separador">
                <asp:Button Text="Grabar Cliente" ID="btnGrabar" OnClientClick="return validar();" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary MargenesX15px" />

                <asp:Button Text="Actualiza Cliente" ID="btnActualizar" OnClientClick="return validar();" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary MargenesX15px" />
            </div>

        </div>

    </div>


</asp:Content>
