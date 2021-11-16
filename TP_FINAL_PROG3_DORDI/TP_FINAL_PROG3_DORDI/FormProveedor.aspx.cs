using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace TP_FINAL_PROG3_DORDI
{
    public partial class FormProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnActualizar.Visible = false;
                txt_CUIT.MaxLength = 11;
                txt_RazonSocial.MaxLength = 50;
                txt_Telefono.MaxLength = 20;
                txt_Mail.MaxLength = 50;
                txt_Direccion.MaxLength = 50;
                txt_PersonaContacto.MaxLength = 50;
                lbl_TituloActualiza.Visible = false;
                CargarRubros();

                var CuitProv = Request.QueryString["Cuit"] != null ? Request.QueryString["Cuit"].ToString() : "" ;
                var Tipo = Request.QueryString["Mod"] != null ? Request.QueryString["Mod"].ToString() : "";
                if (Tipo == "M" || Tipo == "V")
                {
                    if (CuitProv != "")
                    {
                        CargarProveedor(CuitProv);
                        
                        if (Tipo == "V")
                        {
                            _MarcarSoloLectura();
                        }
                        else {
                            btnActualizar.Visible = true;
                            btnGrabar.Visible = false;
                            txt_CUIT.Visible = false;
                            lbl_CUIT.Visible = false;
                            lbl_TituloCargar.Visible = false;
                            lbl_TituloActualiza.Visible = true;
                        }
                    }
                }
                else
                {
                    if (Tipo == "E")
                    {
                        Neg_Proveedor NegProve = new Neg_Proveedor();
                        NegProve.DarBaja(CuitProv);
                        Response.Redirect("Proveedores.aspx");
                    }
                }
            }
        }

        private void _MarcarSoloLectura()
        {
            txt_CUIT.ReadOnly = true;
            txt_RazonSocial.ReadOnly = true;
            txt_Direccion.ReadOnly = true;
            txt_Telefono.ReadOnly = true;
            txt_Mail.ReadOnly = true;
            txt_PersonaContacto.ReadOnly = true;
            cbx_Rubro.Enabled = false;

            btnGrabar.Visible = false;

        }

        protected void CargarRubros()
        {
            NegRubro NegRubro = new NegRubro();
            cbx_Rubro.DataSource = NegRubro.GetAll();
            cbx_Rubro.DataValueField = "Codigo";
            cbx_Rubro.DataTextField = "Descripcion";
            cbx_Rubro.DataBind();
        }

        protected void CargarProveedor(string CuitProv)
        {
            Neg_Proveedor NegProv = new Neg_Proveedor();
                        
            Proveedor Prov = NegProv.GetSingle(CuitProv);

            if (Prov.RazonSocial != "")
            {
                txt_CUIT.Text = Prov.CUIT;
                txt_RazonSocial.Text = Prov.RazonSocial;
                txt_Direccion.Text = Prov.Direccion ;
                txt_Telefono.Text = Prov.Telefono;
                txt_Mail.Text = Prov.Mail ;
                cbx_Rubro.SelectedValue = Prov.Rubro.Codigo;
                txt_PersonaContacto.Text = Prov.PersonaContacto ;
            }
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {

            
            Neg_Proveedor negocio = new Neg_Proveedor();


            Proveedor Prove = new Proveedor();
            
            Prove.CUIT = txt_CUIT.Text;
            Prove.RazonSocial = txt_RazonSocial.Text;
            Prove.Direccion = txt_Direccion.Text;
            Prove.Telefono = txt_Telefono.Text;
            Prove.Mail = txt_Mail.Text;
            Prove.Rubro = new Rubro();
            Prove.Rubro.Codigo = (string)cbx_Rubro.SelectedItem.Value;
            Prove.PersonaContacto = txt_PersonaContacto.Text;
            

            negocio.agregar(Prove);

            //CON EL RESPONSE VOLVEMOS A LA PAGINA DE LA GRILLA
            Response.Redirect("Proveedores.aspx");
        }


        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Neg_Proveedor negocio = new Neg_Proveedor();


            Proveedor Prove = new Proveedor();

            Prove.CUIT = txt_CUIT.Text;
            Prove.RazonSocial = txt_RazonSocial.Text;
            Prove.Direccion = txt_Direccion.Text;
            Prove.Telefono = txt_Telefono.Text;
            Prove.Mail = txt_Mail.Text;
            Prove.Rubro = new Rubro();
            Prove.Rubro.Codigo = (string)cbx_Rubro.SelectedItem.Value;
            Prove.PersonaContacto = txt_PersonaContacto.Text;

            negocio.Actualizar(Prove);

            Response.Redirect("Proveedores.aspx");

        }


            protected void txt_CUIT_TextChanged(object sender, EventArgs e)
        {
            if (txt_CUIT.Text.Contains("-"))
            {
                lbl_ayudaCuit.Visible = true;
            }else
            {
                lbl_ayudaCuit.Visible = false;
            }
        }
    }
}