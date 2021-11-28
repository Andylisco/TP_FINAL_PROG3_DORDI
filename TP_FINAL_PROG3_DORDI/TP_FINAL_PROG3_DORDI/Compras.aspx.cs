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
    public partial class Compras : System.Web.UI.Page
    {
        public List<Compra> ListaCompras { get; set; }
        public int NivelUsuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

                Neg_Compra Neg_Compr = new Neg_Compra();

                ListaCompras = Neg_Compr.GetAll();
                var F = Request.QueryString["F"] != null ? Request.QueryString["F"].ToString() : "";

                if (F != "")
                {

                    

                    ListaCompras = Neg_Compr.GetAll("AND (C.Nro_Factura LIKE '%" + F + "' OR C.CUIT_Prov LIKE '%" + F + "' OR Pv.RazonSocial LIKE '%" + F +
                                "' OR (CONVERT(VARCHAR,C.fecha,103)) LIKE '%" + F + "%' OR C.Tipo_Factura LIKE '%" + F + "' " + 
                                "  OR CAST((SELECT SUM(PrecioU * Cantidad) FROM Compras WHERE Nro_Factura = C.Nro_Factura) as nvarchar) LIKE '%" + F + "%' OR M.Descripcion LIKE '%" + F + "%')");

                    txt_Buscador.Text = F;
                }
                else
                {
                    ListaCompras = Neg_Compr.GetAll();
                }
            }


        }

        protected void BUSCAR_Click(object sender, EventArgs e)
        {
            Response.Redirect("Compras?F=" + txt_Buscador.Text);

        }
    }
}