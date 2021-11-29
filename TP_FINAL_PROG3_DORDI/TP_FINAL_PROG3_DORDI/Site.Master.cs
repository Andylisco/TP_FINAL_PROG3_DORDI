using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_FINAL_PROG3_DORDI
{
    public partial class SiteMaster : MasterPage
    {
        public int NivelUsuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var Usuario = Session["Usuario"].ToString();
                Saludo.Text = "Hola " + Usuario;

                NivelUsuario = (int)Session["NivelUsuario"];
            }
            catch (Exception)
            {

                Response.Redirect("Error_Page?M=SU");
            }
            

        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Session.Remove("NivelUsuario");
            Response.Redirect("Login");
        }
    }
}