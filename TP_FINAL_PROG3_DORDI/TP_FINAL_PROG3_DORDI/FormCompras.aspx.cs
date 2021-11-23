using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace TP_FINAL_PROG3_DORDI
{
    public partial class FormCompras : System.Web.UI.Page
    {
        public List<Producto> ListaProductos { get; set; }
        public int NivelUsuario { get; set; }
        public decimal ImporteTotal { get; set; }

        public string TipoVista { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

                /*ListaProductos = new List<Producto>();*/

                cbx_TipoFactura.Items.Add("A");
                cbx_TipoFactura.Items.Add("B");
                cbx_TipoFactura.Items.Add("C");

                txt_Fecha.Text = DateTime.Today.ToString("dd/MM/yyyy");

                btnActualizar.Visible = false;
               
                lbl_TituloActualiza.Visible = false;

                CargarMediosPagos();
                /*
                CargarMarcas();*/

                var Nro = Request.QueryString["Nro"] != null ? Request.QueryString["Nro"].ToString() : "";
                
                var Tipo = Request.QueryString["Mod"] != null ? Request.QueryString["Mod"].ToString() : "";

                TipoVista = Tipo.ToString();

                if (Tipo == "M" || Tipo == "RM" || Tipo == "V" )
                {
                    if (Nro != "")
                    {
                        Session.Add("NumeroCompra", Nro);

                        _CargarCompra(int.Parse(Nro));


                        if (Tipo == "V")
                        {
                            _MarcarSoloLectura();

                        }
                        else
                        {
                            if (Tipo == "MA")
                            {
                                
                                    txt_CUITProv.Text = Session["CuitProv"].ToString();
                                    txt_CUITProv_TextChanged(null, null);
                                    cbx_TipoFactura.SelectedValue = Session["TipoFac"].ToString();
                                    cbx_MedioPago.SelectedValue = Session["MedPag"].ToString();

                                    _CargarFromLista();

                            }

                            btnActualizar.Visible = true;
                            btnGrabar.Visible = false;
                            lbl_TituloActualiza.Visible = true;
                            lbl_TituloCargar.Visible = false;
                        }

                    }
                }
                else
                {
                    if (Tipo == "E")
                    {
                        Neg_Compra NegComp = new Neg_Compra();
                        NegComp.DarBaja(int.Parse(Nro));
                        Response.Redirect("Compras.aspx");
                    }
                    else
                    {
                        if (Tipo == "NA")
                        {
                            txt_CUITProv.Text = Session["CuitProv"].ToString();
                            txt_CUITProv_TextChanged(null, null);
                            cbx_TipoFactura.SelectedValue = Session["TipoFac"].ToString();
                            cbx_MedioPago.SelectedValue = Session["MedPag"].ToString();

                            _CargarFromLista();

                        }

                        if (Tipo == "MA")
                        {

                            txt_CUITProv.Text = Session["CuitProv"].ToString();
                            txt_CUITProv_TextChanged(null, null);
                            cbx_TipoFactura.SelectedValue = Session["TipoFac"].ToString();
                            cbx_MedioPago.SelectedValue = Session["MedPag"].ToString();

                            _CargarFromLista();

                            btnActualizar.Visible = true;
                            btnGrabar.Visible = false;
                            lbl_TituloActualiza.Visible = true;
                            lbl_TituloCargar.Visible = false;

                        }
                    }
                }


                //SI LA LISTA DE DE PRODUCTOS TIENE ALGO CALCULO EL TOTAL IMPORTE

                ImporteTotal = 0;
                if (ListaProductos != null)
                {
                    if (ListaProductos.Count > 0)
                    {
                        foreach (Producto Prod in ListaProductos)
                        {
                            ImporteTotal += (Prod.Cantidad_Compra * Prod.Precio_U);
                        }
                    }
                }

                txt_ImporteTotal.Text = ImporteTotal.ToString();


                //GUARDO LOS VALORES 
                Session.Add("CuitProv", txt_CUITProv.Text);
                Session.Add("TipoFac", cbx_TipoFactura.SelectedValue);
                Session.Add("MedPag", cbx_MedioPago.SelectedValue);

            }
        }

        private void _CargarLista(Compra Comp)
        {

            if (ListaProductos == null)
            {
                ListaProductos = new List<Producto>();
            }
            
            foreach (Producto Prod in Comp.Productos)
            {
                ListaProductos.Add((Producto)Prod);
            }

            Session.Add("ListaProductosCompra", ListaProductos);
        }

        private void _CargarFromLista()
        {
            ListaProductos = (List<Producto>)Session["ListaProductosCompra"];
        }

        private void _CargarCompra(int Nro)
        {
            Neg_Compra Ng_Comp = new Neg_Compra();
            Compra Comp = Ng_Comp.GetSingle(Nro);

            txt_NroFactura.Text = Nro.ToString();
            txt_CUITProv.Text = Comp.Proveedor.CUIT;
            txt_DescpProv.Text = Comp.Proveedor.RazonSocial;
            txt_Fecha.Text = Comp.Fecha.ToString("dd/MM/yyyy");

            cbx_MedioPago.SelectedValue = Comp.Medio_Pago.Codigo;

            cbx_TipoFactura.SelectedItem.Text = Comp.TipoFactura;

            if (TipoVista == "RM")
            {
                _CargarFromLista();
            }
            else
            {
                _CargarLista(Comp);
            }

            Session.Add("Compra", Comp);

        }

        private void _MarcarSoloLectura()
        {
            txt_CUITProv.ReadOnly = true;


        }
        protected void CargarMediosPagos()
        {
            Neg_MedioPago NegMedPag = new Neg_MedioPago();
            cbx_MedioPago.DataSource = NegMedPag.GetAll();
            cbx_MedioPago.DataValueField = "Codigo";
            cbx_MedioPago.DataTextField = "Descripcion";
            cbx_MedioPago.DataBind();
        }

       

        protected void btnGrabar_Click(object sender, EventArgs e)
        {

            Neg_Compra NgComp = new Neg_Compra();
            Compra Comp = new Compra();

            try
            {
                Comp.Nro = NgComp._ObtenerNumeroNuevo();
            }
            catch (Exception)
            {

                throw;
            }
            
            Comp.Fecha = DateTime.Parse(txt_Fecha.Text);
            Comp.Proveedor = new Proveedor();
            Comp.Proveedor.CUIT = txt_CUITProv.Text;
            Comp.TipoFactura = cbx_TipoFactura.SelectedValue;
            Comp.Usuario = new Usuario();
            Comp.Usuario.Nombre = Session["Usuario"].ToString();
            Comp.Medio_Pago = new MedioPago();
            Comp.Medio_Pago.Codigo = cbx_MedioPago.SelectedValue;

            ListaProductos = (List<Producto>)Session["ListaProductosCompra"];

            Comp.Productos = new List<Producto>();

            foreach (Producto Prod in ListaProductos)
            {
                Comp.Productos.Add(Prod);
            }

            

            try
            {
                NgComp.agregar(Comp);

                Response.Redirect("Compras.aspx");
            }
            catch (Exception)
            {

                throw;
            }           


        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            //Obtengo El Numero De La compra
            int Nro = int.Parse(Session["NumeroCompra"].ToString());
            
            Neg_Compra Ng_Comp = new Neg_Compra();

            Compra CompActual = Ng_Comp.GetSingle(Nro);
            
            Compra Comp = new Compra();


            Comp.Nro = CompActual.Nro;
            Comp.Fecha = CompActual.Fecha;
            Comp.Proveedor = new Proveedor();
            Comp.Proveedor.CUIT = txt_CUITProv.Text;
            Comp.TipoFactura = cbx_TipoFactura.SelectedValue;
            Comp.Usuario = new Usuario();
            Comp.Usuario.Nombre = Session["Usuario"].ToString();
            Comp.Medio_Pago = new MedioPago();
            Comp.Medio_Pago.Codigo = cbx_MedioPago.SelectedValue;

            ListaProductos = (List<Producto>)Session["ListaProductosCompra"];

            Comp.Productos = new List<Producto>();

            foreach (Producto Prod in ListaProductos)
            {
                Comp.Productos.Add(Prod);
            }



            try
            {
                Ng_Comp.Actualizar(Comp);

                Response.Redirect("Compras.aspx");
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void AgregarProd_Click(object sender, EventArgs e)
        {
           /* Session.Add("CuitProv", txt_CUITProv.Text);
            Session.Add("TipoFac", cbx_TipoFactura.SelectedValue);
            Session.Add("MedPag", cbx_MedioPago.SelectedValue);*/
            Response.Redirect("EditarItemComp");
        }

        protected void txt_CUITProv_TextChanged(object sender, EventArgs e)
        {
           

            if (txt_CUITProv.Text.Length == 11)
            {

                Neg_Proveedor NegProv = new Neg_Proveedor();
                Proveedor Prov;
                try
                {
                    Prov = NegProv.GetSingle(txt_CUITProv.Text);
                    txt_DescpProv.Text = Prov.RazonSocial;
                }
                catch (Exception)
                {

                    throw;
                }
            }


            if (ListaProductos == null)
            {
                ListaProductos = (List<Producto>)Session["ListaProductosCompra"];

                if (ListaProductos == null)
                {
                    //SI SIGUE SIENDO NULL, CARGO UNA LISTA NUEVA
                    ListaProductos = new List<Producto>();
                }
            }

            Session.Add("ListaProductosCompra", ListaProductos);


        }
    }
}