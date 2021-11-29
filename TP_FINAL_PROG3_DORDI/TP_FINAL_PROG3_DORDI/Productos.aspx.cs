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
    public partial class Productos : Page
    {
        public List<Producto> ListadoProductos { get; set; }

        public int NivelUsuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                
                Neg_Producto NegPro = new Neg_Producto();

                var F = Request.QueryString["F"] != null ? Request.QueryString["F"].ToString() : "";

                if (F != "")
                {
                    if (F == "SST")
                    {
                        ListadoProductos = NegPro.StockMenorAlRecomendato();
                    }
                    else {
                        ListadoProductos = NegPro.GetAll("AND (Pr.Codigo LIKE '%" + F + "%' OR Pr.Descripcion LIKE '%" + F + "%' OR M.Descripcion LIKE '%" + F + "%' OR R.Descripcion LIKE '%" + F + "%')");
                        txt_Buscador.Text = F;
                    }
                    
                }
                else {
                    ListadoProductos = NegPro.GetAll();
                }

                try
                {

                    NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());
                }
                catch (Exception)
                {

                    Response.Redirect("Error_Page?M=SU");
                }

            }
        }

        protected void BUSCAR_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Productos?F=" + txt_Buscador.Text );
        }
    }
}