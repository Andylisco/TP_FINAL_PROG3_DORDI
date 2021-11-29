using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_FINAL_PROG3_DORDI
{
    public partial class _Default : Page
    {
        public int NivelUsuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    NivelUsuario = (int)Session["NivelUsuario"];
                    if (NivelUsuario != 0)
                    {
                        btn_GestionarUsuarios.Visible = false;
                        btn_Compras.Visible = false;
                    }
                }
                catch (Exception)
                {

                    Response.Redirect("Login");
                }
            }
            
            
        }


        protected void btn_Proveedor_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proveedores");
        }

        protected void btn_Producto_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos");
        }

        protected void btn_Cliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("Clientes");
        }

        protected void btn_Compras_Click(object sender, EventArgs e)
        {
            Response.Redirect("Compras");
        }

        protected void btn_Ventas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ventas");
        }

        protected void btn_GestionarUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios");
        }
    }
}