using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class Neg_Compra
    {

        public Compra GetSingle(int Nro)
        {
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("SELECT C.Renglon, C.CUIT_Prov, Pv.RazonSocial, C.Fecha, C.Tipo_Factura, C.ID_Producto, " +
                                    "C.ID_MedioPago, Descrip_MedioPago = M.Descripcion, C.NombreUsuario, " +
                                    "C.PrecioU, C.Cantidad, Cod_Producto = P.Codigo, Descrip_Producto = p.Descripcion " +
                                    "FROM Compras C LEFT JOIN MediosPagos M ON C.ID_MedioPago = M.Codigo " +
                                    "LEFT JOIN Productos P ON C.ID_PRoducto = P.ID " +
                                    "LEFT JOIN Proveedores Pv ON C.CUIT_Prov = Pv.CUIT " +
                                    "WHERE C.Nro_Factura = @Nro_Factura AND C.Estado = 1 " +
                                    "ORDER BY Renglon DESC");

            Datos.setearParametros("@Nro_Factura", Nro);

            Datos.ejecutarLectura();

            Compra compra = new Compra();
            compra.Productos = new List<Producto>();

            int Renglon;

            while (Datos.Lector.Read())
            {
                if (!(Datos.Lector["Renglon"] is DBNull))
                {
                    Renglon = (int)Datos.Lector["Renglon"];
                    
                    if (Renglon == 1)
                    {
                        compra.Nro = Nro;
                        //PROVEEDOR
                        compra.Proveedor = new Proveedor();
                        if (!(Datos.Lector["CUIT_Prov"] is DBNull))
                            compra.Proveedor.CUIT = (string)Datos.Lector["CUIT_Prov"];

                        if (!(Datos.Lector["RazonSocial"] is DBNull))
                            compra.Proveedor.RazonSocial = (string)Datos.Lector["RazonSocial"];

                        if (!(Datos.Lector["Fecha"] is DBNull))
                           compra.Fecha = (DateTime)Datos.Lector["Fecha"];

                        if (!(Datos.Lector["Tipo_Factura"] is DBNull))
                            compra.TipoFactura = (string)Datos.Lector["Tipo_Factura"];


                        // USUARIO
                        compra.Usuario = new Usuario();
                        if (!(Datos.Lector["NombreUsuario"] is DBNull))
                            compra.Usuario.Nombre = (string)Datos.Lector["NombreUsuario"];

                        //MEDIO PAGO
                        compra.Medio_Pago = new MedioPago();
                        if (!(Datos.Lector["ID_MedioPago"] is DBNull))
                            compra.Medio_Pago.Codigo = (string)Datos.Lector["ID_MedioPago"];

                        if (!(Datos.Lector["Descrip_MedioPago"] is DBNull))
                            compra.Medio_Pago.Descripcion = (string)Datos.Lector["Descrip_MedioPago"];
                    }

                    
                    //AÑADO CADA PRODUCTO A LA LISTA
                    Producto Produ = new Producto();

                    if (!(Datos.Lector["ID_Producto"] is DBNull))
                        Produ.ID = (long)Datos.Lector["ID_Producto"];

                    if (!(Datos.Lector["Cod_Producto"] is DBNull))
                            Produ.Codigo = (string)Datos.Lector["Cod_Producto"];

                       
                        if (!(Datos.Lector["Descrip_Producto"] is DBNull))
                            Produ.Descripcion = (string)Datos.Lector["Descrip_Producto"];

                        if (!(Datos.Lector["PrecioU"] is DBNull))
                            Produ.Precio_U = (decimal)Datos.Lector["PrecioU"];

                                                
                        if (!(Datos.Lector["Cantidad"] is DBNull))
                            Produ.Cantidad_Compra = (int)Datos.Lector["Cantidad"];

                    compra.Productos.Add(Produ);
                }
               




            }



            return compra;
        }
        public List<Compra> GetAll(string ClausulaWHERE = "")
        {
            List<Compra> lista = new List<Compra>();
            AccesoDatos datos = new AccesoDatos();

            //RECIBIMOS EL PARAMETRO OPCIONAL Y SE LO AGREGAMOS A LA CONSULTA
            string WHERE = ClausulaWHERE;

            try
            {

                datos.setearConsulta("SELECT DISTINCT C.Nro_Factura, C.CUIT_Prov, Pv.RazonSocial, C.Fecha, C.Tipo_Factura, " + 
                                    "TotalImporte = (SELECT SUM(PrecioU * Cantidad) FROM Compras WHERE Nro_Factura = C.Nro_Factura), " +
                                    "C.ID_MedioPago, Descrip_MedioPago = M.Descripcion, C.NombreUsuario " +                                    
                                    "FROM Compras C LEFT JOIN MediosPagos M ON C.ID_MedioPago = M.Codigo " +
                                    "LEFT JOIN Productos P ON C.ID_PRoducto = P.ID " +
                                    "LEFT JOIN Proveedores Pv ON C.CUIT_Prov = Pv.CUIT " +
                                    "WHERE  C.Estado = 1 AND C.Renglon = 1 " + WHERE );



                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Compra aux = new Compra();
                    

                    aux.Nro = (int)datos.Lector["Nro_Factura"];

                    aux.Proveedor = new Proveedor();
                    aux.Proveedor.CUIT = (string)datos.Lector["CUIT_Prov"];
                    aux.Proveedor.RazonSocial= (string)datos.Lector["RazonSocial"];

                    aux.TipoFactura = (string)datos.Lector["Tipo_Factura"];
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    aux.TotalImporte = (decimal)datos.Lector["TotalImporte"];

                    aux.Medio_Pago = new MedioPago();
                    aux.Medio_Pago.Codigo = (string)datos.Lector["ID_MedioPago"];
                    aux.Medio_Pago.Descripcion = (string)datos.Lector["Descrip_MedioPago"];

                 


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

       /* public decimal _ObtenerPrecioUnitario(long ID)
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
                            PrecioU = (decimal)datos.Lector["MaxPrecio"];
                        }

                    }

                    datos2.cerrarConexion();


                }


            }
            //CIERRO LA CONEXION 
            datos.cerrarConexion();

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
            datos.setearParametros("@PorcentajeGanancia", nuevo.PorcentajeGanancia);

            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void Actualizar(Compra nuevo)
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

        }*/

        public void DarBaja(int Nro)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE Compras SET Estado = 0 WHERE Nro_Factura = " + Nro + "");
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
