using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Compra
    {
        public int Nro { get; set; }
        public Proveedor Proveedor { get; set; }
        public DateTime Fecha { get; set; }
        public string TipoFactura { get; set; }
        public List<Producto> Productos { get; set; }
        public decimal TotalImporte { get; set; }
        public MedioPago Medio_Pago { get; set; }
        public Usuario Usuario { get; set; }
        
    }
}
