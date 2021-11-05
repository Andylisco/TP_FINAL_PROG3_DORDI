using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Cliente : Persona
    {
        public string DNI { get; set; }        
        public string Telefono { get; set; }
        public string Direccion  { get; set; }
        public DateTime FechaUltCompra { get; set; }

    }
}
