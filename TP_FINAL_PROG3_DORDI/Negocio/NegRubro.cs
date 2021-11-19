using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class NegRubro
    {
        public List<Rubro> GetAll()
        {
            List<Rubro> lista = new List<Rubro>();
            AccesoDatos datos = new AccesoDatos();


            try
            {
                List<string> ListaSQLCnslt = new List<string>();
                ListaSQLCnslt.Add("SELECT Codigo,Descripcion  FROM Rubros");

                datos.setearConsulta(ListaSQLCnslt.ToArray());
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Rubro aux = new Rubro();

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
