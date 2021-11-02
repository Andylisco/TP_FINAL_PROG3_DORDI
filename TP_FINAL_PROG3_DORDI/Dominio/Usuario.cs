using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public string Nombre { get; set; }
        public string Clave { get; set; }
        public int Nivel { get; set; }
        public bool Estado { get; set; }
        public string Email { get; set; }
    }
}
