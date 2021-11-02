using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Producto
    {
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio_U { get; set; }
        public string URLimagen { get; set; }
        public Rubro Rubro { get; set; }
        public Marca Marca { get; set; }
        public int Stock  { get; set; }
        public int StockMinimo { get; set; }
        public Proveedor Proveedor { get; set; }
    }
}
