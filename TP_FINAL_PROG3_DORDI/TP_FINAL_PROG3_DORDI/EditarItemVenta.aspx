<%@ Page Title="" Language="C# " MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarItemVenta.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.EditarItemVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>  

        function ValidarSTOCK() {
            var Bloquear = true;
            //PARTE DE VALIDACION DE PRODUCTO
            document.getElementById("error_SinProducto").style.display = "none";
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
            //PARTE DE VALIDACION DE STOCK
            var stockAc = document.getElementById("txt_StockActual").value;

            var CantidadVenta = document.getElementById("txt_Cantidad").value;
            console.log(document.getElementById("cbx_Producto").value);

            console.log(CantidadVenta);
            console.log(stockAc);

            
            document.getElementById("error_StockInsu").style.display = "none";
            document.getElementById("error_NumEnt").style.display = "none";
            document.getElementById("error_NoVacio").style.display = "none";
            document.getElementById("error_NoCero").style.display = "none";

            if (CantidadVenta == "") {
                document.getElementById("error_NoVacio").style.display = "";
                Bloquear = false;
            } else {
                
                var NumeroEnteroRegex = /^\d+$/;

                if (!NumeroEnteroRegex.test(CantidadVenta)) {
                    document.getElementById("txt_Cantidad").classList.remove("is-valid");
                    document.getElementById("txt_Cantidad").classList.add("is-invalid");
                    document.getElementById("error_NumEnt").style.display = "";
                    Bloquear = false;
                    return Bloquear;
                    console.log("No es un numero entero");
                } else {
                    document.getElementById("txt_Cantidad").classList.remove("is-invalid");
                    document.getElementById("txt_Cantidad").classList.add("is-valid");
                    console.log("Es un numero entero")
                    
                }
                if (parseInt(CantidadVenta) == 0) {
                    console.log("NO puede ser 0");
                    document.getElementById("txt_Cantidad").classList.remove("is-valid");
                    document.getElementById("txt_Cantidad").classList.add("is-invalid");
                    document.getElementById("error_NoCero").style.display = "";
                    Bloquear = false;
                    return Bloquear;

                } else {
                    document.getElementById("txt_Cantidad").classList.remove("is-invalid");
                    document.getElementById("txt_Cantidad").classList.add("is-valid");
                    console.log("Es mayor a 0");
                   

                }

                if (parseInt(CantidadVenta) > parseInt(stockAc))  {
                    console.log("Stock Insuficiente");
                    document.getElementById("txt_Cantidad").classList.remove("is-valid");
                    document.getElementById("txt_Cantidad").classList.add("is-invalid");
                    document.getElementById("error_StockInsu").style.display = "";
                    Bloquear = false;

                } else {
                    document.getElementById("txt_Cantidad").classList.remove("is-invalid");
                    document.getElementById("txt_Cantidad").classList.add("is-valid");
                    console.log("Stock Apto");
                    
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
                            <asp:DropDownList ID="cbx_Producto" runat="server" OnSelectedIndexChanged="cbx_Producto_SelectedIndexChanged" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns">
                            </asp:DropDownList>
                            <span ID="error_SinProducto"  style=" color : red; display: none" >* Debe seleccionar un producto</span>
                        </div>


                        <div class="AlinearCbx ">

                            <div class="padearControles ">
                                <div class="Separador">
                                    <asp:Label ID="lbl_Cantidad" runat="server" for="txt_Cantidad" CssClass="form-label" Font-Bold="true" Text="Cantidad"></asp:Label>
                                    <asp:TextBox ID="txt_Cantidad" runat="server" type="Numeric" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <span ID="error_NumEnt"  style=" color : red ; display: none" >* Debe ser un Numero Entero Mayor a 0</span>
                                    <span ID="error_StockInsu"  style=" color : red; display: none" >* Stock Insuficiente</span>
                                    <span ID="error_NoVacio"  style=" color : red; display: none" >* Debe ingresar una cantidad de venta</span>
                                    <span ID="error_NoCero"  style=" color : red; display: none" >* No debe ser 0</span>
                                    
                                    
                                </div>
                            </div>

                            <div class="padearControles ">
                                <div class="Separador">
                                    <asp:Label ID="lbl_StockActual" runat="server" for="txt_StockActual" CssClass="form-label" Font-Bold="true" Text="Stock Actual"></asp:Label>
                                    <!--CAMPO INVISIBLE PORQUE NO ENCONTRE FORMA DE GUARDAR EL VALOR Y LEVANTARLO EN JAVASCRIPT -->
                                    <asp:TextBox ID="txt_StockActual" runat="server" ClientIDMode="Static" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                        </div>




                        <div class="Separador">
                            <asp:Label ID="lbl_Precio" runat="server" for="txt_Precio" CssClass="form-label" Font-Bold="true" Text="Precio"></asp:Label>
                            <asp:TextBox ID="txt_Precio" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                        </div>




                    </ContentTemplate>
                </asp:UpdatePanel>

                <div>
                    <%if (TipoAcccion != "M")
                        {%>
                    <asp:Button Text="Agregar" runat="server" OnClientClick="return ValidarSTOCK();" OnClick="Agregar_Click" CssClass="btn btn-primary CentrarFormularios" />
                    <%}
                        else
                        {%>
                    <asp:Button Text="Actualizar" runat="server" OnClientClick="return ValidarSTOCK();" OnClick="Actualizar_Click" CssClass="btn btn-primary CentrarFormularios" />
                    <%}%>
                </div>
            </div>
        </div>

        <div class="col-3"></div>
    </div>



</asp:Content>
