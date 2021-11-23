using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class MovVario
    {
        public long ID_MovVario { get; set; }
        public Producto Produc { get; set; }
        public DateTime Fecha { get; set; }
        public string Motivo { get; set; }

    }
}
