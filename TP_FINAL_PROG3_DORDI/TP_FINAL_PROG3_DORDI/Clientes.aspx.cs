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
    public partial class Clientes : System.Web.UI.Page
    {
        public List<Cliente> ListaClientes { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Neg_Cliente Neg_Clien = new Neg_Cliente();

            ListaClientes = Neg_Clien.GetAll();
        }
    }
}