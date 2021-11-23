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
    public partial class MovVarios : System.Web.UI.Page
    {
        
        public int NivelUsuario { get; set; }
        public string TipoAcccion { get; set; }
 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

               
                    

                var ID = Request.QueryString["ID"] != null ? Request.QueryString["ID"].ToString() : "";
                var Tipo = Request.QueryString["Mod"] != null ? Request.QueryString["Mod"].ToString() : "";

           
                if (Tipo == "C")
                {
                    CargarRubros();
                    CargarMarcas();

                    cbxActualizar_SelectedIndexChanged(null, null);
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

       
        protected void _EliminarItem(long ID)
        {
            Neg_MovVario NMV = new Neg_MovVario();

            NMV.DarBaja(ID);                 
            
             //VUELVO A LA PAGINA DE PRODUCTOS
             Response.Redirect("Listado_MovVarios.aspx");
            
        }

        protected void Agregar_Click(object sender, EventArgs e)
        {
           MovVario MovVa = new MovVario();
            Neg_MovVario NMV = new Neg_MovVario();

            MovVa.Produc = new Producto();
            MovVa.Produc.Codigo = cbx_Producto.SelectedValue;
            MovVa.Produc.Cantidad_Compra = int.Parse(txt_Cantidad.Text);
            MovVa.Motivo = txt_Motivo.Text;

            NMV.agregar(MovVa);           
            
            Response.Redirect("Listado_MovVarios.aspx");
        }

        protected void cbxActualizar_SelectedIndexChanged(object sender, EventArgs e)
        {
            Neg_Producto NegProd = new Neg_Producto();



            cbx_Producto.DataSource = NegProd.GetAll("AND Cod_Rubro = '" + cbx_Rubro.SelectedValue + "' AND Cod_Marca = '" + cbx_Marca.SelectedValue + "'");
            cbx_Producto.DataValueField = "ID";
            cbx_Producto.DataTextField = "Descripcion";
            cbx_Producto.DataBind();

        }

      
    }
}
