using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TP_FINAL_PROG3_DORDI
{
    public partial class FormVentas : System.Web.UI.Page
    {
        public List<Producto> ListaProductos { get; set; }
        public int NivelUsuario { get; set; }

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

                if (Tipo == "M" || Tipo == "RM" || Tipo == "V")
                {
                    if (Nro != "")
                    {
                        Session.Add("NumeroVenta", Nro);

                        _CargarVenta(int.Parse(Nro));


                        if (Tipo == "V")
                        {
                            _MarcarSoloLectura();

                        }
                        else
                        {
                            if (Tipo == "MA")
                            {

                                txt_DNICliente.Text = Session["DNICliente"].ToString();
                                txt_DNICliente_TextChanged(null, null);
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
                        Neg_Venta NegVent = new Neg_Venta();
                        NegVent.DarBaja(int.Parse(Nro));
                        Response.Redirect("Ventas.aspx");
                    }
                    else
                    {
                        if (Tipo == "NA")
                        {
                            txt_DNICliente.Text = Session["DNICliente"].ToString();
                            txt_DNICliente_TextChanged(null, null);
                            cbx_TipoFactura.SelectedValue = Session["TipoFac"].ToString();
                            cbx_MedioPago.SelectedValue = Session["MedPag"].ToString();

                            _CargarFromLista();

                        }

                        if (Tipo == "MA")
                        {

                            txt_DNICliente.Text = Session["DNICliente"].ToString();
                            txt_DNICliente_TextChanged(null, null);
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

                //GUARDO LOS VALORES 
                Session.Add("DNICliente", txt_ApellidoNombre.Text);
                Session.Add("TipoFac", cbx_TipoFactura.SelectedValue);
                Session.Add("MedPag", cbx_MedioPago.SelectedValue);

            }
        }

        private void _CargarLista(Venta Venta)
        {

            if (ListaProductos == null)
            {
                ListaProductos = new List<Producto>();
            }

            foreach (Producto Prod in Venta.Productos)
            {
                ListaProductos.Add((Producto)Prod);
            }

            Session.Add("ListaProductosVenta", ListaProductos);
        }

        private void _CargarFromLista()
        {
            ListaProductos = (List<Producto>)Session["ListaProductosVenta"];
        }

        private void _CargarVenta(int Nro)
        {
            Neg_Venta Ng_venta = new Neg_Venta();
            Venta Vent = Ng_venta.GetSingle(Nro);

            txt_NroFactura.Text = Nro.ToString();
            txt_DNICliente.Text = Vent.Cliente.DNI;
            txt_ApellidoNombre.Text = Vent.Cliente.Apellido + " " + Vent.Cliente.Nombre;
            txt_Fecha.Text = Vent.Fecha.ToString("dd/MM/yyyy");

            cbx_MedioPago.SelectedValue = Vent.MedioPago.Codigo;

            cbx_TipoFactura.SelectedItem.Text = Vent.TipoFactura;

            if (TipoVista == "RM")
            {
                _CargarFromLista();
            }
            else
            {
                _CargarLista(Vent);
            }

            Session.Add("Venta", Vent);

        }

        private void _MarcarSoloLectura()
        {
            txt_DNICliente.ReadOnly = true;


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

            Neg_Venta NgVent = new Neg_Venta();
            Venta vent = new Venta();

            try
            {
                vent.Nro = NgVent._ObtenerNumeroNuevo();
            }
            catch (Exception)
            {

                throw;
            }

            vent.Fecha = DateTime.Parse(txt_Fecha.Text);
            vent.Cliente = new Cliente();
            vent.Cliente.DNI = txt_DNICliente.Text;
            vent.TipoFactura = cbx_TipoFactura.SelectedValue;
            vent.Usuario = new Usuario();
            vent.Usuario.Nombre = Session["Usuario"].ToString();
            vent.MedioPago = new MedioPago();
            vent.MedioPago.Codigo = cbx_MedioPago.SelectedValue;

            ListaProductos = (List<Producto>)Session["ListaProductosVenta"];

            vent.Productos = new List<Producto>();

            foreach (Producto Prod in ListaProductos)
            {
                vent.Productos.Add(Prod);
            }


            try
            {
                NgVent.agregar(vent);

                Response.Redirect("Ventas.aspx");
            }
            catch (Exception)
            {

                throw;
            }


        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            //Obtengo El Numero De La Venta
            int Nro = int.Parse(Session["NumeroVenta"].ToString());

            Neg_Venta Ng_Vent = new Neg_Venta();

            Venta VentActual = Ng_Vent.GetSingle(Nro);

            Venta vent = new Venta();


            vent.Nro = VentActual.Nro;
            vent.Fecha = VentActual.Fecha;
            vent.Cliente = new Cliente();
            vent.Cliente.DNI = txt_DNICliente.Text;
            vent.TipoFactura = cbx_TipoFactura.SelectedValue;
            vent.Usuario = new Usuario();
            vent.Usuario.Nombre = Session["Usuario"].ToString();
            vent.MedioPago = new MedioPago();
            vent.MedioPago.Codigo = cbx_MedioPago.SelectedValue;

            ListaProductos = (List<Producto>)Session["ListaProductosVenta"];

            vent.Productos = new List<Producto>();

            foreach (Producto Prod in ListaProductos)
            {
                vent.Productos.Add(Prod);
            }



            try
            {
                Ng_Vent.Actualizar(vent);

                Response.Redirect("Ventas.aspx");
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void AgregarProd_Click(object sender, EventArgs e)
        {
            Session.Add("DNICliente", txt_DNICliente.Text);
             Session.Add("TipoFac", cbx_TipoFactura.SelectedValue);
             Session.Add("MedPag", cbx_MedioPago.SelectedValue);
            Response.Redirect("EditarItemVenta");
        }

        protected void txt_DNICliente_TextChanged(object sender, EventArgs e)
        {


            if (txt_DNICliente.Text.Length == 8)
            {

                Neg_Cliente NegCli = new Neg_Cliente();
                Cliente Clien;
                try
                {
                    Clien = NegCli.GetSingle(txt_DNICliente.Text);
                    txt_ApellidoNombre.Text = Clien.Apellido + " " + Clien.Nombre ;
                }
                catch (Exception)
                {

                    throw;
                }
            }


            if (ListaProductos == null)
            {
                ListaProductos = (List<Producto>)Session["ListaProductosVenta"];

                if (ListaProductos == null)
                {
                    //SI SIGUE SIENDO NULL, CARGO UNA LISTA NUEVA
                    ListaProductos = new List<Producto>();
                }
            }

            Session.Add("ListaProductosVenta", ListaProductos);


        }
    }
}