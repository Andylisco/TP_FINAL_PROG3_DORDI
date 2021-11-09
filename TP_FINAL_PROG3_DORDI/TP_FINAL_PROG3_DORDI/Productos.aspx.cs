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

        protected void Page_Load(object sender, EventArgs e)
        {
            Neg_Producto NegPro = new Neg_Producto();

            ListadoProductos = NegPro.GetAll();
        }


       
    }
}