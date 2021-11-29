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
    public partial class FormUsuarios : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                btnActualizar.Visible = false;
                
                txt_Nombre.MaxLength = 50;
                txt_Clave.MaxLength = 50;                
                txt_EMail.MaxLength = 50;
                lbl_TituloActualiza.Visible = false;


                var Usu = Request.QueryString["U"] != null ? Request.QueryString["U"].ToString() : "";
                var Tipo = Request.QueryString["Mod"] != null ? Request.QueryString["Mod"].ToString() : "";
                if (Tipo == "M" || Tipo == "V")
                {
                    if (Usu != "")
                    {
                            CargarUsuario(Usu);

                            btnActualizar.Visible = true;
                            btnGrabar.Visible = false;
                        txt_Nombre.ReadOnly = true;
                            lbl_TituloActualiza.Visible = true;
                            lbl_TituloCargar.Visible = false;
                        

                    }
                }
                else
                {
                    if (Tipo == "E")
                    {
                        NegUsuario NegUsu = new NegUsuario();
                        NegUsu.DarBaja(Usu);
                        Response.Redirect("Usuarios?T=LTDA");
                    }

                    if (Tipo == "HA")
                    {
                        NegUsuario NegUsu = new NegUsuario();
                        NegUsu.Activar(Usu);
                        Response.Redirect("Usuarios?T=LTDE");
                    }

                }
            }
        }


      


        protected void CargarUsuario(string Nombre)
        {
            NegUsuario NegUsu = new NegUsuario();

            Usuario Usua = NegUsu.GetSingle(Nombre);

            if (Usua.Nombre != "")
            {
                
                txt_Nombre.Text = Usua.Nombre;
                txt_Clave.Text = Usua.Clave;
                txt_EMail.Text = Usua.EMail;

            }
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {

            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            NegUsuario NegUsu = new NegUsuario();


            Usuario Usu = new Usuario();

            
            Usu.Nombre = txt_Nombre.Text;
            Usu.Clave = txt_Clave.Text;
            Usu.Nivel = 1;
            Usu.EMail = txt_EMail.Text;

            try
            {
                NegUsu.agregar(Usu);
            }
            catch (Exception)
            {

                Response.Redirect("Error_Page?M=UG");
            }


            

            //CON EL RESPONSE VOLVEMOS A LA PAGINA DE LA GRILLA
            Response.Redirect("Usuarios.aspx");
        }


        protected void btnActualizar_Click(object sender, EventArgs e)
        {

            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            NegUsuario NegUsu = new NegUsuario();


            Usuario Usu = new Usuario();

            Usu.Nombre = txt_Nombre.Text;
            Usu.Clave = txt_Clave.Text;
            Usu.Nivel = 1;
            Usu.EMail = txt_EMail.Text;

            NegUsu.Actualizar(Usu);

            Response.Redirect("Usuarios.aspx");

        }



    }
}
