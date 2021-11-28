<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormProducto.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>

        function validar() {

            //LIMPIO MSG ERROR CODIGO
            document.getElementById("error_NoVacioCodigo").style.display = "none";
            document.getElementById("error_FormatoCodigo").style.display = "none";

            //LIMPIO MSG ERROR DESCRIPCION
            document.getElementById("error_NoVacioDescrip").style.display = "none";

            //LIMPIO MSG ERROR IMAGEN
            document.getElementById("error_NoVacioImagen").style.display = "none";
            document.getElementById("error_ImagenValida").style.display = "none";

            //LIMPIO MSG ERROR STOCK MINIMO
            document.getElementById("error_NoVacioStock").style.display = "none";
            document.getElementById("error_SoloNumStock").style.display = "none";
            document.getElementById("error_Mayor0").style.display = "none";

            //LIMPIO MSG ERROR PORCENTAJE
            document.getElementById("error_NoVacioPorGan").style.display = "none";
            document.getElementById("error_SoloNumPorGan").style.display = "none";
            document.getElementById("error_MAyor100PorGan").style.display = "none";


            var Codigo = document.getElementById("txt_Codigo").value;
            console.log(Codigo);
            var Descripcion = document.getElementById("txt_Descripcion").value;
            console.log(Descripcion);
            var Img_URL = document.getElementById('IMG_Producto').src;
            console.log(Img_URL);
            var StockMinimo = document.getElementById("txt_StockMinimo").value;
            console.log(StockMinimo);
            var PorcentajeGanancia = document.getElementById("txt_PorcentajeGanancia").value;
            console.log(PorcentajeGanancia);


            var Bloquear = true;


            // CODIGO
            var CodigoBloq = true;
            if (Codigo == "") {

                document.getElementById("txt_Codigo").classList.remove("is-valid");
                document.getElementById("txt_Codigo").classList.add("is-invalid");
                document.getElementById("error_NoVacioCodigo").style.display = "";
                Bloquear = false;
                CodigoBloq = false;
            }
            else {
                var CodRegex = /^[A-z][0-9]+$/;

                if (!CodRegex.test(Codigo)) {
                    document.getElementById("txt_Codigo").classList.remove("is-valid");
                    document.getElementById("txt_Codigo").classList.add("is-invalid");
                    document.getElementById("error_FormatoCodigo").style.display = "";
                    Bloquear = false;
                    CodigoBloq = false;
                }
            }

            if (CodigoBloq == true) {
                document.getElementById("txt_Codigo").classList.remove("is-invalid");
                document.getElementById("txt_Codigo").classList.add("is-valid");
            }

            //DESCROPCION

            if (Descripcion == "") {
                document.getElementById("txt_Descripcion").classList.remove("is-valid");
                document.getElementById("txt_Descripcion").classList.add("is-invalid");
                document.getElementById("error_NoVacioDescrip").style.display = "";
                Bloquear = false;
            }
            else {
                document.getElementById("txt_Descripcion").classList.remove("is-invalid");
                document.getElementById("txt_Descripcion").classList.add("is-valid");
            }

            //IMAGEN
            var IMGBloq = true;
            if (Img_URL === "" ) {
                document.getElementById("txt_URLImagen").classList.remove("is-valid");
                document.getElementById("txt_URLImagen").classList.add("is-invalid");
                document.getElementById("error_NoVacioImagen").style.display = "";
                Bloquear = false;
                IMGBloq = false;
            }
            if (Img_URL === "https://png.pngtree.com/png-vector/20210702/ourlarge/pngtree-error-404-page-not-found-website-png-image_3545448.jpg") {
                document.getElementById("txt_URLImagen").classList.remove("is-valid");
                document.getElementById("txt_URLImagen").classList.add("is-invalid");
                document.getElementById("error_ImagenValida").style.display = "";
                Bloquear = false;
                IMGBloq = false;
            }
            if (IMGBloq == true) {
                document.getElementById("txt_URLImagen").classList.remove("is-invalid");
                document.getElementById("txt_URLImagen").classList.add("is-valid");
            }

            //STOCK MINIMO
            var MinStockbloq = true;
            if (StockMinimo == "") {
                document.getElementById("txt_StockMinimo").classList.remove("is-valid");
                document.getElementById("txt_StockMinimo").classList.add("is-invalid");
                Bloquear = false;
                MinStockbloq = false;
                document.getElementById("error_NoVacioStock").style.display = "";
            }
            else {
                var NumeroEnteroRegex = /^\d+$/;

                if (!NumeroEnteroRegex.test(StockMinimo)) {
                    document.getElementById("txt_StockMinimo").classList.remove("is-valid");
                    document.getElementById("txt_StockMinimo").classList.add("is-invalid");
                    Bloquear = false;
                    MinStockbloq = false;
                    document.getElementById("error_SoloNumStock").style.display = "";

                } else if (StockMinimo < 1) {
                    document.getElementById("txt_StockMinimo").classList.remove("is-valid");
                    document.getElementById("txt_StockMinimo").classList.add("is-invalid");
                    Bloquear = false;
                    MinStockbloq = false;
                    document.getElementById("error_Mayor0").style.display = "";
                }

            }

            if (MinStockbloq == true) {
                document.getElementById("txt_StockMinimo").classList.remove("is-invalid");
                document.getElementById("txt_StockMinimo").classList.add("is-valid");
            }



            //PORCENTAJE GANANCIA
            var PorGanBloq = true;
            if (PorcentajeGanancia == "") {
                document.getElementById("txt_PorcentajeGanancia").classList.remove("is-valid");
                document.getElementById("txt_PorcentajeGanancia").classList.add("is-invalid");
                Bloquear = false;
                PorGanBloq = false;
                document.getElementById("error_NoVacioPorGan").style.display = "";
            } else {
                var NumeroEnteroRegex = /^\d+$/;

                if (!NumeroEnteroRegex.test(PorcentajeGanancia)) {
                    document.getElementById("txt_PorcentajeGanancia").classList.remove("is-valid");
                    document.getElementById("txt_PorcentajeGanancia").classList.add("is-invalid");
                    Bloquear = false;
                    PorGanBloq = false;
                    document.getElementById("error_SoloNumPorGan").style.display = "";

                } else if (PorcentajeGanancia <= 100) {
                    document.getElementById("txt_PorcentajeGanancia").classList.remove("is-valid");
                    document.getElementById("txt_PorcentajeGanancia").classList.add("is-invalid");
                    Bloquear = false;
                    PorGanBloq = false;
                    document.getElementById("error_MAyor100PorGan").style.display = "";
                }
            }
            if (PorGanBloq == true) {
                document.getElementById("txt_PorcentajeGanancia").classList.remove("is-invalid");
                document.getElementById("txt_PorcentajeGanancia").classList.add("is-valid");
            }

            
            
            
            return Bloquear;
        }
    </script>

    <hr />
    <hr />

    <div class="container">
        <div class="col-3"></div>

        <div class="col">
            <div class="CentrarTitulos padearControles">
                <asp:Label ID="lbl_TituloActualiza" Text="ACTUALIZA PRODUCTO" runat="server" CssClass="h3" />
                <asp:Label ID="lbl_TituloCargar" Text="CARGAR PRODUCTO" runat="server" CssClass="h3" />
                <!--<h3>ACTUALIZA PRODUCTO</h3>-->
            </div>


            <div class="row align-items-start">
                <div class="col">
                    <div class="CentrarFormularios ">

                        <div class="Separador w-100">
                            <asp:Label ID="lbl_Codigo" runat="server" for="txt_Codigo" CssClass="form-label" Font-Bold="true" Text="Codigo" />
                            <asp:TextBox ID="txt_Codigo" runat="server" ClientIDMode="Static" CssClass="form-control w-100"></asp:TextBox>

                            <span id="error_NoVacioCodigo" style="color: red; display: none">* Es un campo obligatorio</span>
                            <span id="error_FormatoCodigo" style="color: red; display: none">* No tiene formato correcto. Ej: 'A00000'</span>
                        </div>

                        <div class="Separador w-100">
                            <asp:Label ID="lbl_Descripcion" runat="server" for="txt_Descripcion" CssClass="form-label" Font-Bold="true" Text="Descripcion"></asp:Label>
                            <asp:TextBox ID="txt_Descripcion" runat="server" ClientIDMode="Static" CssClass="form-control "></asp:TextBox>

                            <span id="error_NoVacioDescrip" style="color: red; display: none">* Es un campo obligatorio</span>
                        </div>

                        <div class="Separador w-100">

                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>

                                    <asp:Label ID="lbl_URLImagen" runat="server" for="txt_URLImagen" CssClass="form-label" Font-Bold="true" Text="URL Imagen"></asp:Label>
                                    <asp:TextBox ID="txt_URLImagen" runat="server" ClientIDMode="Static" CssClass="form-control" OnTextChanged="txt_URLImagen_TextChanged" AutoPostBack="true"></asp:TextBox>

                                    <span id="error_NoVacioImagen" style="color: red; display: none">* Es un campo obligatorio</span>
                                    <span id="error_ImagenValida" style="color: red; display: none">* Es un campo obligatorio</span>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>

                        <div class=" AlinearCbx">

                            <div class="padearControles Separador">
                                <asp:Label ID="lbl_Rubro" runat="server" cssfor="cbx_Rubro" Font-Bold="true" Text="Rubro"></asp:Label>
                                <asp:DropDownList ID="cbx_Rubro" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns"></asp:DropDownList>
                            </div>

                            <div class="padearControles Separador">
                                <asp:Label ID="lbl_Marca" runat="server" cssfor="cbx_Marca" Font-Bold="true" Text="Marca"></asp:Label>
                                <asp:DropDownList ID="cbx_Marca" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns"></asp:DropDownList>
                            </div>

                        </div>


                        <div class="Separador">
                            <asp:Label ID="lbl_StockMinimo" runat="server" for="txt_StockMinimo" CssClass="form-label" Font-Bold="true" Text="Stock Minimo"></asp:Label>
                            <asp:TextBox ID="txt_StockMinimo" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>


                            <span id="error_NoVacioStock" style="color: red; display: none">* Es un campo obligatorio</span>
                            <span id="error_SoloNumStock" style="color: red; display: none">* Campo Numerico</span>
                            <span id="error_Mayor0" style="color: red; display: none">* El Numero debe ser mayor a 0</span>
                        </div>

                        <div class="Separador">
                            <asp:Label ID="lbl_PorcentajeGanancia" runat="server" for="txt_PorcentajeGanancia" CssClass="form-label" Font-Bold="true" Text=" % Ganancia"></asp:Label>
                            <asp:TextBox ID="txt_PorcentajeGanancia" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <span id="error_NoVacioPorGan" style="color: red; display: none">* Es un campo obligatorio</span>
                            <span id="error_SoloNumPorGan" style="color: red; display: none">* Campo Numerico</span>
                            <span id="error_MAyor100PorGan" style="color: red; display: none">* Para generar ganancias debe ser mayor a 100</span>
                        </div>

                        <div class="Separador">
                            <asp:Button Text="GRABAR PRODUCTO" ID="btnGrabar" OnClientClick="return validar();" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />

                            <asp:Button Text="ACTUALIZA PRODUCTO" ID="btnActualizar" OnClientClick="return validar();" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />
                        </div>

                    </div>
                </div>
                <div class="col">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <asp:Image ID="IMG_Producto" ClientIDMode="Static" CssClass="img-fluid rounded float-en img-thumbnail" runat="server" />

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>

        </div>


        <div class="col-3"></div>
    </div>


</asp:Content>
