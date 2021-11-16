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
    public partial class EditarItemComp : System.Web.UI.Page
    {
        public List<Producto> ListaProductos { get; set; }
        public int NivelUsuario { get; set; }
        public Compra CompActual{ get; set; }

        public string TipoVista { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

                ListaProductos = new List<Producto>();

                ListaProductos = (List<Producto>)Session["ListaProductosCompra"];

                CompActual = new Compra();

                CompActual = (Compra)Session["Compra"];

                CargarRubros();
                CargarMarcas();

                var ID = Request.QueryString["ID"] != null ? Request.QueryString["ID"].ToString() : "";
                var Tipo = Request.QueryString["Mod"] != null ? Request.QueryString["Mod"].ToString() : "";

                TipoVista = Tipo.ToString();

                if (Tipo == "M")
                {
                    if (ID != "")
                    {
                        _CargarItem(int.Parse(ID));

                    }
                }
                else
                {
                    if (Tipo == "E")
                    {
                        _EliminarItem(int.Parse(ID));
                    }
                }
            }
        }


        protected void CargarRubros()
        {
            NegRubro NegRubro = new NegRubro();
            cbx_Rubro.DataSource = NegRubro.GetAll();
            cbx_Rubro.DataValueField = "Codigo";
            cbx_Rubro.DataTextField = "Descripcion";
            cbx_Rubro.DataBind();
        }
        protected void CargarMarcas()
        {
            Neg_Marca NegMarca = new Neg_Marca();
            cbx_Marca.DataSource = NegMarca.GetAll();
            cbx_Marca.DataValueField = "Codigo";
            cbx_Marca.DataTextField = "Descripcion";
            cbx_Marca.DataBind();
        }


        protected void _CargarItem(int ID)
        {
            foreach (Producto Prod in ListaProductos)
            {
                if (Prod.ID == ID)
                {
                    cbx_Rubro.SelectedValue = Prod.Rubro.Codigo;
                    cbx_Marca.SelectedValue = Prod.Marca.Codigo;
                    cbx_Producto.SelectedValue = Prod.Codigo;
                    txt_Cantidad.Text = Prod.Cantidad_Compra.ToString();
                    txt_Precio.Text = Prod.Precio_U.ToString();
                }
            }
        }

        protected void _EliminarItem(int ID)
        {
            Producto ProductoSacar = new Producto();
            foreach (Producto Prod in ListaProductos)
            {
                if (Prod.ID == ID)
                {
                    ProductoSacar = Prod;
                }
            }
            //LO SACO DE LA LISTA
            ListaProductos.Remove(ProductoSacar);
            //ACTUALIZO LA LISTA SE SESSION
            Session.Add("ListaProductosCompra", ListaProductos);
            //VUELVO A LA PAGINA DE LA COMPRA
            Response.Redirect("FormCompras?Nro=" + CompActual.Nro + "&Mod=RM");
        }

        protected void Agregar_Click(object sender, EventArgs e)
        {
            Session.Add("ListaProductosCompra", ListaProductos);
        }
    }
}