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
            NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

            Neg_Compra Neg_Compr = new Neg_Compra();

            ListaCompras = Neg_Compr.GetAll();
        }
    }
}