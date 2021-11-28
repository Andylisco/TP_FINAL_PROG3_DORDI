<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormCliente.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>


        function validar() {


            //LIMPIO MSG ERROR DNI
            document.getElementById("error_NoVacioDNI").style.display = "none";
            document.getElementById("error_SoloNumDNI").style.display = "none";

            //LIMPIO MSG ERROR NOMBRE
            document.getElementById("error_NoVacioNombre").style.display = "none";

            //LIMPIO MSG APELLIDO
            document.getElementById("error_NoVacioApellido").style.display = "none";

            //LIMPIO MSG ERROR DIRECCION
            document.getElementById("error_NoVacioDireccion").style.display = "none";

            //LIMPIO MSG ERROR TELEFONO
            document.getElementById("error_NoVacioTel").style.display = "none";
            document.getElementById("error_SoloNumTel").style.display = "none";
            document.getElementById("error_LongitudTelefono").style.display = "none";

            //LIMPIO MSG ERROR EMAIL
            document.getElementById("error_NoVacioEMail").style.display = "none";
            document.getElementById("error_NoValidoEMail").style.display = "none";





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



            //DNI
            var DNIBloq = true;
            if (Dni == "") {

                document.getElementById("txt_DNI").classList.remove("is-valid");
                document.getElementById("txt_DNI").classList.add("is-invalid");
                Bloquear = false;
                DNIBloq = false;
                document.getElementById("error_NoVacioDNI").style.display = "";
            }
            else {
                var NumeroEnteroRegex = /^\d+$/;

                if (!NumeroEnteroRegex.test(Dni)) {
                    document.getElementById("txt_DNI").classList.remove("is-valid");
                    document.getElementById("txt_DNI").classList.add("is-invalid");
                    Bloquear = false;
                    DNIBloq = false;
                    document.getElementById("error_SoloNumDNI").style.display = "";
                }
            }
            if (DNIBloq == true) {
                document.getElementById("txt_DNI").classList.remove("is-invalid");
                document.getElementById("txt_DNI").classList.add("is-valid");
            }

            //NOMBRE
            if (Nombre == "") {
                document.getElementById("txt_Nombre").classList.remove("is-valid");
                document.getElementById("txt_Nombre").classList.add("is-invalid");
                Bloquear = false;
                document.getElementById("error_NoVacioNombre").style.display = "";
            }
            else {
                document.getElementById("txt_Nombre").classList.remove("is-invalid");
                document.getElementById("txt_Nombre").classList.add("is-valid");
            }

            //APELLIDO
            if (Apellido == "") {
                document.getElementById("txt_Apellido").classList.remove("is-valid");
                document.getElementById("txt_Apellido").classList.add("is-invalid");
                document.getElementById("error_NoVacioApellido").style.display = "";
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Apellido").classList.remove("is-invalid");
                document.getElementById("txt_Apellido").classList.add("is-valid");
            }



            //DIRECCION
            if (Direccion == "") {
                document.getElementById("txt_Direccion").classList.remove("is-valid");
                document.getElementById("txt_Direccion").classList.add("is-invalid");
                document.getElementById("error_NoVacioDireccion").style.display = "";
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Direccion").classList.remove("is-invalid");
                document.getElementById("txt_Direccion").classList.add("is-valid");
            }

            // TELEFONO
            var TelBloq = true;
            if (Telefono == "") {

                document.getElementById("txt_Telefono").classList.remove("is-valid");
                document.getElementById("txt_Telefono").classList.add("is-invalid");
                document.getElementById("error_NoVacioTel").style.display = "";
                Bloquear = false;
                TelBloq = false;
            }
            else {
                var NumeroEnteroRegex = /^\d+$/;

                if (!NumeroEnteroRegex.test(Telefono)) {
                    document.getElementById("txt_Telefono").classList.remove("is-valid");
                    document.getElementById("txt_Telefono").classList.add("is-invalid");
                    document.getElementById("error_SoloNumTel").style.display = "";
                    Bloquear = false;
                    TelBloq = false;
                }

                if (Telefono.length < 8) {
                    document.getElementById("txt_Telefono").classList.remove("is-valid");
                    document.getElementById("txt_Telefono").classList.add("is-invalid");
                    document.getElementById("error_LongitudTelefono").style.display = "";
                    Bloquear = false;
                    TelBloq = false;
                }
            }

            //EMAIL

            var emailRegex = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            var EmailBloq = true;

            if (Email == "") {
                document.getElementById("txt_EMail").classList.remove("is-valid");
                document.getElementById("txt_EMail").classList.add("is-invalid");
                document.getElementById("error_NoVacioEMail").style.display = "";
                Bloquear = false;
                EmailBloq = false;
            } else if (!emailRegex.test(Email)) {

                document.getElementById("txt_EMail").classList.remove("is-valid");
                document.getElementById("txt_EMail").classList.add("is-invalid");
                Bloquear = false;
                EmailBloq = false;
                document.getElementById("error_NoValidoEMail").style.display = "";
            }

            if (EmailBloq == true) {
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
                        <asp:TextBox ID="txt_DNI" runat="server" CssClass="form-control" ClientIDMode="Static" />

                        <span id="error_NoVacioDNI" style="color: red; display: none">* Es un campo obligatorio</span>
                        <span id="error_SoloNumDNI" style="color: red; display: none">* Debe ser un Numerico</span>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Nombre" runat="server" for="txt_Nombre" CssClass="form-label" Font-Bold="true" Text="Nombre"></asp:Label>
                <asp:TextBox ID="txt_Nombre" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                <span id="error_NoVacioNombre" style="color: red; display: none">* Es un campo obligatorio</span>

            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Apellido" runat="server" for="txt_Apellido" CssClass="form-label" Font-Bold="true" Text="Apellido"></asp:Label>
                <asp:TextBox ID="txt_Apellido" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                <span id="error_NoVacioApellido" style="color: red; display: none">* Es un campo obligatorio</span>

            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Direccion" runat="server" for="txt_Direccion" CssClass="form-label" Font-Bold="true" Text="Direccion"></asp:Label>
                <asp:TextBox ID="txt_Direccion" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                <span id="error_NoVacioDireccion" style="color: red; display: none">* Es un campo obligatorio</span>
            </div>

            <div class="Separador w-100">
                <asp:Label runat="server" for="txt_Telefono" CssClass="form-label" Font-Bold="true" Text="Telefono"></asp:Label>
                <asp:TextBox ID="txt_Telefono" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                <span id="error_NoVacioTel" style="color: red; display: none">* Es un campo obligatorio</span>
                <span id="error_SoloNumTel" style="color: red; display: none">* Debe ser un Numerico</span>
                <span id="error_LongitudTelefono" style="color: red; display: none">* Minimo 8 caracteres</span>
            </div>

            <div class="Separador w-100">
                <asp:Label runat="server" for="txt_EMail" CssClass="form-label" Font-Bold="true" Text="Direccion Email"></asp:Label>
                <asp:TextBox ID="txt_EMail" runat="server" type="email" ClientIDMode="Static" CssClass="form-control " aria-describedby="lbl_AyudaEmail"></asp:TextBox>

                <span id="error_NoVacioEMail" style="color: red; display: none">* Es un campo obligatorio</span>
                <span id="error_NoValidoEMail" style="color: red; display: none">* No es un formato de mail correcto</span>
            </div>


            <div class="Separador">
                <asp:Button Text="Grabar Cliente" ID="btnGrabar" OnClientClick="return validar();" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary MargenesX15px" />

                <asp:Button Text="Actualiza Cliente" ID="btnActualizar" OnClientClick="return validar();" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary MargenesX15px" />
            </div>

        </div>

    </div>


</asp:Content>
