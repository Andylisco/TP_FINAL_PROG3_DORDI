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
    public partial class Listado_MovVarios : System.Web.UI.Page
    {
        public List<MovVario> ListadoMovs { get; set; }
        public int NivelUsuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Neg_MovVario NMV = new Neg_MovVario();

                ListadoMovs = NMV.GetAll();

                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

            }
        }
    }
}