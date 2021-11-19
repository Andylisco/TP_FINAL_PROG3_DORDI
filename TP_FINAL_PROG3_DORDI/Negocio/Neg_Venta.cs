using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class Neg_Venta
    {

        public Venta GetSingle(int Nro)
        {
            AccesoDatos Datos = new AccesoDatos();

            List<string> ListaSQLCnslt = new List<string>();
            ListaSQLCnslt.Add("SELECT V.Nro_Factura, V.DNI_Cliente, V.Renglon, Cl.Apellido, Cl.Nombre, V.Fecha, V.Tipo_Factura, V.ID_Producto, " +
                                    "TotalImporte = (SELECT SUM(PrecioU * Cantidad) FROM Ventas WHERE Nro_Factura = V.Nro_Factura), " +
                                    "V.ID_MedioPago, Descrip_MedioPago = M.Descripcion, V.NombreUsuario, " +
                                    "V.PrecioU, V.Cantidad, Cod_Producto = P.Codigo, Descrip_Producto = P.Descripcion " +
                                    "FROM Ventas V LEFT JOIN MediosPagos M ON V.ID_MedioPago = M.Codigo " +
                                    "LEFT JOIN Productos P ON V.ID_PRoducto = P.ID " +
                                    "LEFT JOIN Clientes Cl ON V.DNI_Cliente = Cl.DNI " +
                                    "WHERE V.Nro_Factura = @Nro_Factura AND V.Estado = 1 " +
                                    "ORDER BY Renglon DESC");

            Datos.setearConsulta(ListaSQLCnslt.ToArray());


            Datos.setearParametros("@Nro_Factura", Nro);

            Datos.ejecutarLectura();

            Venta venta = new Venta();
            venta.Productos = new List<Producto>();

            int Renglon;

            while (Datos.Lector.Read())
            {
                if (!(Datos.Lector["Renglon"] is DBNull))
                {
                    Renglon = (int)Datos.Lector["Renglon"];

                    if (Renglon == 1)
                    {
                        venta.Nro = Nro;
                        //CLIENTE
                        venta.Cliente = new Cliente();
                        if (!(Datos.Lector["DNI_Cliente"] is DBNull))
                            venta.Cliente.DNI = (string)Datos.Lector["DNI_Cliente"];

                        if (!(Datos.Lector["Apellido"] is DBNull))
                            venta.Cliente.Apellido = (string)Datos.Lector["Apellido"];

                        if (!(Datos.Lector["Nombre"] is DBNull))
                            venta.Cliente.Nombre = (string)Datos.Lector["Nombre"];

                        if (!(Datos.Lector["Fecha"] is DBNull))
                            venta.Fecha = (DateTime)Datos.Lector["Fecha"];

                        if (!(Datos.Lector["Tipo_Factura"] is DBNull))
                            venta.TipoFactura = (string)Datos.Lector["Tipo_Factura"];


                        // USUARIO
                        venta.Usuario = new Usuario();
                        if (!(Datos.Lector["NombreUsuario"] is DBNull))
                            venta.Usuario.Nombre = (string)Datos.Lector["NombreUsuario"];

                        //MEDIO PAGO
                        venta.MedioPago = new MedioPago();
                        if (!(Datos.Lector["ID_MedioPago"] is DBNull))
                            venta.MedioPago.Codigo = (string)Datos.Lector["ID_MedioPago"];

                        if (!(Datos.Lector["Descrip_MedioPago"] is DBNull))
                            venta.MedioPago.Descripcion = (string)Datos.Lector["Descrip_MedioPago"];
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

                    venta.Productos.Add(Produ);
                }


            }



            return venta;
        }

        public List<Venta> GetAll(string ClausulaWHERE = "")
        {
            List<Venta> lista = new List<Venta>();
            AccesoDatos datos = new AccesoDatos();

            //RECIBIMOS EL PARAMETRO OPCIONAL Y SE LO AGREGAMOS A LA CONSULTA
            string WHERE = ClausulaWHERE;

            try
            {

                List<string> ListaSQLCnslt = new List<string>();
                ListaSQLCnslt.Add("SELECT DISTINCT V.Nro_Factura, V.DNI_Cliente, Cl.Apellido, Cl.Nombre, V.Fecha, V.Tipo_Factura, " +
                                    "TotalImporte = (SELECT SUM(PrecioU * Cantidad) FROM Ventas WHERE Nro_Factura = V.Nro_Factura), " +
                                    "V.ID_MedioPago, Descrip_MedioPago = M.Descripcion, V.NombreUsuario " +
                                    "FROM Ventas V LEFT JOIN MediosPagos M ON V.ID_MedioPago = M.Codigo " +
                                    "LEFT JOIN Productos P ON V.ID_PRoducto = P.ID " +
                                    "LEFT JOIN Clientes Cl ON V.DNI_Cliente = Cl.DNI " +
                                    "WHERE  V.Estado = 1 AND V.Renglon = 1 " + WHERE);

                datos.setearConsulta(ListaSQLCnslt.ToArray());



                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Venta aux = new Venta();


                    aux.Nro = (int)datos.Lector["Nro_Factura"];

                    aux.Cliente = new Cliente();
                    aux.Cliente.DNI = (string)datos.Lector["DNI_Cliente"];
                    aux.Cliente.Nombre = (string)datos.Lector["Nombre"];
                    aux.Cliente.Apellido = (string)datos.Lector["Apellido"];

                    aux.TipoFactura = (string)datos.Lector["Tipo_Factura"];
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    aux.TotalImporte = (decimal)datos.Lector["TotalImporte"];

                    aux.MedioPago = new MedioPago();
                    aux.MedioPago.Codigo = (string)datos.Lector["ID_MedioPago"];
                    aux.MedioPago.Descripcion = (string)datos.Lector["Descrip_MedioPago"];




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
         }*/

        public int _ObtenerNumeroNuevo()
        {
            AccesoDatos datos = new AccesoDatos();

            int NuevoNumero = 0;

            datos.setearConsulta("SELECT Nuevo_Nro_Factura = ISNULL(Max(Nro_Factura),0) FROM Ventas");


            datos.ejecutarLectura();

            while (datos.Lector.Read())
            {
                NuevoNumero = ((int)datos.Lector["Nuevo_Nro_Factura"] + 1);
            }

            datos.cerrarConexion();

            return NuevoNumero;
        }

       public void agregar(Venta nueva_Venta)
        {
            int Renglon = 0;

            foreach (Producto Prod in nueva_Venta.Productos)
            {
                Renglon += 1;

                AccesoDatos datos = new AccesoDatos();


                datos.setearConsulta("INSERT INTO Ventas(Nro_Factura, Renglon, DNI_Cliente, Fecha, Tipo_Factura,NombreUsuario," +
                                                            "ID_MedioPago, ID_Producto, Cantidad, PrecioU, Estado)" +
                                                    "VALUES(@Nro_Factura, @Renglon, @DNI_Cliente, @Fecha, @Tipo_Factura, @NombreUsuario," +
                                                            "@ID_MedioPago, @ID_Producto, @Cantidad, @PrecioU, @Estado)");

                datos.setearParametros("@Nro_Factura", nueva_Venta.Nro);
                datos.setearParametros("@Renglon", Renglon);
                datos.setearParametros("@DNI_Cliente", nueva_Venta.Cliente.DNI);
                datos.setearParametros("@Fecha", nueva_Venta.Fecha);
                datos.setearParametros("@Tipo_Factura", nueva_Venta.TipoFactura);
                datos.setearParametros("@NombreUsuario", nueva_Venta.Usuario.Nombre);
                datos.setearParametros("@ID_MedioPago", nueva_Venta.MedioPago.Codigo);
                datos.setearParametros("@ID_Producto", Prod.ID);
                datos.setearParametros("@Cantidad", Prod.Cantidad_Compra);
                datos.setearParametros("@PrecioU", Prod.Precio_U);
                datos.setearParametros("@Estado", 1);

                datos.ejecutarAccion();

                datos.cerrarConexion();


            }
        }



        public void Actualizar(Venta vent)
        {
            int Renglon = 0;

            List<string> ListaConsultas = new List<string>();

            ListaConsultas.Add("DELETE FROM Ventas WHERE Nro_Factura = '" + vent.Nro + "'");

            AccesoDatos datos = new AccesoDatos();

            foreach (Producto Prod in vent.Productos)
            {
                Renglon += 1;

                ListaConsultas.Add("INSERT INTO Ventas(Nro_Factura, Renglon, DNI_Cliente, Fecha, Tipo_Factura,NombreUsuario," +
                                                        "ID_MedioPago, ID_Producto, Cantidad, PrecioU, Estado)" +
                                   "VALUES(@Nro_Factura" + Renglon.ToString() + ", " + Renglon + ", @DNI_Cliente" + Renglon.ToString() + ", @Fecha" + Renglon.ToString() + ", @Tipo_Factura" + Renglon.ToString() + ", @NombreUsuario" + Renglon.ToString() + "," +
                                                      "@ID_MedioPago" + Renglon.ToString() + ", @ID_Producto" + Renglon.ToString() + ", @Cantidad" + Renglon.ToString() + ", @PrecioU" + Renglon.ToString() + ", " + 1 + ")");

                datos.setearConsulta(ListaConsultas.ToArray());
                datos.setearParametros("@Nro_Factura" + Renglon.ToString(), vent.Nro);
                datos.setearParametros("@DNI_Cliente" + Renglon.ToString(), vent.Cliente.DNI);
                datos.setearParametros("@Fecha" + Renglon.ToString(), vent.Fecha);
                datos.setearParametros("@Tipo_Factura" + Renglon.ToString(), vent.TipoFactura);
                datos.setearParametros("@NombreUsuario" + Renglon.ToString(), vent.Usuario.Nombre);
                datos.setearParametros("@ID_MedioPago" + Renglon.ToString(), vent.MedioPago.Codigo);
                datos.setearParametros("@ID_Producto" + Renglon.ToString(), Prod.ID);
                datos.setearParametros("@Cantidad" + Renglon.ToString(), Prod.Cantidad_Compra);
                datos.setearParametros("@PrecioU" + Renglon.ToString(), Prod.Precio_U);



            }


            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void DarBaja(int Nro)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE Ventas SET Estado = 0 WHERE Nro_Factura = " + Nro + "");
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

