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

            if (!IsPostBack)
            {
                Neg_Proveedor Neg_Prov = new Neg_Proveedor();

                var F = Request.QueryString["F"] != null ? Request.QueryString["F"].ToString() : "";

                if (F != "")
                {
                    ListaProv = Neg_Prov.GetAll("AND (Pr.Cuit LIKE '%" + F + "%' OR Pr.RazonSocial LIKE '%" + F + "%' OR Pr.Telefono LIKE '%" + F + "%' OR Pr.Direccion LIKE '%" + F + "%' OR Pr.mail LIKE '%" + F + "%' OR R.Descripcion LIKE '%" + F + "%')");


                    txt_Buscador.Text = F;
                }
                else
                {

                    ListaProv = Neg_Prov.GetAll();

                }
            }

            NivelUsuario = int.Parse(Session["NivelUsuario"].ToString());

            // dgvProveedores.DataSource = ListaProv;
            //
            // dgvProveedores.DataBind();
        }

        protected void BUSCAR_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proveedores?F=" + txt_Buscador.Text);

        }
    }
}