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
        public string TipoAcccion { get; set; }
        public Compra CompActual{ get; set; }

        public string TipoVista { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
               
                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());
             } catch (Exception)
                {

                    Response.Redirect("Error_Page?M=SU");
                }

                ListaProductos = new List<Producto>();

                ListaProductos = (List<Producto>)Session["ListaProductosCompra"];

                CompActual = new Compra();

                CompActual = (Compra)Session["Compra"];

                CargarRubros();
                CargarMarcas();

                cbxActualizar_SelectedIndexChanged(null,null);

                lbl_TituloModificar.Visible = false;


                var ID = Request.QueryString["ID"] != null ? Request.QueryString["ID"].ToString() : "";
                var Tipo = Request.QueryString["Mod"] != null ? Request.QueryString["Mod"].ToString() : "";

                TipoVista = Tipo.ToString();

                if (Tipo == "M")
                {
                    if (ID != "")
                    {
                        _CargarItem(int.Parse(ID));

                        TipoAcccion = Tipo;

                        lbl_TituloAgregar.Visible = false;
                        lbl_TituloModificar.Visible = true;
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
            Neg_Producto NegProd = new Neg_Producto();

            foreach (Producto Prod in ListaProductos)
            {
                if (Prod.ID == ID)
                {
                    cbx_Rubro.SelectedValue = NegProd._ObtenerCodigoRubro_XID((int)Prod.ID);
                    cbx_Marca.SelectedValue = NegProd._ObtenerCodigoMarca_XID((int)Prod.ID);
                    cbxActualizar_SelectedIndexChanged(null, null);
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

            if (CompActual == null)
            {
                //VUELVO A LA PAGINA DE COMPRA NUEVA
                Response.Redirect("FormCompras?Mod=NA");
            }
            else { 
            //VUELVO A LA PAGINA DE LA COMPRA DE MODIFICAR
            Response.Redirect("FormCompras?Nro=" + CompActual.Nro + "&Mod=RM");
            }
        }

        protected void Agregar_Click(object sender, EventArgs e)
        {

            Page.Validate();

            if (!Page.IsValid)
            {
                return;
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
       


            Producto Prod = new Producto();
            Neg_Producto NegProd = new Neg_Producto();

            Prod = NegProd.GetSingle(int.Parse(cbx_Producto.SelectedValue));
            /*Prod.ID = long.Parse(cbx_Producto.SelectedValue);
            Prod.Codigo = 
            Prod.Descripcion = cbx_Producto.Text;*/
            Prod.Cantidad_Compra = int.Parse(txt_Cantidad.Text);
            Prod.Precio_U = decimal.Parse(txt_Precio.Text);


            ListaProductos.Add(Prod);
            Session.Remove("ListaProductosCompra");
            Session.Add("ListaProductosCompra", ListaProductos);
            Response.Redirect("FormCompras?Mod=NA");
        }

        protected void cbxActualizar_SelectedIndexChanged(object sender, EventArgs e)
        {
            Neg_Producto NegProd = new Neg_Producto();

                       

            cbx_Producto.DataSource = NegProd.GetAll("AND Cod_Rubro = '" + cbx_Rubro.SelectedValue + "' AND Cod_Marca = '" + cbx_Marca.SelectedValue + "'");
            cbx_Producto.DataValueField = "ID";
            cbx_Producto.DataTextField =  "Descripcion";
            cbx_Producto.DataBind();

        }

        protected void Actualizar_Click(object sender, EventArgs e)
        {


            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            if (ListaProductos == null)
            {
                ListaProductos = (List<Producto>)Session["ListaProductosCompra"];
               
            }



            Producto Prod = new Producto();
            Neg_Producto NegProd = new Neg_Producto();

            Prod = NegProd.GetSingle(int.Parse(cbx_Producto.SelectedValue));
            /*Prod.ID = long.Parse(cbx_Producto.SelectedValue);
            Prod.Codigo = 
            Prod.Descripcion = cbx_Producto.Text;*/
            Prod.Cantidad_Compra = int.Parse(txt_Cantidad.Text);
            Prod.Precio_U = decimal.Parse(txt_Precio.Text);

            Producto ProdSacar = new Producto(); 
            foreach (Producto Produc in ListaProductos)
            {
                if (Produc.ID == Prod.ID)
                {
                    ProdSacar = Produc; 
                }
            }

            ListaProductos.Remove(ProdSacar);


            ListaProductos.Add(Prod);
            Session.Remove("ListaProductosCompra");
            Session.Add("ListaProductosCompra", ListaProductos);
            Response.Redirect("FormCompras?Mod=MA");
        }
    }
}