using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Proveedor
    {
        public string RazonSocial { get; set; }
        public string CUIT { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Mail { get; set; }
        public Rubro Rubro { get; set; }
        public string PersonaContacto { get; set; }
    }
}
