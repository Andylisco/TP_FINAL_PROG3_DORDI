<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormVentas.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormVentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>

        function ValidarVenta() {
            var Bloquear = true;
            console.log("Entre a la validacion")

            var NumeroEnteroRegex = /^\d+$/;
            //PARTE DE VALIDACION DEL DNI
            
            document.getElementById("error_NoVacio").style.display = "none";
            document.getElementById("error_LongitudDNI").style.display = "none";
            document.getElementById("error_SoloNumDNI").style.display = "none";
            var DNI = document.getElementById("txt_DNICliente").value;
            if (DNI == "") {
                document.getElementById("txt_DNICliente").classList.remove("is-valid");
                document.getElementById("txt_DNICliente").classList.add("is-invalid");
                document.getElementById("error_NoVacio").style.display = "";
                Bloquear = false;
                console.log("Esta Vacio")
                
            } 
            if (DNI.length < 8) {
                document.getElementById("txt_DNICliente").classList.remove("is-valid");
                document.getElementById("txt_DNICliente").classList.add("is-invalid");
                document.getElementById("error_LongitudDNI").style.display = "";
                Bloquear = false;
                console.log("No cumple el rango")
            } 
            if (!NumeroEnteroRegex.test(DNI)) {
                document.getElementById("txt_DNICliente").classList.remove("is-valid");
                document.getElementById("txt_DNICliente").classList.add("is-invalid");
                document.getElementById("error_SoloNumDNI").style.display = "";
                Bloquear = false;
                console.log("No son numeros")
            }

            if (Bloquear == true) {
                document.getElementById("txt_DNICliente").classList.remove("is-invalid");
                document.getElementById("txt_DNICliente").classList.add("is-valid");
            }

            //PARTE DE VALIDACION DE STOCK
            

            return Bloquear;
        }
    </script>
    
    <hr />
    <hr />

    <div class="container">
        <div class="col-3"></div>

        <div class="col">
            <div class="CentrarTitulos padearControles">
                <asp:Label ID="lbl_TituloActualiza" Text="ACTUALIZA VENTA" runat="server" CssClass="h3" />
                <asp:Label ID="lbl_TituloCargar" Text="CARGAR VENTA" runat="server" CssClass="h3" />
                <!--<h3>ACTUALIZA PRODUCTO</h3>-->
            </div>


            <div class="row align-items-start">
                <div class="col">
                    <div class="CentrarFormularios ">

                        <div class="AlinearCbx">
                            <div class="padearControles Separador">
                                <asp:Label ID="lbl_NroFactura" runat="server" for="txt_NroFactura" CssClass="form-label" Font-Bold="true" Text="Nro. Factura" />
                                <asp:TextBox ID="txt_NroFactura" runat="server" ClientIDMode="Static" CssClass="form-control w-100" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="padearControles Separador">
                                <asp:Label ID="lbl_Fecha" runat="server" for="txt_Fecha" CssClass="form-label" Font-Bold="true" Text="Fecha" />
                                <asp:TextBox ID="txt_Fecha" runat="server" ClientIDMode="Static" CssClass="form-control w-100" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>

                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>

                                <div class="AlinearCbx w-100">
                                    <div class="Separador w-100">
                                        <asp:Label ID="lbl_DNICliente" runat="server" for="txt_DNICliente" CssClass="form-label" Font-Bold="true" Text="DNI Cliente"></asp:Label>
                                        <asp:TextBox ID="txt_DNICliente" MaxLength="8" runat="server" OnTextChanged="txt_DNICliente_TextChanged" ClientIDMode="Static" CssClass="form-control " AutoPostBack="true"></asp:TextBox>
                                        <span ID="error_NoVacio"  style=" color : red; display: none" >* Es un campo obligatorio</span>
                                          <span ID="error_LongitudDNI"  style=" color : red; display: none" >* Debe tener 8 caracteres</span>
                                          <span ID="error_SoloNumDNI"  style=" color : red; display: none" >* Debe ser un Numero Entero, mayor a 0</span>
                                    </div>
                                    <div class="Separador w-100">
                                        <asp:Label ID="lbl_ApellidoNombre" runat="server" for="txt_ApellidoNombre" CssClass="form-label" Font-Bold="true" Text="Apellido y Nombre"></asp:Label>
                                        <asp:TextBox ID="txt_ApellidoNombre" runat="server" ClientIDMode="Static" CssClass="form-control " ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <div class="AlinearCbx ">

                            <div class="padearControles ">
                                <asp:Label ID="lbl_TipoFactura" runat="server" cssfor="cbx_TipoFactura" Font-Bold="true" Text="Tipo F."></asp:Label>
                                <asp:DropDownList ID="cbx_TipoFactura" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns"></asp:DropDownList>
                            </div>

                            <div class="padearControles ">
                                <asp:Label ID="lbl_MedioPago" runat="server" cssfor="cbx_MedioPago" Font-Bold="true" Text="M. Pago"></asp:Label>
                                <asp:DropDownList ID="cbx_MedioPago" runat="server" ClientIDMode="Static" CssClass="btn btn-primary dropdown-toggle ColorB_N_Dropdowns"></asp:DropDownList>
                            </div>

                        </div>

                         <div class="padearControles Separador">
                                <asp:Label ID="lbl_ImporteTotal" runat="server" for="txt_ImporteTotal" CssClass="form-label" Font-Bold="true" Text="Total Importe" />
                                <asp:TextBox ID="txt_ImporteTotal" runat="server" ClientIDMode="Static" CssClass="form-control w-100" ReadOnly="true"></asp:TextBox>
                            </div>



                        <div class="Separador">

                            <%if (TipoVista != "V")
                                {%>
                            <asp:Button Text="GRABAR VENTA" ID="btnGrabar" OnClientClick="return ValidarVenta();" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />

                            <asp:Button Text="ACTUALIZA VENTA" ID="btnActualizar" OnClientClick="return ValidarVenta();" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />
                            <%} %>
                        </div>

                    </div>
                </div>
                <div class="col">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">CODIGO</th>
                                        <th scope="col">DESCRIPCION</th>
                                        <th scope="col">CANTIDAD</th>
                                        <th scope="col">PRECIO U</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%if ( (ListaProductos != null) && (ListaProductos.Count > 0))
                                        {%>
                                    <%foreach (var Producto in ListaProductos)
                                        {                                         
                                           %>
                                    <tr>
                                        <th scope="row"><%:  Producto.Codigo  %></td>
                                        <td><%: Producto.Descripcion  %></td>
                                        <td><%: Producto.Cantidad_Compra %></td>
                                        <td><%: Producto.Precio_U %></td>



                                        <%if (TipoVista != "V")
                                                {%>
                                        <td><a href="EditarItemVenta.aspx?ID=<%: Producto.ID %>&Mod=M" class="btn btn-primary">MODIFICAR</a> </td>
                                        <td><a href="EditarItemVenta.aspx?ID=<%: Producto.ID %>&Mod=E" class="btn btn-danger">ELIMINAR</a> </td>
                                        <%}
                                          %>
                                    </tr>
                                    <% }
                                        }%>
                                </tbody>
                            </table>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <%if (TipoVista != "V")
                        {%>
                    <asp:Button Text="AGREGAR PRODUCTO" runat="server"  OnClick="AgregarProd_Click" CssClass="btn btn-primary" />
                    <%} %>
                </div>
            </div>




            <div class="col-3"></div>
        </div>


</asp:Content>
