using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoDatos
    {
        public SqlTransaction t { get; set; }
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;
        public SqlDataReader Lector
        {
            get { return lector; }
        }

        public AccesoDatos()
        {
            conexion = new SqlConnection("server=.\\SQLEXPRESS; database=TP_Final3; integrated security=true");
            comando = new SqlCommand();
           
        }

        public void BeginTransaction()
        {
            
        }

        public void setearConsulta(string consulta)
        {
            List<string> ListConsultas = new List<string>();
            ListConsultas.Add(consulta);
            setearConsulta(ListConsultas.ToArray());
        }
        public void setearConsulta(string[] consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = string.Join(";",consulta);
        }

        public void ejecutarLectura()
        {
            comando.Connection = conexion;

            try
            {                
                conexion.Open();
                
                t = conexion.BeginTransaction();
                comando.Transaction = t;
                lector = comando.ExecuteReader();
               
            }
            catch (Exception ex)
            {
               //ACCION PENDIENTE
            }
        }

        public void ejecutarAccion()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();

                t = conexion.BeginTransaction();
                comando.Transaction = t;
                comando.ExecuteNonQuery();
              
            }
            catch (Exception ex)
            {
                if (t != null && t.Connection != null)
                {
                    t.Rollback();
                }
            }

        }

        public void setearParametros(string Nombre, Object Valor)
        {
            comando.Parameters.AddWithValue(Nombre, Valor);
        }

        public void cerrarConexion()
        {
            if (lector != null)
                lector.Close();

            t.Commit();

            conexion.Close();

        }
    }
}

