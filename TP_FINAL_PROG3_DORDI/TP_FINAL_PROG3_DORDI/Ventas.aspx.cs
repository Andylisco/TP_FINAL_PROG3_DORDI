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
    public partial class About : Page
    {
        public List<Venta> ListaVentas { get; set; }
        public int NivelUsuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

                Neg_Venta Neg_Ven = new Neg_Venta();


                var F = Request.QueryString["F"] != null ? Request.QueryString["F"].ToString() : "";

                if (F != "")
                {
                    

                    ListaVentas = Neg_Ven.GetAll("AND (V.Nro_Factura LIKE '%" + F + "' OR V.DNI_Cliente LIKE '%" + F + "' OR Cl.Apellido LIKE '%" + F + "' OR Cl.Nombre LIKE '%" + F + "'" +
                                                  " OR (CONVERT(VARCHAR,V.fecha,103)) LIKE '%" + F + "%' OR V.Tipo_Factura LIKE '%" + F + "'" +
                                                  " OR Cast((SELECT SUM(PrecioU * Cantidad) FROM Ventas WHERE Nro_Factura = V.Nro_Factura) as varchar) LIKE '%" + F + "' OR M.Descripcion LIKE '%" + F + "')");

                    txt_Buscador.Text = F;
                }
                else
                {
                    ListaVentas = Neg_Ven.GetAll();
                }
            }
        }

        protected void BUSCAR_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ventas?F=" + txt_Buscador.Text);

        }

    }
}