<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarItemComp.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.EditarItemComp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <script>  

        function ValidarCompra() {
            var Bloquear = true;

            //LIMPIO MSG ERROR CANTIDAD
            document.getElementById("error_NoVacioCant").style.display = "none";
            document.getElementById("error_SoloNum").style.display = "none";
            document.getElementById("error_NoCeroCant").style.display = "none";

            //LIMPIO MSG ERROR PRECIO
            document.getElementById("error_NoVacioPre").style.display = "none";
            document.getElementById("error_SoloNumConComa").style.display = "none";
            document.getElementById("error_NoCeroPre").style.display = "none";

            //LIMPIO MSG ERROR PRODUCTO
            document.getElementById("error_SinProducto").style.display = "none";

            //PARTE DE VALIDACION DE PRODUCTO         
            var IDProd = document.getElementById("cbx_Producto").value;

            if (IDProd == "") {
                document.getElementById("cbx_Producto").classList.remove("is-valid");
                document.getElementById("cbx_Producto").classList.add("is-invalid");
                document.getElementById("error_SinProducto").style.display = "";
                Bloquear = false;

            } else {
                document.getElementById("cbx_Producto").classList.remove("is-invalid");
                document.getElementById("cbx_Producto").classList.add("is-valid");

            }
            //PARTE DE VALIDACION DE CANTIDAD
            var Cantidad = document.getElementById("txt_Cantidad").value;
            var Novalido_Cant = true;

            if (Cantidad == "") {
                document.getElementById("txt_Cantidad").classList.remove("is-valid");
                document.getElementById("txt_Cantidad").classList.add("is-invalid");
                document.getElementById("error_NoVacioCant").style.display = "";
                Bloquear = false;
                Novalido_Cant = false;
            } else {

                var NumeroEnteroRegex = /^\d+$/;

                if (!NumeroEnteroRegex.test(Cantidad)) {
                    document.getElementById("txt_Cantidad").classList.remove("is-valid");
                    document.getElementById("txt_Cantidad").classList.add("is-invalid");
                    document.getElementById("error_SoloNum").style.display = "";
                    Bloquear = false;
                    Novalido_Cant = false;
                    console.log("No es un numero entero");
                } else {                    
                    console.log("Es un numero entero")

                }
                if (parseInt(Cantidad) == 0) {
                    console.log("No puede ser 0");
                    document.getElementById("txt_Cantidad").classList.remove("is-valid");
                    document.getElementById("txt_Cantidad").classList.add("is-invalid");
                    document.getElementById("error_NoCeroCant").style.display = "";
                    Bloquear = false;                   
                    Novalido_Cant = false;
                }
                if (Novalido_Cant == true)    {
                    document.getElementById("txt_Cantidad").classList.remove("is-invalid");
                    document.getElementById("txt_Cantidad").classList.add("is-valid");
                }

            }

             //PARTE DE VALIDACION DE PRECIO
            var Precio = document.getElementById("txt_Precio").value;
            var Novalido_Pre = true;

            if (Precio == "") {
                document.getElementById("txt_Precio").classList.remove("is-valid");
                document.getElementById("txt_Precio").classList.add("is-invalid");
                document.getElementById("error_NoVacioPre").style.display = "";
                Bloquear = false;
                Novalido_Pre = false;
            } else {

                var NumeroDecimalRegex = /^[0-9]+(\,)?[0-9]+$/;

                var PrecioConPunto = Precio.replace(",", ".");
                console.log(PrecioConPunto);

                if (!NumeroDecimalRegex.test(Precio)) {
                    document.getElementById("txt_Precio").classList.remove("is-valid");
                    document.getElementById("txt_Precio").classList.add("is-invalid");
                    document.getElementById("error_SoloNumConComa").style.display = "";
                    Bloquear = false;
                    Novalido_Pre = false;
                    console.log("No decimal con coma");
                   
                } else if (parseFloat(PrecioConPunto) == 0) {
                    console.log("No puede ser 0");
                    document.getElementById("txt_Precio").classList.remove("is-valid");
                    document.getElementById("txt_Precio").classList.add("is-invalid");
                    document.getElementById("error_NoCeroPre").style.display = "";
                    Bloquear = false;
                    Novalido_Pre = false;
                }

                if (Novalido_Pre == true)
                {
                    document.getElementById("txt_Precio").classList.remove("is-invalid");
                    document.getElementById("txt_Precio").classList.add("is-valid");

                }
            }

            return Bloquear;
        }
    </script>

    <hr />
    <hr />

    <div class="container">
        <div class="col-3"></div>

        <div class="row">

            <div class="CentrarTitulos padearControles">
                <asp:Label ID="lbl_TituloModificar" Text="MODIFICAR PRODUCTO" runat="server" CssClass="h3" />
                <asp:Label ID="lbl_TituloAgregar" Text="AGREGAR PRODUCTO" runat="server" CssClass="h3" />
                <!--<h3>ACTUALIZA PRODUCTO</h3>-->
            </div>
            <div class="CentrarFormularios">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                        <div class="padearControles Separador">
                            <asp:Label ID="lbl_Rubro" runat="server" for="txt_Rubro" CssClass="form-label" Font-Bold="true" Text="Rubro" />
                            <asp:DropDownList ID="cbx_Rubro" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns"
                                AutoPostBack="true" OnSelectedIndexChanged="cbxActualizar_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>

                        <div class="padearControles Separador">
                            <asp:Label ID="lbl_Marca" runat="server" for="cbx_Marca" CssClass="form-label" Font-Bold="true" Text="Marca" />
                            <asp:DropDownList ID="cbx_Marca" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns"
                                AutoPostBack="true" OnSelectedIndexChanged="cbxActualizar_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>

                        <div class="padearControles Separador">
                            <asp:Label ID="lbl_Producto" runat="server" for="cbx_Producto" CssClass="form-label" Font-Bold="true" Text="Producto" />
                            <asp:DropDownList ID="cbx_Producto" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns">
                            </asp:DropDownList>
                            <span id="error_SinProducto" style="color: red; display: none">* Debe seleccionar un producto</span>
                        </div>

                        <div class="Separador">
                            <asp:Label ID="lbl_Cantidad" runat="server" for="txt_Cantidad" CssClass="form-label" Font-Bold="true" Text="Cantidad"></asp:Label>
                            <asp:TextBox ID="txt_Cantidad" runat="server" type="Numeric" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            <span id="error_NoVacioCant" style="color: red; display: none">* Es un campo obligatorio</span>
                            <span id="error_SoloNum" style="color: red; display: none">* Debe ser un Numero Entero, mayor a 0</span>
                            <span id="error_NoCeroCant" style="color: red; display: none">* No puede ser 0</span>

                        </div>

                        <div class="Separador">
                            <asp:Label ID="lbl_Precio" runat="server" for="txt_Precio" CssClass="form-label" Font-Bold="true" Text="Precio"></asp:Label>
                            <asp:TextBox ID="txt_Precio" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            <span id="error_NoVacioPre" style="color: red; display: none">* Es un campo obligatorio</span>
                            <span id="error_SoloNumConComa" style="color: red; display: none">* Acepta Numero Decimales con ",", sin "."</span>
                            <span id="error_NoCeroPre" style="color: red; display: none">* No puede ser 0</span>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <div>
                    <%if (TipoAcccion != "M")
                        {%>
                    <asp:Button Text="Agregar" runat="server" OnClientClick="return ValidarCompra();" OnClick="Agregar_Click" CssClass="btn btn-primary CentrarFormularios" />
                    <%}
                        else
                        {%>
                    <asp:Button Text="Actualizar" runat="server" OnClientClick="return ValidarCompra();" OnClick="Actualizar_Click" CssClass="btn btn-primary CentrarFormularios" />
                    <%}%>
                </div>
            </div>
        </div>

        <div class="col-3"></div>
    </div>
</asp:Content>
