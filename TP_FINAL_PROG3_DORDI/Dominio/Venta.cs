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
        public DateTime Fecha { get; set; }
        public Cliente Cliente { get; set; }
        public string TipoFactura { get; set; }
        public List<Producto> Productos { get; set; }
        public decimal TotalImporte { get; set; }
        public MedioPago MedioPago { get; set; }
        public Usuario Usuario { get; set; }
    }
}
