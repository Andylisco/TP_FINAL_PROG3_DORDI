using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class Neg_MedioPago
    {
        public List<MedioPago> GetAll()
        {
            List<MedioPago> lista = new List<MedioPago>();
            AccesoDatos datos = new AccesoDatos();


            try
            {
                datos.setearConsulta("SELECT Codigo,Descripcion  FROM MediosPagos");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    MedioPago aux = new MedioPago();

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

