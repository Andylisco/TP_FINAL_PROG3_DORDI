﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class NegUsuario
    {
        public Usuario GetSingle(string User, string Clave)
        {
            AccesoDatos Datos = new AccesoDatos();

            List<string> ListaSQLCnslt = new List<string>();
            ListaSQLCnslt.Add("SELECT NivelUsuario, EMail FROM Usuarios WHERE NombreUsuario = @Usuario AND Clave = @Clave AND Estado = 1");

            Datos.setearConsulta(ListaSQLCnslt.ToArray());
            
            Datos.setearParametros("@Usuario", User);
            Datos.setearParametros("@Clave", Clave);

            Datos.ejecutarLectura();

            Usuario Usuario = new Usuario();

            while (Datos.Lector.Read())
            {
                Usuario.Nombre = User;

                Usuario.Clave = Clave;

                if (!(Datos.Lector["EMail"] is DBNull))
                    Usuario.EMail = (string)Datos.Lector["EMail"];

                if (!(Datos.Lector["NivelUsuario"] is DBNull))
                    Usuario.Nivel = (int)Datos.Lector["NivelUsuario"];
                                

            }

            Datos.cerrarConexion();

            return Usuario;
        }
    }
}
