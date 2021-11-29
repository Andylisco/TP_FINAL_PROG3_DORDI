using System;
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

        public Usuario GetSingle(string User)
        {
            AccesoDatos Datos = new AccesoDatos();

            List<string> ListaSQLCnslt = new List<string>();
            ListaSQLCnslt.Add("SELECT Clave, NivelUsuario, EMail FROM Usuarios WHERE NombreUsuario = @Usuario AND Estado = 1");

            Datos.setearConsulta(ListaSQLCnslt.ToArray());

            Datos.setearParametros("@Usuario", User);
            

            Datos.ejecutarLectura();

            Usuario Usuario = new Usuario();

            while (Datos.Lector.Read())
            {
                Usuario.Nombre = User;
                if (!(Datos.Lector["Clave"] is DBNull))
                    Usuario.Clave = (string)Datos.Lector["Clave"];

                if (!(Datos.Lector["EMail"] is DBNull))
                    Usuario.EMail = (string)Datos.Lector["EMail"];

                if (!(Datos.Lector["NivelUsuario"] is DBNull))
                    Usuario.Nivel = (int)Datos.Lector["NivelUsuario"];


            }

            Datos.cerrarConexion();

            return Usuario;
        }

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



        public List<Usuario> GetAll(string ClausulaWHERE = "")
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            //RECIBIMOS EL PARAMETRO OPCIONAL Y SE LO AGREGAMOS A LA CONSULTA
            string WHERE = ClausulaWHERE;
            try
            {
                List<string> ListaSQLCnslt = new List<string>();
                ListaSQLCnslt.Add("SELECT NombreUsuario, Clave, Email FROM Usuarios WHERE NivelUsuario <> 0 " +
                              WHERE);

                datos.setearConsulta(ListaSQLCnslt.ToArray());



                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();

                    aux.Nombre = (string)datos.Lector["NombreUsuario"];
                    aux.Clave = (string)datos.Lector["Clave"];
                    aux.EMail = (string)datos.Lector["Email"];
                    



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

        
            
        public void agregar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            datos.setearConsulta("INSERT INTO Usuarios(NombreUsuario, Clave, NivelUsuario, Email)" +
                                "VALUES( @NombreUsuario, @Clave, @NivelUsuario, @Email)");

            datos.setearParametros("@NombreUsuario", nuevo.Nombre);
            datos.setearParametros("@Clave", nuevo.Clave);
            datos.setearParametros("@NivelUsuario", nuevo.Nivel);
            datos.setearParametros("@EMail", nuevo.EMail);



            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void Actualizar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();


            datos.setearConsulta("UPDATE Usuarios SET Clave = @Clave, NivelUsuario = @NivelUsuario,  Email = @EMail" +
                                        " WHERE NombreUsuario = @NombreUsuario");

            datos.setearParametros("@NombreUsuario", nuevo.Nombre);
            datos.setearParametros("@Clave", nuevo.Clave);
            datos.setearParametros("@NivelUsuario", nuevo.Nivel);
            datos.setearParametros("@EMail", nuevo.EMail);

            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void DarBaja(string Nombre)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE Usuarios SET Estado = 0 WHERE NombreUsuario = '" + Nombre + "'");
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

        public void Activar(string Nombre)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE Usuarios SET Estado = 1 WHERE NombreUsuario = '" + Nombre + "'");
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
