<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormProveedor.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormProveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <script>

        function validar() {

            //LIMPIO MSG ERROR CUIT
            document.getElementById("error_NoVacioCuit").style.display = "none";
            document.getElementById("error_SoloNumCuit").style.display = "none";

            //LIMPIO MSG ERROR RAZON SOCIAL
            document.getElementById("error_NoVacioRazonSo").style.display = "none";
          
            //LIMPIO MSG DIRECCION
            document.getElementById("error_NoVacioDireccion").style.display = "none";

            //LIMPIO MSG ERROR TELEFONO
            document.getElementById("error_NoVacioTel").style.display = "none";
            document.getElementById("error_SoloNumTel").style.display = "none";
            document.getElementById("error_LongitudTelefono").style.display = "none";

            //LIMPIO MSG ERROR MAIL
            document.getElementById("error_NoVacioMail").style.display = "none";
            document.getElementById("error_NoValidoMail").style.display = "none";

            //LIMPIO MSG ERROR PERSONA DE CONTACTO
            document.getElementById("error_NoVacioPerCont").style.display = "none";

            


            var CUIT = document.getElementById("txt_CUIT").value;
            console.log(CUIT);
            var RazonSocial = document.getElementById("txt_RazonSocial").value;
            console.log(RazonSocial);
            var Telefono = document.getElementById("txt_Telefono").value;
            console.log(Telefono);
            var Direccion = document.getElementById("txt_Direccion").value;
            console.log(Telefono);
            var Mail = document.getElementById("txt_Mail").value;
            console.log(Mail);
            var PersonaContacto = document.getElementById("txt_PersonaContacto").value;
            console.log(PersonaContacto);


            var Bloquear = true;

            // CUIT
            var CuitBloq = true;
            if (CUIT == "") {

                document.getElementById("txt_CUIT").classList.remove("is-valid");
                document.getElementById("txt_CUIT").classList.add("is-invalid");
                document.getElementById("error_NoVacioCuit").style.display = "";
                Bloquear = false;
                CuitBloq = false;
            }
            else {
                var NumeroEnteroRegex = /^\d+$/;

                if (!NumeroEnteroRegex.test(CUIT)) {
                    document.getElementById("txt_CUIT").classList.remove("is-valid");
                    document.getElementById("txt_CUIT").classList.add("is-invalid");
                    document.getElementById("error_SoloNumCuit").style.display = "";
                    Bloquear = false;
                    CuitBloq = false;
                }
            }

            if (CuitBloq == true) {
                document.getElementById("txt_CUIT").classList.remove("is-invalid");
                document.getElementById("txt_CUIT").classList.add("is-valid");
            }



           //RAZON SOCIAL
            if (RazonSocial == "") {
                document.getElementById("txt_RazonSocial").classList.remove("is-valid");
                document.getElementById("txt_RazonSocial").classList.add("is-invalid");
                document.getElementById("error_NoVacioRazonSo").style.display = "";
                Bloquear = false;
            }
            else {
                document.getElementById("txt_RazonSocial").classList.remove("is-invalid");
                document.getElementById("txt_RazonSocial").classList.add("is-valid");
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

            if (TelBloq == true) {
                document.getElementById("txt_Telefono").classList.remove("is-invalid");
                document.getElementById("txt_Telefono").classList.add("is-valid");
            }


            //EMAIL
            var MAilBloq = true
            if (Mail == "") {
                document.getElementById("txt_Mail").classList.remove("is-valid");
                document.getElementById("txt_Mail").classList.add("is-invalid");
                document.getElementById("error_NoVacioMail").style.display = "";
                Bloquear = false;
                MAilBloq = false;
               
            } else {                
                
                var emailRegex = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                console.log(emailRegex)
                //Se muestra un texto a modo de ejemplo, luego va a ser un icono
                if (!emailRegex.test(Mail)) {
                    //invalido
                    document.getElementById("txt_Mail").classList.remove("is-valid");
                    document.getElementById("txt_Mail").classList.add("is-invalid");
                    document.getElementById("error_NoValidoMail").style.display = "";
                    Bloquear = false;
                    MAilBloq = false;
                }                
            }

            if (MAilBloq == true) {
                document.getElementById("txt_Mail").classList.remove("is-invalid");
                document.getElementById("txt_Mail").classList.add("is-valid");
            }

            // PERSONA CONTACTO
            if (PersonaContacto == "") {
                document.getElementById("txt_PersonaContacto").classList.remove("is-valid");
                document.getElementById("txt_PersonaContacto").classList.add("is-invalid");
                document.getElementById("error_NoVacioPerCont").style.display = "";
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
            <asp:Label ID="lbl_CUIT" runat="server" for="txt_CUIT" CssClass="form-label" Font-Bold="true" Text="CUIT" />
            <asp:TextBox ID="txt_CUIT" runat="server" ClientIDMode="Static" CssClass="form-control" aria-describedby="lbl_ayudaCuit" />

            <span id="error_NoVacioCuit" style="color: red; display: none">* Es un campo obligatorio</span>
            <span id="error_SoloNumCuit" style="color: red; display: none">* Debe ser un Numerico</span>            
        </div>

        <div>
            <asp:Label ID="lbl_RazonSocial" runat="server" for="txt_RazonSocial" class="form-label" Font-Bold="true" Text="Razon Social"></asp:Label>
            <asp:TextBox ID="txt_RazonSocial" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

              <span id="error_NoVacioRazonSo" style="color: red; display: none">* Es un campo obligatorio</span>             
        </div>

        <div>

            <asp:Label ID="lbl_Direccion" runat="server" for="txt_Direccion" CssClass="form-label" Font-Bold="true" Text="Direccion"></asp:Label>
            <asp:TextBox ID="txt_Direccion" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

              <span id="error_NoVacioDireccion" style="color: red; display: none">* Es un campo obligatorio</span>      
        </div>

        <div>
            <asp:Label runat="server" for="txt_Telefono" CssClass="form-label" Font-Bold="true" Text="Telefono"></asp:Label>
            <asp:TextBox ID="txt_Telefono" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
            

              <span id="error_NoVacioTel" style="color: red; display: none">* Es un campo obligatorio</span>
            <span id="error_SoloNumTel" style="color: red; display: none">* Debe ser un Numerico</span>  
            <span id="error_LongitudTelefono" style="color: red; display: none">* Minimo 8 caracteres</span>  
                        
        </div>

        <div>
            <asp:Label runat="server" for="txt_Mail" CssClass="form-label" Font-Bold="true" Text="Direccion Email"></asp:Label>
            <asp:TextBox ID="txt_Mail" runat="server" type="email" ClientIDMode="Static" CssClass="form-control" aria-describedby="emailHelp"></asp:TextBox>


            <span id="error_NoVacioMail" style="color: red; display: none">* Es un campo obligatorio</span>
            <span id="error_NoValidoMail" style="color: red; display: none">* No tiene el formato correcto</span>  
        </div>


        <div class="padearControles Separador">
            <asp:Label ID="lbl_Rubro" runat="server" for="cbx_Rubro" CssClass="form-label" Font-Bold="true" Text="Rubro"></asp:Label>
            <asp:DropDownList ID="cbx_Rubro" runat="server" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns"></asp:DropDownList>
        </div>

        <div>
            <asp:Label ID="lbl_PersonaContacto" runat="server" for="txt_PersonaContacto" CssClass="form-label" Font-Bold="true" Text="Persona de Contacto"></asp:Label>
            <asp:TextBox ID="txt_PersonaContacto" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

            
            <span id="error_NoVacioPerCont" style="color: red; display: none">* Es un campo obligatorio</span>      
        </div>
       

        <div>
            <asp:Button Text="Grabar Proveedor" ID="btnGrabar" OnClientClick="return validar();" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />

            <asp:Button Text="Actualiza Proveedor" ID="btnActualizar" OnClientClick="return validar();" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />
        </div>
    </div>



</asp:Content>
