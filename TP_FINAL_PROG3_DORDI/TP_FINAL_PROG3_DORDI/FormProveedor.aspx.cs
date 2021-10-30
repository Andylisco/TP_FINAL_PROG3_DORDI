﻿using System;
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
                txt_CUIT.MaxLength = 11;
                txt_RazonSocial.MaxLength = 100;
                txt_Telefono.MaxLength = 100;
                txt_Mail.MaxLength = 100;
                txt_Direccion.MaxLength = 100;
                txt_PersonaContacto.MaxLength = 100;
                CargarRubros();
            }
        }


        protected void CargarRubros()
        {
            NegRubro CatNeg = new NegRubro();
            cbx_Rubro.DataSource = CatNeg.GetAll();
            cbx_Rubro.DataValueField = "Codigo";
            cbx_Rubro.DataTextField = "Descripcion";
            cbx_Rubro.DataBind();
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
            Response.Redirect("Default.aspx");
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