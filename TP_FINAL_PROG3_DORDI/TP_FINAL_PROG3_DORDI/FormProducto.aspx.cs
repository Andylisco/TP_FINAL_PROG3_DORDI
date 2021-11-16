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
    public partial class FormProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnActualizar.Visible = false;
                txt_Codigo.MaxLength = 6;
                txt_Descripcion.MaxLength = 50;
                txt_URLImagen.MaxLength = 250;
                txt_StockMinimo.MaxLength = 20;
                txt_PorcentajeGanancia.MaxLength = 4;
                cbx_Rubro.SelectedIndex = 0;
                cbx_Marca.SelectedIndex = 0;
                lbl_TituloActualiza.Visible = false;

                CargarRubros();
                CargarMarcas();

                var IDProduc = Request.QueryString["ID"] != null ? Request.QueryString["ID"].ToString() : "";
                var Tipo = Request.QueryString["Mod"] != null ? Request.QueryString["Mod"].ToString() : "";
                if (Tipo == "M" || Tipo == "V")
                {
                    if (IDProduc != "")
                    {
                        CargarProducto(int.Parse(IDProduc));
                        
                        txt_URLImagen_TextChanged(null,null);
                        
                        if (Tipo == "V")
                        {
                            _MarcarSoloLectura();
                        }
                        else
                        {
                            lbl_TituloCargar.Visible = false;
                            lbl_TituloActualiza.Visible = true;
                            btnActualizar.Visible = true;
                            btnGrabar.Visible = false;
                        }

                    }
                }
                else
                {
                    if (Tipo == "E")
                    {
                        Neg_Producto NegProduc = new Neg_Producto();
                        NegProduc.DarBaja(int.Parse(IDProduc));
                        Response.Redirect("Productos.aspx");
                    }
                }
            }
        }
        private void _MarcarSoloLectura()
        {
            txt_Codigo.ReadOnly = true;
            txt_Descripcion.ReadOnly = true;
            txt_PorcentajeGanancia.ReadOnly = true;
            txt_StockMinimo.ReadOnly = true;
            txt_URLImagen.ReadOnly = true;
            cbx_Marca.Enabled = false;
            cbx_Rubro.Enabled = false;

            btnGrabar.Visible = false;

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

        protected void CargarProducto(int ID)
        {
            Neg_Producto NegProduc = new Neg_Producto();

            Producto Produc = NegProduc.GetSingle(ID);

            if (Produc.Descripcion != "")
            {

                txt_Codigo.Text = Produc.Codigo;
                txt_Descripcion.Text = Produc.Descripcion;
                txt_URLImagen.Text = Produc.URLimagen;
                txt_StockMinimo.Text = Produc.StockMinimo.ToString();
                txt_PorcentajeGanancia.Text = Produc.PorcentajeGanancia.ToString();
                cbx_Rubro.SelectedValue = Produc.Rubro.Codigo;
                cbx_Marca.SelectedValue = Produc.Marca.Codigo;
            }
        }
        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            Neg_Producto negocio = new Neg_Producto();


            Producto Produc = new Producto();

            Produc.Codigo = txt_Codigo.Text;
            Produc.Descripcion = txt_Descripcion.Text;
            Produc.URLimagen = txt_URLImagen.Text;
            Produc.PorcentajeGanancia = int.Parse(txt_PorcentajeGanancia.Text);
            Produc.StockMinimo = int.Parse(txt_StockMinimo.Text);
            Produc.Rubro = new Rubro();
            Produc.Rubro.Codigo = (string)cbx_Rubro.SelectedItem.Value;
            Produc.Marca = new Marca();
            Produc.Marca.Codigo = (string)cbx_Marca.SelectedItem.Value;



            negocio.agregar(Produc);

            //CON EL RESPONSE VOLVEMOS A LA PAGINA DE LA GRILLA
            Response.Redirect("Productos.aspx");

        }


        protected void btnActualizar_Click(object sender, EventArgs e)
        {

            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            Neg_Producto negocio = new Neg_Producto();


               Producto Produc = new Producto();

            Produc.ID = int.Parse(Request.QueryString["ID"] != null ? Request.QueryString["ID"].ToString() : "");
            Produc.Codigo = txt_Codigo.Text;
            Produc.Descripcion = txt_Descripcion.Text;
            Produc.URLimagen = txt_URLImagen.Text;
            Produc.PorcentajeGanancia = int.Parse(txt_PorcentajeGanancia.Text);
            Produc.StockMinimo = int.Parse(txt_StockMinimo.Text);
            Produc.Rubro = new Rubro();
            Produc.Rubro.Codigo = (string)cbx_Rubro.SelectedItem.Value;
            Produc.Marca = new Marca();
            Produc.Marca.Codigo = (string)cbx_Marca.SelectedItem.Value;


               negocio.Actualizar(Produc);

               Response.Redirect("Productos.aspx");
   
        }

        protected void txt_URLImagen_TextChanged(object sender, EventArgs e)
        {
            //trozo de codigo de la pagina para cargar la imagen
            string urlPicture = txt_URLImagen.Text;
            byte[] imagen = GetImage(urlPicture);       //comprobar que exsiste

            if (imagen != null)
                IMG_Producto.ImageUrl = urlPicture;
            else
                IMG_Producto.ImageUrl = "https://png.pngtree.com/png-vector/20210702/ourlarge/pngtree-error-404-page-not-found-website-png-image_3545448.jpg";
            // en mi caso en la pagina ASP por defecto la imagen esta asignada 
            //a la imagen de que no exsiste
            //<asp:Image ID="imgProducto" CssClass=" img-thumbnail" runat="server"
            //	 ImageUrl="~/img/nopicture.jpg" />
                     
        }

			                                                 

    private byte[] GetImage(string url)
        {
            try
            {
                System.Net.WebClient _WebClient = new System.Net.WebClient();
                byte[] _image = _WebClient.DownloadData(url);
                if (_image.Length > 0)
                    return _image;
                else
                    return null;
            }
            catch (Exception)
            {
                return null;
            }
        }


    }
}