<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormCompras.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <script>

        function ValidarCompra() {
            var Bloquear = true;
            console.log("Entre a la validacion")

            var NumeroEnteroRegex = /^\d+$/;
            //PARTE DE VALIDACION DEL DNI
            
            document.getElementById("error_NoVacio").style.display = "none";
            document.getElementById("error_LongitudCuit").style.display = "none";
            document.getElementById("error_SoloNumCuit").style.display = "none";
            var Cuit = document.getElementById("txt_CUITProv").value;
            if (Cuit == "") {
                document.getElementById("txt_CUITProv").classList.remove("is-valid");
                document.getElementById("txt_CUITProv").classList.add("is-invalid");
                document.getElementById("error_NoVacio").style.display = "";
                Bloquear = false;
                console.log("Esta Vacio")
                
            } 
            if (Cuit.length < 8) {
                document.getElementById("txt_CUITProv").classList.remove("is-valid");
                document.getElementById("txt_CUITProv").classList.add("is-invalid");
                document.getElementById("error_LongitudCuit").style.display = "";
                Bloquear = false;
                console.log("No cumple el rango")
            } 
            if (!NumeroEnteroRegex.test(Cuit)) {
                document.getElementById("txt_CUITProv").classList.remove("is-valid");
                document.getElementById("txt_CUITProv").classList.add("is-invalid");
                document.getElementById("error_SoloNumCuit").style.display = "";
                Bloquear = false;
                console.log("No son numeros")
            }

            if (Bloquear == true) {
                document.getElementById("txt_CUITProv").classList.remove("is-invalid");
                document.getElementById("txt_CUITProv").classList.add("is-valid");
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
                <asp:Label ID="lbl_TituloActualiza" Text="ACTUALIZA COMPRA" runat="server" CssClass="h3" />
                <asp:Label ID="lbl_TituloCargar" Text="CARGAR COMPRA" runat="server" CssClass="h3" />
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
                                        <asp:Label ID="lbl_CUITProv" runat="server" for="txt_CUITProv" CssClass="form-label" Font-Bold="true" Text="CUIT Prov."></asp:Label>
                                        <asp:TextBox ID="txt_CUITProv" runat="server" MaxLength="11" OnTextChanged="txt_CUITProv_TextChanged" ClientIDMode="Static" CssClass="form-control " AutoPostBack="true"></asp:TextBox>
                                         <span ID="error_NoVacio"  style=" color : red; display: none" >* Es un campo obligatorio</span>
                                          <span ID="error_LongitudCuit"  style=" color : red; display: none" >* Debe tener 11 caracteres</span>
                                          <span ID="error_SoloNumCuit"  style=" color : red; display: none" >* Debe ser un Numero Entero, mayor a 0</span>
                                    </div>
                                    <div class="Separador w-100">
                                        <asp:Label ID="lbl_DescpProv" runat="server" for="txt_DescpProv" CssClass="form-label" Font-Bold="true" Text="Descp. Prov."></asp:Label>
                                        <asp:TextBox ID="txt_DescpProv" runat="server" ClientIDMode="Static" CssClass="form-control " ReadOnly="true"></asp:TextBox>
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
                            <asp:Button Text="GRABAR COMPRA" ID="btnGrabar" OnClientClick="return ValidarCompra();" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />

                            <asp:Button Text="ACTUALIZA COMPRA" ID="btnActualizar" OnClientClick="return ValidarCompra();" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />
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
                                    <%if ((ListaProductos != null) && (ListaProductos.Count > 0))
                                        {%>
                                    <%foreach (var Producto in ListaProductos)
                                        {
                                    %>
                                    <tr>
                                        <th scope="row"><%:  Producto.Codigo  %>
                                        </td>
                                <td><%: Producto.Descripcion  %></td>
                                        <td><%: Producto.Cantidad_Compra %></td>
                                        <td><%: Producto.Precio_U %></td>



                                        <%if (NivelUsuario == 0)
                                            {
                                                if (TipoVista != "V")
                                                {%>
                                        <td><a href="EditarItemComp.aspx?ID=<%: Producto.ID %>&Mod=M" class="btn btn-primary">MODIFICAR</a> </td>
                                        <td><a href="EditarItemComp.aspx?ID=<%: Producto.ID %>&Mod=E" class="btn btn-danger">ELIMINAR</a> </td>
                                        <%}
                                            } %>
                                    </tr>
                                    <% }
                                        }%>
                                </tbody>
                            </table>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <%if (TipoVista != "V")
                        {%>
                    <asp:Button Text="AGREGAR PRODUCTO" runat="server" OnClick="AgregarProd_Click" CssClass="btn btn-primary" />
                    <%} %>
                </div>
            </div>




            <div class="col-3"></div>
        </div>
</asp:Content>
