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
    public partial class Contact : Page
    {
        public List<Proveedor> ListaProv { get; set; }
        public int NivelUsuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Neg_Proveedor Neg_Prov = new Neg_Proveedor();


            ListaProv = Neg_Prov.GetAll();

            NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

            // dgvProveedores.DataSource = ListaProv;
            //
            // dgvProveedores.DataBind();
        }
    }
}