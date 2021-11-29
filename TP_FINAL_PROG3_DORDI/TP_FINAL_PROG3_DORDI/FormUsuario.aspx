<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormUsuario.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


     <script>


        function validar() {



            //LIMPIO MSG ERROR NOMBRE
            document.getElementById("error_NoVacioNombre").style.display = "none";

            //LIMPIO MSG CLAVE
            document.getElementById("error_NoVacioClave").style.display = "none";

        
            //LIMPIO MSG ERROR EMAIL
            document.getElementById("error_NoVacioEMail").style.display = "none";
            document.getElementById("error_NoValidoEMail").style.display = "none";





            var Nombre = document.getElementById("txt_Nombre").value;
            console.log(Nombre)
            var Clave = document.getElementById("txt_Clave").value;
            console.log(Apellido)
         
            var Email = document.getElementById("txt_EMail").value;
            console.log(Email)


            var Bloquear = true;



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

            //CLAVE
            if (Clave == "") {
                document.getElementById("txt_Clave").classList.remove("is-valid");
                document.getElementById("txt_Clave").classList.add("is-invalid");
                document.getElementById("error_NoVacioClave").style.display = "";
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Clave").classList.remove("is-invalid");
                document.getElementById("txt_Clave").classList.add("is-valid");
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
        <asp:Label ID="lbl_TituloActualiza" Text="ACTUALIZA USUARIO" runat="server" CssClass="h3" />
        <asp:Label ID="lbl_TituloCargar" Text="CARGAR USUARIO" runat="server" CssClass="h3" />
        <!-- <h3>ACTUALIZA CLIENTE</h3>-->
    </div>
    <div class="row CentrarFormularios">

        <div class=" col-md-4 offset-md-4 CentrarFormularios">

         

            <div class="Separador w-100">
                <asp:Label ID="lbl_Nombre" runat="server" for="txt_Nombre" CssClass="form-label" Font-Bold="true" Text="Nombre"></asp:Label>
                <asp:TextBox ID="txt_Nombre" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                <span id="error_NoVacioNombre" style="color: red; display: none">* Es un campo obligatorio</span>

            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Clave" runat="server" for="txt_Clave" CssClass="form-label" Font-Bold="true" Text="Clave"></asp:Label>
                <asp:TextBox ID="txt_Clave" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                <span id="error_NoVacioClave" style="color: red; display: none">* Es un campo obligatorio</span>

            </div>

           

         

            <div class="Separador w-100">
                <asp:Label runat="server" for="txt_EMail" CssClass="form-label" Font-Bold="true" Text="Direccion Email"></asp:Label>
                <asp:TextBox ID="txt_EMail" runat="server" type="email" ClientIDMode="Static" CssClass="form-control " aria-describedby="lbl_AyudaEmail"></asp:TextBox>

                <span id="error_NoVacioEMail" style="color: red; display: none">* Es un campo obligatorio</span>
                <span id="error_NoValidoEMail" style="color: red; display: none">* No es un formato de mail correcto</span>
            </div>


            <div class="Separador">
                <asp:Button Text="Grabar Usuario" ID="btnGrabar" OnClientClick="return validar();" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary MargenesX15px" />

                <asp:Button Text="Actualiza Usuario" ID="btnActualizar" OnClientClick="return validar();" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary MargenesX15px" />
            </div>

        </div>

    </div>



</asp:Content>
