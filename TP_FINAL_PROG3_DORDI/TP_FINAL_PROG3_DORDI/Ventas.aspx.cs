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
            NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

            Neg_Venta Neg_Ven = new Neg_Venta();

            ListaVentas = Neg_Ven.GetAll();
        }
    }
}