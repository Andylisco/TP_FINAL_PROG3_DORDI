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

                var F = Request.QueryString["F"] != null ? Request.QueryString["F"].ToString() : "";

                if (F != "")
                      
                {
                    ListadoMovs = NMV.GetAll("AND (Mv.ID LIKE '%" + F + "%' OR Mv.ID_Producto LIKE '%" + F + "%' OR P.Descripcion LIKE '%" + F + "%' OR Mv.Motivo LIKE '%" + F + "%' OR (CONVERT(VARCHAR,Fecha,103)) LIKE  '%" + F + "%')");


                    txt_Buscador.Text = F;
                }
                else
                {

                ListadoMovs = NMV.GetAll();
                  

                }


                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

            }
        }
        protected void BUSCAR_Click(object sender, EventArgs e)
        {
            Response.Redirect("Listado_MovVarios?F=" + txt_Buscador.Text);

        }
    }
}