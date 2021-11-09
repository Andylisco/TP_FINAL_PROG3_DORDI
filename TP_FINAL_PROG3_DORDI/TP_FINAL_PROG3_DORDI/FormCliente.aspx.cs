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
    public partial class FormCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                btnActualizar.Visible = false;
                txt_DNI.MaxLength = 8;
                txt_Nombre.MaxLength = 50;
                txt_Apellido.MaxLength = 50;
                txt_Direccion.MaxLength = 50;
                txt_Telefono.MaxLength = 20;
                txt_EMail.MaxLength = 50;
                

                var DNI = Request.QueryString["DNI"] != null ? Request.QueryString["DNI"].ToString() : "";
                if (DNI != "")
                {
                    CargarCliente(DNI);
                    btnActualizar.Visible = true;
                    btnGrabar.Visible = false;
                    txt_DNI.Visible = false;
                    lbl_DNI.Visible = false;
                }
            }
        }




        protected void CargarCliente(string DNI)
        {
            Neg_Cliente NegCli = new Neg_Cliente();

            Cliente Clien = NegCli.GetSingle(DNI);

            if (Clien.Nombre != "")
            {
                txt_DNI.Text = Clien.DNI;
                txt_Nombre.Text = Clien.Nombre;
                txt_Apellido.Text = Clien.Apellido;
                txt_Direccion.Text = Clien.Direccion;
                txt_Telefono.Text = Clien.Telefono;
                txt_EMail.Text = Clien.EMail;
                
            }
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {


            Neg_Cliente NegCli = new Neg_Cliente();


            Cliente Clien = new Cliente();

            Clien.DNI = txt_DNI.Text;
            Clien.Nombre = txt_Nombre.Text;
            Clien.Apellido = txt_Apellido.Text;
            Clien.Direccion = txt_Direccion.Text;
            Clien.Telefono = txt_Telefono.Text;
            Clien.EMail = txt_EMail.Text;           


            NegCli.agregar(Clien);

            //CON EL RESPONSE VOLVEMOS A LA PAGINA DE LA GRILLA
            Response.Redirect("Clientes.aspx");
        }


        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Neg_Cliente NegCli = new Neg_Cliente();


            Cliente Clien = new Cliente();

            Clien.DNI = txt_DNI.Text;
            Clien.Nombre = txt_Nombre.Text;
            Clien.Direccion = txt_Direccion.Text;
            Clien.Telefono = txt_Telefono.Text;
            Clien.EMail = txt_EMail.Text;            
            Clien.Apellido = txt_Apellido.Text;

            NegCli.Actualizar(Clien);

            Response.Redirect("Clientes.aspx");

        }


        protected void txt_DNI_TextChanged(object sender, EventArgs e)
        {
            if (txt_DNI.Text.Contains("-"))
            {
                lbl_ayudaDNI.Visible = true;
            }
            else
            {
                lbl_ayudaDNI.Visible = false;
            }
        }
    }



}
