<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovVarios.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.MovVarios" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr />
    <hr />

    <div class="container">
        <div class="col-3"></div>

        <div class="row">

            <div class="CentrarTitulos padearControles">
                <asp:Label ID="lbl_TituloAgregar" Text="GENERAR MOVIMIENTOS VARIOS" runat="server" CssClass="h3" />
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
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="Separador">
                    <asp:Label ID="lbl_Cantidad" runat="server" for="txt_Cantidad" CssClass="form-label" Font-Bold="true" Text="Cantidad"></asp:Label>
                    <asp:TextBox ID="txt_Cantidad" runat="server" type="Numeric" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                </div>

                 <div class="Separador w-100">
                    <asp:Label ID="lbl_Motivo" runat="server" for="txt_Motivo" CssClass="form-label" Font-Bold="true" Text="Motivo"></asp:Label>
                    <asp:TextBox ID="txt_Motivo" runat="server"  ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                </div>


                <div>
                    <asp:Button Text="Agregar" runat="server" OnClick="Agregar_Click" CssClass="btn btn-primary CentrarFormularios" />
                </div>
            </div>
        </div>

        <div class="col-3"></div>
    </div>
</asp:Content>
