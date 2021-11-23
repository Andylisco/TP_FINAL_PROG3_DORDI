using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class Neg_MovVario
    {

        public List<MovVario> GetAll(string ClausulaWHERE = "")
        {
            List<MovVario> lista = new List<MovVario>();
            AccesoDatos datos = new AccesoDatos();

            //RECIBIMOS EL PARAMETRO OPCIONAL Y SE LO AGREGAMOS A LA CONSULTA
            string WHERE = ClausulaWHERE;
            try
            {
                List<string> ListaSQLCnslt = new List<string>();
                ListaSQLCnslt.Add("SELECT Mv.ID, Mv.ID_Producto, P.Descripcion, Mv.Cantidad , Mv.Fecha, Mv.Motivo " +
                                  "FROM MovVarios Mv LEFT JOIN Productos P ON Mv.ID_Producto = P.ID " +
                                  "WHERE Mv.Estado = 1 " + WHERE);

                datos.setearConsulta(ListaSQLCnslt.ToArray());



                datos.ejecutarLectura();

                if (datos.Lector != null)
                {
                    while (datos.Lector.Read())
                    {
                        MovVario aux = new MovVario();

                        aux.ID_MovVario = long.Parse(datos.Lector["ID"].ToString());
                        aux.Produc = new Producto();
                        aux.Produc.ID = long.Parse(datos.Lector["ID_Producto"].ToString());
                        aux.Produc.Descripcion = (string)datos.Lector["Descripcion"];
                        aux.Produc.Cantidad_Compra = (int)datos.Lector["Cantidad"];
                        aux.Fecha = (DateTime)datos.Lector["Fecha"];
                        aux.Motivo = (string)datos.Lector["Motivo"];

                        //LO AGREGO A LA LISTA
                        lista.Add(aux);
                    }
                }

                //DEVUELVO LA LISTA
                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }



        }


        public void agregar(MovVario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();



            datos.setearConsulta("INSERT INTO MovVarios(ID_Producto, Cantidad, Fecha, Motivo)" +
                                "VALUES(@ID_Producto, @Cantidad, @Fecha, @Motivo)");

            datos.setearParametros("@ID_Producto", nuevo.Produc.Codigo);
            datos.setearParametros("@Cantidad", nuevo.Produc.Cantidad_Compra);
            datos.setearParametros("@Fecha", DateTime.Today);
            datos.setearParametros("@Motivo", nuevo.Motivo);


            datos.ejecutarAccion();

            datos.cerrarConexion();

        }


        public void DarBaja(long ID)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                List<string> ListaSQLCnslt = new List<string>();
                ListaSQLCnslt.Add("UPDATE MovVarios SET Estado = 0 WHERE ID = " + ID + "");

                datos.setearConsulta(ListaSQLCnslt.ToArray());

                datos.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
