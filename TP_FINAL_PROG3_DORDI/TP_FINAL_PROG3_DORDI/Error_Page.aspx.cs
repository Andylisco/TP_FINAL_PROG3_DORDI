using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_FINAL_PROG3_DORDI
{
    public partial class Error_Page : System.Web.UI.Page
    {
        public string TipoError { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var M = Request.QueryString["M"] != null ? Request.QueryString["M"].ToString() : "";
                TipoError = M;
                switch (M)
                {
                    case "UG":
                        lbl_msgError.Text = "NO SE PUDO GRABAR EL USUARIO, VERIFIQUE QUE NO EXISTA EL NOMBRE DEL USUARIO.";
                        break;
                    case "CG":
                        lbl_msgError.Text = "NO SE PUDO GRABAR EL CLIENTE, VERIFIQUE QUE NO EXISTA UN CLIENTE CON DICHO DNI.";
                        break;

                    case "PG":
                        lbl_msgError.Text = "NO SE PUDO GRABAR EL PROVEEDOR, VERIFIQUE QUE NO EXISTA UN PROVEEDOR CON DICHO CUIT.";
                        break;
                    case "SU":
                        lbl_msgError.Text = "NO PUEDE USAR EL SISTEMA SIN LOGUEARSE";
                        break;

                }
            }   
            //if (M == "UG")
            //{
            //    lbl_msgError.Text = "NO SE PUDO GRABAR EL USUARIO, VERIFIQUE QUE NO EXISTA EL NOMBRE DEL USUARIO.";
            //}
        }

        protected void Volver_Click(object sender, EventArgs e)
        {

            if (TipoError == "SU")
            {
                Response.Redirect("Login");
            }
            else { 
            Response.Redirect("Default");
            }
        }
    }
}