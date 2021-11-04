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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Msg_ErrorLogin.Visible = false;


        }

        protected void Login_Click(object sender, EventArgs e)
        {
            NegUsuario Neguser = new NegUsuario();

            Usuario User = Neguser.GetSingle(txt_Usuario.Text, txt_Contraseña.Text);

            if (User.Email is null)
            {
                Msg_ErrorLogin.Visible = true;

            }
            else 
            {
                //FALTA PASAR EL USUARIO A EL RESTO DE LA PAGINA
                Session.Add("Usuario", User.Nombre);
                Session.Add("Clave", User.Clave);


                Response.Redirect("Default");
            }
            
            
        }
    }
}