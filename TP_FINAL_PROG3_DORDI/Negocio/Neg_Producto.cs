using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class Neg_Producto
    {

        public Producto GetSingle(int ID)
        {
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("SELECT P.Codigo, P.Descripcion, P.URL_Imagen, P.Cod_Rubro, P.Cod_Marca, P.Stock, P.Stock_Minimo," +
                                    "P.PorcentajeGanancia, DescripRubro = R.Descripcion, DescripMarca = M.Descripcion " + 
                                    "FROM Productos P LEFT JOIN Rubros R ON P.Cod_Rubro = R.Codigo " +
                                    "LEFT JOIN Marcas M ON P.Cod_Marca = M.Codigo " +
                                    "WHERE ID = @ID");

            Datos.setearParametros("@ID", ID);

            Datos.ejecutarLectura();

            Producto Produc = new Producto();

            while (Datos.Lector.Read())
            {
                Produc.ID = ID;

                if (!(Datos.Lector["Codigo"] is DBNull))
                    Produc.Codigo = (string)Datos.Lector["Codigo"];

                if (!(Datos.Lector["Descripcion"] is DBNull))
                    Produc.Descripcion = (string)Datos.Lector["Descripcion"];

                if (!(Datos.Lector["URL_Imagen"] is DBNull))
                    Produc.URLimagen = (string)Datos.Lector["URL_Imagen"];

                if (!(Datos.Lector["Stock"] is DBNull))
                    Produc.Stock = (int)Datos.Lector["Stock"];

                if (!(Datos.Lector["Stock_Minimo"] is DBNull))
                    Produc.StockMinimo = (int)Datos.Lector["Stock_Minimo"];


                if (!(Datos.Lector["PorcentajeGanancia"] is DBNull))
                    Produc.PorcentajeGanancia = (int)Datos.Lector["PorcentajeGanancia"];

                Produc.Rubro = new Rubro();
                if (!(Datos.Lector["Cod_Rubro"] is DBNull))
                    Produc.Rubro.Codigo = (string)Datos.Lector["Cod_Rubro"];

                if (!(Datos.Lector["DescripRubro"] is DBNull))
                    Produc.Rubro.Descripcion = (string)Datos.Lector["DescripRubro"];


                Produc.Marca = new Marca();
                if (!(Datos.Lector["Cod_Marca"] is DBNull))
                    Produc.Marca.Codigo = (string)Datos.Lector["Cod_Marca"];

               


            }



            return Produc;
        }
        public List<Producto> GetAll(string ClausulaWHERE = "")
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            //RECIBIMOS EL PARAMETRO OPCIONAL Y SE LO AGREGAMOS A LA CONSULTA
            string WHERE = ClausulaWHERE;
            try
            {

                datos.setearConsulta("SELECT Pr.ID, Pr.Codigo, Pr.Descripcion, URL_Imagen = ISNULL(Pr.URL_Imagen,'')," +
                             " Stock, Stock_Minimo, PorcentajeGanancia , Pr.Cod_Rubro," +
                             " RubroDesc = ISNULL(R.Descripcion,''), Pr.Cod_Marca, MarcaDesc = ISNULL(M.Descripcion,'') " +
                             "FROM Productos Pr LEFT JOIN Rubros R on Pr.Cod_Rubro = R.Codigo " +
                             "LEFT JOIN Marcas M on Pr.Cod_Marca = M.Codigo " +
                             "WHERE Estado = 1 " + WHERE);



                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();
                    
                    aux.ID = long.Parse(datos.Lector["ID"].ToString());
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.URLimagen = (string)datos.Lector["URL_Imagen"];
                    aux.Stock = _ObtenerStock(aux.ID);
                    aux.StockMinimo = (int)datos.Lector["Stock_Minimo"];
                    aux.PorcentajeGanancia = (int)datos.Lector["PorcentajeGanancia"];

                                        
                    aux.Rubro = new Rubro();
                    aux.Rubro.Codigo = (string)datos.Lector["Cod_Rubro"];
                    aux.Rubro.Descripcion = (string)datos.Lector["RubroDesc"];

                    
                    aux.Marca = new Marca();
                    aux.Marca.Codigo = (string)datos.Lector["Cod_Marca"];
                    aux.Marca.Descripcion = (string)datos.Lector["MarcaDesc"];


                    aux.Precio_U = _ObtenerPrecioUnitario(aux.ID);

                    //LO AGREGO A LA LISTA
                    lista.Add(aux);
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

        public int _ObtenerStock(long ID)
        {
            int stock = 0;

            AccesoDatos datos = new AccesoDatos();

            datos.setearConsulta("SELECT StockCompras = SUM(Cantidad) FROM Compras WHERE ID_Producto = @ID_Producto AND Estado = 1");
            datos.setearParametros("@ID_Producto", ID);

            datos.ejecutarLectura();



            while (datos.Lector.Read())
            {
                if (!(datos.Lector["StockCompras"] is DBNull))
                {
                    stock += (int)datos.Lector["StockCompras"];
                }
            }

            //DESCOMENTAR DESPUES DE CREAR VENTAS
          /*  AccesoDatos datos2 = new AccesoDatos();

            datos2.setearConsulta("SELECT StockVentas = SUM(Cantidad) FROM Ventas WHERE ID_Producto = @ID_Producto AND Estado = 1");
            datos2.setearParametros("@ID_Producto", ID);

            while (datos2.Lector.Read())
            {
                if (!(datos2.Lector["StockVentas"] is DBNull))
                {
                    stock -= (int)datos2.Lector["StockVentas"];
                }
            }*/

            return stock;
        }

        public decimal _ObtenerPrecioUnitario(long ID)
        {
            decimal PrecioU;
            PrecioU = 0;

            Producto producto = new Producto();
            AccesoDatos datos = new AccesoDatos();

            //BUSCO EL MEJOR PRECiO EN LOS ULTIMOS 3 MESES
            datos.setearConsulta("SELECT PrecioMaximo3Meses = Max(PrecioU) FROM Compras WHERE ID_Producto = @ID AND Fecha BETWEEN @FechaAtras AND @FechaActual");
            datos.setearParametros("@ID", ID);
            datos.setearParametros("@FechaAtras", DateTime.Now.AddMonths(-3));
            datos.setearParametros("@FechaActual", DateTime.Now);

            datos.ejecutarLectura();



            while (datos.Lector.Read())
            {

                if (!(datos.Lector["PrecioMaximo3Meses"] is DBNull))
                {
                    PrecioU = (decimal)datos.Lector["PrecioMaximo3Meses"];
                }
                else
                {
                  

                    //SINO TENGO UN PRECIO EN LOS ULTIMOS 3 MESES BUSCO EL MEJOR PRECIO
                    AccesoDatos datos2 = new AccesoDatos();
                    datos2.setearConsulta("SELECT MaxPrecio = Max(PrecioU) FROM Compras WHERE ID_Producto = @ID");
                    datos2.setearParametros("@ID", ID);

                    datos2.ejecutarLectura();



                    while (datos2.Lector.Read())
                    {
                        if (!(datos2.Lector["MaxPrecio"] is DBNull))
                        {
                            PrecioU = (decimal)datos2.Lector["MaxPrecio"];
                        }

                    }

                    datos2.cerrarConexion();


                }

               
            }
            //CIERRO LA CONEXION 
            datos.cerrarConexion();

            return PrecioU;
        }

        public string _ObtenerCodigoRubro_XID(int id)
        {
            string CodRubro = "";

            AccesoDatos datos = new AccesoDatos();
            datos.setearConsulta("SELECT Cod_Rubro " +
                                     "FROM Productos " +
                                    "WHERE Estado = 1  AND ID = @ID");

            datos.setearParametros("@ID", id);

            datos.ejecutarLectura();
            while (datos.Lector.Read())
            {

                if (!(datos.Lector["Cod_Rubro"] is DBNull))
                {
                    CodRubro = (string)datos.Lector["Cod_Rubro"];
                }
            }

            return CodRubro;
        }

        public string _ObtenerCodigoMarca_XID(int id)
        {
            string CodRubro = "";

            AccesoDatos datos = new AccesoDatos();
            datos.setearConsulta("SELECT Cod_Marca " +
                                     "FROM Productos " +
                                    "WHERE Estado = 1  AND ID = @ID");

            datos.setearParametros("@ID", id);

            datos.ejecutarLectura();
            while (datos.Lector.Read())
            {

                if (!(datos.Lector["Cod_Marca"] is DBNull))
                {
                    CodRubro = (string)datos.Lector["Cod_Marca"];
                }
            }

            return CodRubro;
        }


        public void agregar(Producto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();



            datos.setearConsulta("INSERT INTO Productos(Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock_Minimo, PorcentajeGanancia)" +
                                "VALUES(@Codigo, @Descripcion, @URL_Imagen, @Cod_Rubro, @Cod_Marca, @Stock_Minimo, @PorcentajeGanancia)");

            datos.setearParametros("@Codigo", nuevo.Codigo);
            datos.setearParametros("@Descripcion", nuevo.Descripcion);
            datos.setearParametros("@URL_Imagen", nuevo.URLimagen);
            datos.setearParametros("@Cod_Rubro", nuevo.Rubro.Codigo);
            datos.setearParametros("@Cod_Marca", nuevo.Marca.Codigo);
            datos.setearParametros("@Stock_Minimo", nuevo.StockMinimo);
            datos.setearParametros("@PorcentajeGanancia", nuevo.PorcentajeGanancia);

            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void Actualizar(Producto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();


            datos.setearConsulta("UPDATE Productos SET Codigo = @Codigo, Descripcion = @Descripcion, URL_Imagen = @URL_Imagen, " +
                 "@Cod_Rubro = @Cod_Rubro, Cod_Marca = @Cod_Marca, Stock_Minimo = @Stock_Minimo, PorcentajeGanancia = @PorcentajeGanancia " +
                 "WHERE ID = @ID");

            datos.setearParametros("@ID", nuevo.ID);
            datos.setearParametros("@Codigo", nuevo.Codigo);
            datos.setearParametros("@Descripcion", nuevo.Descripcion);
            datos.setearParametros("@URL_Imagen", nuevo.URLimagen);
            datos.setearParametros("@Cod_Rubro", nuevo.Rubro.Codigo);
            datos.setearParametros("@Cod_Marca", nuevo.Marca.Codigo);
            datos.setearParametros("@Stock_Minimo", nuevo.StockMinimo);
            datos.setearParametros("@PorcentajeGanancia", nuevo.PorcentajeGanancia);

            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void DarBaja(int ID)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE Productos SET Estado = 0 WHERE ID = " + ID + "");
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
