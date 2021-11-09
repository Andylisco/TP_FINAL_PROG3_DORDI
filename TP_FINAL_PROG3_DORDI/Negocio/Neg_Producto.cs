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

            Datos.setearConsulta("SELECT Codigo, Descripcion, URL_Imagen, Cod_Rubro, Cod_Marca, Stock, Stock_Minimo,"  +
                                    "PorcentajeGanancias FROM Productos WHERE ID = @ID");

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

                Produc.Rubro.Descripcion = "";


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
                    
                    aux.ID = (int)datos.Lector["ID"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.URLimagen = (string)datos.Lector["URL_Imagen"];
                    aux.Stock = (int)datos.Lector["Stock"];
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

        public decimal _ObtenerPrecioUnitario(int ID)
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
                    //CIERRO LA CONEXION 
                    datos.cerrarConexion();

                    //SINO TENGO UN PRECIO EN LOS ULTIMOS 3 MESES BUSCO EL MEJOR PRECIO                    
                    datos.setearConsulta("SELECT MaxPrecio = Max(PrecioU) FROM Compras WHERE ID_Producto = @ID");
                    datos.setearParametros("@ID", ID);

                    datos.ejecutarLectura();



                    while (datos.Lector.Read())
                    {
                        if (!(datos.Lector["MaxPrecio"] is DBNull))
                        {
                            PrecioU = (decimal)datos.Lector["MaxPrecio"];
                        }

                    }

                    datos.cerrarConexion();


                }

               
            }

            return PrecioU;
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
            datos.setearParametros("@PorcentajeGanacia", nuevo.PorcentajeGanancia);

            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void Actualizar(Producto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();


            datos.setearConsulta("UPDATE Productos SET Codigo = @Codigo, Descripcion = @Descripcion, URL_Imagen = @URL_Imagen, " +
                 "@Cod_Rubro = @Cod_Rubro, Cod_Marca = @Cod_Marca, Stock_Minimo = @Stock_Minimo, PorcentajeGanacia = @PorcentajeGanacia " +
                 "WHERE ID = @ID");

            datos.setearParametros("@ID", nuevo.ID);
            datos.setearParametros("@Codigo", nuevo.Codigo);
            datos.setearParametros("@Descripcion", nuevo.Descripcion);
            datos.setearParametros("@URL_Imagen", nuevo.URLimagen);
            datos.setearParametros("@Cod_Rubro", nuevo.Rubro.Codigo);
            datos.setearParametros("@Cod_Marca", nuevo.Marca.Codigo);
            datos.setearParametros("@Stock_Minimo", nuevo.StockMinimo);
            datos.setearParametros("@PorcentajeGanacia", nuevo.PorcentajeGanancia);

            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void DarBaja(int ID)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE Producto SET Estado = 0 WHERE ID = " + ID + "");
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
