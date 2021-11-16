<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormProducto.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>

        function validar()
        {

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
                            <asp:Label ID="lbl_Codigo" runat="server" for="txt_Codigo" CssClass="form-label"  Font-Bold="true" Text="Codigo" />
                            <asp:TextBox ID="txt_Codigo" runat="server" ClientIDMode="Static" CssClass="form-control w-100"></asp:TextBox>
                        </div>

                        <div class="Separador w-100">
                            <asp:Label ID="lbl_Descripcion" runat="server" for="txt_Descripcion" CssClass="form-label" Font-Bold="true" Text="Descripcion"></asp:Label>
                            <asp:TextBox ID="txt_Descripcion" runat="server" ClientIDMode="Static" CssClass="form-control "></asp:TextBox>
                        </div>

                        <div class="Separador w-100">

                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                        
                            <asp:Label ID="lbl_URLImagen" runat="server" for="txt_URLImagen" CssClass="form-label" Font-Bold="true" Text="URL Imagen"></asp:Label>
                            <asp:TextBox ID="txt_URLImagen" runat="server" ClientIDMode="Static" CssClass="form-control" OnTextChanged="txt_URLImagen_TextChanged" AutoPostBack="true"></asp:TextBox>
                        
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        </div>

                        <div class=" AlinearCbx">

                            <div class="padearControles Separador">
                                <asp:Label ID="lbl_Rubro" runat="server" cssfor="cbx_Rubro"  Font-Bold="true" Text="Rubro"></asp:Label>
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
                        </div>

                        <div class="Separador">
                            <asp:Label ID="lbl_PorcentajeGanancia" runat="server" for="txt_PorcentajeGanancia" CssClass="form-label" Font-Bold="true" Text=" % Ganancia"></asp:Label>
                            <asp:TextBox ID="txt_PorcentajeGanancia" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
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
