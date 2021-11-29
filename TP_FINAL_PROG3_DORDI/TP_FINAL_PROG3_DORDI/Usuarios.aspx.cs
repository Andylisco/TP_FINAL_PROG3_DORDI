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
    public partial class Usuarios : System.Web.UI.Page
    {
        public List<Usuario> ListaUsuarios { get; set; }

        public string T { get; set; }

        public int NivelUsuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                NegUsuario NegUsu = new NegUsuario();

                  T = Request.QueryString["T"] != null ? Request.QueryString["T"].ToString() : "";
                Session.Add("T", T);
                 var F = Request.QueryString["F"] != null ? Request.QueryString["F"].ToString() : "";

                if (F != "")
                {
                    if (T == "LTDE")
                    {
                        ListaUsuarios = NegUsu.GetAll("AND Estado = 0 AND (NombreUsuario LIKE '%" + F + "%' OR Clave LIKE '%" + F + "%' OR Email LIKE '%" + F + "%')");
                        txt_Buscador.Text = F;
                    }
                    else
                    {
                        ListaUsuarios = NegUsu.GetAll("AND Estado = 1 AND (NombreUsuario LIKE '%" + F + "%' OR Clave LIKE '%" + F + "%' OR Email LIKE '%" + F + "%')");
                        txt_Buscador.Text = F;
                    }

                }
                else {

                    if (T == "LTDE")
                    {
                        ListaUsuarios = NegUsu.GetAll("AND Estado = 0 ");
                        txt_Buscador.Text = F;
                    }
                    else
                    {
                        ListaUsuarios = NegUsu.GetAll("AND Estado = 1 ");
                        txt_Buscador.Text = F;
                    }
                }



                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

            }
        }

        protected void BUSCAR_Click(object sender, EventArgs e)
        {

            Response.Redirect("Usuarios?F=" + txt_Buscador.Text + "&T=" + Session["T"]);
        }
    }
}
