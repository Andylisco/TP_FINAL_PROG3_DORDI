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
        protected void Page_Load(object sender, EventArgs e)
        {
            var NivelU = (int)Session["NivelUsuario"];
            if (NivelU != 0)
            {
                btn_GestionarUsuarios.Visible = false;
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
            Response.Redirect("Productos");
        }
    }
}