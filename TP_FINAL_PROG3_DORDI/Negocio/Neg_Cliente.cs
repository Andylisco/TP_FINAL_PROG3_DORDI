using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    /*
    public string DNI { get; set; }
    public string Telefono { get; set; }
    public string Direccion { get; set; }
    public DateTime FechaUltCompra { get; set; }
    public string Apellido { get; set; }
    public string Nombre { get; set; }
    public string EMail { get; set; } 
    */
    public class Neg_Cliente
    {
        public Cliente GetSingle(string DNI)
        {
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("SELECT Nombre, Apellido, Telefono, Direccion, EMail, FechaUltCompra FROM Clientes WHERE DNI = @DNI");
            Datos.setearParametros("@DNI", DNI);

            Datos.ejecutarLectura();

            Cliente Clien = new Cliente();

            while (Datos.Lector.Read())
            {
                Clien.DNI = DNI;

                if (!(Datos.Lector["Nombre"] is DBNull))
                    Clien.Nombre = (string)Datos.Lector["Nombre"];

                if (!(Datos.Lector["Apellido"] is DBNull))
                    Clien.Apellido = (string)Datos.Lector["Apellido"];

                if (!(Datos.Lector["EMail"] is DBNull))
                    Clien.EMail = (string)Datos.Lector["EMail"];

                if (!(Datos.Lector["Telefono"] is DBNull))
                    Clien.Telefono = (string)Datos.Lector["Telefono"];

                if (!(Datos.Lector["Direccion"] is DBNull))
                    Clien.Direccion = (string)Datos.Lector["Direccion"];

                if (!(Datos.Lector["FechaUltCompra"] is DBNull))
                    Clien.FechaUltCompra = (DateTime)Datos.Lector["FechaUltCompra"];

            }

            return Clien;
        }

        public List<Cliente> GetAll(string ClausulaWHERE = "")
        {
            List<Cliente> lista = new List<Cliente>();
            AccesoDatos datos = new AccesoDatos();

            //RECIBIMOS EL PARAMETRO OPCIONAL Y SE LO AGREGAMOS A LA CONSULTA
            string WHERE = ClausulaWHERE;
            try
            {

                datos.setearConsulta("SELECT DNI, Nombre, Apellido, Telefono = ISNULL(Telefono,''), " +
                                        "Direccion = ISNULL(Direccion,''), EMail = ISNULL(EMail,''), FechaUltCompra " +                             
                                        "FROM Clientes " +
                                        " WHERE Estado = 1 " + WHERE);



                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cliente aux = new Cliente();
                    //Modifique como recibimos los datos para facilitar la lectura de los mismos
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Telefono = (string)datos.Lector["Telefono"];
                    aux.Direccion = (string)datos.Lector["Direccion"];
                    aux.EMail = (string)datos.Lector["EMail"];
                    aux.FechaUltCompra = (DateTime)datos.Lector["FechaUltCompra"];

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

        public void agregar(Cliente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            datos.setearConsulta("INSERT INTO Clientes(DNI, Nombre, Apellido, Telefono, Direccion, Email)" +
                                "VALUES( @DNI, @Nombre, @Apellido, @Telefono, @Direccion, @Email)");

            datos.setearParametros("@DNI", nuevo.DNI);
            datos.setearParametros("@Nombre", nuevo.Nombre);
            datos.setearParametros("@Apellido", nuevo.Apellido);
            datos.setearParametros("@Telefono", nuevo.Telefono);
            datos.setearParametros("@Direccion", nuevo.Direccion);
            datos.setearParametros("@EMail", nuevo.EMail);
            
            

            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void Actualizar(Cliente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();


            datos.setearConsulta("UPDATE Clientes SET Nombre = @Nombre, Apellido = @Apellido, Telefono = @Telefono, " +
                "Direccion = @Direccion, Email = @EMail WHERE DNI = @DNI");


            datos.setearParametros("@DNI", nuevo.DNI);
            datos.setearParametros("@Nombre", nuevo.Nombre);
            datos.setearParametros("@Apellido", nuevo.Apellido);
            datos.setearParametros("@Telefono", nuevo.Telefono);
            datos.setearParametros("@Direccion", nuevo.Direccion);
            datos.setearParametros("@EMail", nuevo.EMail);

            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void BorrarArt(string DNI)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE Clientes SET Estado = 0 WHERE DNI = " + DNI + "");
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
