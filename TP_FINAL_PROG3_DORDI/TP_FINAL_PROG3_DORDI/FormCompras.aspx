﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormCompras.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.FormCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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

                        <div class="AlinearCbx w-100">
                            <div class="Separador w-100">
                                <asp:Label ID="lbl_CUITProv" runat="server" for="txt_CUITProv" CssClass="form-label" Font-Bold="true" Text="CUIT Prov."></asp:Label>
                                <asp:TextBox ID="txt_CUITProv" runat="server" ClientIDMode="Static" CssClass="form-control "></asp:TextBox>
                            </div>
                            <div class="Separador w-100">
                                <asp:Label ID="lbl_DescpProv" runat="server" for="txt_DescpProv" CssClass="form-label" Font-Bold="true" Text="Descp. Prov."></asp:Label>
                                <asp:TextBox ID="txt_DescpProv" runat="server" ClientIDMode="Static" CssClass="form-control " ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>


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



                        <div class="Separador">
                            
                      <%if (TipoVista != "V")
                          {%>
                            <asp:Button Text="GRABAR PRODUCTO" ID="btnGrabar" OnClick="btnGrabar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />

                            <asp:Button Text="ACTUALIZA PRODUCTO" ID="btnActualizar" OnClick="btnActualizar_Click" runat="server" CssClass="btn btn-primary CentrarFormularios" />
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
                                    <%if (ListaProductos.Count > 0)
                                        {%>
                                    <%foreach (var Producto in ListaProductos)
                                        {  %>
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
