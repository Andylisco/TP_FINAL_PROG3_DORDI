<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormCliente.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>

        function validar() {

            /* var Codigo = document.getElementById("txt_Codigo").value;
             console.log(Codigo);
             var Descripcion = document.getElementById("txt_Descripcion").value;
             console.log(Descripcion);
             var Img_URL = document.getElementById('IMG_Producto').src;
             console.log(Img_URL);
             var StockMinimo = document.getElementById("txt_StockMinimo").value;
             console.log(StockMinimo);
             var PorcentajeGanancia = document.getElementById("txt_PorcentajeGanancia").value;
             console.log(PorcentajeGanancia);
            */

            var Bloquear = true;

            /*

            if (Codigo == "") {
                
                document.getElementById("txt_Codigo").classList.remove("is-valid");                
                document.getElementById("txt_Codigo").classList.add("is-invalid");
                Bloquear = false;
            }
            else
            {
                document.getElementById("txt_Codigo").classList.remove("is-invalid");
                document.getElementById("txt_Codigo").classList.add("is-valid");
            }

            if (Descripcion == "") {
                document.getElementById("txt_Descripcion").classList.remove("is-valid");
                document.getElementById("txt_Descripcion").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Descripcion").classList.remove("is-invalid");
                document.getElementById("txt_Descripcion").classList.add("is-valid");
            }

            if (Img_URL === "" || Img_URL === "https://png.pngtree.com/png-vector/20210702/ourlarge/pngtree-error-404-page-not-found-website-png-image_3545448.jpg") {
                document.getElementById("txt_URLImagen").classList.remove("is-valid");
                document.getElementById("txt_URLImagen").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_URLImagen").classList.remove("is-invalid");
                document.getElementById("txt_URLImagen").classList.add("is-valid");
            }

            if (StockMinimo < 1) {
                document.getElementById("txt_StockMinimo").classList.remove("is-valid");
                document.getElementById("txt_StockMinimo").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_StockMinimo").classList.remove("is-invalid");
                document.getElementById("txt_StockMinimo").classList.add("is-valid");
            }

            if (PorcentajeGanancia <= 100) {
                document.getElementById("txt_PorcentajeGanancia").classList.remove("is-valid");
                document.getElementById("txt_PorcentajeGanancia").classList.add("is-invalid");
                Bloquear = false;
            }
            else {
                document.getElementById("txt_PorcentajeGanancia").classList.remove("is-invalid");
                document.getElementById("txt_PorcentajeGanancia").classList.add("is-valid");
            }
            */

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
                <asp:Label ID="lbl_DNI" runat="server" for="txt_DNI" CssClass="form-label" Font-Bold="true" Text="DNI" />
                <asp:TextBox ID="txt_DNI" runat="server" CssClass="form-control" aria-describedby="lbl_ayudaDNI" OnTextChanged="txt_DNI_TextChanged" AutoPostBack="true" />
                <asp:Label ID="lbl_ayudaDNI" runat="server" Text="Ingrese el Numero sin '-'" ForeColor="OrangeRed" Visible="false" />
            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Nombre" runat="server" for="txt_Nombre" CssClass="form-label" Font-Bold="true" Text="Nombre"></asp:Label>
                <asp:TextBox ID="txt_Nombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Apellido" runat="server" for="txt_Apellido" CssClass="form-label" Font-Bold="true" Text="Apellido"></asp:Label>
                <asp:TextBox ID="txt_Apellido" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="Separador w-100">
                <asp:Label ID="lbl_Direccion" runat="server" for="txt_Direccion" CssClass="form-label" Font-Bold="true" Text="Direccion"></asp:Label>
                <asp:TextBox ID="txt_Direccion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="Separador w-100">
                <asp:Label runat="server" for="txt_Telefono" CssClass="form-label" Font-Bold="true" Text="Telefono"></asp:Label>
                <asp:TextBox ID="txt_Telefono" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="Separador w-100">
                <asp:Label runat="server" for="txt_EMail" CssClass="form-label" Font-Bold="true" Text="Direccion Email"></asp:Label>
                <asp:TextBox ID="txt_EMail" runat="server" type="email" CssClass="form-control " aria-describedby="emailHelp"></asp:TextBox>
            </div>


            <div class="Separador">
                <asp:Button Text="Grabar Cliente" ID="btnGrabar" OnClientClick="return validar();" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary MargenesX15px" />

                <asp:Button Text="Actualiza Cliente" ID="btnActualizar" OnClientClick="return validar();" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary MargenesX15px" />
            </div>

        </div>

    </div>


</asp:Content>
