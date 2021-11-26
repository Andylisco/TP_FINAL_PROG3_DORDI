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

        public int NivelUsuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

                Neg_Cliente Neg_Clien = new Neg_Cliente();

                var F = Request.QueryString["F"] != null ? Request.QueryString["F"].ToString() : "";

                if (F != "")
                {
                    ListaClientes = Neg_Clien.GetAll("AND (DNI LIKE '%" + F + "%' OR Nombre LIKE '%" + F + "%' OR Apellido LIKE '%" + F + "%' OR Telefono LIKE '%" + F + "%' OR Direccion LIKE '%" + F + "%' OR Email LIKE '%" + F + "%')");

                    txt_Buscador.Text = F;
                }
                else
                {

                    ListaClientes = Neg_Clien.GetAll();
                }
            }

        }

        protected void BUSCAR_Click(object sender, EventArgs e)
        {
            Response.Redirect("Clientes?F=" + txt_Buscador.Text);

        }
    }


}