using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class Neg_Proveedor
    {

        public Proveedor GetSingle(string CUIT)
        {
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("SELECT RazonSocial, Telefono, Direccion, Mail, Cod_Rubro, PersonaContacto FROM Proveedores WHERE CUIT = @NroProveedor");
            Datos.setearParametros("@CUIT", CUIT);

            Datos.ejecutarLectura();

            Proveedor Prov = new Proveedor();

            while (Datos.Lector.Read())
            {
                Prov.CUIT = CUIT;

                if (!(Datos.Lector["RazonSocial"] is DBNull))
                    Prov.RazonSocial = (string)Datos.Lector["RazonSocial"];

                if (!(Datos.Lector["Telefono"] is DBNull))
                    Prov.Telefono = (string)Datos.Lector["Telefono"];

                if (!(Datos.Lector["Direccion"] is DBNull))
                    Prov.Direccion = (string)Datos.Lector["Direccion"]; 

                if (!(Datos.Lector["Mail"] is DBNull))
                    Prov.Mail = (string)Datos.Lector["Mail"];

                if (!(Datos.Lector["PersonaContacto"] is DBNull))
                    Prov.PersonaContacto = (string)Datos.Lector["PersonaContacto"];

                Prov.Rubro = new Rubro();
                if (!(Datos.Lector["Cod_Rubro"] is DBNull))
                    Prov.Rubro.Codigo = (int)Datos.Lector["Cod_Rubro"];

                Prov.Rubro.Descripcion = "";

             
            }



            return Prov;
        }
        public List<Proveedor> GetAll(string ClausulaWHERE = "")
        {
            List<Proveedor> lista = new List<Proveedor>();
            AccesoDatos datos = new AccesoDatos();

            //RECIBIMOS EL PARAMETRO OPCIONAL Y SE LO AGREGAMOS A LA CONSULTA
            string WHERE = ClausulaWHERE;
            try
            {
                
                        datos.setearConsulta("SELECT Pr.CUIT, Pr.RazonSocial, Telefono = ISNULL(Pr.Telefono,'')," + 
                                     " Direccion = ISNULL(Pr.Direccion, ''), Mail = ISNULL(Pr.Mail, '')," +
                                     " PersonaContacto = ISNULL(Pr. PersonaContacto, ''), Pr.Cod_Rubro," +
                                     " RubroDesc = ISNULL(R.Descripcion,'') " +
                                     "FROM Proveedores Pr LEFT JOIN Rubros R on Pr.Cod_Rubro = R.Codigo " + WHERE);



                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Proveedor aux = new Proveedor();
                    //Modifique como recibimos los datos para facilitar la lectura de los mismos
                    aux.CUIT = (string)datos.Lector["CUIT"];
                    aux.RazonSocial = (string)datos.Lector["RazonSocial"];
                    aux.Telefono = (string)datos.Lector["Telefono"];
                    aux.Direccion = (string)datos.Lector["Direccion"];
                    aux.Mail = (string)datos.Lector["Mail"];
                    aux.PersonaContacto = (string)datos.Lector["PersonaContacto"];


                    //SE CARGA EL RUBRO COMO OBJETOS
                    aux.Rubro = new Rubro();
                    aux.Rubro.Codigo = (int)datos.Lector["Cod_Rubro"];
                    aux.Rubro.Descripcion = (string)datos.Lector["RubroDesc"];
                                        
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

        public void agregar(Proveedor nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            datos.setearConsulta("INSERT INTO Proveedores(CUIT, RazonSocial, Telefono, Direccion, Mail, Cod_Rubro, PersonaContacto)" +
                                "VALUES( @CUIT, @RazonSocial, @Telefono, @Direccion, @Mail, @Cod_Rubro, @PersonaContacto)");
            
            datos.setearParametros("@CUIT", nuevo.CUIT);
            datos.setearParametros("@RazonSocial", nuevo.RazonSocial);
            datos.setearParametros("@Telefono", nuevo.Telefono);
            datos.setearParametros("@Direccion", nuevo.Direccion);
            datos.setearParametros("@Mail", nuevo.Mail);
            datos.setearParametros("@PersonaContacto", nuevo.PersonaContacto);
            datos.setearParametros("@Cod_Rubro", nuevo.Rubro.Codigo);
            
            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void Actualizar(Proveedor nuevo)
        {
            AccesoDatos datos = new AccesoDatos();


            datos.setearConsulta("UPDATE ARTICULOS SET RazonSocial = @RazonSocial, Telefono = @Telefono, " +
                "Direccion = @Direccion, @Mail = @Mail, PersonaContacto = @PersonaContacto, Cod_Rubro = @Cod_Rubro WHERE CUIT = @CUIT");

            datos.setearParametros("@CUIT", nuevo.CUIT);
            datos.setearParametros("@RazonSocial", nuevo.RazonSocial);
            datos.setearParametros("@Telefono", nuevo.Telefono);
            datos.setearParametros("@Direccion", nuevo.Direccion);
            datos.setearParametros("@Mail", nuevo.Mail);
            datos.setearParametros("@PersonaContacto", nuevo.PersonaContacto);
            datos.setearParametros("@Cod_Rubro", nuevo.Rubro.Codigo);
            datos.ejecutarAccion();

            datos.cerrarConexion();

        }

        public void BorrarArt(string CUIT)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("DELETE FROM Proveedores WHERE CUIT = " + CUIT + "");
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

