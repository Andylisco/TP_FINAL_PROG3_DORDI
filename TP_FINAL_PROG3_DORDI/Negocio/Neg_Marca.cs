using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    class Neg_Marca
    {
        public class NegRubro
        {
            public List<Marca> GetAll()
            {
                List<Marca> lista = new List<Marca>();
                AccesoDatos datos = new AccesoDatos();


                try
                {
                    datos.setearConsulta("SELECT Codigo,Descripcion  FROM Marcas");
                    datos.ejecutarLectura();

                    while (datos.Lector.Read())
                    {
                        Marca aux = new Marca();

                        aux.Codigo = (string)datos.Lector["Codigo"];
                        aux.Descripcion = (string)datos.Lector["Descripcion"];

                        lista.Add(aux);
                    }

                    return lista;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
                finally
                {
                    datos.cerrarConexion();
                }
            }
        }
    }
}
