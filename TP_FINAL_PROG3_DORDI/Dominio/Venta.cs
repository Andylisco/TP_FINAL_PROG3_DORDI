using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Venta
    {
        public int Nro { get; set; }
        public List<Producto> Productos { get; set; }
        public Cliente Proveedor { get; set; }
        public DateTime Fecha { get; set; }
        public decimal TotalImporte { get; set; }
    }
}
